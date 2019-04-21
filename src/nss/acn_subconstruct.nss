/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...
*/



/*
//Includes
*/
#include "acn_subfunc"

void LoadSubrace_AdamantineGolem()
{
    ACN_SubRace_CreateAllowed("Adamantine-Golem", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Adamantine-Golem", 717, 717, APPEARANCE_TYPE_GOLEM_ADAMANTIUM, APPEARANCE_TYPE_GOLEM_ADAMANTIUM, -1, 389, 389, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Adamantine-Golem", 1, 0, 0, 0, 0, -1);
    ACN_SubRace_CreateMisc("Adamantine-Golem", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateItems("Adamantine-Golem", "pcadamantineg", "", "", 13);
}

void LoadSubrace_BattleHorror()
{
    ACN_SubRace_CreateAllowed("Battle-Horror", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Battle-Horror", 146, 235, APPEARANCE_TYPE_BAT_HORROR, APPEARANCE_TYPE_HELMED_HORROR, -1, 54, 54, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Battle-Horror", 2, 0, -2, -2, 2, 0);
    ACN_SubRace_CreateMisc("Battle-Horror", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Battle-Horror", FEAT_CLEAVE);
    ACN_SubRace_CreateFeat("Battle-Horror", FEAT_POWER_ATTACK);
}

void LoadSubrace_BoneGolem()
{
    ACN_SubRace_CreateAllowed("Bone-Golem", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Bone-Golem", 226, 226, APPEARANCE_TYPE_GOLEM_BONE, APPEARANCE_TYPE_GOLEM_BONE, -1, 47, 47, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Bone-Golem", 2, 0, 0, -1, 0, -1);
    ACN_SubRace_CreateMisc("Bone-Golem", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateItems("Bone-Golem", "pcbonegolemprope", "", "", 6);
}

void LoadSubrace_ClayGolem()
{
    ACN_SubRace_CreateAllowed("Clay-Golem", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Clay-Golem", 227, 227, APPEARANCE_TYPE_GOLEM_CLAY, APPEARANCE_TYPE_GOLEM_CLAY, -1, 50, 50, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Clay-Golem", 2, 0, 0, -1, 1, -2);
    ACN_SubRace_CreateMisc("Clay-Golem", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateItems("Clay-Golem", "pcclaygolemprope", "", "", 7);
}

void LoadSubrace_DemonfleshGolem()
{
    ACN_SubRace_CreateAllowed("Demonflesh-Golem", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Demonflesh-Golem", 900, 900, APPEARANCE_TYPE_GOLEM_DEMONFLESH, APPEARANCE_TYPE_GOLEM_DEMONFLESH, -1, 442, 442, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Demonflesh-Golem", 2, -1, 0, -1, 0, 0);
    ACN_SubRace_CreateMisc("Demonflesh-Golem", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateItems("Demonflesh-Golem", "pcdemonfleshgole", "", "", 3);
    ACN_SubRace_CreateFeat("Demonflesh-Golem", FEAT_IMPROVED_INITIATIVE);
}

void LoadSubrace_DiamondGolem()
{
    ACN_SubRace_CreateAllowed("Diamond-Golem", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Diamond-Golem", 1270, 1270, 149, 149, -1, 442, 442, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Diamond-Golem", 2, 0, 0, 0, 0, -2);
    ACN_SubRace_CreateMisc("Diamond-Golem", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateItems("Diamond-Golem", "pcdiamondgolem", "", "", 1);
}

void LoadSubrace_EmeraldGolem()
{
    ACN_SubRace_CreateAllowed("Emerald-Golem", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Emerald-Golem", 1271, 1271, 169, 169, -1, 442, 442, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Emerald-Golem", 0, 1, 0, 0, 1, -2);
    ACN_SubRace_CreateMisc("Emerald-Golem", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateItems("Emerald-Golem", "pcemeraldgolem", "", "", 1);
}

void LoadSubrace_FleshGolem()
{
    ACN_SubRace_CreateAllowed("Flesh-Golem", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Flesh-Golem", 228, 228, APPEARANCE_TYPE_GOLEM_FLESH, APPEARANCE_TYPE_GOLEM_FLESH, -1, 48, 48, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Flesh-Golem", 1, -1, 1, -1, 1, -1);
    ACN_SubRace_CreateMisc("Flesh-Golem", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateItems("Flesh-Golem", "pcsubracefleshgo", "", "", 9);
}

void LoadSubrace_IronGolem()
{
    ACN_SubRace_CreateAllowed("Iron-Golem", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Iron-Golem", 229, 229, APPEARANCE_TYPE_GOLEM_IRON, APPEARANCE_TYPE_GOLEM_IRON, -1, 49, 49, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Iron-Golem", 2, 0, 0, -2, 2, -2);
    ACN_SubRace_CreateMisc("Iron-Golem", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateItems("Iron-Golem", "pcirongolemprope", "", "", 18);
}

void LoadSubrace_Minogon()
{
    ACN_SubRace_CreateAllowed("Minogon", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Minogon", 254, 254, APPEARANCE_TYPE_MINOGON, APPEARANCE_TYPE_MINOGON, -1, 49, 49, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Minogon", 2, 0, 1, -2, 0, -1);
    ACN_SubRace_CreateMisc("Minogon", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateFeat("Minogon", FEAT_DARKVISION);
}

void LoadSubrace_MithrilGolem()
{
    ACN_SubRace_CreateAllowed("Mithril-Golem", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Mithril-Golem", 716, 716, APPEARANCE_TYPE_GOLEM_MITHRAL, APPEARANCE_TYPE_GOLEM_MITHRAL, -1, 49, 49, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Mithril-Golem", 0, 1, 0, 0, 1, -2);
    ACN_SubRace_CreateMisc("Mithril-Golem", TRUE, RACIAL_TYPE_CONSTRUCT, NWNX_CREATURE_MOVEMENT_RATE_FAST, CREATURE_SIZE_LARGE);
}

void LoadSubrace_RubyGolem()
{
    ACN_SubRace_CreateAllowed("Ruby-Golem", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Ruby-Golem", 1272, 1272, 173, 173, -1, 49, 49, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Ruby-Golem", 1, 1, -1, -1, 1, -1);
    ACN_SubRace_CreateMisc("Ruby-Golem", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateItems("Ruby-Golem", "pcrubygolempr", "", "", 4);
}

void LoadSubrace_ShieldGolem()
{
    ACN_SubRace_CreateAllowed("Shield-Golem", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Shield-Golem", 285, 285, 90, 90, -1, 49, 49, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Shield-Golem", 2, 0, 0, 0, 0, -2);
    ACN_SubRace_CreateMisc("Shield-Golem", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateItems("Shield-Golem", "pcshieldgolempro", "", "", 4);
}

void LoadSubrace_StoneGolem()
{
    ACN_SubRace_CreateAllowed("Stone-Golem", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Stone-Golem", 230, 230, 92, 92, -1, 49, 49, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Stone-Golem", 2, -1, 0, 0, 1, -2);
    ACN_SubRace_CreateMisc("Stone-Golem", TRUE, RACIAL_TYPE_CONSTRUCT, -1, CREATURE_SIZE_LARGE);
    ACN_SubRace_CreateItems("Stone-Golem", "pcstonegolemp", "", "", 15);
}

void ACN_SubRace_LoadConstruct()
{
    LoadSubrace_AdamantineGolem();
    LoadSubrace_BattleHorror();
    LoadSubrace_BoneGolem();
    LoadSubrace_ClayGolem();
    LoadSubrace_DemonfleshGolem();
    LoadSubrace_DiamondGolem();
    LoadSubrace_EmeraldGolem();
    LoadSubrace_FleshGolem();
    LoadSubrace_IronGolem();
    LoadSubrace_Minogon();
    LoadSubrace_MithrilGolem();
    LoadSubrace_RubyGolem();
    LoadSubrace_ShieldGolem();
    LoadSubrace_StoneGolem();
}
