void main()
{
    object oPC = GetLastUsedBy();
    object oHome = GetObjectByTag("CarpathianCircle");
    DelayCommand(1.5, AssignCommand(oPC, JumpToLocation(GetStartingLocation())));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_TORNADO), oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), oHome);
}

