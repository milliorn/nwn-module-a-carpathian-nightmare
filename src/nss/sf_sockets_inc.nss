//::///////////////////////////////////////////////
//:: Scarface's Socketed Items include
//:: V2.5
//:: sf_sockets_inc
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////

#include "x2_inc_itemprop"

//////////////////////////////////////////////////
//:: Global Constants
//:: These constants can be set to your liking
//::
//:: NOTE:
//::      Do NOT set the constants higher than the
//::      maximum specified otherwise the system
//::      will fail to function correctly.
//////////////////////////////////////////////////

// Use this switch to decide if you want to allow a gem to
// be socketed even if one of the same type is already occupying
// a socket.
// Note: this obviously won't work with haste, keen etc.
// TRUE = Allow stacking   :    FALSE = No stacking
const int STACKABLE_GEMS = TRUE;

// If this switch is set TRUE then stackable gems will share a slot with
// another gem of the same type.
// If set FALSE then gems of the same type will take their own slot if one is available.
// However the gem will still be stacked in either case based on
// the STACKABLE_GEMS switch.
// Ignore this switch if STACKABLE_GEMS is set FALSE.
const int STACKABLE_GEMS_SHARE_SLOT = TRUE;

// Maximum Damage Bonus allowed on a weapon
// Use the dice roll damage DAMAGE_BONUS_* constants
// at the top of this script.
// Minimum allowed is DAMAGE_BONUS_1d4.
// Maximum allowed is DAMAGE_BONUS_2d12.
const int MAX_DAMAGE_BONUS = DAMAGE_BONUS_2d12;

// Maximum Massive Critical allowed on a weapon
// Use the dice roll damage DAMAGE_BONUS_* constants
// at the top of this script.
// Minimum allowed is DAMAGE_BONUS_1d4.
// Maximum allowed is DAMAGE_BONUS_2d12.
const int MAX_MASSIVE_CRITICALS = DAMAGE_BONUS_2d12;

// Maximum Attack Bonus allowed on a weapon
// Do NOT set this higher than 20
const int MAX_ATTACK_BONUS = 5;

// Maximum Enhancement Bonus allowed on a weapon
// Do NOT set this higher than 20
const int MAX_ENHANCEMENT_BONUS = 5;

// Maximum AC Bonus allowed on armour type items
// Do NOT set this higher than 20
const int MAX_AC_BONUS = 5;

// Maximum Damage Resistance allowed on armour type items
// The only values you can use for this to function
// correctly is: 5, 10, 15, 20, 25, 30, 35, 40, 45, 50
const int MAX_DAMAGE_RESISTANCE = 5; // XX/-

// Maximum Regeneration Bonus allowed on armour type items
// Do NOT set this higher than 20
const int MAX_REGENERATION = 0;

// Maximum Ability Bonus allowed on armour type items
// Do NOT set this higher than 12
const int MAX_ABILITY_BONUS = 2;

// Maximum Vampiric allowed on a weapon
// Do NOT set this higher than 20
const int MAX_VAMP_REGEN_BONUS = 6;

// Maximum Saving Throw bonus allowed on armour items
// Do NOT set this higher than 20
const int MAX_SAVING_THROWS = 2;

// Maximum Skill bonus allowed on armour items
// Do NOT set this higher than 50
const int MAX_SKILL_BONUS = 1;

// Maximum Mighty bonus allowed on ranged items
// Do NOT set this higher than 10
const int MAX_MIGHTY = 10;

// Maximum Spell Resistance allowed on armour items
// Do NOT set this higher than 32
const int MAX_SPELL_RESISTANCE = 20;

// Debug mode switch.
const int DEBUG = FALSE;

////////////////////////////////////////////////////////////////////////////////
//:: Declared Functions
//:: Do NOT touch anything below!!!
////////////////////////////////////////////////////////////////////////////////

void SF_Debug(string sDebug);
struct ItemProperty SF_GetItemPropertyToAdd(object oTarget, int nIPType, int nIPSubType, int nIPValue);
int SF_GetNextSpellResistanceValue(int nValue);
int SF_GetIsDamageValid(object oTarget, int nIPType, int nIPSubType);
int SF_GetCurrentDamageValue(int nValue);
int SF_GetDamageValue(int nValue, int nNextValue = TRUE);
int SF_GetNextDamageResistValue(int nValue);
int SF_DamageBonusCostValue(int nCostTableValue);
int SF_DamageResistCostValue(int nCostTableValue);
int SF_GetNumSpellUses(int nValue);
string SF_GetDamageValueString(int nValue);
int SF_GetMatchingCostTableValue(itemproperty ipProp, int nCostTable);
int SF_GetMatchingItemProperty(object oItem, int nType, int nSubType = -1);
int SF_GetIsCorrectItemType(object oPC, object oItem, int nIPType);
int SF_GetMaxBonus(int nIPType);
int SF_GetHasSockets(object oPC, object oTarget);
int SF_GetIsSocketUpgradable(object oPC, object oTarget, int nOldValue);
void SF_DecrementSocket(object oPC, object oItem, object oTarget, int nOldValue);
void SF_SocketGemToItem(object oPC, object oTarget, object oActivated);

