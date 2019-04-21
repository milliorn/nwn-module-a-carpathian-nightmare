#include "hgll_const_inc"
#include "hgll_struct_stat"
#include "hgll_featreq_inc"
#include "hgll_classft_inc"
#include "hgll_leto_inc"
#include "hgll_spells_inc"
//#include "aps_include"
//--------------------------------DECLARATIONS--------------------------------//

// This returns the current legendary level ("LL") of the PC. It is designed to
// work hand in hand with DAR subraces by tracking level by entering it in
// the (normally unused on PCs) Lootable field on the character file (".bic file").
// If you are not using DAR, it will still function correctly, using GetHitDice to
// track non-legendary levels.
int CheckLegendaryLevel(object oPC);

// This function determines whether a PC has enough experience to take the next legendary
// level.  Possible return values: 1 for having enough, 0 for not, -1 for having too few
// levels to gain Legendary levels, and -2 for already having the maximum amount of LL.
int GetHasXPForNextLL(object oPC);

// This function was used to remove xp from a character based on what LL they were taking.
// It subtracted XP and then returned the XP that was subtracted. It returns zero if they
// are level 60 and -1 if they aren't level 40 yet. It is not used in the current configuration,
// which just lets the xp keep adding up, rather than subtracting the xp after the level is
// gained. This ensures that the character doesn't lose the experience that accrued if for some
// reason Letoscript misfires and fails to edit the character.
int SubtractXPForNextLL(object oPC);

// This function returns the amount of XP the PC is missing to reach their next LL. It will
// return the amount needed to reach level 41 if they are under level 40. If they already
// have enough, it returns 0. If they are level 60, it returns -1.
int GetXPNeededForNextLL(object oPC);

// This function checks for whether or not the PC gains a feat this level. By default it
// is set to one every three levels, carrying the progression of character feats onward from
// the last standard one received at 39, adding new feats starting at level 42
// It is easily modified so that you can assign feats at whatever levels desired.
int GetGainsFeatOnLevelUp(object oPC);

// This function checks for whether ornot the PC gains a stat this level. By default it
// is set to one every two levels, doubling the progression of character stats onward from
// the last standard one received at 40, adding new stats starting at level 42
// It is easily modified so that you can assign stats at whatever levels desired.
int GetGainsStatOnLevelUp(object oPC);

// This function tells the caller whether the PC gains +1 to saving throws this level. By default
// it is set to one every four levels, halving the progression of character saves onward from
// the last standard increase received at 40, increasing saves starting at level 44
// It is easily modified so that you can increase saves at whatever levels desired.
int GetGainsSavesOnLevelUp(object oPC);

// This function permanently tags a PC with the CLASS_TYPE that controls his LLs.
//void SetControlClass(object oPC, int nClass);
// This function is where any other requirements besides experence and level
// are added to GetHasXPForNextLL. It returns TRUE by default unless modified.
int GetCanGainLL(object oPC);

// This function outputs debugging info to the player and log, but only if DEBUG is
// set to TRUE in hgll_const_inc.
void DoDebug(object oPC, string sDebug);

// This function determines and returns the amount of skill points a character will get each
// LL based on their control class, INT modifier, and their main race (humans get +1)
int GetSkillPointsGainedOnLevelUp(object oPC);

// This function determines whether a skill is available to the charcter and should appear on the
// skill list, based on the character's control class, the amount of points they have remaining,
// the cost of the skill for the control class, and their current skill level in the skill.
int GetIsSkillAvailable(object oPC, int nSkill);

// This function returns the name string of the specified skill.
string GetNameOfSkill(int nSkill);

// This function returns the name of the tracking int for the specified skill.
//string GetNameOfTrackingInt(int nSkill);

// This function determines the amount of HP that a character gets on levelup based on their
// control class, their CON modifier, and whether or not they've taken the toughness feat.
int GetHitPointsGainedOnLevelUp(object oPC);

// This function restores all limited usage feats so that GetHasFeat will not
// return a false negative.
void ReplenishLimitedUseFeats(object oPC);

// This function determines whether a feat is available to the charcter and should appear on the
// feat list, based on the character's control class, whether they meet the feat's requirements,
// whether they already have the feat, and whether the feat is restricted.
int GetIsFeatAvailable(int nFeat, object oPC);

