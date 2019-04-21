//::///////////////////////////////////////////////
//:: Acid Splash
//:: [X0_S0_AcidSplash.nss]
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
1d3 points of acid damage to one target.

Update: A target must succeed on a Dexterity save or take 1d6 acid damage.

This spell's damage increases by 1d6 when you reach 5th, 11th, and 17th level.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: July 17 2002
//:://////////////////////////////////////////////

#include "X0_I0_SPELLS"
#include "x2_inc_spellhook"

void main()
{

/*
  Spellcast Hook Code
  Added 2003-06-20 by Georg
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
    object oTarget = GetSpellTargetObject();

    int nDamage = 1;
    int nCasterLevel = GetCasterLevel(OBJECT_SELF);

//  DnD 5.0 edition changes
    if (nCasterLevel >= 17) nDamage = 4;
    else if (nCasterLevel >= 11) nDamage = 3;
    else if (nCasterLevel >= 5) nDamage = 2;

    effect eVis = EffectVisualEffect(VFX_IMP_ACID_S);
    if(!GetIsReactionTypeFriendly(oTarget))
    {
        //Fire cast spell at event for the specified target
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, 424));
        //Make SR Check
        if(!ReflexSave(oTarget, GetSpellSaveDC(), SAVING_THROW_TYPE_ACID))
        {
            //Set damage effect
            int nDamage =  MaximizeOrEmpower(6, nDamage, GetMetaMagicFeat());
            effect eBad = EffectDamage(nDamage, DAMAGE_TYPE_ACID);
            //Apply the VFX impact and damage effect
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eBad, oTarget);
        }
    }
}




