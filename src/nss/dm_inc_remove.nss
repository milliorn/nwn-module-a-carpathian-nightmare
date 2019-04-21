//::///////////////////////////////////////////////
//:: Name     Forge System Handler
//:: FileName dm_inc_remove
//:://////////////////////////////////////////////
/*

    This include file holds all the custom functions
    used in the new IP removal feature.
    Please do not alter any of this file. Any
    altering of this file is considered unsupported.
    For instructions on configuring the forge,
    please refer to the new script file: dm_forge_readme

    OmegaDM

*/
//:://////////////////////////////////////////////
//:: Created By: OmegaDM
//:: Created On: August 2006
//:://////////////////////////////////////////////

//////////////////////////////////////////////////

#include "dm_inc_forge"
//#include "x2_inc_itemprop"  wrapped in with dm_inc_forge

//::///////////////////////////////////////////////////////////////
//::        Do not alter ANYTHING within this include.
//::        All forge configuring is done in the file
//::        dm_forge_config
//::///////////////////////////////////////////////////////////////


void dmRemoveProperty(object oItem, int ModCode, int Mods = -1);

void dmRemoveProperty(object oItem, int ModCode, int Mods = -1)
{

    switch(ModCode)
    {
        case 1: // enhancement bonus
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_ENHANCEMENT_BONUS,DURATION_TYPE_PERMANENT);
            break;
        case 2: // fire damage
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_FIRE);
            break;
        case 3: // cold damage
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_COLD);
            break;
        case 4: // electrical damage
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_ELECTRICAL);
            break;
        case 5: // acid damage
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_ACID);
            break;
        case 6: // sonic damage
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_SONIC);
            break;
        case 7: // divine damage
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_DIVINE);
            break;
        case 8: // magical damage
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_MAGICAL);
            break;
        case 9: // all damages
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_BONUS,DURATION_TYPE_PERMANENT);
            break;
        case 10: // DR (damage reduction)
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_REDUCTION,DURATION_TYPE_PERMANENT);
            break;
        case 11: // fire resistance
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_RESISTANCE,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_FIRE);
            break;
        case 12: // cold resistance
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_RESISTANCE,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_COLD);
            break;
        case 13: // lightning resistance
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_RESISTANCE,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_ELECTRICAL);
            break;
        case 14: // acid resistance
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_RESISTANCE,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_ACID);
            break;
        case 15: // sonic resistance
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_RESISTANCE,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_SONIC);
            break;
        case 16: // divine resistance
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_RESISTANCE,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_DIVINE);
            break;
        case 17: // magical resistance
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_RESISTANCE,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_MAGICAL);
            break;
        case 18: // slashing resist
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_RESISTANCE,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_SLASHING);
            break;
        case 19: // piercing resist
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_RESISTANCE,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_PIERCING);
            break;
        case 20: // bludgeoning resist
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_RESISTANCE,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_BLUDGEONING);
            break;
        case 21: // AC bonus
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_AC_BONUS,DURATION_TYPE_PERMANENT);
            break;
        case 22: // strength bonus
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_ABILITY_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_ABILITY_STR);
            break;
        case 23: // dexterity bonus
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_ABILITY_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_ABILITY_DEX);
            break;
        case 24: // constitution bonus
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_ABILITY_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_ABILITY_CON);
            break;
        case 25: // intelligence bonus
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_ABILITY_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_ABILITY_INT);
            break;
        case 26: // wisdom bonus
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_ABILITY_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_ABILITY_WIS);
            break;
        case 27: // charisma bonus
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_ABILITY_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_ABILITY_CHA);
            break;
        case 28: // all ability bonuses
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_ABILITY_BONUS,DURATION_TYPE_PERMANENT);
            break;
        // Ran out of abilitys, so here we skip some and start our immunitys
        case 31: // death magic
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS,DURATION_TYPE_PERMANENT,IP_CONST_IMMUNITYMISC_DEATH_MAGIC);
            break;
        case 32: // disease
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS,DURATION_TYPE_PERMANENT,IP_CONST_IMMUNITYMISC_DISEASE);
            break;
        case 33: // fear
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS,DURATION_TYPE_PERMANENT,IP_CONST_IMMUNITYMISC_FEAR);
            break;
        case 34: // knockdown
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS,DURATION_TYPE_PERMANENT,IP_CONST_IMMUNITYMISC_KNOCKDOWN);
            break;
        case 35: // level and ability drain
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS,DURATION_TYPE_PERMANENT,IP_CONST_IMMUNITYMISC_LEVEL_ABIL_DRAIN);
            break;
        case 36: // mind spells
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS,DURATION_TYPE_PERMANENT,IP_CONST_IMMUNITYMISC_MINDSPELLS);
            break;
        case 37: // paralysis
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS,DURATION_TYPE_PERMANENT,IP_CONST_IMMUNITYMISC_PARALYSIS);
            break;
        case 38: // poison
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS,DURATION_TYPE_PERMANENT,IP_CONST_IMMUNITYMISC_POISON);
            break;
        case 39: // all immunitys
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS,DURATION_TYPE_PERMANENT);
            break;
        // skip 40 as we ran out of immunitys
        case 41: // attack bonus
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_ATTACK_BONUS,DURATION_TYPE_PERMANENT);
            break;
        // we can jump right into saves from here
        case 42: // fortitude save
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC,DURATION_TYPE_PERMANENT,IP_CONST_SAVEBASETYPE_FORTITUDE);
            break;
        case 43: // reflex save
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC,DURATION_TYPE_PERMANENT,IP_CONST_SAVEBASETYPE_REFLEX);
            break;
        case 44: // will save
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC,DURATION_TYPE_PERMANENT,IP_CONST_SAVEBASETYPE_WILL);
            break;
        case 45: // universal save
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_SAVING_THROW_BONUS,DURATION_TYPE_PERMANENT);
            break;
        case 46: // all saves
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC,DURATION_TYPE_PERMANENT);
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_SAVING_THROW_BONUS,DURATION_TYPE_PERMANENT);
            break;
        // ran out of saves, nothing else to fill in till 51
        case 51: // freedom of movement
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_FREEDOM_OF_MOVEMENT,DURATION_TYPE_PERMANENT);
            break;
        case 52: // haste
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_HASTE,DURATION_TYPE_PERMANENT);
            break;
        case 53: // keen
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_KEEN,DURATION_TYPE_PERMANENT);
            break;
        case 54: // true seeing
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_TRUE_SEEING,DURATION_TYPE_PERMANENT);
            break;
        case 55: // spell resistance
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_SPELL_RESISTANCE,DURATION_TYPE_PERMANENT);
            break;
        case 56: // unlimited ammo
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_UNLIMITED_AMMUNITION,DURATION_TYPE_PERMANENT);
            break;
        case 57: // vampiric regen
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_REGENERATION_VAMPIRIC,DURATION_TYPE_PERMANENT);
            break;
        case 58: // improved evasion
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_IMPROVED_EVASION,DURATION_TYPE_PERMANENT);
            break;
        case 59: // massive crits
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_MASSIVE_CRITICALS,DURATION_TYPE_PERMANENT);
            break;
        case 60: // visual effects
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_VISUALEFFECT,DURATION_TYPE_PERMANENT);
            break;
        case 61: // regeneration
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_REGENERATION,DURATION_TYPE_PERMANENT);
            break;
        case 62: // remove all properties
            IPRemoveAllItemProperties(oItem,DURATION_TYPE_PERMANENT);
            break;
        case 63: // all feats
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_BONUS_FEAT,DURATION_TYPE_PERMANENT);
            break;
        case 64: // all skills
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_SKILL_BONUS,DURATION_TYPE_PERMANENT);
            break;
        case 65: // all cast spells
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_CAST_SPELL,DURATION_TYPE_PERMANENT);
            break;
        case 66: // Bludgeoning damage
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_BLUDGEONING);
            break;
        case 67: // Piercing damage
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_PIERCING);
            break;
        case 68: // Slashing damage
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_DAMAGE_BONUS,DURATION_TYPE_PERMANENT,IP_CONST_DAMAGETYPE_SLASHING);
            break;
        case 69: // Bonus Spell Slot
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_BONUS_SPELL_SLOT_OF_LEVEL_N,DURATION_TYPE_PERMANENT);
            break;
        case 70: // Bonus Spell Slot
            IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_EXTRA_MELEE_DAMAGE_TYPE,DURATION_TYPE_PERMANENT);
            break;

    }
}


