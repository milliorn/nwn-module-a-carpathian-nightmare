/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...
*/



/*
//Includes
*/
#include "acn_subfunc"

void LoadSubrace_Troglodyte()
{
    ACN_SubRace_CreateAllowed("Troglodyte", 1, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_MONK | CLASS_RESTRICT_DRUID | CLASS_RESTRICT_RANGER, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Troglodyte", 821, 821, APPEARANCE_TYPE_TROGLODYTE_WARRIOR, APPEARANCE_TYPE_TROGLODYTE_CLERIC, -1, 448, 448, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Troglodyte", 0, -1, 2, -1, 0, 0);
    ACN_SubRace_CreateMisc("Troglodyte", FALSE, RACIAL_TYPE_HUMANOID_REPTILIAN, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Troglodyte", FEAT_SKILL_FOCUS_HIDE);
    ACN_SubRace_CreateFeat("Troglodyte", FEAT_SKILL_FOCUS_LISTEN);
}

void LoadSubrace_Yuanti()
{
    ACN_SubRace_CreateAllowed("Yuan-ti", 1, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_RANGER, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Yuan-ti", 348, 349, APPEARANCE_TYPE_YUAN_TI, APPEARANCE_TYPE_YUAN_TI_CHIEFTEN, -1, 108, 108, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Yuan-ti", -2, 1, -1, 1, 0, 1);
    ACN_SubRace_CreateMisc("Yuan-ti", FALSE, RACIAL_TYPE_HUMANOID_REPTILIAN, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Yuan-ti", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Yuan-ti", FEAT_BLIND_FIGHT);
    ACN_SubRace_CreateFeat("Yuan-ti", FEAT_DODGE);
    ACN_SubRace_CreateFeat("Yuan-ti", FEAT_IMPROVED_INITIATIVE);
}

void LoadSubrace_Gnoll()
{
    ACN_SubRace_CreateAllowed("Gnoll", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Gnoll", 604, 605, APPEARANCE_TYPE_GNOLL_WARRIOR, APPEARANCE_TYPE_GNOLL_WIZ, -1, 251, 251, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Gnoll", 2, 0, 2, -2, 0, -2);
    ACN_SubRace_CreateMisc("Gnoll", FALSE, RACIAL_TYPE_HUMANOID_GOBLINOID, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Gnoll", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Gnoll", FEAT_POWER_ATTACK);
}

void LoadSubrace_Minotaur()
{
    ACN_SubRace_CreateAllowed("Minotaur", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Minotaur", 253, 256, APPEARANCE_TYPE_MINOTAUR_CHIEFTAIN, APPEARANCE_TYPE_MINOTAUR_SHAMAN, -1, 65, 65, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Minotaur", 2, 0, 2, -2, 0, -2);
    ACN_SubRace_CreateMisc("Minotaur", FALSE, RACIAL_TYPE_HUMANOID_MONSTROUS, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateFeat("Minotaur", FEAT_KEEN_SENSE);
    ACN_SubRace_CreateFeat("Minotaur", FEAT_SKILL_FOCUS_LISTEN);
    ACN_SubRace_CreateFeat("Minotaur", FEAT_SKILL_FOCUS_SEARCH);
    ACN_SubRace_CreateFeat("Minotaur", FEAT_SKILL_FOCUS_SPOT);
}

void LoadSubrace_Medusa()
{
    ACN_SubRace_CreateAllowed("Medusa", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Medusa", 608, 608, APPEARANCE_TYPE_MEDUSA, APPEARANCE_TYPE_MEDUSA, -1, 308, 308, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Medusa", -2, 1, 0, 0, 0, 1);
    ACN_SubRace_CreateMisc("Medusa", FALSE, RACIAL_TYPE_HUMANOID_MONSTROUS, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Medusa", FEAT_POINT_BLANK_SHOT);
    ACN_SubRace_CreateFeat("Medusa", FEAT_WEAPON_FINESSE);
}

void LoadSubrace_Seahag()
{
    ACN_SubRace_CreateAllowed("Sea-Hag", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Sea-Hag", 822, 822, APPEARANCE_TYPE_SEA_HAG, APPEARANCE_TYPE_SEA_HAG, -1, 445, 445, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Sea-Hag", 2, 0, 0, -2, 0, 0);
    ACN_SubRace_CreateMisc("Sea-Hag", FALSE, RACIAL_TYPE_HUMANOID_MONSTROUS, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Sea-Hag", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Sea-Hag", FEAT_TOUGHNESS);
    ACN_SubRace_CreateItems("Sea-Hag", "pcseahagskin", "", "", 10);
}

void LoadSubrace_Stinger()
{
    ACN_SubRace_CreateAllowed("Stinger", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Stinger", 612, 615, APPEARANCE_TYPE_STINGER, APPEARANCE_TYPE_STINGER_MAGE, -1, 313, 319, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Stinger", 2, -1, 0, -2, 0, 1);
    ACN_SubRace_CreateMisc("Stinger", FALSE, RACIAL_TYPE_HUMANOID_MONSTROUS, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Stinger", FEAT_RESIST_ENERGY_FIRE);
    ACN_SubRace_CreateItems("Stinger", "pcstingerskin", "", "", 4);
}


void ACN_SubRace_LoadMonsterThree()
{
    LoadSubrace_Troglodyte();
    LoadSubrace_Yuanti();
    LoadSubrace_Gnoll();
    LoadSubrace_Minotaur();
    LoadSubrace_Medusa();
    LoadSubrace_Stinger();
    LoadSubrace_Seahag();
}