// This function returns the name of the designated ability score.
string GetNameOfAbility(int nStat);

// This function returns TRUE if the specified feat is a class feat and the character has
// enough levels in the class to take it. Otherwise it returns FALSE.
int GetIsClassFeat(int nFeat, int nClass, object oPC);

//Returns ability modifier of requested ability
int GetRawAbilityModifer(object oPC, int nAbility);

//Create local variable to 'que' the skill to be added after level up confirmation
void QueAddSkill(int nSkill, object oPC);

//remove addskill que local variables
void DeleteAddSkillQue(object oPC);

//adds the skills in add skill que to the player
void ExecuteAddSkillQue(object oPC);

//checks the que to see if a certain skill exists in it already
//returns the number of times the skill appears in the que
int CheckAddSkillQue(object oPC, int nSkill);

//Create local variable to 'que' the feat to be added after level up confirmation
void QueAddFeat(int nFeat, object oPC);

//remove add feat que local variables
void DeleteAddFeatQue(object oPC);

//adds the feats in add feat que to the player
void ExecuteAddFeatQue(object oPC);

//Create local variable to 'que' the spell to be added after level up confirmation
void QueAddSpell(int nSpell, int nSpellLevel, object oPC);

//remove add spell que local variables
void DeleteAddSpellQue(object oPC);

//adds the feats in add feat que to the player
void ExecuteAddSpellQue(object oPC);

//Create local variable to 'que' the spell to be removed after level up confirmation
void QueRemoveSpell(int nSpell, int nSpellLevel, object oPC);

//delete remove spell que local variables
void DeleteRemoveSpellQue(object oPC);

//adds the feats in add feat que to the player
void ExecuteRemoveSpellQue(object oPC);

//Create local variable to 'que' the ability to be added after level up confirmation
void QueAddAbility(int nFeat, object oPC);

//remove add ability que local variables
void DeleteAddAbilityQue(object oPC);

//adds the abilities in add ability que to the player
void ExecuteAddAbilityQue(object oPC);





//----------------------------------FUNCTIONS---------------------------------//

int CheckLegendaryLevel(object oPC)
{
    int nLevel = GetLocalInt(GetItemPossessedBy(oPC, plotItemTag), "nLegendLevel");

    if (nLevel<41)
        return GetHitDice(oPC);
    else
        return nLevel;
}

int GetHasXPForNextLL(object oPC)
{
    switch(CheckLegendaryLevel(oPC))
    {
        case 40: return (XP_REQ_LVL41-GetXP(oPC)<=0); break;
        case 41: return (XP_REQ_LVL42-GetXP(oPC)<=0); break;
        case 42: return (XP_REQ_LVL43-GetXP(oPC)<=0); break;
        case 43: return (XP_REQ_LVL44-GetXP(oPC)<=0); break;
        case 44: return (XP_REQ_LVL45-GetXP(oPC)<=0); break;
        case 45: return (XP_REQ_LVL46-GetXP(oPC)<=0); break;
        case 46: return (XP_REQ_LVL47-GetXP(oPC)<=0); break;
        case 47: return (XP_REQ_LVL48-GetXP(oPC)<=0); break;
        case 48: return (XP_REQ_LVL49-GetXP(oPC)<=0); break;
        case 49: return (XP_REQ_LVL50-GetXP(oPC)<=0); break;
        case 50: return (XP_REQ_LVL51-GetXP(oPC)<=0); break;
        case 51: return (XP_REQ_LVL52-GetXP(oPC)<=0); break;
        case 52: return (XP_REQ_LVL53-GetXP(oPC)<=0); break;
        case 53: return (XP_REQ_LVL54-GetXP(oPC)<=0); break;
        case 54: return (XP_REQ_LVL55-GetXP(oPC)<=0); break;
        case 55: return (XP_REQ_LVL56-GetXP(oPC)<=0); break;
        case 56: return (XP_REQ_LVL57-GetXP(oPC)<=0); break;
        case 57: return (XP_REQ_LVL58-GetXP(oPC)<=0); break;
        case 58: return (XP_REQ_LVL59-GetXP(oPC)<=0); break;
        case 59: return (XP_REQ_LVL60-GetXP(oPC)<=0); break;
        case 60: return -2; break;
        default: return -1; break;
    }
    return -3;
}

