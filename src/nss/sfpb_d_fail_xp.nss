//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_d_fail
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////

int StartingConditional()
{
    // Check if the player has enough xp to bank
    return(GetXP(GetPCSpeaker()) < StringToInt(GetLocalString(OBJECT_SELF, "EXP")));
}