////////////////////////////////////////////////////////////////////////////////
//:: Main Functions
//:: Do NOT touch anything below!!!
////////////////////////////////////////////////////////////////////////////////

void SF_Debug(string sDebug) {

    PrintString(sDebug);
    SendMessageToPC(GetFirstPC(), sDebug);
}

struct ItemProperty {int Restriction; int Value; int OldValue; int Damage; itemproperty ItemProp; };
struct ItemProperty SF_GetItemPropertyToAdd(object oTarget, int nIPType, int nIPSubType, int nIPValue) {

    struct ItemProperty IP;
    int nBaseItem = GetBaseItemType(oTarget);

    switch (nIPType) {

        case ITEM_PROPERTY_ABILITY_BONUS: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, nIPSubType);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Value = nIPValue + IP.OldValue;
            IP.ItemProp = ItemPropertyAbilityBonus(nIPSubType, IP.Value);
            break;
        }
        case ITEM_PROPERTY_AC_BONUS: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Value = nIPValue + IP.OldValue;
            IP.ItemProp = ItemPropertyACBonus(IP.Value);
            break;
        }
        case ITEM_PROPERTY_DAMAGE_BONUS: {

            if (IPGetIsRangedWeapon(oTarget)) { IP.Restriction = 9999; break; }
            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, nIPSubType);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Damage = SF_GetDamageValue(IP.OldValue - 1);
            IP.Value = SF_GetDamageValue(nIPValue + IP.OldValue);
            IP.ItemProp = ItemPropertyDamageBonus(nIPSubType, IP.Value);
            break;
        }
        case ITEM_PROPERTY_DAMAGE_RESISTANCE: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, nIPSubType);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Value = SF_GetNextDamageResistValue(nIPValue + IP.OldValue);
            IP.ItemProp = ItemPropertyDamageResistance(nIPSubType, IP.Value);
            break;
        }
        case ITEM_PROPERTY_ATTACK_BONUS: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Value = nIPValue + IP.OldValue;
            IP.ItemProp = ItemPropertyAttackBonus(IP.Value);
            break;
        }
        case ITEM_PROPERTY_ENHANCEMENT_BONUS: {

            if (IPGetIsRangedWeapon(oTarget) ||
                nBaseItem == BASE_ITEM_GLOVES ||
                nBaseItem == BASE_ITEM_MAGICSTAFF) { IP.Restriction = 9999; break; }
            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Value = nIPValue + IP.OldValue;
            IP.ItemProp = ItemPropertyEnhancementBonus(IP.Value);
            break;
        }
        case ITEM_PROPERTY_REGENERATION_VAMPIRIC: {

            if (nBaseItem == BASE_ITEM_GLOVES) { IP.Restriction = 9999; break; }
            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Value = nIPValue + IP.OldValue;
            IP.ItemProp = ItemPropertyVampiricRegeneration(IP.Value);
            break;
        }
        case ITEM_PROPERTY_HASTE: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue == -999) { IP.Restriction = 9998; break; }
            IP.ItemProp = ItemPropertyHaste();
            break;
        }
        case ITEM_PROPERTY_HOLY_AVENGER: {

            if (IPGetIsRangedWeapon(oTarget) ||
                nBaseItem == BASE_ITEM_GLOVES ||
                nBaseItem == BASE_ITEM_MAGICSTAFF)  { IP.Restriction = 9999; break; }
            if (IP.OldValue == -999) { IP.Restriction = 9998; break; }
            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            IP.ItemProp = ItemPropertyHolyAvenger();
            break;
        }
        case ITEM_PROPERTY_KEEN: {

            if (IPGetIsRangedWeapon(oTarget) ||
                nBaseItem == BASE_ITEM_GLOVES ||
                nBaseItem == BASE_ITEM_MAGICSTAFF)  { IP.Restriction = 9999; break; }
            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue == -999) { IP.Restriction = 9998; break; }
            IP.ItemProp = ItemPropertyKeen();
            break;
        }
        case ITEM_PROPERTY_MASSIVE_CRITICALS: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Damage = SF_GetDamageValue(IP.OldValue - 1);
            IP.Value = SF_GetDamageValue(nIPValue + IP.OldValue);
            IP.ItemProp = ItemPropertyMassiveCritical(IP.Value);
            break;
        }
        case ITEM_PROPERTY_REGENERATION: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Value = nIPValue + IP.OldValue;
            IP.ItemProp = ItemPropertyRegeneration(IP.Value);
            break;
        }
        case ITEM_PROPERTY_SAVING_THROW_BONUS: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, nIPSubType);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Value = nIPValue + IP.OldValue;
            IP.ItemProp = ItemPropertyBonusSavingThrow(nIPSubType, IP.Value);
            break;
        }
        case ITEM_PROPERTY_SKILL_BONUS: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, nIPSubType);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Value = nIPValue + IP.OldValue;
            IP.ItemProp = ItemPropertySkillBonus(nIPSubType, IP.Value);
            break;
        }
        case ITEM_PROPERTY_SPELL_RESISTANCE: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Value = SF_GetNextSpellResistanceValue(nIPValue + IP.OldValue);
            IP.ItemProp =  ItemPropertyBonusSpellResistance(IP.Value);
            break;
        }
        case ITEM_PROPERTY_TRUE_SEEING: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue == -999) { IP.Restriction = 9998; break; }
            IP.ItemProp = ItemPropertyTrueSeeing();
            break;
        }
        case ITEM_PROPERTY_IMPROVED_EVASION: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue == -999) { IP.Restriction = 9998; break; }
            IP.ItemProp = ItemPropertyImprovedEvasion();
            break;
        }
        case ITEM_PROPERTY_BONUS_FEAT: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, nIPSubType);
            if (IP.OldValue == -999) { IP.Restriction = 9998; break; }
            IP.ItemProp = ItemPropertyBonusFeat(nIPSubType);
            break;
        }
        case ITEM_PROPERTY_FREEDOM_OF_MOVEMENT: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue == -999) { IP.Restriction = 9998; break; }
            IP.ItemProp = ItemPropertyFreeAction();
            break;
        }
        case ITEM_PROPERTY_CAST_SPELL: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, nIPSubType);
            if (IP.OldValue == -999) { IP.Restriction = 9998; break; }
            IP.ItemProp = ItemPropertyCastSpell(nIPSubType, SF_GetNumSpellUses(nIPValue));
            break;
        }
        case ITEM_PROPERTY_ONHITCASTSPELL: {

            if (!IPGetIsMeleeWeapon(oTarget) &&
                nBaseItem != BASE_ITEM_ARMOR &&
                nBaseItem != BASE_ITEM_GLOVES &&
                nBaseItem != BASE_ITEM_MAGICSTAFF) { IP.Restriction = 9999; break; }
            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, nIPSubType);
            if (IP.OldValue == -999) { IP.Restriction = 9998; break; }
            IP.ItemProp = ItemPropertyOnHitCastSpell(nIPSubType, nIPValue);
            break;
        }
        case ITEM_PROPERTY_BONUS_SPELL_SLOT_OF_LEVEL_N: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, nIPSubType);
            if (IP.OldValue == -999) { IP.Restriction = 9998; break; }
            IP.ItemProp = ItemPropertyBonusLevelSpell(nIPSubType, nIPValue);
            break;
        }
        case ITEM_PROPERTY_UNLIMITED_AMMUNITION: {

            if (IPGetItemHasProperty(oTarget, ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_1D6COLD), DURATION_TYPE_PERMANENT, TRUE) ||
            IPGetItemHasProperty(oTarget, ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_1D6FIRE), DURATION_TYPE_PERMANENT, TRUE) ||
            IPGetItemHasProperty(oTarget, ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_1D6LIGHT), DURATION_TYPE_PERMANENT, TRUE) ||
            IPGetItemHasProperty(oTarget, ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_BASIC), DURATION_TYPE_PERMANENT, TRUE) ||
            IPGetItemHasProperty(oTarget, ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_PLUS1), DURATION_TYPE_PERMANENT, TRUE) ||
            IPGetItemHasProperty(oTarget, ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_PLUS2), DURATION_TYPE_PERMANENT, TRUE) ||
            IPGetItemHasProperty(oTarget, ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_PLUS3), DURATION_TYPE_PERMANENT, TRUE) ||
            IPGetItemHasProperty(oTarget, ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_PLUS4), DURATION_TYPE_PERMANENT, TRUE) ||
            IPGetItemHasProperty(oTarget, ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_PLUS4), DURATION_TYPE_PERMANENT, TRUE))
            {
                IP.Restriction = 9997; break;
            }

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, nIPSubType);
            if (IP.OldValue == -999)
            {
                IP.Restriction = 9998; break;
            }
            IP.ItemProp = ItemPropertyUnlimitedAmmo(nIPSubType);
            break;
        }
        case ITEM_PROPERTY_EXTRA_RANGED_DAMAGE_TYPE: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, nIPSubType);
            if (IP.OldValue == -999) { IP.Restriction = 9998; break; }
            IP.ItemProp = ItemPropertyExtraRangeDamageType(nIPSubType);
            break;
        }
        case ITEM_PROPERTY_MIGHTY: {

            IP.OldValue = SF_GetMatchingItemProperty(oTarget, nIPType, -1);
            if (IP.OldValue < 0) { IP.OldValue = 0; }
            IP.Value = nIPValue + IP.OldValue;
            IP.ItemProp = ItemPropertyMaxRangeStrengthMod(IP.Value);
            break;
        }
    }

    return IP;
}

