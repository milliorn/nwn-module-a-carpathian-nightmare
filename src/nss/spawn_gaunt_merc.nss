void main()
{
    object oPC = GetEnteringObject(),
           oObject = GetWaypointByTag("POST_gauntletmerchant");

    if(!GetIsPC(oPC)) return;

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (OBJECT_INVALID == GetNearestObjectByTag("GauntletMerchant", oObject))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "gauntletmerchant", GetLocation(oObject));
    }
}
