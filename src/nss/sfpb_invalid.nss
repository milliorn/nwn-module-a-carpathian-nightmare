//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_invalid
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////

int StartingConditional()
{
    string sGold = GetLocalString(OBJECT_SELF, "GOLD");
    // Check if amount spoken is valid
    return (sGold == "" || GetStringLength(sGold) > 9);
}
