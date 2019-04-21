void main()
{
    object oPC = GetEnteringObject(),
           oObject1 = GetWaypointByTag("POST_shopkeep001"),
           oObject2 = GetWaypointByTag("NW_TailoringModel_M"),
           oObject3 = GetWaypointByTag("NW_TailoringModel_F"),
           oObject4 = GetWaypointByTag("NW_MERCHANT_WEAPON"),
           oObject5 = GetWaypointByTag("POST_languageteacher"),
           oObject6 = GetWaypointByTag("NW_MrJeeves");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("shopkeep001", oObject1)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "shopkeep001", GetLocation(oObject1));
    }

    if (!GetIsObjectValid(GetNearestObjectByTag("weaponshop", oObject4)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "weaponshop", GetLocation(oObject4));
    }

    if (!GetIsObjectValid(GetNearestObjectByTag("languageteacher", oObject5)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "languageteacher", GetLocation(oObject5));
    }

    if (!GetIsObjectValid(GetNearestObjectByTag("mrjeeves", oObject6)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "mrjeeves", GetLocation(oObject6));
    }
}
