//::///////////////////////////////////////////////
//:: Mass Heal
//:: [NW_S0_MasHeal.nss]
//:: Copyright (c) 2000 Bioware Corp.
//:://////////////////////////////////////////////
//:: Heals all friendly targets within 10ft to full
//:: unless they are undead.
//:: If undead they reduced to 1d4 HP.
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 11, 2001
//:://////////////////////////////////////////////

#include "NW_I0_SPELLS"
#include "x2_inc_spellhook"

void main()
{

/*
  Spellcast Hook Code
  Added 2003-06-23 by GeorgZ
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more

*/

    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook


    //Declare major variables
    effect eDam;
    effect eKill;
    effect eVis = EffectVisualEffect(VFX_IMP_SUNSTRIKE);
    effect eHeal;
    effect eVis2 = EffectVisualEffect(VFX_IMP_HEALING_G);
    effect eStrike = EffectVisualEffect(VFX_FNF_LOS_HOLY_10);
    int nTouch, nModify, nDamage, nHeal;
    int nMetaMagic = GetMetaMagicFeat();
    // Custom Change
    object oCaster = OBJECT_SELF;
    int nCasterLvl = GetCasterLevel(oCaster);
    float fDelay;
    location lLoc =  GetSpellTargetLocation();

    //Apply VFX area impact
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eStrike, lLoc);
    //Get first target in spell area
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lLoc);
    while(GetIsObjectValid(oTarget))
    {
        fDelay = GetRandomDelay();
        //Check to see if the target is an undead
        if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
        {
            if (nTouch) //== TRUE) 1 or 2 are valid return numbers from TouchAttackMelee
            {
                if(!GetIsReactionTypeFriendly(oTarget))
                {
                    //Fire cast spell at event for the specified target
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_HEAL));
                    if (!MyResistSpell(OBJECT_SELF, oTarget))
                    {
                        nDamage = 10 * nCasterLvl;

                        if (nDamage > 150)
                        {
                            nDamage = 150;
                        }

                        if (nMetaMagic == METAMAGIC_MAXIMIZE)
                        {
                            nDamage = 150;
                        }

                        //Will save for half damage
                        if (MySavingThrow(SAVING_THROW_WILL, oTarget, GetSpellSaveDC()))
                        {
                            nDamage = nDamage / 2;
                        }
                    }

                    if (nDamage > (GetCurrentHitPoints(oTarget) - 1))
                    {
                        nDamage = GetCurrentHitPoints(oTarget) - 1;
                    }

                    eDam = EffectDamage(nDamage,DAMAGE_TYPE_POSITIVE);
                    //Apply the VFX impact and effects
                    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget));
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget));
                }
            }
        }
        else
        {
            //Make a faction check
            if(GetIsFriend(oTarget) && GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD)
            {
                //Figure out the amount of damage to heal
                nHeal = 10 * nCasterLvl;

                if (nHeal > 150)
                {
                    nHeal = 150;
                }

                //Set the heal effect
                eHeal = EffectHeal(nHeal);
                //Apply the VFX impact and heal effect
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget));
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget));
                //Fire cast spell at event for the specified target
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_MASS_HEAL, FALSE));
            }
        }
        //Get next target in the spell area
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lLoc);
    }
}