int SubtractXPForNextLL(object oPC)
{
    switch(CheckLegendaryLevel(oPC))
    {
        case 40: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL41)); return XP_REQ_LVL41; break;
        case 41: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL42)); return XP_REQ_LVL42; break;
        case 42: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL43)); return XP_REQ_LVL43; break;
        case 43: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL44)); return XP_REQ_LVL44; break;
        case 44: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL45)); return XP_REQ_LVL45; break;
        case 45: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL46)); return XP_REQ_LVL46; break;
        case 46: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL47)); return XP_REQ_LVL47; break;
        case 47: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL48)); return XP_REQ_LVL48; break;
        case 48: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL49)); return XP_REQ_LVL49; break;
        case 49: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL50)); return XP_REQ_LVL50; break;
        case 50: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL51)); return XP_REQ_LVL51; break;
        case 51: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL52)); return XP_REQ_LVL52; break;
        case 52: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL53)); return XP_REQ_LVL53; break;
        case 53: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL54)); return XP_REQ_LVL54; break;
        case 54: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL55)); return XP_REQ_LVL55; break;
        case 55: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL56)); return XP_REQ_LVL56; break;
        case 56: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL57)); return XP_REQ_LVL57; break;
        case 57: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL58)); return XP_REQ_LVL58; break;
        case 58: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL59)); return XP_REQ_LVL59; break;
        case 59: SetXP(oPC,(GetXP(oPC)-XP_REQ_LVL60)); return XP_REQ_LVL60; break;
        case 60: return 0; break;
        default: return -1; break;
    }
    return -3;
}

int GetXPNeededForNextLL(object oPC)
{
    int nXP;

    switch(CheckLegendaryLevel(oPC))
    {
        case 40: nXP = XP_REQ_LVL41-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 41: nXP = XP_REQ_LVL42-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 42: nXP = XP_REQ_LVL43-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 43: nXP = XP_REQ_LVL44-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 44: nXP = XP_REQ_LVL45-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 45: nXP = XP_REQ_LVL46-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 46: nXP = XP_REQ_LVL47-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 47: nXP = XP_REQ_LVL48-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 48: nXP = XP_REQ_LVL49-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 49: nXP = XP_REQ_LVL50-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 50: nXP = XP_REQ_LVL51-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 51: nXP = XP_REQ_LVL52-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 52: nXP = XP_REQ_LVL53-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 53: nXP = XP_REQ_LVL54-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 54: nXP = XP_REQ_LVL55-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 55: nXP = XP_REQ_LVL56-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 56: nXP = XP_REQ_LVL57-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 57: nXP = XP_REQ_LVL58-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 58: nXP = XP_REQ_LVL59-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 59: nXP = XP_REQ_LVL60-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
        case 60: nXP = -1;
        default: nXP = XP_REQ_LVL41-(GetXP(oPC)); if(nXP<=0) nXP = 0; break;
    }
    return nXP;
}

int GetGainsFeatOnLevelUp(object oPC)
{
    //gains a feat every three levels after 39
    if((CheckLegendaryLevel(oPC) - 38) % 3 == 0)
        return 1;
    else
        return 0;
}

int GetGainsStatOnLevelUp(object oPC)
{
    //gain stat every even level
    if((CheckLegendaryLevel(oPC) + 1) % 2 == 0)
        return 1;
    else
        return 0;
}

int GetGainsSavesOnLevelUp(object oPC)
{
    //increase saves every 4 levels after the 40th
    if((CheckLegendaryLevel(oPC) - 39) % 4 == 0)
        return 1;
    else
        return 0;
}

int GetCanGainLL(object oPC)
{
    //Replace TRUE with Legendary Level Requirement check
    if (TRUE)
        return TRUE;
    else
        return FALSE;
}

void DoDebug(object oPC, string sDebug)
{
    if (DEBUG)
    {
        //WriteTimestampedLogEntry(sDebug);
        SendMessageToPC(oPC, sDebug);
    }
}