void SetRemovalCost(object oOriginal, object oModified, object oSmith)
{
    int y = GetGoldPieceValue(oModified);
    int x = GetGoldPieceValue(oOriginal);
    float fDiff = IntToFloat(abs(y-x));

    float fGoldCost = fDiff * PROPERTY_REMOVAL_VAR;
    float fTokenCost;


    if(x > L_20)
    {
        fGoldCost = fGoldCost * EPIC_COST_VAR;
        fTokenCost = fDiff * EPIC_COST_VAR;
    }

    fTokenCost /= FORGE_TOKEN_VALUE;


    int iGold = FloatToInt(fGoldCost);
    int iToken = FloatToInt(fTokenCost);

    if (PAYMENT_METHOD == 1) // Gold for payment
    {
        if(GetLocalInt(oSmith,"Visual"))
        {
            iGold = VISUAL_GOLD_VALUE;
            iToken = 0;
        }

        if(y <= x)
        {
            SetLocalInt(oSmith,"Refund",TRUE);
        }

        if(iGold < 1)
        {
            iGold = 1;
            iToken = 0;
        }

        SetLocalInt(oSmith,"GoldCost",iGold);
        SetLocalInt(oSmith,"TokenCost",0);
        SetSmithToken(oSmith,IntToString(iGold),"0",dmGetNewLevel(oModified));
    }
    else
    if(PAYMENT_METHOD == 2) // Tokens used instead
    {
        if(GetLocalInt(oSmith,"Visual"))
        {
            iGold = 0;
            iToken = VISUAL_TOKEN_VALUE;
        }

        if(y <= x)
        {
            SetLocalInt(oSmith,"Refund",TRUE);
        }

        if(iToken < 1)
        {
            iGold = 0;
            iToken = 1;
        }

        SetLocalInt(oSmith,"GoldCost",0);
        SetLocalInt(oSmith,"TokenCost",iToken);
        SetSmithToken(oSmith,"0",IntToString(iToken),dmGetNewLevel(oModified));
    }
    else
    if(PAYMENT_METHOD == 3) // Use both gold and tokens
    {
        if(GetLocalInt(oSmith,"Visual"))
        {
            iGold = VISUAL_GOLD_VALUE;
            iToken = VISUAL_TOKEN_VALUE;
        }

        if(y <= x)
        {
            SetLocalInt(oSmith,"Refund",TRUE);
        }

        if(iToken < 1) iToken = 1;
        if(iGold < 1) iGold = 1;

        SetLocalInt(oSmith,"GoldCost",iGold);
        SetLocalInt(oSmith,"TokenCost",iToken);
        SetSmithToken(oSmith,IntToString(iGold),IntToString(iToken),dmGetNewLevel(oModified));
    }
}


void ModItemWithRemoval(object oOriginal, object oForge, object oAnvil, object oSmith, int ModCode, int Mods = -1)
{
    object oModified = CopyItem(oOriginal,oAnvil);
    dmRemoveProperty(oModified,ModCode,Mods);

    DelayCommand(0.3, SetRemovalCost(oOriginal, oModified, oSmith));
}
