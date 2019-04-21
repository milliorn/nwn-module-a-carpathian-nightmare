//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_listen
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////

void main()
{
    // Set the banker to listen
    DeleteLocalString(OBJECT_SELF, "EXP");
    SetListening(OBJECT_SELF, TRUE);
    SetListenPattern(OBJECT_SELF, "*n", 1);
}
