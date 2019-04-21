#include "dm_inc_forge"
void main()
{
    AssignCommand(GetPCSpeaker(),ActionPauseConversation());

    object oItem = GetFirstItemInInventory(GetObjectByTag("omegaforge4"));

    string LEVEL = dmGetNewLevel(oItem);

    SetCustomToken(4511,LEVEL);

    DelayCommand(2.0,AssignCommand(GetPCSpeaker(),ActionResumeConversation()));
}
