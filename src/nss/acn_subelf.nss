/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...
*/



/*
//Includes
*/
#include "acn_subfunc"

void LoadSubrace_AquaticElf()
{
    ACN_SubRace_CreateAllowed("Elf-Aquatic", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_GOOD);
    ACN_SubRace_CreateAppearance("Elf-Aquatic", -1, -1, -1, -1, -1, -1, -1, 36, 40, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Elf-Aquatic", 0, 2, 0, -2, 0, 0);
    ACN_SubRace_CreateMisc("Elf-Aquatic", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateItems("Elf-Aquatic", "sfsub_elfaquatic", "", "", 1);
}

void LoadSubrace_Avariel()
{
    ACN_SubRace_CreateAllowed("Avariel", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_GOOD);
    ACN_SubRace_CreateAppearance("Avariel", -1, -1, -1, -1, -1, -1, -1, 62, 57, CREATURE_WING_TYPE_ANGEL, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Avariel", -2, 2, 0, 1, 1, -2);
    ACN_SubRace_CreateMisc("Avariel", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Avariel", FEAT_BLOODED);
    ACN_SubRace_CreateFeat("Avariel", FEAT_ALERTNESS);
}

void LoadSubrace_Drider()
{
    ACN_SubRace_CreateAllowed("Drider", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    ACN_SubRace_CreateAppearance("Drider", 707, 986, APPEARANCE_TYPE_DRIDER_CHIEF, APPEARANCE_TYPE_DRIDER_FEMALE, -1, 377, 377, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Drider", -2, 0, 0, 0, 2, 0);
    ACN_SubRace_CreateMisc("Drider", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Drider", FEAT_DARKVISION);
    ACN_SubRace_CreateFeat("Drider", FEAT_COMBAT_CASTING);
    ACN_SubRace_CreateFeat("Drider", FEAT_TWO_WEAPON_FIGHTING);
    ACN_SubRace_CreateItems("Drider", "pcdriderskin", "", "", 5);
}

void LoadSubrace_Drow()
{
    ACN_SubRace_CreateAllowed("Drow", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Drow", 970, 966, APPEARANCE_TYPE_DROW_WARRIOR_2, APPEARANCE_TYPE_DROW_MATRON, -1, 380, 381, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Drow", -2, 0, -1, 2, 0, 1);
    ACN_SubRace_CreateMisc("Drow", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Drow", FEAT_DARKVISION);
    ACN_SubRace_CreateFeat("Drow", FEAT_IRON_WILL);
    ACN_SubRace_CreateItems("Drow", "pcdrowskin", "", "", 22);
}

void LoadSubrace_MoonElf()
{
    ACN_SubRace_CreateAllowed("Elf-Moon", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_GOOD);
    ACN_SubRace_CreateAppearance("Elf-Moon", -1, -1, -1, -1, -1, -1, -1, 56, 57, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Elf-Moon", 0, 2, -2, 0, 0, 0);
    ACN_SubRace_CreateMisc("Elf-Moon", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
}

void LoadSubrace_SunElf()
{
    ACN_SubRace_CreateAllowed("Elf-Sun", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_GOOD);
    ACN_SubRace_CreateAppearance("Elf-Sun", -1, -1, -1, -1, -1, -1, -1, 54, 58, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Elf-Sun", 0, 0, -2, 2, 0, 0);
    ACN_SubRace_CreateMisc("Elf-Sun", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
}

void LoadSubrace_WildElf()
{
    ACN_SubRace_CreateAllowed("Elf-Wild", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Elf-Wild", -1, -1, -1, -1, -1, -1, -1, 11, 59, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Elf-Wild", 0, -2, 2, 0, 0, 0);
    ACN_SubRace_CreateMisc("Elf-Wild", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
}

void LoadSubrace_WoodElf()
{
    ACN_SubRace_CreateAllowed("Elf-Wood", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Elf-Wood", -1, -1, -1, -1, -1, -1, -1, 54, 2, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Elf-Wood", 2, 0, 0, -2, 0, 0);
    ACN_SubRace_CreateMisc("Elf-Wood", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
}

void ACN_SubRace_LoadElf()
{
    LoadSubrace_AquaticElf();
    LoadSubrace_Avariel();
    LoadSubrace_Drow();
    LoadSubrace_MoonElf();
    LoadSubrace_SunElf();
    LoadSubrace_WildElf();
    LoadSubrace_WoodElf();
    LoadSubrace_Drider();
}

/*void main () {}
