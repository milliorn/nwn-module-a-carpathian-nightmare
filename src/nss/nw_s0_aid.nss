//::///////////////////////////////////////////////
//:: Aid
//:: NW_S0_Aid.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Target creature gains +1 to attack rolls and
    saves vs fear. Also gain +1d8 temporary HP.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 6, 2001
//:://////////////////////////////////////////////
//:: VFX Pass By: Preston W, On: June 20, 2001

#include "x2_inc_spellhook"
#include "nw_i0_spells"

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

    // Anti Exploit
    RemoveTempHitPoints();

// End of Spell Cast Hook


    //Declare major variables
    int nDuration = GetCasterLevel(OBJECT_SELF);
    int nBonus = 5; //d8(1);
    int nMetaMagic = GetMetaMagicFeat();
    int nBonus2;

    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

    if (GetLastSpellCastClass() == CLASS_TYPE_RANGER)
    {
        nBonus = 5 + d3();
        //Enter Metamagic conditions
        if (nMetaMagic == METAMAGIC_MAXIMIZE)
        {
            nBonus = 8;//Damage is at max
        }
        else if (nMetaMagic == METAMAGIC_EMPOWER)
        {
            nBonus = nBonus + (nBonus/2); //Damage/Healing is +50%
        }
        else if (nMetaMagic == METAMAGIC_EXTEND)
        {
            nDuration = nDuration *2; //Duration is +100%
        }

        nBonus2 = nDuration;
        if (nBonus2 >= 9) nBonus = 9;
        nBonus = nBonus + nBonus2;

        effect eAttack = EffectAttackIncrease(1);
        effect eSave = EffectSavingThrowIncrease(SAVING_THROW_ALL, 1, SAVING_THROW_TYPE_FEAR);
        effect eHP = EffectTemporaryHitpoints(nBonus);
        effect eVis = EffectVisualEffect(VFX_IMP_HOLY_AID);
        object oTarget = GetSpellTargetObject();

        effect eLink = EffectLinkEffects(eAttack, eSave);
        eLink = EffectLinkEffects(eLink, eDur);

        //Fire cast spell at event for the specified target
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_AID, FALSE));

        //Apply the VFX impact and effects
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, TurnsToSeconds(nDuration));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHP, oTarget, TurnsToSeconds(nDuration));
        return;
    }

    //Enter Metamagic conditions
    if (nMetaMagic == METAMAGIC_MAXIMIZE)
    {
        nBonus = 5;//Damage is at max
    }

    else if (nMetaMagic == METAMAGIC_EMPOWER)
    {
        nBonus = nBonus + (nBonus/2); //Damage/Healing is +50%
    }

    else if (nMetaMagic == METAMAGIC_EXTEND)
    {
        nDuration = nDuration *2; //Duration is +100%
    }

    nBonus2 = nDuration;
    if (nBonus2 >= 9) nBonus = 9;
    nBonus = nBonus + nBonus2;

    effect eAttack = EffectAttackIncrease(1);
    effect eSave = EffectSavingThrowIncrease(SAVING_THROW_ALL, 1, SAVING_THROW_TYPE_FEAR);
    effect eHP = EffectTemporaryHitpoints(nBonus);
    effect eVis = EffectVisualEffect(VFX_IMP_HOLY_AID);

    object oTarget = GetSpellTargetObject();

    effect eLink = EffectLinkEffects(eAttack, eSave);
    eLink = EffectLinkEffects(eLink, eDur);

    //Fire cast spell at event for the specified target
    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_AID, FALSE));

    //Apply the VFX impact and effects
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, TurnsToSeconds(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHP, oTarget, TurnsToSeconds(nDuration));
}