int SF_GetNextSpellResistanceValue(int nValue) {

    switch (nValue) {

        case -1:
        case 0:     { nValue = IP_CONST_SPELLRESISTANCEBONUS_10; break; }
        case 10:    { nValue = IP_CONST_SPELLRESISTANCEBONUS_12; break; }
        case 12:    { nValue = IP_CONST_SPELLRESISTANCEBONUS_14; break; }
        case 14:    { nValue = IP_CONST_SPELLRESISTANCEBONUS_16; break; }
        case 16:    { nValue = IP_CONST_SPELLRESISTANCEBONUS_18; break; }
        case 18:    { nValue = IP_CONST_SPELLRESISTANCEBONUS_20; break; }
        case 20:    { nValue = IP_CONST_SPELLRESISTANCEBONUS_22; break; }
        case 22:    { nValue = IP_CONST_SPELLRESISTANCEBONUS_24; break; }
        case 24:    { nValue = IP_CONST_SPELLRESISTANCEBONUS_26; break; }
        case 26:    { nValue = IP_CONST_SPELLRESISTANCEBONUS_28; break; }
        case 28:    { nValue = IP_CONST_SPELLRESISTANCEBONUS_30; break; }
        case 30:    { nValue = IP_CONST_SPELLRESISTANCEBONUS_32; break; }
        case 32:    { nValue =  99; break; }
        default:    { nValue = -99; break; }
    }

    return nValue;
}

