void main()
{
    object oPC = GetExitingObject();
    object oDoor1 = GetObjectByTag("rakdoor1");
    object oDoor2 = GetObjectByTag("rakdoor2");
    ActionLockObject(oDoor1);
    ActionLockObject(oDoor2);
    ActionCloseDoor(oDoor1);
    ActionCloseDoor(oDoor2);
}
