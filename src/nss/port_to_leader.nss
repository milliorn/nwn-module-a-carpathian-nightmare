void main()
{
    object oPC = GetLastUsedBy();
    object oLeader = GetFactionLeader(oPC);
    object oLeaderArea = GetArea(oLeader);
    object oArea = GetArea(OBJECT_SELF);
    string sName = GetName(oPC),
           sArea = GetTag(GetArea(oLeader));
    location iTarget = GetLocation(oLeader);
    effect eVis = EffectVisualEffect(VFX_IMP_HEALING_X);

    if (oLeader == oPC) return;

    else if (GetLocalInt(oLeaderArea, "NO_PORTALS"))
    {
        FloatingTextStringOnCreature("<có  >Cannot teleport to this area.  Restricted or Boss map.", oPC);
        return;
    }

    else if (GetArea(oLeader) == OBJECT_INVALID || oLeader == OBJECT_INVALID)
    {
        FloatingTextStringOnCreature("<có  >Unable to port to leader."
        + " Try again in a few seconds", oPC);
        return;
    }

    else
    DelayCommand(1.5,(AssignCommand(oPC, JumpToLocation(iTarget))));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
}