int GetSkillPointsGainedOnLevelUp(object oPC)
{
    int nClass = GetControlClass(oPC);
    int nClassBonus = 0;
    int nRaceBonus = 0;

    if(GetRacialType(oPC)==RACIAL_TYPE_HUMAN)
        nRaceBonus = 1;

    switch(nClass)
    {
        case CLASS_TYPE_ROGUE:
            nClassBonus = 8; break;
        case CLASS_TYPE_BARD:
        case CLASS_TYPE_RANGER:
        case CLASS_TYPE_SHADOWDANCER:
            nClassBonus = 6; break;
        case CLASS_TYPE_ARCANE_ARCHER:
        case CLASS_TYPE_ASSASSIN:
        case CLASS_TYPE_BARBARIAN:
//        case CLASS_TYPE_BARD:
        case CLASS_TYPE_DRUID:
        case CLASS_TYPE_HARPER:
        case CLASS_TYPE_MONK:
//        case CLASS_TYPE_RANGER:
        case CLASS_TYPE_SHIFTER:
            nClassBonus = 4; break;
        case CLASS_TYPE_BLACKGUARD:
        case CLASS_TYPE_CLERIC:
        case CLASS_TYPE_FIGHTER:
        case CLASS_TYPE_DIVINECHAMPION:
        case CLASS_TYPE_DRAGONDISCIPLE:
        case CLASS_TYPE_DWARVENDEFENDER:
        case CLASS_TYPE_PALADIN:
        case CLASS_TYPE_PALEMASTER:
        case CLASS_TYPE_SORCERER:
        case CLASS_TYPE_WEAPON_MASTER:
        case CLASS_TYPE_WIZARD:
            nClassBonus = 2; break;
    }

    return nClassBonus + nRaceBonus + GetRawAbilityModifer(oPC, ABILITY_INTELLIGENCE);
}

int GetIsSkillAvailable(object oPC, int nSkill)
{
    int nPointsAvailable = GetLocalInt(oPC, "PointsAvailable");
    int nClass = GetControlClass(oPC);
    int nLevel = CheckLegendaryLevel(oPC);
    int nSkillMax;
    int nSkillTotal = GetSkillRank(nSkill, oPC, TRUE) + CheckAddSkillQue(oPC, nSkill);

    int nSkillCost = GetCostOfSkill(nClass, nSkill);//returns -1 if not available

    if (nSkillCost == 2)//cross-class
        nSkillMax = (nLevel+4)/2;//they can go up to half of (three points higher than their new level), CheckLegendaryLevel returns the CURRENT level
    else
        nSkillMax = nLevel+4;//they can go three points higher than their new level, CheckLegendaryLevel returns the CURRENT level

    if((nSkillCost > 0) && (nPointsAvailable >= nSkillCost) && (nSkillTotal < nSkillMax))
        return TRUE;
    else
        return FALSE;
}

string GetNameOfSkill(int nSkill)
{
    string sSkill = "";
    switch (nSkill)
    {
        case SKILL_ANIMAL_EMPATHY:
            sSkill = "Animal Empathy"; break;
        case SKILL_CONCENTRATION:
            sSkill = "Concentration"; break;
        case SKILL_DISABLE_TRAP:
            sSkill = "Disable Trap"; break;
        case SKILL_DISCIPLINE:
            sSkill = "Discipline"; break;
        case SKILL_HEAL:
            sSkill = "Heal"; break;
        case SKILL_HIDE:
            sSkill = "Hide"; break;
        case SKILL_LISTEN:
            sSkill = "Listen"; break;
        case SKILL_LORE:
            sSkill = "Lore"; break;
        case SKILL_MOVE_SILENTLY:
            sSkill = "Move Silently"; break;
        case SKILL_OPEN_LOCK:
            sSkill = "Open Lock"; break;
        case SKILL_PARRY:
            sSkill = "Parry"; break;
        case SKILL_PERFORM:
            sSkill = "Perform"; break;
        case SKILL_PERSUADE:
            sSkill = "Persuade"; break;
        case SKILL_PICK_POCKET:
            sSkill = "Pick Pocket"; break;
        case SKILL_SEARCH:
            sSkill = "Search"; break;
        case SKILL_SET_TRAP:
            sSkill = "Set Trap"; break;
        case SKILL_SPELLCRAFT:
            sSkill = "Spellcraft"; break;
        case SKILL_SPOT:
            sSkill = "Spot"; break;
        case SKILL_TAUNT:
            sSkill = "Taunt"; break;
        case SKILL_USE_MAGIC_DEVICE:
            sSkill = "Use Magic Device"; break;
        case SKILL_APPRAISE:
            sSkill = "Appraise"; break;
        case SKILL_TUMBLE:
            sSkill = "Tumble"; break;
        case SKILL_CRAFT_TRAP:
            sSkill = "Craft Trap"; break;
        case SKILL_BLUFF:
            sSkill = "Bluff"; break;
        case SKILL_INTIMIDATE:
            sSkill = "Intimidate"; break;
        case SKILL_CRAFT_ARMOR:
            sSkill = "Craft Armor"; break;
        case SKILL_CRAFT_WEAPON:
            sSkill = "Craft Weapon"; break;
        case SKILL_RIDE:
            sSkill = "Ride"; break;
        default:
            break;
    }

    return sSkill;
}

