/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...
*/



/*
//Includes
*/
#include "acn_subfunc"

void LoadSubrace_Rakshasa()
{
    ACN_SubRace_CreateAllowed("Rakshasa", 1, CLASS_RESTRICT_BARD | CLASS_RESTRICT_SORCERER | CLASS_RESTRICT_WIZARD, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    ACN_SubRace_CreateAppearance("Rakshasa", 281, 565, APPEARANCE_TYPE_RAKSHASA_TIGER_MALE, APPEARANCE_TYPE_RAKSHASA_TIGER_FEMALE, -1, 76, 76, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Rakshasa", -1, 1, 1, -1, -1, 1);
    ACN_SubRace_CreateMisc("Rakshasa", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateItems("Rakshasa", "pcrakshasaskin", "", "", 7);
}

void LoadSubrace_CelestialAvenger()
{
    ACN_SubRace_CreateAllowed("Celestial-Avenger", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_GOOD);
    ACN_SubRace_CreateAppearance("Celestial-Avenger", 561, 561, APPEARANCE_TYPE_RAKSHASA_BEAR_MALE, APPEARANCE_TYPE_RAKSHASA_BEAR_MALE, -1, 20, 20, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Celestial-Avenger", 2, 1, 1, -2, -1, -1);
    ACN_SubRace_CreateMisc("Celestial-Avenger", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Celestial-Avenger", FEAT_STEALTHY);
    ACN_SubRace_CreateFeat("Celestial-Avenger", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Celestial-Avenger", FEAT_RESIST_ENERGY_ACID);
    ACN_SubRace_CreateFeat("Celestial-Avenger", FEAT_RESIST_ENERGY_COLD);
    ACN_SubRace_CreateFeat("Celestial-Avenger", FEAT_RESIST_ENERGY_ELECTRICAL);
}

void LoadSubrace_Archon()
{
    ACN_SubRace_CreateAllowed("Archon", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_GOOD | ALIGN_RESTRICT_LAWFUL);
    ACN_SubRace_CreateAppearance("Archon", 556, 556, APPEARANCE_TYPE_RAKSHASA_WOLF_MALE, APPEARANCE_TYPE_RAKSHASA_WOLF_MALE, -1, 20, 20, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Archon", 1, -2, 1, -2, 1, 1);
    ACN_SubRace_CreateMisc("Archon", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Archon", FEAT_IMPROVED_INITIATIVE);
    ACN_SubRace_CreateFeat("Archon", FEAT_POWER_ATTACK);
    ACN_SubRace_CreateFeat("Archon", FEAT_SNAKEBLOOD);
    ACN_SubRace_CreateItems("Archon", "pcarchonskin", "", "", 5);
}

void LoadSubrace_Ettin()
{
    ACN_SubRace_CreateAllowed("Ettin", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    ACN_SubRace_CreateAppearance("Ettin", 205, 205, APPEARANCE_TYPE_ETTIN, APPEARANCE_TYPE_ETTIN, -1, 42, 42, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Ettin", 2, -1, 1, -2, 0, 0);
    ACN_SubRace_CreateMisc("Ettin", TRUE, RACIAL_TYPE_GIANT, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateFeat("Ettin", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Ettin", FEAT_IMPROVED_INITIATIVE);
    ACN_SubRace_CreateFeat("Ettin", FEAT_IRON_WILL);
    ACN_SubRace_CreateFeat("Ettin", FEAT_POWER_ATTACK);
}

void LoadSubrace_HillGiant()
{
    ACN_SubRace_CreateAllowed("Hill-Giant", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    ACN_SubRace_CreateAppearance("Hill-Giant", 217, 217, APPEARANCE_TYPE_GIANT_HILL, APPEARANCE_TYPE_GIANT_HILL, -1, 42, 42, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Hill-Giant", 2, -2, 2, -2, 0, 0);
    ACN_SubRace_CreateMisc("Hill-Giant", TRUE, RACIAL_TYPE_GIANT, -1, CREATURE_SIZE_LARGE);
}

void LoadSubrace_StoneGiant()
{
    ACN_SubRace_CreateAllowed("Stone-Giant", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Stone-Giant", 217, 217, APPEARANCE_TYPE_GIANT_MOUNTAIN, APPEARANCE_TYPE_GIANT_MOUNTAIN, -1, 42, 42, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Stone-Giant", 2, 1, 1, -2, -1, -1);
    ACN_SubRace_CreateMisc("Stone-Giant", TRUE, RACIAL_TYPE_GIANT, -1, CREATURE_SIZE_LARGE);
}

void LoadSubrace_FrostGiant()
{
    ACN_SubRace_CreateAllowed("Frost-Giant", 1, CLASS_RESTRICT_BARBARIAN | CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_FIGHTER | CLASS_RESTRICT_SORCERER, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    ACN_SubRace_CreateAppearance("Frost-Giant", 216, 606, APPEARANCE_TYPE_GIANT_FROST, APPEARANCE_TYPE_GIANT_FROST_FEMALE, -1, 43, 306, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Frost-Giant", 2, -2, 2, -2, 0, 0);
    ACN_SubRace_CreateMisc("Frost-Giant", TRUE, RACIAL_TYPE_GIANT, -1, CREATURE_SIZE_HUGE);
    ACN_SubRace_CreateFeat("Frost-Giant", FEAT_ARTIST);
    ACN_SubRace_CreateFeat("Frost-Giant", FEAT_POWER_ATTACK);
    ACN_SubRace_CreateFeat("Frost-Giant", FEAT_CLEAVE);
    ACN_SubRace_CreateFeat("Frost-Giant", FEAT_RESIST_ENERGY_COLD);
    ACN_SubRace_CreateItems("Frost-Giant", "pcfrostgiantskin", "", "", 1);
}

void LoadSubrace_FireGiant()
{
    ACN_SubRace_CreateAllowed("Fire-Giant", 1, CLASS_RESTRICT_BARBARIAN | CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_FIGHTER | CLASS_RESTRICT_SORCERER, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    ACN_SubRace_CreateAppearance("Fire-Giant", 215, 607, APPEARANCE_TYPE_GIANT_FIRE, APPEARANCE_TYPE_GIANT_FIRE_FEMALE, -1, 43, 307, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Fire-Giant", 2, -2, 2, -1, 0, -1);
    ACN_SubRace_CreateMisc("Fire-Giant", TRUE, RACIAL_TYPE_GIANT, -1, CREATURE_SIZE_HUGE);
    ACN_SubRace_CreateFeat("Fire-Giant", FEAT_ARTIST);
    ACN_SubRace_CreateFeat("Fire-Giant", FEAT_POWER_ATTACK);
    ACN_SubRace_CreateFeat("Fire-Giant", FEAT_CLEAVE);
    ACN_SubRace_CreateFeat("Fire-Giant", FEAT_RESIST_ENERGY_FIRE);
    ACN_SubRace_CreateItems("Fire-Giant", "pcfiregiantskin", "", "", 1);
}

void LoadSubrace_Ogre()
{
    ACN_SubRace_CreateAllowed("Ogre", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    ACN_SubRace_CreateAppearance("Ogre", 262, 262, APPEARANCE_TYPE_OGRE, APPEARANCE_TYPE_OGREB, -1, 70, 70, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Ogre", 2, -1, 2, -1, -1, -1);
    ACN_SubRace_CreateMisc("Ogre", TRUE, RACIAL_TYPE_GIANT, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateFeat("Ogre", FEAT_TOUGHNESS);
    ACN_SubRace_CreateFeat("Ogre", FEAT_POWER_ATTACK);
}

void LoadSubrace_Troll()
{
    ACN_SubRace_CreateAllowed("Troll", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    ACN_SubRace_CreateAppearance("Troll", 307, 308, APPEARANCE_TYPE_TROLL_CHIEFTAIN, APPEARANCE_TYPE_TROLL_SHAMAN, -1, 93, 93, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Troll", 2, 1, 2, -2, -1, -2);
    ACN_SubRace_CreateMisc("Troll", TRUE, RACIAL_TYPE_GIANT, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateFeat("Troll", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Troll", FEAT_IRON_WILL);
    ACN_SubRace_CreateItems("Troll", "pcsubracetroll", "", "", 5);
}

void ACN_SubRace_LoadMonsterOne()
{
    LoadSubrace_Rakshasa();
    LoadSubrace_CelestialAvenger();
    LoadSubrace_Archon();
    LoadSubrace_Ettin();
    LoadSubrace_HillGiant();
    LoadSubrace_StoneGiant();
    LoadSubrace_FireGiant();
    LoadSubrace_FrostGiant();
    LoadSubrace_Ogre();
    LoadSubrace_Troll();
}
