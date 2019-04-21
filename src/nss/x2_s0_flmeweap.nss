//::///////////////////////////////////////////////
//:: Flame Weapon
//:: X2_S0_FlmeWeap
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Gives a melee weapon 1d4 fire damage, +1 per caster
  level electric damage bonus, to a maximum of +10.
*/
//:://////////////////////////////////////////////
//:: Created By: Andrew Nobbs
//:: Created On: Nov 29, 2002
//:://////////////////////////////////////////////
//:: Updated by Andrew Nobbs May 08, 2003
//:: 2003-07-07: Stacking Spell Pass, Georg Zoeller
//:: 2003-07-15: Complete Rewrite to make use of Item Property System



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
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

    int nDuration = 2 * GetCasterLevel(OBJECT_SELF);
    int nMetaMagic = GetMetaMagicFeat();
    int nCasterLvl = GetCasterLevel(OBJECT_SELF);

    object oObject = GetItemInSlot(INVENTORY_SLOT_ARMS, OBJECT_SELF);
    object oMyWeapon   =  IPGetTargetedOrEquippedMeleeWeapon();

    //Limit nCasterLvl to 10, so it max out at +10 to the damage.
    if(nCasterLvl > 10)
    {
        nCasterLvl = 10;
    }

    if (nMetaMagic == METAMAGIC_EXTEND)
    {
        nDuration = nDuration * 2; //Duration is +100%
    }

   if(GetIsObjectValid(oMyWeapon) || GetIsObjectValid(oObject))
   {
        SignalEvent(GetItemPossessor(oMyWeapon), EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));

        if (nCasterLvl == 0 || nCasterLvl == 1 || nCasterLvl == 2 || nCasterLvl == 3)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_1d4), TurnsToSeconds(nDuration));
            return;
        }

        if (nCasterLvl == 4 || nCasterLvl == 5)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_1d6), TurnsToSeconds(nDuration));
            return;
        }

        if (nCasterLvl == 6 || nCasterLvl == 7)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_1d8), TurnsToSeconds(nDuration));
            return;
        }

        if (nCasterLvl == 8 || nCasterLvl == 9)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_1d10), TurnsToSeconds(nDuration));
            return;
        }

        if (nCasterLvl == 10)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_1d12), TurnsToSeconds(nDuration));
            IPSafeAddItemProperty(oMyWeapon, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_POSITIVE, IP_CONST_DAMAGEBONUS_1d4), TurnsToSeconds(nDuration));
            return;
        }
    }

    else
    {
        FloatingTextStrRefOnCreature(83615, OBJECT_SELF);
        return;
    }
}

