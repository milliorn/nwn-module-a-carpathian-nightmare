 void main()
{
   DelayCommand(60.0, ActionCloseDoor(OBJECT_SELF));
   DelayCommand(60.5, SetLocked(OBJECT_SELF, TRUE));
}

