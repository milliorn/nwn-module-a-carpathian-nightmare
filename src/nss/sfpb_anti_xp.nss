//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_anti_cheat
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////

int StartingConditional()
{
    // Anti exploit stuff
    if (GetLocalInt(OBJECT_SELF, "ANTI_CHEAT_XP"))
    {
        DeleteLocalInt(OBJECT_SELF, "ANTI_CHEAT_XP");
        return TRUE;
    }
    return FALSE;
}
