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
    // Check if the player has enough gold to bank
    return(GetGold(GetPCSpeaker()) < StringToInt(GetLocalString(OBJECT_SELF, "GOLD")));
}
