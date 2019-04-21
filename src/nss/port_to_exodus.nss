void main()
{
    object oPC = GetLastUsedBy();
    location iTarget = GetLocation(GetWaypointByTag("POST_gauntlet_boss"));
    DelayCommand(1.5, AssignCommand(oPC, JumpToLocation(iTarget)));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY ), oPC);
}
