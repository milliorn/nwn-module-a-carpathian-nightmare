#include "inc_loot"
void main()
{
    if(!GetLocalInt(OBJECT_SELF, "TIMER"))
    {
        GenerateLootBoss();
        DelayCommand(0.1, GenerateLootBasic());
        DelayCommand(0.2, GenerateLootMisc());
        DelayCommand(0.3, GenerateLootSocket());
        SetLocalInt(OBJECT_SELF, "TIMER", TRUE);
        DelayCommand(600.0, DeleteLocalInt(OBJECT_SELF, "TIMER"));
    }
}
