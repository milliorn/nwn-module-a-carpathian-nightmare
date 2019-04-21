void main()
{
    object oPC = GetEnteringObject(),
           oMerry = GetWaypointByTag("NW_MERRY_SPAWN");

    if(GetIsDM(oPC)) return;

    // Loop all objects in area
    object oArea = OBJECT_SELF;
    object oObject = GetFirstObjectInArea(oArea);
    while(GetIsObjectValid(oObject))
    {
        if(GetResRef(OBJECT_SELF) == "merrypriest")
        {
            return;
        }

        else if(GetIsPC(OBJECT_SELF))
        {
            return;
        }

        oObject = GetNextObjectInArea(oArea);
    }

    if (!GetIsObjectValid(GetNearestObjectByTag("MerryPriest", oMerry)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oMerry));
    }

    AssignCommand(oPC, ClearAllActions(TRUE));
}