int GetHitPointsGainedOnLevelUp(object oPC)
{
    int nClass = GetControlClass(oPC);
    int nClassDie = 0;
    int nFeatBonus = 0;

    if(GetHasFeat(FEAT_TOUGHNESS, oPC))
        nFeatBonus = 1;

switch(nClass)
    {
    case CLASS_TYPE_DWARVENDEFENDER:
    case CLASS_TYPE_BARBARIAN:
        nClassDie = 12; break;
    case CLASS_TYPE_DIVINECHAMPION:
    case CLASS_TYPE_WEAPON_MASTER:
    case CLASS_TYPE_PALADIN:
    case CLASS_TYPE_RANGER:
    case CLASS_TYPE_BLACKGUARD:
    case CLASS_TYPE_FIGHTER:
    case CLASS_TYPE_DRAGONDISCIPLE:
        nClassDie = 10; break;
    case CLASS_TYPE_SHADOWDANCER:
    case CLASS_TYPE_DRUID:
    case CLASS_TYPE_ARCANE_ARCHER:
    case CLASS_TYPE_MONK:
    case CLASS_TYPE_SHIFTER:
    case CLASS_TYPE_CLERIC:
        nClassDie = 8; break;
    case CLASS_TYPE_ROGUE:
    case CLASS_TYPE_ASSASSIN:
    case CLASS_TYPE_BARD:
    case CLASS_TYPE_HARPER:
    case CLASS_TYPE_PALEMASTER:
        nClassDie = 6; break;
    case CLASS_TYPE_SORCERER:
    case CLASS_TYPE_WIZARD:
        nClassDie = 4; break;
    }

    return nClassDie + nFeatBonus + GetRawAbilityModifer(oPC, ABILITY_CONSTITUTION);
}

void ReplenishLimitedUseFeats(object oPC)
{
    NWNX_Creature_RestoreFeats(oPC);
    NWNX_Creature_RestoreSpells(oPC);
}

int GetIsFeatAvailable(int nFeat, object oPC)
{
    int nClass = GetControlClass(oPC);

    if (DEV_CRIT_DISABLED && GetIsFeatDevCrit(nFeat))
        return FALSE;

    if (GetIsFeatFirstLevelOnly(nFeat))
        return FALSE;

    if (GetHasFeat(nFeat, oPC) && nFeat != 13)
        return FALSE;//only Extra Turning (13) may be taken multiple times

    if (!GetIsClassFeat(nFeat, nClass, oPC) && !GetIsGeneralFeat(nFeat))
        return FALSE;//if it's not a class skill and it's not a general skill return FALSE

    if (GetAreFeatStatReqsMet(nFeat, oPC) && GetAreFeatSkillReqsMet(nFeat, oPC) && GetAreFeatFeatReqsMet(nFeat, oPC) && GetHasRequiredSpellLevelForFeat(oPC, nFeat))
        return TRUE;

    return FALSE;
}

