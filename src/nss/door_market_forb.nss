void main()
{
    object oPC = GetEnteringObject();
    string sName = GetName(oPC, FALSE);
    string sCDKey = GetPCPublicCDKey(oPC, TRUE);

    FloatingTextStringOnCreature("<cþf >WARNING!  You have trespassed in a forbidden area"
    + "<cþf > in the Market.  Now, escape from jail!", oPC);

    DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("WP_JAIL")))));
    SendMessageToAllDMs("<có  >WARNING!!! </c>" + sName + " <có  >was sent to jail for trying to access </c>"
    + GetName(GetArea(oPC)));
}
