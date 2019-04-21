void main()
{
    object oPC = GetEnteringObject(),
           oObject = GetWaypointByTag("POST_RavanasCovenSpectreHo");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("RavanaSpectre", oObject)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "ravanaspectre", GetLocation(oObject));
    }
}
