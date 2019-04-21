#include "inc_loot"

void main()
{
    object oPC = GetLastOpenedBy();
    ActionCastSpellAtObject(SPELL_HORRID_WILTING, oPC, METAMAGIC_MAXIMIZE, TRUE, 60, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);

    if(!GetLocalInt(OBJECT_SELF, "TIMER"))
    {
        GenerateLootBoss();
        DelayCommand(0.1, GenerateLootBasic());
        DelayCommand(0.2, GenerateLootMisc());
        DelayCommand(0.3, GenerateLootSocket());
        DelayCommand(0.4, GenerateLootBoss());
        SetLocalInt(OBJECT_SELF, "TIMER", TRUE);
        DelayCommand(600.0, DeleteLocalInt(OBJECT_SELF, "TIMER"));
    }
}
