#include "dm_inc_forge"

void main()
{
    AssignCommand(GetPCSpeaker(),ActionPauseConversation());

    ModItem(GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1))),
                GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1)),
                GetObjectByTag("omegaanvil" + GetStringRight(GetTag(OBJECT_SELF),1)),
                OBJECT_SELF, GetLocalInt(OBJECT_SELF,"Mods"), GetLocalInt(OBJECT_SELF,"MODCODE"));

    DelayCommand(3.0,AssignCommand(GetPCSpeaker(),ActionResumeConversation()));
}
