/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...
*/



/*
//Includes
*/
#include "acn_subfunc"

void LoadSubrace_Aasimar()
{
    ACN_SubRace_CreateAllowed("Aasimar", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE ^ (ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_NEUTRAL1 | ALIGN_RESTRICT_NEUTRAL2));
    ACN_SubRace_CreateAppearance("Aasimar", -1, -1, -1, -1, -1, -1, -1, -1, -1, CREATURE_WING_TYPE_ANGEL, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Aasimar", -1, -1, -1, -1, 2, 2);
    ACN_SubRace_CreateMisc("Aasimar", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Aasimar", FEAT_RESIST_ENERGY_ACID);
    ACN_SubRace_CreateFeat("Aasimar", FEAT_RESIST_ENERGY_COLD);
    ACN_SubRace_CreateFeat("Aasimar", FEAT_RESIST_ENERGY_ELECTRICAL);
    ACN_SubRace_CreateFeat("Aasimar", FEAT_DARKVISION);
}

void LoadSubrace_Tiefling()
{
    ACN_SubRace_CreateAllowed("Tiefling", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_CHAOTIC);
    ACN_SubRace_CreateAppearance("Tiefling", -1, -1, -1, -1, -1, -1, -1, -1, -1, CREATURE_WING_TYPE_DEMON, CREATURE_TAIL_TYPE_DEVIL);
    ACN_SubRace_CreateAttributes("Tiefling", 0, 2, 0,-1, 0, -1);
    ACN_SubRace_CreateMisc("Tiefling", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Tiefling", FEAT_RESIST_ENERGY_COLD);
    ACN_SubRace_CreateFeat("Tiefling", FEAT_RESIST_ENERGY_ELECTRICAL);
    ACN_SubRace_CreateFeat("Tiefling", FEAT_RESIST_ENERGY_FIRE);
    ACN_SubRace_CreateFeat("Tiefling", FEAT_DARKVISION);
}

void LoadSubrace_Feyri()
{
    ACN_SubRace_CreateAllowed("Fey-ri", 1, CLASS_RESTRICT_FIGHTER | CLASS_RESTRICT_ROGUE | CLASS_RESTRICT_SORCERER, RACE_RESTRICT_ELF, ALIGN_RESTRICT_NONE ^ (ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_GOOD));
    ACN_SubRace_CreateAppearance("Fey-ri", -1, -1, -1, -1, -1, -1, -1, 44, 7, CREATURE_WING_TYPE_DEMON, CREATURE_TAIL_TYPE_BONE);
    ACN_SubRace_CreateAttributes("Fey-ri", -2, 2, -2, 2, 0, 0);
    ACN_SubRace_CreateMisc("Fey-ri", FALSE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_MEDIUM);
}

void LoadSubrace_AirGenasi()
{
    ACN_SubRace_CreateAllowed("Air-Genasi", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Air-Genasi", -1, -1, -1, -1, -1, -1, -1, 20, 62, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Air-Genasi", 0, 2, -2, 0, 0, 0);
    ACN_SubRace_CreateMisc("Air-Genasi", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Air-Genasi", FEAT_RESIST_ENERGY_ELECTRICAL);
    ACN_SubRace_CreateFeat("Air-Genasi", FEAT_DARKVISION);
}

void LoadSubrace_EarthGenasi()
{
    ACN_SubRace_CreateAllowed("Earth-Genasi", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Earth-Genasi", -1, -1, -1, -1, -1, -1, -1, 60, 0, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Earth-Genasi", 2, -2, 0, 0, 0, 0);
    ACN_SubRace_CreateMisc("Earth-Genasi", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Earth-Genasi", FEAT_RESIST_ENERGY_ACID);
    ACN_SubRace_CreateFeat("Earth-Genasi", FEAT_DARKVISION);
}

void LoadSubrace_FireGenasi()
{
    ACN_SubRace_CreateAllowed("Fire-Genasi", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Fire-Genasi", -1, -1, -1, -1, -1, -1, -1, 58, 4, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Fire-Genasi", 0, 0, 0, 2, 0, -2);
    ACN_SubRace_CreateMisc("Fire-Genasi", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Fire-Genasi", FEAT_RESIST_ENERGY_FIRE);
    ACN_SubRace_CreateFeat("Fire-Genasi", FEAT_DARKVISION);
}

void LoadSubrace_WaterGenasi()
{
    ACN_SubRace_CreateAllowed("Water-Genasi", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Water-Genasi", -1, -1, -1, -1, -1, -1, -1, 50, 40, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Water-Genasi", 0, 0, 0, 0, 2, -2);
    ACN_SubRace_CreateMisc("Water-Genasi", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Water-Genasi", FEAT_RESIST_ENERGY_COLD);
    ACN_SubRace_CreateFeat("Water-Genasi", FEAT_DARKVISION);
}

void LoadSubrace_Succubus()
{
    ACN_SubRace_CreateAllowed("Succubus", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Succubus", 187, 187, 163, 163, -1, 90, 90, -1, -1, CREATURE_WING_TYPE_DEMON, CREATURE_TAIL_TYPE_DEVIL);
    ACN_SubRace_CreateAttributes("Succubus", -1, 1, 0, -1, -1, 2);
    ACN_SubRace_CreateMisc("Succubus", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Succubus", FEAT_DARKVISION);
    ACN_SubRace_CreateFeat("Succubus", FEAT_DODGE);
    ACN_SubRace_CreateFeat("Succubus", FEAT_MOBILITY);
}

void LoadSubrace_Balor()
{
    ACN_SubRace_CreateAllowed("Balor", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    ACN_SubRace_CreateAppearance("Balor", 176, 176, 38, 38, -1, 25, 25, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Balor", 1, -2, 2, -1, -1, 1);
    ACN_SubRace_CreateMisc("Balor", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Balor", FEAT_RESIST_ENERGY_FIRE);
    ACN_SubRace_CreateFeat("Balor", FEAT_RESIST_ENERGY_ELECTRICAL);
    ACN_SubRace_CreateFeat("Balor", FEAT_POWER_ATTACK);
    ACN_SubRace_CreateFeat("Balor", FEAT_DARKVISION);

}

void LoadSubrace_PitFiend()
{
    ACN_SubRace_CreateAllowed("Pit-Fiend", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    ACN_SubRace_CreateAppearance("Pit-Fiend", 694, 694, 392, 392, -1, 386, 386, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Pit-Fiend", 2, -2, 1, 0, -2, 1);
    ACN_SubRace_CreateMisc("Pit-Fiend", TRUE, RACIAL_TYPE_OUTSIDER, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateFeat("Pit-Fiend", FEAT_POWER_ATTACK);
    ACN_SubRace_CreateFeat("Pit-Fiend", FEAT_CLEAVE);
    ACN_SubRace_CreateFeat("Pit-Fiend", FEAT_IRON_WILL);
    ACN_SubRace_CreateFeat("Pit-Fiend", FEAT_DARKVISION);
}




void ACN_SubRace_LoadPlane()
{
    LoadSubrace_Aasimar();
    LoadSubrace_Tiefling();
    LoadSubrace_Feyri();
    LoadSubrace_AirGenasi();
    LoadSubrace_EarthGenasi();
    LoadSubrace_FireGenasi();
    LoadSubrace_WaterGenasi();
    LoadSubrace_Succubus();
    LoadSubrace_Balor();
    LoadSubrace_PitFiend();
}
