/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...
*/



/*
//Includes
*/
#include "acn_subfunc"

void LoadSubrace_Ghostwise()
{
    ACN_SubRace_CreateAllowed("Ghostwise", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFLING, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Ghostwise", -1, -1, -1, -1, -1, -1, -1, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Ghostwise", 0, 0, -2, 0, 2, 0);
    ACN_SubRace_CreateMisc("Ghostwise", FALSE, -1, -1, CREATURE_SIZE_SMALL);
    ACN_SubRace_CreateFeat("Ghostwise", FEAT_BLOODED);
    ACN_SubRace_CreateFeat("Ghostwise", FEAT_STRONGSOUL);
}

void LoadSubrace_Lightfoot()
{
    ACN_SubRace_CreateAllowed("Lightfoot", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFLING, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Lightfoot", -1, -1, -1, -1, -1, -1, -1, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Lightfoot", 0, 0, 0, -2, 0, 2);
    ACN_SubRace_CreateMisc("Lightfoot", FALSE, -1, -1, CREATURE_SIZE_SMALL);
    ACN_SubRace_CreateFeat("Lightfoot", FEAT_SKILL_FOCUS_HIDE);
}

void LoadSubrace_StoutHalfling()
{
    ACN_SubRace_CreateAllowed("Halfling-Stout", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFLING, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Halfling-Stout", -1, -1, -1, -1, -1, -1, -1, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Halfling-Stout", -2, 1, 1, 0, 0, 0);
    ACN_SubRace_CreateMisc("Halfling-Stout", FALSE, -1, -1, CREATURE_SIZE_SMALL);
    ACN_SubRace_CreateFeat("Halfling-Stout", FEAT_SKILL_FOCUS_SEARCH);
    ACN_SubRace_CreateFeat("Halfling-Stout", FEAT_DARKVISION);
}

void LoadSubrace_Strongheart()
{
    ACN_SubRace_CreateAllowed("Strongheart", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFLING, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Strongheart", -1, -1, -1, -1, -1, -1, -1, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Strongheart", 2, -2, 0, 0, 0, 0);
    ACN_SubRace_CreateMisc("Strongheart", FALSE, -1, -1, CREATURE_SIZE_SMALL);
    ACN_SubRace_CreateFeat("Strongheart", FEAT_SKILL_FOCUS_LISTEN);
}

void LoadSubrace_Tallfellow()
{
    ACN_SubRace_CreateAllowed("Tallfellow", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFLING, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Tallfellow", -1, -1, -1, -1, -1, -1, -1, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Tallfellow", -2, 2, 0, 0, 0, 0);
    ACN_SubRace_CreateMisc("Tallfellow", FALSE, -1, -1, CREATURE_SIZE_SMALL);
    ACN_SubRace_CreateFeat("Tallfellow", FEAT_ARTIST);
    ACN_SubRace_CreateFeat("Tallfellow", FEAT_SKILL_FOCUS_SEARCH);
}

void LoadSubrace_GrayOrc()
{
    ACN_SubRace_CreateAllowed("Orc-Gray", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFORC, ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Orc-Gray", -1, -1, -1, -1, -1, -1, -1, 60, 57, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Orc-Gray", 0, 0, 0, 0, 2, 0);
    ACN_SubRace_CreateMisc("Orc-Gray", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Orc-Gray", FEAT_PDK_INSPIRE_1);
    ACN_SubRace_CreateFeat("Orc-Gray", FEAT_SKILL_FOCUS_INTIMIDATE);
}

void LoadSubrace_MountainOrc()
{
    ACN_SubRace_CreateAllowed("Orc-Mountain", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFORC, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Orc-Mountain", -1, -1, -1, -1, -1, -1, -1, 32, 63, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Orc-Mountain", 2, 0, 0, -1, 0, -1);
    ACN_SubRace_CreateMisc("Orc-Mountain", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
}

void LoadSubrace_Orog()
{
    ACN_SubRace_CreateAllowed("Orog", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFORC, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Orog", -1, -1, -1, -1, -1, -1, -1, 54, 60, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Orog", 1, -1, 0, 0, -1, 1);
    ACN_SubRace_CreateMisc("Orog", FALSE, -1, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Orog", FEAT_RESIST_ENERGY_FIRE);
    ACN_SubRace_CreateFeat("Orog", FEAT_RESIST_ENERGY_COLD);
    ACN_SubRace_CreateFeat("Orog", FEAT_EPIC_ARMOR_SKIN);
}

void ACN_SubRace_LoadHalf()
{
    LoadSubrace_Ghostwise();
    LoadSubrace_Tallfellow();
    LoadSubrace_Lightfoot();
    LoadSubrace_StoutHalfling();
    LoadSubrace_Strongheart();
    LoadSubrace_GrayOrc();
    LoadSubrace_MountainOrc();
    LoadSubrace_Orog();
}

/*void main () {}
