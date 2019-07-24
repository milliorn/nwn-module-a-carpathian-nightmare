//::///////////////////////////////////////////////
//:: x0_s2_blkdead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Level 3 - 6:  Summons Ghast
    Level 7 - 10: Doom Knight
    Level 11 - 14
    Level 15 - 18
    Level 19 - 22
    Level 23 - 26
    Level 27 - 30
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    int nLevel = GetLevelByClass(CLASS_TYPE_BLACKGUARD, OBJECT_SELF);
    effect eSummon;
    //float fDelay = 3.0;
    int nDuration = nLevel;

    if (nLevel >= 27) {
        eSummon = EffectSummonCreature("blckgrd_030",VFX_FNF_SUMMON_UNDEAD);
    }
    else if (nLevel >= 23) {
        eSummon = EffectSummonCreature("blckgrd_027",VFX_FNF_SUMMON_UNDEAD);
    }
    else if (nLevel >= 19) {
        eSummon = EffectSummonCreature("blckgrd_023",VFX_FNF_SUMMON_UNDEAD);
    }
    else if (nLevel >= 15) {
        eSummon = EffectSummonCreature("blckgrd_015",VFX_FNF_SUMMON_UNDEAD);
    }
    else if (nLevel >= 11) {
        eSummon = EffectSummonCreature("nw_blckgrd_11",VFX_FNF_SUMMON_UNDEAD);
    }
    else if (nLevel >= 7) {
        eSummon = EffectSummonCreature("NW_S_DOOMKGHT",VFX_FNF_SUMMON_UNDEAD);
    }
    else {
        eSummon = EffectSummonCreature("NW_S_GHAST",VFX_FNF_SUMMON_UNDEAD);
    }

    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, GetSpellTargetLocation(), HoursToSeconds(nDuration));
}