string GetNameOfAbility(int nStat)
{
    string sStat = "";

    switch (nStat)
    {
        case ABILITY_STRENGTH:
            sStat =  "Strength"; break;
        case ABILITY_DEXTERITY:
            sStat =  "Dexterity"; break;
        case ABILITY_CONSTITUTION:
            sStat =  "Constitution"; break;
        case ABILITY_INTELLIGENCE:
            sStat =  "Intelligence"; break;
        case ABILITY_WISDOM:
            sStat =  "Wisdom"; break;
        case ABILITY_CHARISMA:
            sStat =  "Charisma"; break;
        default:
            break;
    }
    return sStat;
}

int GetIsClassFeat(int nFeat, int nClass, object oPC)
{
    int nLevel = GetClassLevelReqForFeat(nFeat, nClass);

    if ((nLevel < -1) || (GetLevelByClass(nClass, oPC) < nLevel))
        return FALSE;
    else
        return TRUE;
}

void QueAddSkill(int nSkill, object oPC)
{
    int nSkillsToAdd = GetLocalInt(oPC, "nSkillsToAdd");
    nSkillsToAdd++;
    SetLocalInt(oPC, "nSkillsToAdd", nSkillsToAdd);

    SetLocalInt(oPC, "storeSkill" + IntToString(nSkillsToAdd), nSkill);
}

void DeleteAddSkillQue(object oPC)
{
    int nSkillsToAdd = GetLocalInt(oPC, "nSkillsToAdd");

    int xSkill = nSkillsToAdd;

    for(; xSkill > 0; xSkill--)
    {
        DeleteLocalInt(oPC, "storeSkill" + IntToString(xSkill));
    }

    SetLocalInt(oPC, "nSkillsToAdd", 0);
}

void ExecuteAddSkillQue(object oPC)
{
    int nSkillsToAdd = GetLocalInt(oPC, "nSkillsToAdd");

    int xSkill = nSkillsToAdd;

    for(; xSkill > 0; xSkill--)
    {
        AddSkillPoint(GetLocalInt(oPC, "storeSkill" + IntToString(xSkill)), oPC);
    }

    DeleteAddSkillQue(oPC);
}

void QueAddFeat(int nFeat, object oPC)
{
    int nFeatsToAdd = GetLocalInt(oPC, "nFeatsToAdd");
    nFeatsToAdd++;
    SetLocalInt(oPC, "nFeatsToAdd", nFeatsToAdd);

    SetLocalInt(oPC, "storeFeat" + IntToString(nFeatsToAdd), nFeat);
}

void DeleteAddFeatQue(object oPC)
{
    int nFeatsToAdd = GetLocalInt(oPC, "nFeatsToAdd");

    int xFeat = nFeatsToAdd;

    for(; xFeat > 0; xFeat--)
    {
        DeleteLocalInt(oPC, "storeFeat" + IntToString(xFeat));
    }

    SetLocalInt(oPC, "nFeatsToAdd", 0);
}

void ExecuteAddFeatQue(object oPC)
{
    int nFeatsToAdd = GetLocalInt(oPC, "nFeatsToAdd");

    int xFeat = nFeatsToAdd;

    for(; xFeat > 0; xFeat--)
    {
        AddFeat(oPC, GetLocalInt(oPC, "storeFeat" + IntToString(xFeat)));
    }

    DeleteAddFeatQue(oPC);
}

void QueAddSpell(int nSpell, int nSpellLevel, object oPC)
{
    int nSpellsToAdd = GetLocalInt(oPC, "nSpellsToAdd");
    nSpellsToAdd++;
    SetLocalInt(oPC, "nSpellsToAdd", nSpellsToAdd);

    SetLocalInt(oPC, "storeAddSpell" + IntToString(nSpellsToAdd), nSpell);
    SetLocalInt(oPC, "storeAddSpellLevel" + IntToString(nSpellsToAdd), nSpellLevel);
}

void DeleteAddSpellQue(object oPC)
{
    int nSpellsToAdd = GetLocalInt(oPC, "nSpellsToAdd");

    int xSpell = nSpellsToAdd;

    for(; xSpell > 0; xSpell--)
    {
        DeleteLocalInt(oPC, "storeAddSpell" + IntToString(xSpell));
        DeleteLocalInt(oPC, "storeAddSpellLevel" + IntToString(xSpell));
    }

    SetLocalInt(oPC, "nSpellsToAdd", 0);
}

