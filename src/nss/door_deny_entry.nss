#include "inc_mod_events"
void main()
{
    object oPC = GetEnteringObject();
    string sName = GetName(oPC, FALSE);
    string sCDKEY = GetPCPublicCDKey(oPC, TRUE);

    if (GetIsGM(oPC)) return;

    AssignCommand(oPC, ActionJumpToLocation(GetStartingLocation()));
    SendMessageToAllDMs("<có  >WARNING!!! </c>" + sName + " <có  >tried to access </c>"
    + GetName(GetArea(oPC)));
}
