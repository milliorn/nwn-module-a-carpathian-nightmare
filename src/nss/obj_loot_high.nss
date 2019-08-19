#include "inc_loot"
void main()
{
    if(!GetLocalInt(OBJECT_SELF, "TIMER"))
    {
        GenerateLootBoss();
        DelayCommand(0.8, GenerateLootBasic());
        DelayCommand(0.2, GenerateLootMisc());
        DelayCommand(0.6, GenerateLootSocket());
        DelayCommand(0.4, GenerateLootSocketGem());
        SetLocalInt(OBJECT_SELF, "TIMER", TRUE);
        DelayCommand(600.0, DeleteLocalInt(OBJECT_SELF, "TIMER"));
    }
}
