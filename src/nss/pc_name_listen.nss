//::///////////////////////////////////////////////
//:: Milliorn's Name Changer
//:: pc_name_listen
//:://////////////////////////////////////////////
/*
    Written By Scott Milliorn
*/
//////////////////////////////////////////////////

void main()
{
    // Set the NPC to listen
    DeleteLocalString(OBJECT_SELF, "NAME");
    SetListening(OBJECT_SELF, TRUE);
    SetListenPattern(OBJECT_SELF, "**", 1);
}
