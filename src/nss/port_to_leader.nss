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

    else if (GetHitDice(oPC) <= 15)
    {
        FloatingTextStringOnCreature("<có  >Free Party Portal travel until level 15."
        + "  After that the fee is 10,000 gold pieces.", oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
        DelayCommand(1.5, AssignCommand(oPC, JumpToLocation(iTarget)));
        return;
    }

    else if (GetGold(oPC) <= 10000)
    {
        FloatingTextStringOnCreature("<có  >You do not have 10,000 gold pieces "
        + "to use the Party Portal.", oPC, FALSE);
        return;
    }

    else
    {
        TakeGoldFromCreature(10000, oPC, TRUE);
        DelayCommand(1.5,(AssignCommand(oPC, JumpToLocation(iTarget))));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    }
}





