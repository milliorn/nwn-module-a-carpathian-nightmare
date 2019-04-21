void main()
{
    object oPC = OBJECT_SELF;
    effect summon = EffectSummonCreature("coziaspider", VFX_FNF_SUMMON_UNDEAD);
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, summon, GetLocalLocation(oPC, "itm_cozia"), TurnsToSeconds(20));
    DeleteLocalLocation(oPC, "itm_cozia");
}
