void main()
{
    object oPC = GetLastUsedBy(),
           oLastUser = GetLocalObject(OBJECT_SELF, "LAST_USER");

    if (GetIsDM(oPC)) return;
    if (GetIsObjectValid(oLastUser) && oLastUser != oPC)
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionForceMoveToLocation(GetLocation(GetWaypointByTag("NW_OMEGA_FORGE")), TRUE));
        FloatingTextStringOnCreature("This forge is in use and your activity has been reported to the DMs", oPC);
        SendMessageToAllDMs(GetName(oPC) + "<cþf > could POSSIBLY be attempting to steal from a forge in use");
    }
}
