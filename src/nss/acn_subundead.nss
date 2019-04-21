/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...

*/



/*
//Includes
*/
#include "acn_subfunc"

void LoadSubrace_Bodak()
{
    ACN_SubRace_CreateAllowed("Bodak", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Bodak", 153, 153, APPEARANCE_TYPE_BODAK, APPEARANCE_TYPE_BODAK, -1, 40, 40, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Bodak", 1, 1, -2, -2, 1, 1);
    ACN_SubRace_CreateMisc("Bodak", FALSE, RACIAL_TYPE_UNDEAD, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Bodak", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Bodak", FEAT_DODGE);
    ACN_SubRace_CreateFeat("Bodak", FEAT_IMPROVED_INITIATIVE);
}

void LoadSubrace_DoomKnight()
{
    ACN_SubRace_CreateAllowed("Doom-Knight", 1, CLASS_RESTRICT_BARBARIAN | CLASS_RESTRICT_BARD | CLASS_RESTRICT_FIGHTER | CLASS_RESTRICT_RANGER | CLASS_RESTRICT_PALADIN, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_NONE);
    ACN_SubRace_CreateAppearance("Doom-Knight", 190, 190, APPEARANCE_TYPE_DOOM_KNIGHT, APPEARANCE_TYPE_DOOM_KNIGHT, -1, 28, 28, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Doom-Knight", 2, -2, 0, -2, 1, 1);
    ACN_SubRace_CreateMisc("Doom-Knight", FALSE, RACIAL_TYPE_UNDEAD, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Bodak", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Bodak", FEAT_CLEAVE);
    ACN_SubRace_CreateItems("Doom-Knight", "pcdoomknightskin", "", "", 11);
}

void LoadSubrace_Ghoul()
{
    ACN_SubRace_CreateAllowed("Ghoul", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Ghoul", 213, 211, APPEARANCE_TYPE_GHOUL, APPEARANCE_TYPE_GHAST, -1, 40, 40, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Ghoul", 0, 1, -2, 0, 0, 1);
    ACN_SubRace_CreateMisc("Ghoul", FALSE, RACIAL_TYPE_UNDEAD, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Ghoul", FEAT_TOUGHNESS);
}

void LoadSubrace_Lich()
{
    ACN_SubRace_CreateAllowed("Lich", 1, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_DRUID | CLASS_RESTRICT_SORCERER | CLASS_RESTRICT_WIZARD, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Lich", 241, 241, APPEARANCE_TYPE_LICH, 465, -1, 56, 56, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Lich", -2, -2, -2, 2, 2, 2);
    ACN_SubRace_CreateMisc("Lich", FALSE, RACIAL_TYPE_UNDEAD, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Lich", FEAT_SILENCE_SPELL);
    ACN_SubRace_CreateFeat("Lich", FEAT_STILL_SPELL);
    ACN_SubRace_CreateFeat("Lich", FEAT_QUICKEN_SPELL);
}

void LoadSubrace_Mohrg()
{
    ACN_SubRace_CreateAllowed("Mohrg", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Mohrg", 257, 257, APPEARANCE_TYPE_MOHRG, APPEARANCE_TYPE_MOHRG, -1, 67, 67, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Mohrg", 1, 1, -2, 0, 0, 0);
    ACN_SubRace_CreateMisc("Mohrg", FALSE, RACIAL_TYPE_UNDEAD, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Mohrg", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Mohrg", FEAT_DODGE);
    ACN_SubRace_CreateFeat("Mohrg", FEAT_IMPROVED_INITIATIVE);
    ACN_SubRace_CreateFeat("Mohrg", FEAT_LIGHTNING_REFLEXES);
}


void LoadSubrace_Mummy()
{
    ACN_SubRace_CreateAllowed("Mummy", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Mummy", 260, 260, APPEARANCE_TYPE_MUMMY_COMMON, APPEARANCE_TYPE_MUMMY_COMMON, -1, 68, 68, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Mummy", 2, 0, -2, -2, 1, 1);
    ACN_SubRace_CreateMisc("Mummy", FALSE, RACIAL_TYPE_UNDEAD, NWNX_CREATURE_MOVEMENT_RATE_FAST, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Mummy", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Mummy", FEAT_GREAT_FORTITUDE);
    ACN_SubRace_CreateFeat("Mummy", FEAT_TOUGHNESS);
    ACN_SubRace_CreateItems("Mummy", "pcmummyskin", "", "", 7);
}

void LoadSubrace_Shadow()
{
    ACN_SubRace_CreateAllowed("Shadow", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Shadow", 284, 283, APPEARANCE_TYPE_SHADOW_FIEND, APPEARANCE_TYPE_SHADOW, -1, 78, 78, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Shadow", -1, 1, -1, -1, 1, 1);
    ACN_SubRace_CreateMisc("Shadow", FALSE, RACIAL_TYPE_UNDEAD, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Shadow", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Shadow", FEAT_DODGE);
}

void LoadSubrace_Skeleton()
{
    ACN_SubRace_CreateAllowed("Skeleton", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Skeleton", 293, 292, APPEARANCE_TYPE_SKELETON_WARRIOR_2, APPEARANCE_TYPE_SKELETON_WARRIOR_1, -1, 82, 82, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Skeleton", 0, 2, 0, 0, 0, -2);
    ACN_SubRace_CreateMisc("Skeleton", FALSE, RACIAL_TYPE_UNDEAD, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Skeleton", FEAT_IMPROVED_INITIATIVE);
    ACN_SubRace_CreateItems("Skeleton", "pcskeletonskin", "", "", 5);
}

void LoadSubrace_Vampire()
{
    ACN_SubRace_CreateAllowed("Vampire", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Vampire", 310, 546, APPEARANCE_TYPE_VAMPIRE_MALE, APPEARANCE_TYPE_VAMPIRE_FEMALE, -1, 96, 205, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Vampire", 2, 0, -2, 0, 0, 0);
    ACN_SubRace_CreateMisc("Vampire", FALSE, RACIAL_TYPE_UNDEAD, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Vampire", FEAT_ALERTNESS);
    ACN_SubRace_CreateFeat("Vampire", FEAT_IMPROVED_INITIATIVE);
    ACN_SubRace_CreateFeat("Vampire", FEAT_LIGHTNING_REFLEXES);
    ACN_SubRace_CreateFeat("Vampire", FEAT_TOUGHNESS);
    ACN_SubRace_CreateItems("Vampire", "pcsubracevamp", "", "", 9);
}
void LoadSubrace_Wraith()
{
    ACN_SubRace_CreateAllowed("Wraith", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF,  ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Wraith", 299, 322, APPEARANCE_TYPE_SPECTRE, APPEARANCE_TYPE_WRAITH, -1, 107, 107, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Wraith", -1, 1, -1, 0, 0, 1);
    ACN_SubRace_CreateMisc("Wraith", FALSE, RACIAL_TYPE_UNDEAD, -1, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Wraith", FEAT_IMPROVED_INITIATIVE);
    ACN_SubRace_CreateFeat("Wraith", FEAT_LIGHTNING_REFLEXES);
}

void LoadSubrace_Zombie()
{
    ACN_SubRace_CreateAllowed("Zombie", 1, CLASS_RESTRICT_NONE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF, ALIGN_RESTRICT_EVIL);
    ACN_SubRace_CreateAppearance("Zombie", 356, 357, APPEARANCE_TYPE_ZOMBIE_WARRIOR_1, APPEARANCE_TYPE_ZOMBIE_WARRIOR_2, -1, 111, 111, -1, -1, CREATURE_WING_TYPE_NONE, CREATURE_TAIL_TYPE_NONE);
    ACN_SubRace_CreateAttributes("Zombie", 2, 0, 0, 0, -1, -1);
    ACN_SubRace_CreateMisc("Zombie", FALSE, RACIAL_TYPE_UNDEAD, NWNX_CREATURE_MOVEMENT_RATE_FAST, CREATURE_SIZE_MEDIUM);
    ACN_SubRace_CreateFeat("Zombie", FEAT_TOUGHNESS);
    ACN_SubRace_CreateItems("Zombie", "pcundeadskin", "", "", 1);
}

void ACN_SubRace_LoadUndead()
{
    LoadSubrace_Bodak();
    LoadSubrace_DoomKnight();
    LoadSubrace_Ghoul();
    LoadSubrace_Lich();
    LoadSubrace_Mohrg();
    LoadSubrace_Mummy();
    LoadSubrace_Shadow();
    LoadSubrace_Skeleton();
    LoadSubrace_Vampire();
    LoadSubrace_Wraith();
    LoadSubrace_Zombie();
}

/*void main (){}
