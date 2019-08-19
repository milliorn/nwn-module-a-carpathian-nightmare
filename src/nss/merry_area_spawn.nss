void main()
{
    object oPC = GetEnteringObject(),
           oMerry = GetWaypointByTag("NW_MERRY_SPAWN");

    if(GetIsDM(oPC) || !GetIsPC(oPC)) return;

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (OBJECT_INVALID == GetNearestObjectByTag("MerryPriest", oMerry))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oMerry));
    }
}
