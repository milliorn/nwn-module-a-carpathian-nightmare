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
    string sXP = GetLocalString(OBJECT_SELF, "EXP");
    // Check if amount spoken is valid
    return (sXP == "" || GetStringLength(sXP) > 9);
}