int SF_GetDamageValue(int nValue, int nNextValue = TRUE) {

    if (nNextValue < 1) { nValue --; }

    switch (nValue) {

        case -1:
        case 0:     { nValue = DAMAGE_BONUS_1d4;  break; }
        case 21:    { nValue = DAMAGE_BONUS_1d6;  break; }
        case 22:    { nValue = DAMAGE_BONUS_1d8;  break; }
        case 23:    { nValue = DAMAGE_BONUS_1d10; break; }
        case 24:    { nValue = DAMAGE_BONUS_1d12; break; }
        case 25:    { nValue = DAMAGE_BONUS_2d4;  break; }
        case 26:    { nValue = DAMAGE_BONUS_2d6;  break; }
        case 27:    { nValue = DAMAGE_BONUS_2d8;  break; }
        case 28:    { nValue = DAMAGE_BONUS_2d10; break; }
        case 29:    { nValue = DAMAGE_BONUS_2d12; break; }
        case 30:    { nValue =  99; break; }
        default:    { nValue = -99; break; }
    }

    return nValue;
}

int SF_GetNextDamageResistValue(int nValue) {

    switch (nValue) {

        case -1:
        case 0:     { nValue = IP_CONST_DAMAGERESIST_5;  break; }
        case 5:     { nValue = IP_CONST_DAMAGERESIST_10; break; }
        case 10:    { nValue = IP_CONST_DAMAGERESIST_15; break; }
        case 15:    { nValue = IP_CONST_DAMAGERESIST_20; break; }
        case 20:    { nValue = IP_CONST_DAMAGERESIST_25; break; }
        case 25:    { nValue = IP_CONST_DAMAGERESIST_30; break; }
        case 30:    { nValue = IP_CONST_DAMAGERESIST_35; break; }
        case 35:    { nValue = IP_CONST_DAMAGERESIST_40; break; }
        case 40:    { nValue = IP_CONST_DAMAGERESIST_45; break; }
        case 45:    { nValue = IP_CONST_DAMAGERESIST_50; break; }
        case 50:    { nValue =  99; break; }
        default:    { nValue = -99; break; }
    }

    return nValue;
}

