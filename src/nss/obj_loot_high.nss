#include "inc_loot"
void main()
{
    if(!GetLocalInt(OBJECT_SELF, "TIMER"))
    {
        GenerateLootBoss();
        DelayCommand(0.4, GenerateLootBasic());
        DelayCommand(0.1, GenerateLootMisc());
        DelayCommand(0.3, GenerateLootSocket());
        DelayCommand(0.2, GenerateLootSocketGem());
        SetLocalInt(OBJECT_SELF, "TIMER", TRUE);
        DelayCommand(600.0, DeleteLocalInt(OBJECT_SELF, "TIMER"));
    }
}
