#include "hgll_const_inc"
#include "nwnx_creature"
//--------------------------------DECLARATIONS--------------------------------//

// This function adds a stat point to the specified stat.
void AddStatPoint(int nStat, object oPC);

// This function adds a skill point to the specified skill.
void AddSkillPoint(int iSkill, object oPC);

// This function adds +1 to all the character's saving throws.
void ModifySaves(object oPC);

// This function adds the specified number of hit points to the character.
void AddHitPoints(int nHP, int nLevel, object oPC);

// This function adds the specified feat to the character, treating
// it as if he had gained it on character creation (level 0). This ensures that deleveling
// the character thus will not remove the feat.
void AddFeat(object oPC, int iFeat = -1);

//This function adds the specified spell to the character
void AddSpell(object oPC, int class, int level, int spellId);

//This function removes the specified spell from the character
void RemoveSpell(object oPC, int class, int level, int spellId);

//----------------------------------FUNCTIONS---------------------------------//

void SetDocumentedLevel(object oPC, int level = 1)
{
    SetLocalInt(GetItemPossessedBy(oPC, plotItemTag), "nLegendLevel", level);
}

void AddStatPoint(int nStat, object oPC)
{
    NWNX_Creature_ModifyRawAbilityScore(oPC, nStat, 1);
}

void AddSkillPoint(int iSkill, object oPC)
{
    int nSkill = GetSkillRank(iSkill, oPC, TRUE);

    NWNX_Creature_SetSkillRank(oPC, iSkill, nSkill + 1);
}

void ModifySaves(object oPC)
{
    int nFort = NWNX_Creature_GetBaseSavingThrow(oPC, SAVING_THROW_FORT);
    int nRefl = NWNX_Creature_GetBaseSavingThrow(oPC, SAVING_THROW_REFLEX);
    int nWill = NWNX_Creature_GetBaseSavingThrow(oPC, SAVING_THROW_WILL);
    NWNX_Creature_SetBaseSavingThrow(oPC, SAVING_THROW_FORT, nFort + 1);
    NWNX_Creature_SetBaseSavingThrow(oPC, SAVING_THROW_REFLEX, nRefl + 1);
    NWNX_Creature_SetBaseSavingThrow(oPC, SAVING_THROW_WILL, nWill + 1);
}

void AddHitPoints(int nHP, int nLevel, object oPC)
{
    int nCurrMax = NWNX_Creature_GetMaxHitPointsByLevel(oPC, 40);
    NWNX_Creature_SetMaxHitPointsByLevel(oPC, 40, nCurrMax + nHP);
}

void AddFeat(object oPC, int iFeat = -1)
{
    //stop if invalid feat
    if(iFeat < 0)
        return;

    //just adding the feat does nothing so manually add the ability point
    if(iFeat >= FEAT_EPIC_GREAT_CHARISMA_1 && iFeat <= FEAT_EPIC_GREAT_CHARISMA_10)
        NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CHARISMA, 1);
    else if(iFeat >= FEAT_EPIC_GREAT_CONSTITUTION_1 && iFeat <= FEAT_EPIC_GREAT_CONSTITUTION_10)
        NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CONSTITUTION, 1);
    else if(iFeat >= FEAT_EPIC_GREAT_DEXTERITY_1 && iFeat <= FEAT_EPIC_GREAT_DEXTERITY_10)
        NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_DEXTERITY, 1);
    else if(iFeat >= FEAT_EPIC_GREAT_INTELLIGENCE_1 && iFeat <= FEAT_EPIC_GREAT_INTELLIGENCE_10)
        NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_INTELLIGENCE, 1);
    else if(iFeat >= FEAT_EPIC_GREAT_STRENGTH_1 && iFeat <= FEAT_EPIC_GREAT_STRENGTH_10)
        NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_STRENGTH, 1);
    else if(iFeat >= FEAT_EPIC_GREAT_WISDOM_1 && iFeat <= FEAT_EPIC_GREAT_WISDOM_10)
        NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_WISDOM, 1);

    NWNX_Creature_AddFeat(oPC, iFeat);
}

void AddSpell(object oPC, int class, int level, int spellId)
{
    NWNX_Creature_AddKnownSpell(oPC, class, level, spellId);
}

void RemoveSpell(object oPC, int class, int level, int spellId)
{
    NWNX_Creature_RemoveKnownSpell(oPC, class, level, spellId);
}

