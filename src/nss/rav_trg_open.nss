void main()
{
    object oPC = GetEnteringObject();
    object oDoor1 = GetObjectByTag("rakdoor1");
    object oDoor2 = GetObjectByTag("rakdoor2");
    ActionUnlockObject(oDoor1);
    ActionUnlockObject(oDoor2);
    ActionOpenDoor(oDoor1);
    ActionOpenDoor(oDoor2);
}
