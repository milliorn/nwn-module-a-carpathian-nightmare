//::///////////////////////////////////////////////
//:: Milliorn's Name Changer
//:: pc_name_confirm
//:://////////////////////////////////////////////
/*
    Written By Scott Milliorn
*/
//////////////////////////////////////////////////

void main()
{
    // Set the NPC to listen
    SetListening(OBJECT_SELF, FALSE);

    // Set the custom token for the text spoken
    SetCustomToken(2000, GetLocalString(OBJECT_SELF, "NAME"));
}
