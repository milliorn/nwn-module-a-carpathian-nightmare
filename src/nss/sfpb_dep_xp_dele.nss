//////////////////////////////////////////////////
#include "nwnx_admin"
void main()
{
    // Vars
    object oPC = GetPCSpeaker();
    DelayCommand(3.0, NWNX_Administration_DeletePlayerCharacter(oPC, FALSE));
}
