void main()
{
    string sTagNum = GetStringRight(GetTag(OBJECT_SELF), 1);
    object oPC = GetLastUsedBy();
    effect eVis = EffectVisualEffect(VFX_FNF_PWKILL);

    if (sTagNum == "1") sTagNum = "2";
    else sTagNum = "1";

    object oTarget = GetObjectByTag("portal_baator_" + sTagNum);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    DelayCommand(2.0, AssignCommand(oPC, ClearAllActions()));
    DelayCommand(2.1, AssignCommand(oPC, JumpToLocation(GetLocation(oTarget))));
}