void ExecuteAddSpellQue(object oPC)
{
    int nSpellsToAdd = GetLocalInt(oPC, "nSpellsToAdd");

    int xSpell = nSpellsToAdd;

    int class = GetLocalInt(oPC, "nCClass");

    int level = GetLocalInt(GetItemPossessedBy(oPC, plotItemTag), "nLegendLevel");

    for(; xSpell > 0; xSpell--)
    {
        level = GetLocalInt(oPC, "storeAddSpellLevel" + IntToString(xSpell));
        AddSpell(oPC, class, level, GetLocalInt(oPC, "storeAddSpell" + IntToString(xSpell)));
    }

    DeleteAddSpellQue(oPC);
}

void QueRemoveSpell(int nSpell, int nSpellLevel, object oPC)
{
    int nSpellsToRemove = GetLocalInt(oPC, "nSpellsToRemove");
    nSpellsToRemove++;
    SetLocalInt(oPC, "nSpellsToRemove", nSpellsToRemove);

    SetLocalInt(oPC, "storeRemoveSpell" + IntToString(nSpellsToRemove), nSpell);
    SetLocalInt(oPC, "storeRemoveSpellLevel" + IntToString(nSpellsToRemove), nSpellLevel);
}

void DeleteRemoveSpellQue(object oPC)
{
    int nSpellsToRemove = GetLocalInt(oPC, "nSpellsToRemove");

    int xSpell = nSpellsToRemove;

    for(; xSpell > 0; xSpell--)
    {
        DeleteLocalInt(oPC, "storeRemoveSpell" + IntToString(xSpell));
        DeleteLocalInt(oPC, "storeRemoveSpellLevel" + IntToString(xSpell));
    }

    SetLocalInt(oPC, "nSpellsToRemove", 0);
}

void ExecuteRemoveSpellQue(object oPC)
{
    int nSpellsToRemove = GetLocalInt(oPC, "nSpellsToRemove");

    int xSpell = nSpellsToRemove;

    int class = GetLocalInt(oPC, "nCClass");

    int level = 0;

    for(; xSpell > 0; xSpell--)
    {
        level = GetLocalInt(oPC, "storeRemoveSpellLevel" + IntToString(xSpell));
        RemoveSpell(oPC, class, level, GetLocalInt(oPC, "storeRemoveSpell" + IntToString(xSpell)));
    }

    DeleteRemoveSpellQue(oPC);
}

void QueAddAbility(int nAbility, object oPC)
{
    int nAbilitiesToAdd = GetLocalInt(oPC, "nAbilitiesToAdd");
    nAbilitiesToAdd++;
    SetLocalInt(oPC, "nAbilitiesToAdd", nAbilitiesToAdd);

    SetLocalInt(oPC, "storeAbility" + IntToString(nAbilitiesToAdd), nAbility);
}

void DeleteAddAbilityQue(object oPC)
{
    int nAbilitiesToAdd = GetLocalInt(oPC, "nAbilitiesToAdd");

    int xAbility = nAbilitiesToAdd;

    for(; xAbility > 0; xAbility--)
    {
        DeleteLocalInt(oPC, "storeAbilty" + IntToString(xAbility));
    }

    SetLocalInt(oPC, "nAbilitiesToAdd", 0);
}

void ExecuteAddAbilityQue(object oPC)
{
    int nAbilitiesToAdd = GetLocalInt(oPC, "nAbilitiesToAdd");

    int xAbility = nAbilitiesToAdd;

    for(; xAbility > 0; xAbility--)
    {
        AddStatPoint(GetLocalInt(oPC, "storeAbility" + IntToString(xAbility)), oPC);
    }

    DeleteAddAbilityQue(oPC);
}

int GetRawAbilityModifer(object oPC, int nAbility)
{
    return (NWNX_Creature_GetRawAbilityScore(oPC, nAbility) - 10) / 2;
}

int CheckAddSkillQue(object oPC, int nSkill)
{
    int nSkillsToAdd = GetLocalInt(oPC, "nSkillsToAdd");

    int xSkill = nSkillsToAdd;

    int nSkillCount = 0;

    for(; xSkill > 0; xSkill--)
    {
        if(GetLocalInt(oPC, "storeSkill" + IntToString(xSkill)) == nSkill)
            nSkillCount++;
    }

    return nSkillCount;
}
