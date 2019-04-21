//::///////////////////////////////////////////////
//:: Darkfire
//:: X2_S0_Darkfire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Gives a melee weapon 1d6 fire damage +1 per two caster
  levels to a maximum of +10.
*/
//:://////////////////////////////////////////////
//:: Created By: Andrew Nobbs
//:: Created On: Dec 04, 2002
//:://////////////////////////////////////////////
//:: Updated by Andrew Nobbs May 08, 2003
//:: 2003-07-29: Rewritten, Georg Zoeller



#include "x2_inc_spellhook"



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
    effect eVis = EffectVisualEffect(VFX_IMP_PULSE_FIRE);
    eVis = EffectLinkEffects(EffectVisualEffect(VFX_IMP_FLAME_M),eVis);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    int nDuration = 2 * GetCasterLevel(OBJECT_SELF);
    int nMetaMagic = GetMetaMagicFeat();
    int nCasterLvl = GetCasterLevel(OBJECT_SELF);
    object oObject = GetItemInSlot(INVENTORY_SLOT_ARMS, OBJECT_SELF);

    //Limit nCasterLvl to 10, so it max out at +10 to the damage.
    //Bugfix: Limiting nCasterLvl to *20* - the damage calculation
    //        divides it by 2.
    if(nCasterLvl > 20)
    {
        nCasterLvl = 20;
    }

    if (nMetaMagic == METAMAGIC_EXTEND)
    {
        nDuration = nDuration * 2; //Duration is +100%
    }

   object oMyWeapon   =  IPGetTargetedOrEquippedMeleeWeapon();

   if(GetIsObjectValid(oMyWeapon) || GetBaseItemType(oObject) == BASE_ITEM_GLOVES)
   {
        SignalEvent(GetItemPossessor(oMyWeapon), EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));

        if (nCasterLvl == 0 || nCasterLvl == 1 || nCasterLvl == 2 || nCasterLvl == 3 || nCasterLvl == 4)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_1d4), TurnsToSeconds(nDuration));
            return;
        }

        if (nCasterLvl == 5 || nCasterLvl == 6)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_1d6), TurnsToSeconds(nDuration));
            return;
        }

        if (nCasterLvl == 7 || nCasterLvl == 8)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_1d8), TurnsToSeconds(nDuration));
            return;
        }

        if (nCasterLvl == 9 || nCasterLvl == 10)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_2d4), TurnsToSeconds(nDuration));
            return;
        }

        if (nCasterLvl == 11 || nCasterLvl == 12)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_1d10), TurnsToSeconds(nDuration));
            return;
        }

        if (nCasterLvl == 13 || nCasterLvl == 14)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_1d12), TurnsToSeconds(nDuration));
            return;
        }

        if (nCasterLvl == 15 || nCasterLvl == 16)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_2d6), TurnsToSeconds(nDuration));
            return;
        }

        if (nCasterLvl >= 17)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_2d8), TurnsToSeconds(nDuration));
            return;
        }
    }

    else
    {
           FloatingTextStrRefOnCreature(83615, OBJECT_SELF);
           return;
    }
}

