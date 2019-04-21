void main()
{
    object oPC = GetEnteringObject(),
           oBanker = GetWaypointByTag("POST_banker");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("banker", oBanker)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "banker", GetLocation(oBanker));
    }
}

