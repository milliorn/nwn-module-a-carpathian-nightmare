/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...
*/



/*
//Includes
*/
#include "acn_subfunc"

void LoadSubrace_Svirfneblin()
{
    ACN_SubRace_CreateAllowed("Svirfneblin", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_GNOME, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Svirfneblin", -1, -1, APPEARANCE_TYPE_SVIRF_MALE, APPEARANCE_TYPE_SVIRF_FEMALE, -1, -1, -1, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Svirfneblin", 0, 0, 0, 1, 1, -2);
    ACN_SubRace_CreateMisc("Svirfneblin", FALSE, -1, -1, CREATURE_SIZE_SMALL);
    ACN_SubRace_CreateFeat("Svirfneblin", FEAT_DARKVISION);
    ACN_SubRace_CreateFeat("Svirfneblin", FEAT_TOUGHNESS);
    ACN_SubRace_CreateFeat("Svirfneblin", FEAT_STRONGSOUL);
    ACN_SubRace_CreateFeat("Svirfneblin", FEAT_LUCK_OF_HEROES);
}

void LoadSubrace_ForestGnome()
{
    ACN_SubRace_CreateAllowed("Gnome-Forest", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_GNOME, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Gnome-Forest", -1, -1, -1, -1, -1, -1, -1, 36, 19, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Gnome-Forest", 2, 0, -2, 0, 0, -0);
    ACN_SubRace_CreateMisc("Gnome-Forest", FALSE, -1, -1, CREATURE_SIZE_SMALL);
    ACN_SubRace_CreateFeat("Gnome-Forest", FEAT_SKILL_FOCUS_HIDE);
}

void LoadSubrace_RockGnome()
{
    ACN_SubRace_CreateAllowed("Gnome-Rock", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_GNOME, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Gnome-Rock", -1, -1, -1, -1, -1, -1, -1, 0, 8, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Gnome-Rock", -2, 0, 2, 0, 0, 0);
    ACN_SubRace_CreateMisc("Gnome-Rock", FALSE, -1, -1, CREATURE_SIZE_SMALL);
}



void ACN_SubRace_LoadGnome()
{
    LoadSubrace_Svirfneblin();
    LoadSubrace_ForestGnome();
    LoadSubrace_RockGnome();
}

/*void main () {}