int SF_DamageBonusCostValue(int nCostTableValue)
{

    switch(nCostTableValue)
    {
        case 1:     { nCostTableValue = 1;  break; }
        case 2:     { nCostTableValue = 2;  break; }
        case 3:     { nCostTableValue = 3;  break; }
        case 4:     { nCostTableValue = 4;  break; }
        case 5:     { nCostTableValue = 5;  break; }
        case 6:     { nCostTableValue = 21; break; }// 1d4
        case 7:     { nCostTableValue = 22; break; }// 1d6
        case 8:     { nCostTableValue = 23; break; }// 1d8
        case 9:     { nCostTableValue = 24; break; }// 1d10
        case 10:    { nCostTableValue = 27; break; }// 2d6
        case 11:    { nCostTableValue = 28; break; }// 2d8
        case 12:    { nCostTableValue = 26; break; }// 2d4
        case 13:    { nCostTableValue = 29; break; }// 2d10
        case 14:    { nCostTableValue = 25; break; }// 1d12
        case 15:    { nCostTableValue = 30; break; }// 2d12
        case 16:    { nCostTableValue = 6;  break; }
        case 17:    { nCostTableValue = 7;  break; }
        case 18:    { nCostTableValue = 8;  break; }
        case 19:    { nCostTableValue = 9;  break; }
        case 20:    { nCostTableValue = 10; break; }
        case 21:    { nCostTableValue = 11; break; }
        case 22:    { nCostTableValue = 12; break; }
        case 23:    { nCostTableValue = 13; break; }
        case 24:    { nCostTableValue = 14; break; }
        case 25:    { nCostTableValue = 15; break; }
        case 26:    { nCostTableValue = 16; break; }
        case 27:    { nCostTableValue = 17; break; }
        case 28:    { nCostTableValue = 18; break; }
        case 29:    { nCostTableValue = 19; break; }
        case 30:    { nCostTableValue = 20; break; }
        default:    { nCostTableValue = -1; break; }
    }
    return nCostTableValue;
}

int SF_DamageResistCostValue(int nCostTableValue)  {

    switch(nCostTableValue)
    {
        case 1:     { nCostTableValue = 5;  break; }
        case 2:     { nCostTableValue = 10; break; }
        case 3:     { nCostTableValue = 15; break; }
        case 4:     { nCostTableValue = 20; break; }
        case 5:     { nCostTableValue = 25; break; }
        case 6:     { nCostTableValue = 30; break; }
        case 7:     { nCostTableValue = 35; break; }
        case 8:     { nCostTableValue = 40; break; }
        case 9:     { nCostTableValue = 45; break; }
        case 10:    { nCostTableValue = 50; break; }
        default:    { nCostTableValue = -1; break; }
    }

    return nCostTableValue;
}

int SF_SpellResistCostValue(int nCostTableValue) {

    switch (nCostTableValue) {

        case 0:     { nCostTableValue = 10; break; }
        case 1:     { nCostTableValue = 12; break; }
        case 2:     { nCostTableValue = 14; break; }
        case 3:     { nCostTableValue = 16; break; }
        case 4:     { nCostTableValue = 18; break; }
        case 5:     { nCostTableValue = 20; break; }
        case 6:     { nCostTableValue = 22; break; }
        case 7:     { nCostTableValue = 24; break; }
        case 8:     { nCostTableValue = 26; break; }
        case 9:     { nCostTableValue = 28; break; }
        case 10:    { nCostTableValue = 30; break; }
        case 11:    { nCostTableValue = 32; break; }
        default:    { nCostTableValue = -1; break; }
    }

    return nCostTableValue;
}

int SF_GetNumSpellUses(int nValue) {

    switch (nValue) {

        case 1:     { nValue = IP_CONST_CASTSPELL_NUMUSES_1_USE_PER_DAY;  break; }
        case 2:     { nValue = IP_CONST_CASTSPELL_NUMUSES_2_USES_PER_DAY; break; }
        case 3:     { nValue = IP_CONST_CASTSPELL_NUMUSES_3_USES_PER_DAY; break; }
        case 4:     { nValue = IP_CONST_CASTSPELL_NUMUSES_4_USES_PER_DAY; break; }
        case 5:     { nValue = IP_CONST_CASTSPELL_NUMUSES_5_USES_PER_DAY; break; }
        case 6:     { nValue = IP_CONST_CASTSPELL_NUMUSES_UNLIMITED_USE;  break; }
        default:    { nValue = -1;  break; }
    }

    return nValue;
}

string SF_GetDamageValueString(int nValue) {

    string sValue = "";

    switch (nValue) {

        case DAMAGE_BONUS_1d4:  { sValue = "1d4";   break; }
        case DAMAGE_BONUS_1d6:  { sValue = "1d6";   break; }
        case DAMAGE_BONUS_1d8:  { sValue = "1d8";   break; }
        case DAMAGE_BONUS_1d10: { sValue = "1d10";  break; }
        case DAMAGE_BONUS_1d12: { sValue = "1d12";  break; }
        case DAMAGE_BONUS_2d4:  { sValue = "2d4";   break; }
        case DAMAGE_BONUS_2d6:  { sValue = "2d6";   break; }
        case DAMAGE_BONUS_2d8:  { sValue = "2d8";   break; }
        case DAMAGE_BONUS_2d10: { sValue = "2d10";  break; }
        case DAMAGE_BONUS_2d12: { sValue = "2d12";  break; }
    }

    return sValue;
}

