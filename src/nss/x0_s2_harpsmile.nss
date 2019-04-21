//::///////////////////////////////////////////////
//:: Tymora's Smile
//:: x0_s2_HarpSmile
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    +2 luck bonus on all saving throws for 5 turns.

    past 5
    Gain an additional +2 on saving throws vs. spells every 3levels (6, 9, 12 et cetera )
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: September 2002
//:: Updated On: Jul 21, 2003 Georg -
//                            Epic Level progession
//:://////////////////////////////////////////////
#include "nw_i0_spells"

void main()
{
    //Declare major variables
    object oTarget = GetSpellTargetObject();
    object oObject = GetFirstFactionMember(oTarget);
    object oArea = GetArea(OBJECT_SELF);
    int nDuration = 5;
    int nAmount = 2;
    // epic level progression
    int nLevel = GetLevelByClass(CLASS_TYPE_HARPER,oTarget);

    nAmount = nLevel + nAmount;

    effect eSaving =  EffectSavingThrowIncrease(SAVING_THROW_ALL, nAmount, SAVING_THROW_TYPE_ALL);
    effect eDur = EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS);
    effect eVis = EffectVisualEffect(VFX_IMP_ELEMENTAL_PROTECTION);
    //Link Effects
    effect eLink = EffectLinkEffects(eSaving, eDur);

    while(GetIsObjectValid(oObject))
    {
         if (GetArea(oObject) == oArea)
         {
            if(!GetIsDead(oObject))
            {
                RemoveEffectsFromSpell(oTarget, GetSpellId());
                //Fire cast spell at event for the specified target
                SignalEvent(oTarget, EventSpellCastAt(oTarget, 478, FALSE));
                //Apply the VFX impact and effects
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, TurnsToSeconds(nDuration));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            }
         }

         oObject = GetNextFactionMember(oTarget);
    }
}
