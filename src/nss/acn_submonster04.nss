/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...
*/



/*
//Includes
*/
#include "acn_subfunc"

void LoadSubrace_Bugbear()
{
    ACN_SubRace_CreateAllowed("Bugbear", 1, CLASS_RESTRICT_FIGHTER | CLASS_RESTRICT_ROGUE, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    ACN_SubRace_CreateAppearance("Bugbear", 160, 161, APPEARANCE_TYPE_BUGBEAR_CHIEFTAIN_A, APPEARANCE_TYPE_BUGBEAR_CHIEFTAIN_B, -1, 13, 13, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Bugbear", 2, 1, 1, 0, -2, -2);
    ACN_SubRace_CreateMisc("Bugbear", FALSE, RACIAL_TYPE_HUMANOID_GOBLINOID, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Bugbear", FEAT_SKILL_FOCUS_MOVE_SILENTLY);
}

void LoadSubrace_Dryad()
{
    ACN_SubRace_CreateAllowed("Dryad", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_GOOD | ALIGN_RESTRICT_CHAOTIC);
    ACN_SubRace_CreateAppearance("Dryad", 201, 201, APPEARANCE_TYPE_DRYAD, APPEARANCE_TYPE_DRYAD, -1, 31, 31, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Dryad", -1, 1, -1, -1, 1, 1);
    ACN_SubRace_CreateMisc("Dryad", FALSE, RACIAL_TYPE_FEY, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Dryad", FEAT_GREAT_FORTITUDE);
    ACN_SubRace_CreateFeat("Dryad", FEAT_WEAPON_FINESSE);
}

void LoadSubrace_Nymph()
{
    ACN_SubRace_CreateAllowed("Nymph", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_GOOD | ALIGN_RESTRICT_CHAOTIC);
    ACN_SubRace_CreateAppearance("Nymph", 261, 261, APPEARANCE_TYPE_NYMPH, APPEARANCE_TYPE_NYMPH, -1, 197, 197, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Nymph", -2, 0, 0, 0, 0, 2);
    ACN_SubRace_CreateMisc("Nymph", FALSE, RACIAL_TYPE_FEY, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Nymph", FEAT_COMBAT_CASTING);
    ACN_SubRace_CreateFeat("Nymph", FEAT_DODGE);
    ACN_SubRace_CreateFeat("Nymph", FEAT_WEAPON_FINESSE);
}

void LoadSubrace_Pixie()
{
    ACN_SubRace_CreateAllowed("Pixie", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_GOOD);
    ACN_SubRace_CreateAppearance("Pixie", 559, 559, APPEARANCE_TYPE_FAIRY, APPEARANCE_TYPE_FAIRY, -1, 37, 37, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Pixie", -2, 2, -2, 1, 0, 1);
    ACN_SubRace_CreateMisc("Pixie", FALSE, RACIAL_TYPE_FEY, -1, CREATURE_SIZE_SMALL);
    ACN_SubRace_CreateFeat("Pixie", FEAT_DODGE);
    ACN_SubRace_CreateFeat("Pixie", FEAT_SKILL_FOCUS_LISTEN);
    ACN_SubRace_CreateFeat("Pixie", FEAT_SKILL_FOCUS_SEARCH);
    ACN_SubRace_CreateFeat("Pixie", FEAT_SKILL_FOCUS_SPOT);
    ACN_SubRace_CreateItems("Pixie", "pcpixieskin", "", "", 10);
}

void LoadSubrace_Goblin()
{
    ACN_SubRace_CreateAllowed("Goblin", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_NEUTRAL1);
    ACN_SubRace_CreateAppearance("Goblin", 223, 225, APPEARANCE_TYPE_GOBLIN_B, APPEARANCE_TYPE_GOBLIN_SHAMAN_B, -1, 44, 44, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Goblin", -1, 2, 0, 0, 0, -1);
    ACN_SubRace_CreateMisc("Goblin", FALSE, RACIAL_TYPE_HUMANOID_GOBLINOID, -1, CREATURE_SIZE_SMALL);
    ACN_SubRace_CreateFeat("Goblin", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Goblin", FEAT_SKILL_FOCUS_MOVE_SILENTLY);
}

void LoadSubrace_Hobgoblin()
{
    ACN_SubRace_CreateAllowed("Hobgoblin", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    ACN_SubRace_CreateAppearance("Hobgoblin", 692, 693, APPEARANCE_TYPE_HOBGOBLIN_WARRIOR, APPEARANCE_TYPE_HOBGOBLIN_WIZARD, -1, 253, 253, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Hobgoblin", 0, 2, 2, -2, 0, -2);
    ACN_SubRace_CreateMisc("Hobgoblin", FALSE, RACIAL_TYPE_HUMANOID_GOBLINOID, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Hobgoblin", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Hobgoblin", FEAT_SKILL_FOCUS_MOVE_SILENTLY);
}

void LoadSubrace_Asabi()
{
    ACN_SubRace_CreateAllowed("Asabi", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Asabi", 611, 610, APPEARANCE_TYPE_ASABI_WARRIOR, APPEARANCE_TYPE_ASABI_SHAMAN, -1, 311, 311, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Asabi", 0, 0, 0, 0, 2, -2);
    ACN_SubRace_CreateMisc("Asabi", FALSE, RACIAL_TYPE_HUMANOID_REPTILIAN, NWNX_CREATURE_MOVEMENT_RATE_FAST, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Asabi", FEAT_DODGE);
    ACN_SubRace_CreateFeat("Asabi", FEAT_KNOCKDOWN);
}

void LoadSubrace_Kobold()
{
    ACN_SubRace_CreateAllowed("Kobold", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    ACN_SubRace_CreateAppearance("Kobold", 267, 268, APPEARANCE_TYPE_KOBOLD_A, APPEARANCE_TYPE_KOBOLD_B, -1, 246, 246, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Kobold", -1, 2, -1, 0, 0, 0);
    ACN_SubRace_CreateMisc("Kobold", FALSE, RACIAL_TYPE_HUMANOID_REPTILIAN, -1, CREATURE_SIZE_SMALL);
    ACN_SubRace_CreateFeat("Kobold", FEAT_SKILL_FOCUS_CRAFT_TRAP);
    ACN_SubRace_CreateFeat("Kobold", FEAT_SKILL_FOCUS_SEARCH);
}

void LoadSubrace_Lizardfiend()
{
    ACN_SubRace_CreateAllowed("Lizardfiend", 1, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_DRUID | CLASS_RESTRICT_BARBARIAN, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Lizardfiend", 571, 570, APPEARANCE_TYPE_LIZARDFOLK_A, APPEARANCE_TYPE_LIZARDFOLK_B, -1, 60, 60, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Lizardfiend", 1, 0, 1, 0, 0, -2);
    ACN_SubRace_CreateMisc("Lizardfiend", FALSE, RACIAL_TYPE_HUMANOID_REPTILIAN, NWNX_CREATURE_MOVEMENT_RATE_FAST, CREATURE_SIZE_MEDIUM);
}

void LoadSubrace_Sahuagin()
{
    ACN_SubRace_CreateAllowed("Sahuagin", 1, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_RANGER, RACE_RESTRICT_HUMAN, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    ACN_SubRace_CreateAppearance("Sahuagin", 734, 734, APPEARANCE_TYPE_SAHUAGIN, APPEARANCE_TYPE_SAHUAGIN_CLERIC, -1, 84, 84, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Sahuagin", 1, 1, -2, 1, 1, -2);
    ACN_SubRace_CreateMisc("Sahuagin", FALSE, RACIAL_TYPE_HUMANOID_REPTILIAN, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Sahuagin", FEAT_SKILL_FOCUS_LISTEN);
    ACN_SubRace_CreateFeat("Sahuagin", FEAT_SKILL_FOCUS_HIDE);
    ACN_SubRace_CreateFeat("Sahuagin", FEAT_SKILL_FOCUS_SPOT);
    ACN_SubRace_CreateFeat("Sahuagin", FEAT_GREAT_FORTITUDE);
    ACN_SubRace_CreateItems("Sahuagin", "pcsahuaginskin", "", "", 1);
}

void ACN_SubRace_LoadMonsterFour()
{
    LoadSubrace_Bugbear();
    LoadSubrace_Dryad();
    LoadSubrace_Nymph();
    LoadSubrace_Pixie();
    LoadSubrace_Goblin();
    LoadSubrace_Hobgoblin();
    LoadSubrace_Asabi();
    LoadSubrace_Kobold();
    LoadSubrace_Sahuagin();
    LoadSubrace_Lizardfiend();
}
