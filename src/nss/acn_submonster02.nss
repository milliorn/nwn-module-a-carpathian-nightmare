/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...
*/



/*
//Includes
*/
#include "acn_subfunc"

void LoadSubrace_Aranea()
{
    ACN_SubRace_CreateAllowed("Aranea", 1, CLASS_RESTRICT_DRUID, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Aranea", 143, 143, APPEARANCE_TYPE_ARANEA, APPEARANCE_TYPE_ARANEA, -1, 85, 85, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Aranea", -1, 1, 0, 0, 1, -1);
    ACN_SubRace_CreateMisc("Aranea", TRUE, RACIAL_TYPE_SHAPECHANGER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Aranea", FEAT_IMPROVED_INITIATIVE);
    ACN_SubRace_CreateFeat("Aranea", FEAT_IRON_WILL);
    ACN_SubRace_CreateFeat("Aranea", FEAT_WEAPON_FINESSE);
}

void LoadSubrace_Weretiger()
{
    ACN_SubRace_CreateAllowed("Weretiger", 1, CLASS_RESTRICT_DRUID, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Weretiger", 314, 314, APPEARANCE_TYPE_WERECAT, APPEARANCE_TYPE_WERECAT, -1, 98, 98, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Weretiger", 2, 1, 1, -1, -1, -2);
    ACN_SubRace_CreateMisc("Weretiger", TRUE, RACIAL_TYPE_SHAPECHANGER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Weretiger", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Weretiger", FEAT_IRON_WILL);
    ACN_SubRace_CreateFeat("Weretiger", FEAT_IMPROVED_INITIATIVE);
}

void LoadSubrace_Werewolf()
{
    ACN_SubRace_CreateAllowed("Werewolf", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Werewolf", 316, 316, APPEARANCE_TYPE_WEREWOLF, APPEARANCE_TYPE_WEREWOLF, -1, 100, 100, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Werewolf", 0, 1, 0, -1, 0, 0);
    ACN_SubRace_CreateMisc("Werewolf", TRUE, RACIAL_TYPE_SHAPECHANGER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Werewolf", FEAT_IRON_WILL);
    ACN_SubRace_CreateFeat("Werewolf", FEAT_IMPROVED_INITIATIVE);
    ACN_SubRace_CreateFeat("Werewolf", FEAT_STEALTHY);
}

void LoadSubrace_Wererat()
{
    ACN_SubRace_CreateAllowed("Wererat", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Wererat", 315, 315, APPEARANCE_TYPE_WERERAT, APPEARANCE_TYPE_WERERAT, -1, 99, 99, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Wererat", 0, 1, 1, -1, 0, -1);
    ACN_SubRace_CreateMisc("Wererat", TRUE, RACIAL_TYPE_SHAPECHANGER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Wererat", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Wererat", FEAT_DODGE);
    ACN_SubRace_CreateFeat("Wererat", FEAT_ARTIST);
    ACN_SubRace_CreateFeat("Wererat", FEAT_WEAPON_FINESSE);
}

void LoadSubrace_Quasit()
{
    ACN_SubRace_CreateAllowed("Quasit", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Quasit", 186, 186, APPEARANCE_TYPE_QUASIT, APPEARANCE_TYPE_QUASIT, -1, 63, 63, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Quasit", -2, 2, 0, 0, 0, 0);
    ACN_SubRace_CreateMisc("Quasit", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_SMALL);
    ACN_SubRace_CreateFeat("Quasit", FEAT_SNAKEBLOOD);
    ACN_SubRace_CreateFeat("Quasit", FEAT_IMPROVED_INITIATIVE);
    ACN_SubRace_CreateFeat("Quasit", FEAT_RESIST_ENERGY_FIRE);
    ACN_SubRace_CreateFeat("Quasit", FEAT_WEAPON_FINESSE);
    ACN_SubRace_CreateItems("Quasit", "pcsubracequas", "", "", 1);
}

void LoadSubrace_Beholder()
{
    ACN_SubRace_CreateAllowed("Beholder", 1, CLASS_RESTRICT_SORCERER | CLASS_RESTRICT_WIZARD, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Beholder", 701, 935, APPEARANCE_TYPE_BEHOLDER, APPEARANCE_TYPE_BEHOLDER_MOTHER, -1, 372, 372, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Beholder", -2, -2, 0, 2, 1, 1);
    ACN_SubRace_CreateMisc("Beholder", TRUE, RACIAL_TYPE_ABERRATION, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Beholder", FEAT_IRON_WILL);
    ACN_SubRace_CreateFeat("Beholder", FEAT_IMPROVED_INITIATIVE);
    ACN_SubRace_CreateFeat("Beholder", FEAT_ALERTNESS);
}

void LoadSubrace_Ettercap()
{
    ACN_SubRace_CreateAllowed("Ettercap", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Ettercap", 204, 204, APPEARANCE_TYPE_ETTERCAP, APPEARANCE_TYPE_ETTERCAP, -1, 36, 36, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Ettercap", 0, 2, 0, -2, 2, -2);
    ACN_SubRace_CreateMisc("Ettercap", TRUE, RACIAL_TYPE_ABERRATION, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateFeat("Ettercap", FEAT_GREAT_FORTITUDE);
}

void LoadSubrace_Mindflayer()
{
    ACN_SubRace_CreateAllowed("Mind-Flayer", 1, CLASS_RESTRICT_SORCERER | CLASS_RESTRICT_WIZARD, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Mind-Flayer", 709, 710, APPEARANCE_TYPE_MINDFLAYER, APPEARANCE_TYPE_MINDFLAYER_2, -1, 384, 384, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Mind-Flayer", -1, -1, -1, 1, 1, 1);
    ACN_SubRace_CreateMisc("Mind-Flayer", TRUE, RACIAL_TYPE_ABERRATION, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateItems("Mind-Flayer", "pcmindflayer", "", "", 7);
}

void LoadSubrace_Umberhulk()
{
    ACN_SubRace_CreateAllowed("Umber-Hulk", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Umber-Hulk", 309, 309, APPEARANCE_TYPE_UMBERHULK, APPEARANCE_TYPE_UMBERHULK, -1, 95, 95, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Umber-Hulk", 2, 0, 2, -2, -2, 0);
    ACN_SubRace_CreateMisc("Umber-Hulk", TRUE, RACIAL_TYPE_ABERRATION, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Umber-Hulk", FEAT_GREAT_FORTITUDE);
    ACN_SubRace_CreateFeat("Umber-Hulk", FEAT_TOUGHNESS);
}

void LoadSubrace_Orc()
{
    ACN_SubRace_CreateAllowed("Orc", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFORC, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Orc", 273, 277, APPEARANCE_TYPE_ORC_CHIEFTAIN_A, APPEARANCE_TYPE_ORC_SHAMAN_A, -1, 74, 74, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Orc", 4, 0, 0, 0, -2, -2);
    ACN_SubRace_CreateMisc("Orc", FALSE, RACIAL_TYPE_HUMANOID_ORC, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Orc", FEAT_ALERTNESS);
}

void ACN_SubRace_LoadMonsterTwo()
{
    LoadSubrace_Aranea();
    LoadSubrace_Weretiger();
    LoadSubrace_Werewolf();
    LoadSubrace_Wererat();
    LoadSubrace_Quasit();
    LoadSubrace_Beholder();
    LoadSubrace_Ettercap();
    LoadSubrace_Mindflayer();
    LoadSubrace_Umberhulk();
    LoadSubrace_Orc();
}
