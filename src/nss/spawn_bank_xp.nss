void main()
{
    object oPC = GetEnteringObject(),
           oGrimm = GetWaypointByTag("POST_thegrimmreefe002");

    AssignCommand(oPC, ClearAllActions(TRUE));
    if (!GetIsObjectValid(GetNearestObjectByTag("thegrimmreefe002", oGrimm)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "thegrimmreefe002", GetLocation(oGrimm));
    }
}
