void main()
{
    object oPC = GetLastUsedBy();
    object oDoor = GetNearestObjectByTag("GateHalloftheFallen", OBJECT_SELF);
    AssignCommand(oDoor, SetLocked(oDoor, FALSE));
    DelayCommand(1.0, ActionOpenDoor(oDoor));
    DelayCommand(1440.0, ActionCloseDoor(oDoor));
    DelayCommand(1440.9, SetLocked(oDoor, TRUE));
    FloatingTextStringOnCreature("You hear a gate in the distance open", oPC, TRUE);
}
