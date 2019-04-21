//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_amount
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////

void main()
{
    // Set the banker to listen
    SetListening(OBJECT_SELF, FALSE);

    // Set the custom token for the amount spoken
    SetCustomToken(1000, GetLocalString(OBJECT_SELF, "GOLD"));
}
