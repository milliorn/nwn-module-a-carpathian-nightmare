#include "dm_inc_remove"

void main()
{
    AssignCommand(GetPCSpeaker(),ActionPauseConversation());

    ModItemWithRemoval(GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1))),
                GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1)),
                GetObjectByTag("omegaanvil" + GetStringRight(GetTag(OBJECT_SELF),1)),
                OBJECT_SELF, GetLocalInt(OBJECT_SELF,"MODCODE"), GetLocalInt(OBJECT_SELF,"Mods"));

    DelayCommand(3.0,AssignCommand(GetPCSpeaker(),ActionResumeConversation()));
}
