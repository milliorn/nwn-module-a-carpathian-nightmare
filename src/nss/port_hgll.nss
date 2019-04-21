void main()
{
    string sTagNum = GetStringRight(GetTag(OBJECT_SELF), 1);
    object oPC = GetLastUsedBy(), oTarget;
    effect eVis = EffectVisualEffect(VFX_FNF_IMPLOSION);

    if (sTagNum == "1") sTagNum = "2";
    else sTagNum = "1";

    oTarget = GetObjectByTag("HGLL_ROOM_" + sTagNum);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    DelayCommand(2.0, AssignCommand(oPC, ClearAllActions()));
    DelayCommand(2.1, AssignCommand(oPC, JumpToLocation(GetLocation(oTarget))));
}
