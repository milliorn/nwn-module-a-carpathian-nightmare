/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...
*/



/*
//Includes
*/
#include "acn_subfunc"

void LoadSubrace_ArticDwarf()
{
    ACN_SubRace_CreateAllowed("Dwarf-Artic", 1, CLASS_RESTRICT_BARBARIAN | CLASS_RESTRICT_FIGHTER | CLASS_RESTRICT_RANGER | CLASS_RESTRICT_DRUID, RACE_RESTRICT_DWARF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Dwarf-Artic", -1, -1, -1, -1, -1, -1, -1, 16, 16, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Dwarf-Artic", 2, -1, 1, 0, 0, -2);
    ACN_SubRace_CreateMisc("Dwarf-Artic", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Dwarf-Artic", FEAT_RESIST_ENERGY_COLD);
}

void LoadSubrace_Azer()
{
    ACN_SubRace_CreateAllowed("Azer", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_DWARF, ALIGN_RESTRICT_LAWFUL);
    ACN_SubRace_CreateAppearance("Azer", 722, 723, APPEARANCE_TYPE_AZER_MALE, APPEARANCE_TYPE_AZER_FEMALE, -1, -1, -1, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Azer", 1, 1, 0, 0, 0, -2);
    ACN_SubRace_CreateMisc("Azer", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Azer", FEAT_RESIST_ENERGY_FIRE);
    ACN_SubRace_CreateItems("Azer", "pcazerskin", "", "", 22);
}

void LoadSubrace_DeepDwarf()
{
    ACN_SubRace_CreateAllowed("Dwarf-Deep", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_DWARF, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_GOOD);
    ACN_SubRace_CreateAppearance("Dwarf-Deep", -1, -1, -1, -1, -1, -1, -1, 43, 31, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Dwarf-Deep", 0, 0, 2, 0, 0, -2);
    ACN_SubRace_CreateMisc("Dwarf-Deep", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Dwarf-Deep", FEAT_WEAPON_PROFICIENCY_EXOTIC);
}

void LoadSubrace_DerroDwarf()
{
    ACN_SubRace_CreateAllowed("Dwarf-Derro", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_DWARF, ALIGN_RESTRICT_CHAOTIC);
    ACN_SubRace_CreateAppearance("Dwarf-Derro", -1, -1, -1, -1, -1, -1, -1, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Dwarf-Derro", 0, 0, 0, 0, -2, 2);
    ACN_SubRace_CreateMisc("Dwarf-Derro", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Dwarf-Derro", FEAT_BLIND_FIGHT);
    ACN_SubRace_CreateFeat("Dwarf-Derro", FEAT_IMPROVED_INITIATIVE);
    ACN_SubRace_CreateItems("Dwarf-Derro", "pcderroskin", "", "", 10);
}

void LoadSubrace_DuergarDwarf()
{
    ACN_SubRace_CreateAllowed("Dwarf-Duergar", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_DWARF, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Dwarf-Duergar", 973, 972, APPEARANCE_TYPE_DUERGAR_CHIEF, APPEARANCE_TYPE_DUERGAR_SLAVE, -1, -1, -1, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Dwarf-Duergar", -1, 0, 1, 0, 0, -2);
    ACN_SubRace_CreateMisc("Dwarf-Duergar", FALSE, 1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Dwarf-Duergar", FEAT_TOUGHNESS);
    ACN_SubRace_CreateFeat("Dwarf-Duergar", FEAT_SKILL_FOCUS_MOVE_SILENTLY);
    ACN_SubRace_CreateFeat("Dwarf-Duergar", FEAT_ALERTNESS);
    ACN_SubRace_CreateItems("Dwarf-Duergar", "pcduergarprope", "", "", 10);
}

void LoadSubrace_DwarfGold()
{
    ACN_SubRace_CreateAllowed("Dwarf-Gold", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_DWARF, ALIGN_RESTRICT_GOOD);
    ACN_SubRace_CreateAppearance("Dwarf-Gold", -1, -1, -1, -1, -1, -1, -1, 44, 15, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Dwarf-Gold", 0, -2, 2, 0, 0, 0);
    ACN_SubRace_CreateMisc("Dwarf-Gold", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
}

void LoadSubrace_DwarfShield()
{
    ACN_SubRace_CreateAllowed("Dwarf-Shield", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_DWARF, ALIGN_RESTRICT_GOOD);
    ACN_SubRace_CreateAppearance("Dwarf-Shield", -1, -1, -1, -1, -1, -1, -1, 8, 58, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Dwarf-Shield", 0, 0, 0, 0, 2, -2);
    ACN_SubRace_CreateMisc("Dwarf-Shield", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
}

void LoadSubrace_DwarfUrdunnir()
{
    ACN_SubRace_CreateAllowed("Dwarf-Urdunnir", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_DWARF, ALIGN_RESTRICT_GOOD);
    ACN_SubRace_CreateAppearance("Dwarf-Urdunnir", -1, -1, -1, -1, -1, -1, -1, 21, 19, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Dwarf-Urdunnir", 0, -2, 0, -2, 0, 0);
    ACN_SubRace_CreateMisc("Dwarf-Urdunnir", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Dwarf-Urdunnir", FEAT_SNAKEBLOOD);
}

void LoadSubrace_DwarfWild()
{
    ACN_SubRace_CreateAllowed("Dwarf-Wild", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_DWARF, ALIGN_RESTRICT_LAWFUL);
    ACN_SubRace_CreateAppearance("Dwarf-Wild", -1, -1, -1, -1, -1, -1, -1, 32, 40, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Dwarf-Wild", 0, 2, 0, 0, 0, -2);
    ACN_SubRace_CreateMisc("Dwarf-Wild", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Dwarf-Wild", FEAT_RESIST_ENERGY_FIRE);
    ACN_SubRace_CreateFeat("Dwarf-Wild", FEAT_DODGE);
    ACN_SubRace_CreateFeat("Dwarf-Wild", FEAT_RESIST_ENERGY_FIRE);
    ACN_SubRace_CreateFeat("Dwarf-Wild", FEAT_SKILL_FOCUS_HIDE);
    ACN_SubRace_CreateFeat("Dwarf-Wild", FEAT_SNAKEBLOOD);
    ACN_SubRace_CreateFeat("Dwarf-Wild", FEAT_SKILL_FOCUS_HIDE);
    ACN_SubRace_CreateFeat("Dwarf-Wild", FEAT_RESIST_DISEASE);
}

void ACN_SubRace_LoadDwarf()
{
    LoadSubrace_Azer();
    LoadSubrace_ArticDwarf();
    LoadSubrace_DeepDwarf();
    LoadSubrace_DerroDwarf();
    LoadSubrace_DuergarDwarf();
    LoadSubrace_DwarfGold();
    LoadSubrace_DwarfShield();
    LoadSubrace_DwarfUrdunnir();
    LoadSubrace_DwarfWild();
}