int SF_GetIsItemActivatedValid(object oTarget) {

    int nBaseType = GetBaseItemType(oTarget);

    switch (nBaseType) {

        case BASE_ITEM_AMULET:
        case BASE_ITEM_ARMOR:
        case BASE_ITEM_BASTARDSWORD:
        case BASE_ITEM_BATTLEAXE:
        case BASE_ITEM_BELT:
        case BASE_ITEM_BOOTS:
        case BASE_ITEM_BRACER:
        case BASE_ITEM_CLOAK:
        case BASE_ITEM_CLUB:
        case BASE_ITEM_DAGGER:
        case BASE_ITEM_DIREMACE:
        case BASE_ITEM_DOUBLEAXE:
        case BASE_ITEM_DWARVENWARAXE:
        case BASE_ITEM_GLOVES:
        case BASE_ITEM_GREATAXE:
        case BASE_ITEM_GREATSWORD:
        case BASE_ITEM_HALBERD:
        case BASE_ITEM_HANDAXE:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_HEAVYFLAIL:
        case BASE_ITEM_HELMET:
        case BASE_ITEM_KAMA:
        case BASE_ITEM_KATANA:
        case BASE_ITEM_KUKRI:
        case BASE_ITEM_LARGESHIELD:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_LIGHTFLAIL:
        case BASE_ITEM_LIGHTHAMMER:
        case BASE_ITEM_LIGHTMACE:
        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_LONGSWORD:
        case BASE_ITEM_MAGICSTAFF:
        case BASE_ITEM_MORNINGSTAR:
        case BASE_ITEM_QUARTERSTAFF:
        case BASE_ITEM_RAPIER:
        case BASE_ITEM_RING:
        case BASE_ITEM_SCIMITAR:
        case BASE_ITEM_SCYTHE:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_SHORTSPEAR:
        case BASE_ITEM_SHORTSWORD:
        case BASE_ITEM_SICKLE:
        case BASE_ITEM_SLING:
        case BASE_ITEM_SMALLSHIELD:
        case BASE_ITEM_TOWERSHIELD:
        case BASE_ITEM_TRIDENT:
        case BASE_ITEM_TWOBLADEDSWORD:
        case BASE_ITEM_WARHAMMER:
        case BASE_ITEM_WHIP: {

            nBaseType = TRUE;
            break;
        }
        default: nBaseType = FALSE;
    }

    return nBaseType;
}

int SF_GetMatchingCostTableValue(itemproperty ipProp, int nCostTable) {

    int nCostTableValue = GetItemPropertyCostTableValue(ipProp);

    switch(nCostTable) {

        /* IPRP_BONUSCOST */
        /* IPRP_MELEECOST */
        /* IPRP_SKILLCOST */
        case 1:  case 2: case 25:{ nCostTable = nCostTableValue; break; }

        /* IPRP_DAMAGECOST */
        case 4: { nCostTable = SF_DamageBonusCostValue(nCostTableValue); break; }

        /* IPRP_RESISTCOST */
        case 7: { nCostTable = SF_DamageResistCostValue(nCostTableValue); break; }

        /* IPRP_SRCOST */
        case 11: { nCostTable = SF_SpellResistCostValue(nCostTableValue); break; }

        /* DEFAULT COST */
        default: { nCostTable = -999; break; }
    }

    return nCostTable;
}
int SF_GetMatchingItemProperty(object oItem, int nType, int nSubType = -1) {

    itemproperty ipProp = GetFirstItemProperty(oItem);
    int nMatchType; int nMatchSubType;

    // Bug fix - Saving Throws weirdness
    if (nType == 40) { nType = 41; }

    if (DEBUG) {

        SF_Debug("IP Type To Find = " + IntToString(nType));
        SF_Debug("IP Subtype To Find = " + IntToString(nSubType));
    }


    while (GetIsItemPropertyValid(ipProp)) {

        nMatchType = GetItemPropertyType(ipProp);
        nMatchSubType = GetItemPropertySubType(ipProp);

        if (DEBUG) {

            SF_Debug("IP Loop: ");
            SF_Debug("IP Type To Found = " + IntToString(nMatchType));
            SF_Debug("IP Subtype To Found = " + IntToString(nMatchSubType));
        }

        if ((nMatchType == nType && nMatchSubType == nSubType) ||
             nMatchType == nType && nMatchSubType == 65535) {

            nMatchType = SF_GetMatchingCostTableValue(ipProp, GetItemPropertyCostTable(ipProp));

            if (DEBUG) {

                SF_Debug("Matching IP Found!!!");
                SF_Debug("IP Cost Table = " + IntToString(nMatchType));
            }

            return nMatchType;
        }

        ipProp = GetNextItemProperty(oItem);
    }

    return -1;
}

