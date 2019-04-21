#include "inc_loot"
void main()
{
    if(!GetLocalInt(OBJECT_SELF, "TIMER"))
    {
        GenerateLootTreature();
        SetLocalInt(OBJECT_SELF, "TIMER", TRUE);
        DelayCommand(600.0, DeleteLocalInt(OBJECT_SELF, "TIMER"));
    }
}
