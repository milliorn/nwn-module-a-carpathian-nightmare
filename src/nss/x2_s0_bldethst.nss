//::///////////////////////////////////////////////
//:: Blade Thrist
//:: X2_S0_BldeThst
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Grants a +3 enhancement bonus to a slashing weapon
*/
//:://////////////////////////////////////////////
//:: Created By: Andrew Nobbs
//:: Created On: Nov 27, 2002
//:://////////////////////////////////////////////
//:: Updated by Andrew Nobbs May 08, 2003
//:: 2003-07-07: Stacking Spell Pass, Georg Zoeller
//:: 2003-07-21: Complete Rewrite to make use of Item Property System


#include "nw_i0_spells"
#include "x2_i0_spells"

#include "x2_inc_spellhook"


void  AddEnhanceEffectToWeapon(object oMyWeapon, float fDuration)
{
//  Class Improvement: Ranger +5 enhancement
   IPSafeAddItemProperty(oMyWeapon,ItemPropertyEnhancementBonus(5), fDuration, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING,FALSE,TRUE);
}

void  AddGreaterEnhancementEffectAttackBonus(object oMyWeapon, float fDuration, int nBonus)
{
   IPSafeAddItemProperty(oMyWeapon,ItemPropertyAttackBonus(nBonus), fDuration, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING,FALSE,TRUE);
   return;
}

void main()
{

    /*
      Spellcast Hook Code
      Added 2003-07-07 by Georg Zoeller
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
    effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    int nDuration = 2 * GetCasterLevel(OBJECT_SELF);
    int nMetaMagic = GetMetaMagicFeat();

     object oMyWeapon   =  IPGetTargetedOrEquippedMeleeWeapon();
     object oRanged = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);

    if (nMetaMagic == METAMAGIC_EXTEND)
    {
        nDuration = nDuration * 2; //Duration is +100%
    }

    if(GetIsObjectValid(oMyWeapon))
    {
        SignalEvent(oMyWeapon, EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));

            if (nDuration>0)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), HoursToSeconds(nDuration));
                //AddEnhanceEffectToWeapon(oMyWeapon, RoundsToSeconds(nDuration));
//              Class Improvement: Ranger
                AddEnhanceEffectToWeapon(oMyWeapon, HoursToSeconds(nDuration));
                return;
            }
    }

//  Class Improvement: Ranger
    else if(IPGetIsRangedWeapon(oRanged))
    {
        SignalEvent(GetItemPossessor(oRanged), EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));

        if (nDuration>0)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oRanged));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oRanged), HoursToSeconds(nDuration));
            AddGreaterEnhancementEffectAttackBonus(oRanged, (HoursToSeconds(nDuration)), 5);
            return;
        }
    }

    else
    {
          FloatingTextStrRefOnCreature(83615, OBJECT_SELF);
          return;
    }
}
