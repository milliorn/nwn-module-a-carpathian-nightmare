void main()
{
    DelayCommand(600.0, ActionCloseDoor(OBJECT_SELF));
    if(GetLockLockable(OBJECT_SELF))
    {
        SetLocked(OBJECT_SELF, TRUE);
    }
}
