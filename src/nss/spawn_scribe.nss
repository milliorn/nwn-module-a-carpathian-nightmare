void main()
{
    object oPC = GetEnteringObject(),
           oObject  = GetWaypointByTag("POST_namingmerchant_9"),
           oObject1 = GetWaypointByTag("WP_DYE_METAL"),
           oObject2 = GetWaypointByTag("WP_DYE_CLOTH"	),
           oObject3 = GetWaypointByTag("WP_DYE_LEATHER");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("namingmerchant_9", oObject)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "namingmerchant_9", GetLocation(oObject));
    }

    if (!GetIsObjectValid(GetNearestObjectByTag("metaldyemercha", oObject1)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "metaldyemercha", GetLocation(oObject1));
    }

    if (!GetIsObjectValid(GetNearestObjectByTag("clothdyemercha", oObject2)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "clothdyemercha", GetLocation(oObject2));
    }

    if (!GetIsObjectValid(GetNearestObjectByTag("leatherdyemerc", oObject3)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "leatherdyemerc", GetLocation(oObject3));
    }
}
