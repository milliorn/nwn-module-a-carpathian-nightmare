//::///////////////////////////////////////////////
//:: Bless Weapon
//:: X2_S0_BlssWeap
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*

  If cast on a crossbow bolt, it adds the ability to
  slay rakshasa's on hit

  If cast on a melee weapon, it will add the
      grants a +1 enhancement bonus.
      grants a +2d6 damage divine to undead

  will add a holy vfx when command becomes available

  If cast on a creature it will pick the first
  melee weapon without these effects

*/
//:://////////////////////////////////////////////
//:: Created By: Andrew Nobbs
//:: Created On: Nov 28, 2002
//:://////////////////////////////////////////////
//:: Updated by Andrew Nobbs May 09, 2003
//:: 2003-07-07: Stacking Spell Pass, Georg Zoeller
//:: 2003-07-15: Complete Rewrite to make use of Item Property System

#include "nw_i0_spells"
#include "x2_i0_spells"

#include "x2_inc_spellhook"


void AddBlessEffectToWeapon(object oTarget, float fDuration)
{
   // If the spell is cast again, any previous enhancement boni are kept
   IPSafeAddItemProperty(oTarget, ItemPropertyEnhancementBonus(1), fDuration, X2_IP_ADDPROP_POLICY_KEEP_EXISTING,TRUE);
   // Replace existing temporary anti undead boni
   IPSafeAddItemProperty(oTarget, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_DIVINE, IP_CONST_DAMAGEBONUS_2d6), fDuration,X2_IP_ADDPROP_POLICY_REPLACE_EXISTING );
   IPSafeAddItemProperty(oTarget, ItemPropertyVisualEffect(ITEM_VISUAL_HOLY), fDuration,X2_IP_ADDPROP_POLICY_REPLACE_EXISTING,FALSE,TRUE );
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
    object oTarget = GetSpellTargetObject();
    int nDuration = 2 * GetCasterLevel(OBJECT_SELF);
    int nMetaMagic = GetMetaMagicFeat();

    if (nMetaMagic == METAMAGIC_EXTEND)
    {
       nDuration = nDuration * 2; //Duration is +100%
    }

    // ---------------- TARGETED ON BOLT  -------------------
    if(GetIsObjectValid(oTarget) && GetObjectType(oTarget) == OBJECT_TYPE_ITEM &&
        GetBaseItemType(oTarget) ==  BASE_ITEM_BOLT || GetBaseItemType(oTarget) ==  BASE_ITEM_ARROW ||
        GetBaseItemType(oTarget) ==  BASE_ITEM_BULLET || GetBaseItemType(oTarget) ==  BASE_ITEM_DART ||
        GetBaseItemType(oTarget) ==  BASE_ITEM_GRENADE || GetBaseItemType(oTarget) ==  BASE_ITEM_SHURIKEN ||
        GetBaseItemType(oTarget) ==  BASE_ITEM_THROWINGAXE)
    {
        // special handling for blessing crossbow bolts that can slay rakshasa's
        SignalEvent(GetItemPossessor(oTarget), EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));
        IPSafeAddItemProperty(oTarget, ItemPropertyOnHitCastSpell(123,1), RoundsToSeconds(nDuration), X2_IP_ADDPROP_POLICY_KEEP_EXISTING );
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oTarget));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oTarget), RoundsToSeconds(nDuration));
        return;
    }

    object oMyWeapon   =  IPGetTargetedOrEquippedMeleeWeapon();

    if(GetIsObjectValid(oMyWeapon) || GetBaseItemType(oTarget) ==  BASE_ITEM_GLOVES)
    {
        SignalEvent(GetItemPossessor(oMyWeapon), EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));

        if (nDuration>0)
        {
           AddBlessEffectToWeapon(oMyWeapon, TurnsToSeconds(nDuration));
           ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
           ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
           return;
        }

    }

    else
    {
        FloatingTextStrRefOnCreature(83615, OBJECT_SELF);
        return;
    }
}
