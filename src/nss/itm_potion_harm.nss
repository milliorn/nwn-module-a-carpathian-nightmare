//::///////////////////////////////////////////////
//:: [Harm]
//:: [NW_S0_Harm.nss]
//:: Copyright (c) 2000 Bioware Corp.
//:://////////////////////////////////////////////
//:: Reduces target to 1d4 HP on successful touch
//:: attack.  If the target is undead it is healed.
//:://////////////////////////////////////////////
//:: Created By: Keith Soleski
//:: Created On: Jan 18, 2001
//:://////////////////////////////////////////////
//:: VFX Pass By: Preston W, On: June 20, 2001
//:: Update Pass By: Preston W, On: Aug 1, 2001

//  Edited by Milliorn - 3.5 Edition Compliant
#include "NW_I0_SPELLS"
void main()
{
    //Declare major variables
    object oCaster = GetItemActivator();
    object oTarget = GetItemActivator();

    int nMetaMagic = GetMetaMagicFeat();
    int nCasterLvl = GetCasterLevel(oCaster);
    int nDamage, nHeal;

    effect eVis = EffectVisualEffect(VFX_IMP_HARM);
    effect eHeal, eDam;

    //Check that the target is undead
    if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
    {
        //Figure out the amount of damage to heal
        nHeal = 10 * nCasterLvl;

        if (nHeal > 150)
        {
            nHeal = 150;
        }

        //Set the heal effect
        eHeal = EffectHeal(nHeal);
        //Apply heal effect and VFX impact
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        //Fire cast spell at event for the specified target
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_HARM, FALSE));
    }

    else
    {
        //Fire cast spell at event for the specified target
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_HARM));

        if (!MyResistSpell(OBJECT_SELF, oTarget))
        {
            nDamage = 10 * nCasterLvl;

            if (nDamage > 150)
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

        eDam = EffectDamage(nDamage,DAMAGE_TYPE_NEGATIVE);
        //Apply the VFX impact and effects
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    }
}