int SF_GetIsCorrectItemType(object oPC, object oTarget, int nIPType) {

    int nBaseItem = GetBaseItemType(oTarget);

    switch(nIPType) {

        case ITEM_PROPERTY_MIGHTY:
        case ITEM_PROPERTY_EXTRA_RANGED_DAMAGE_TYPE:
        case ITEM_PROPERTY_UNLIMITED_AMMUNITION: {

            if (IPGetIsRangedWeapon(oTarget)) { nBaseItem = TRUE; }

            break;
        }
        case ITEM_PROPERTY_MASSIVE_CRITICALS:
        case ITEM_PROPERTY_ATTACK_BONUS:
        case ITEM_PROPERTY_DAMAGE_BONUS:
        case ITEM_PROPERTY_ENHANCEMENT_BONUS:
        case ITEM_PROPERTY_KEEN:
        case ITEM_PROPERTY_HOLY_AVENGER:
        case ITEM_PROPERTY_ONHITCASTSPELL:
        case ITEM_PROPERTY_REGENERATION_VAMPIRIC: {

            if (IPGetIsMeleeWeapon(oTarget) ||
                nBaseItem == BASE_ITEM_GLOVES ||
                nBaseItem == BASE_ITEM_MAGICSTAFF) { nBaseItem = TRUE; }

            break;
        }
        case ITEM_PROPERTY_ABILITY_BONUS:
        case ITEM_PROPERTY_AC_BONUS:
        case ITEM_PROPERTY_BONUS_FEAT:
        case ITEM_PROPERTY_CAST_SPELL:
        case ITEM_PROPERTY_DAMAGE_REDUCTION:
        case ITEM_PROPERTY_DAMAGE_RESISTANCE:
        case ITEM_PROPERTY_FREEDOM_OF_MOVEMENT:
        case ITEM_PROPERTY_HASTE:
        case ITEM_PROPERTY_IMPROVED_EVASION:
        case ITEM_PROPERTY_REGENERATION:
        case ITEM_PROPERTY_SAVING_THROW_BONUS:
        case ITEM_PROPERTY_SKILL_BONUS:
        case ITEM_PROPERTY_SPELL_RESISTANCE:
        case ITEM_PROPERTY_BONUS_SPELL_SLOT_OF_LEVEL_N:
        case ITEM_PROPERTY_TRUE_SEEING:  {

            if (IPGetIsRangedWeapon(oTarget))  { nBaseItem = TRUE; break; }

            switch (nBaseItem) {

                case BASE_ITEM_AMULET:
                case BASE_ITEM_GLOVES:
                case BASE_ITEM_MAGICSTAFF:
                case BASE_ITEM_ARMOR:
                case BASE_ITEM_BELT:
                case BASE_ITEM_BOOTS:
                case BASE_ITEM_BRACER:
                case BASE_ITEM_CLOAK:
                case BASE_ITEM_HELMET:
                case BASE_ITEM_SMALLSHIELD:
                case BASE_ITEM_TOWERSHIELD:
                case BASE_ITEM_LARGESHIELD:
                case BASE_ITEM_RING: { nBaseItem = TRUE; }
            }
            break;
        }
        default: { nBaseItem = FALSE; break; }
    }

    if (!nBaseItem) {

        FloatingTextStringOnCreature("This type of gem can not be socketed into this type of item.", oPC);
    }

    return nBaseItem;
}

int SF_GetMaxBonus(int nIPType) {

    int nMaxBonus;

    switch (nIPType) {

        // Weapon Bonuses
        case ITEM_PROPERTY_ATTACK_BONUS:            { nMaxBonus = MAX_ATTACK_BONUS; break; }
        case ITEM_PROPERTY_DAMAGE_BONUS:            { nMaxBonus = MAX_DAMAGE_BONUS; break; }
        case ITEM_PROPERTY_ENHANCEMENT_BONUS:       { nMaxBonus = MAX_ENHANCEMENT_BONUS; break; }
        case ITEM_PROPERTY_MASSIVE_CRITICALS:       { nMaxBonus = MAX_MASSIVE_CRITICALS; break; }
        case ITEM_PROPERTY_REGENERATION_VAMPIRIC:   { nMaxBonus = MAX_VAMP_REGEN_BONUS; break; }
        case ITEM_PROPERTY_MIGHTY:                  { nMaxBonus = MAX_MIGHTY; break; }

        // Armour Bonuses
        case ITEM_PROPERTY_ABILITY_BONUS:           { nMaxBonus = MAX_ABILITY_BONUS; break; }
        case ITEM_PROPERTY_AC_BONUS:                { nMaxBonus = MAX_AC_BONUS; break; }
        case ITEM_PROPERTY_DAMAGE_RESISTANCE:       { nMaxBonus = MAX_DAMAGE_RESISTANCE; break; }
        case ITEM_PROPERTY_REGENERATION:            { nMaxBonus = MAX_REGENERATION; break; }
        case ITEM_PROPERTY_SAVING_THROW_BONUS:      { nMaxBonus = MAX_SAVING_THROWS; break; }
        case ITEM_PROPERTY_SKILL_BONUS:             { nMaxBonus = MAX_SKILL_BONUS; break; }
        case ITEM_PROPERTY_SPELL_RESISTANCE:        { nMaxBonus = MAX_SPELL_RESISTANCE; break; }

        default: nMaxBonus = 0;
   }

    return nMaxBonus;
}

