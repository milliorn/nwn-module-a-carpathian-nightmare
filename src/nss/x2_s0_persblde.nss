//::///////////////////////////////////////////////
//:: Shelgarn's Persistent Blade
//:: X2_S0_PersBlde
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Summons a dagger to battle for the caster
*/
//:://////////////////////////////////////////////
//:: Created By: Andrew Nobbs
//:: Created On: Nov 26, 2002
//:://////////////////////////////////////////////
//:: Last Updated By: Georg Zoeller, Aug 2003
//
// Edits by Cheetah:
// level 5-9 gives the summon +1d4 sonic damage
// level 10-14 gives the summon +2d4 sonic damage
// level 15+ gives the summon +2d8 sonic damage
#include "nw_i0_plot"
#include "x2_i0_spells"
#include "x2_inc_spellhook"

//Creates the weapon that the creature will be using.
void spellsCreateItemForSummoned(object oCaster, float fDuration)
{
    //Declare major variables
    int nStat = GetIsMagicStatBonus(oCaster) / 2;
    int nLevel = GetCasterLevel(oCaster);
    effect eDamageBonus;
    // GZ: Just in case...
    if (nStat >20)
    {
        nStat =20;
    }
    else if (nStat <1)
    {
        nStat = 1;
    }
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED);
    object oWeapon;
    if (GetIsObjectValid(oSummon))
    {
        // Weapon depends on level.
        if (nLevel >= 10)
        oWeapon = CreateItemOnObject("NW_WSWKA001", oSummon);
        else
        oWeapon = CreateItemOnObject("NW_WSWDG001", oSummon);

        // GZ: Fix for weapon being dropped when killed
        SetDroppableFlag(oWeapon,FALSE);
        AssignCommand(oSummon, ActionEquipItem(oWeapon, INVENTORY_SLOT_RIGHTHAND));
        // GZ: Check to prevent invalid item properties from being applies
        if (nStat>0)
        {
            AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyAttackBonus(nStat), oWeapon,fDuration);
        }
        AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyDamageReduction(IP_CONST_DAMAGEREDUCTION_1,5),oWeapon,fDuration);

        // Damage bonuses...
        if (nLevel >= 15)
        {
        eDamageBonus = ExtraordinaryEffect(SupernaturalEffect(EffectDamageIncrease(DAMAGE_BONUS_2d8, DAMAGE_TYPE_SONIC)));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDamageBonus, oSummon);
        }
        else if (nLevel >= 10)
        {
        eDamageBonus = ExtraordinaryEffect(SupernaturalEffect(EffectDamageIncrease(DAMAGE_BONUS_2d4, DAMAGE_TYPE_SONIC)));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDamageBonus, oSummon);
        }
        else if (nLevel >= 5)
        {
        eDamageBonus = ExtraordinaryEffect(SupernaturalEffect(EffectDamageIncrease(DAMAGE_BONUS_1d4, DAMAGE_TYPE_SONIC)));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDamageBonus, oSummon);
        }
    }
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

    if(!HasItem(OBJECT_SELF, "book_of_summons") && GetIsPC(OBJECT_SELF))
    {
        CreateItemOnObject("book_of_summons", OBJECT_SELF);
    }

    //Declare major variables
    int nMetaMagic = GetMetaMagicFeat();
    int nDuration = GetCasterLevel(OBJECT_SELF)/2;
    if (nDuration <1)
    {
        nDuration = 1;
    }
    effect eSummon;
    if (GetCasterLevel(OBJECT_SELF) >= 10)
    eSummon = EffectSummonCreature("su_shelgarn2");
    else
    eSummon = EffectSummonCreature("su_shelgarn1");

    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
    //Make metamagic check for extend
    if (nMetaMagic == METAMAGIC_EXTEND)
    {
        nDuration = nDuration *2;   //Duration is +100%
    }
    //Apply the VFX impact and summon effect
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, GetSpellTargetLocation());
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, GetSpellTargetLocation(), TurnsToSeconds(nDuration));

    object oSelf = OBJECT_SELF;
    DelayCommand(1.0, spellsCreateItemForSummoned(oSelf,TurnsToSeconds(nDuration)));
}