int SF_GetHasSockets(object oPC, object oTarget) {

    int nSockets = GetLocalInt(oTarget, "SOCKET_SLOTS");

    FloatingTextStringOnCreature(IntToString(nSockets) + " socket(s) left", oPC);

    return TRUE;
}

void SF_DecrementSocket(object oPC, object oItem, object oTarget, int nOldValue)
{
    int nSockets = GetLocalInt(oTarget, "SOCKET_SLOTS");

    if ((!STACKABLE_GEMS_SHARE_SLOT && STACKABLE_GEMS && nOldValue > 0) || (nOldValue <= 0))
    {
        if (nSockets > 0)
        {
            nSockets --;
            SetLocalInt(oTarget, "SOCKET_SLOTS", nSockets);
        }
    }

    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionUnequipItem(oTarget));
    DestroyObject(oItem);
    SF_GetHasSockets(oPC, oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_30), oPC);
}

int SF_GetIsSocketUpgradable(object oPC, object oTarget, int nOldValue)
{
    int nSockets = GetLocalInt(oTarget, "SOCKET_SLOTS");

    if (!STACKABLE_GEMS && nOldValue  && nSockets) {

        FloatingTextStringOnCreature("You can not socket another gem of this type.", oPC);
        return FALSE;
    }

    if (!nSockets && !nOldValue)
    //if (nSockets == 0)
    {

        FloatingTextStringOnCreature("No more sockets left", oPC);
        return FALSE;
    }

    return TRUE;
}

void SF_SocketGemToItem(object oPC, object oTarget, object oGem) {

    int nIPType     = GetLocalInt(oGem, "IP_TYPE");
    int nIPSubType  = GetLocalInt(oGem, "IP_SUBTYPE");
    int nIPValue    = GetLocalInt(oGem, "IP_VALUE");

    struct ItemProperty IP = SF_GetItemPropertyToAdd(oTarget, nIPType, nIPSubType, nIPValue);

    if (!SF_GetIsCorrectItemType(oPC, oTarget, nIPType)) { return; }

    // Restrictions (Keen.. etc obviously won't work for gloves or staffs and so on)
    if (IP.Restriction == 9999) {

        FloatingTextStringOnCreature("This type of gem can not be socketed into this type of item.", oPC);
        return;
    }

    // Item Properties i.e. haste, imp evasion, true seeing... etc should not work if already present
    if (IP.Restriction == 9998) {

        FloatingTextStringOnCreature("Gems of this type do not stack.", oPC);
        return;
    }

    if (IP.Restriction == 9997) {

        FloatingTextStringOnCreature("You cannot change or stack Unlimited Ammo type.", oPC);
        return;
    }

    if (!SF_GetIsSocketUpgradable(oPC, oTarget, IP.OldValue)) { return; }

    int nMaxBonus = SF_GetMaxBonus(nIPType);

    if (DEBUG) {

        SF_Debug("Max Allowed Bonus: " + IntToString(nMaxBonus));
    }

    switch (nIPType) {

        case ITEM_PROPERTY_MASSIVE_CRITICALS:
        case ITEM_PROPERTY_DAMAGE_BONUS: {

            if (IP.Damage == nMaxBonus) {

                FloatingTextStringOnCreature("Maximum bonus allowed for this gem type is " + SF_GetDamageValueString(MAX_DAMAGE_BONUS) + ".", oPC);
                return;
            }
            break;
        }

        case ITEM_PROPERTY_DAMAGE_RESISTANCE: {

            if (IP.OldValue + 5 > nMaxBonus) {

                FloatingTextStringOnCreature("Maximum bonus allowed for this gem type is " + IntToString(nMaxBonus) + " /-.", oPC);
                return;
            }
            break;
        }

        default: {

            if (IP.Value > nMaxBonus) {

                FloatingTextStringOnCreature("Maximum bonus allowed for this gem type is " + IntToString(nMaxBonus) + ".", oPC);
                return;
            }
            break;
        }
    }

    IPRemoveAllItemProperties(oTarget, DURATION_TYPE_TEMPORARY);
    IPSafeAddItemProperty(oTarget, IP.ItemProp);
    SF_DecrementSocket(oPC, oGem, oTarget, IP.OldValue);
    ActionUnequipItem(oTarget);
}

/*void main () {}
