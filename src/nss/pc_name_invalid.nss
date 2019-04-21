//::///////////////////////////////////////////////
//:: Milliorn's Name Changer
//:: pc_name_invalid
//:://////////////////////////////////////////////
/*
    Written By Scott Milliorn
*/
//////////////////////////////////////////////////

int StartingConditional()
{
    string sName = GetLocalString(OBJECT_SELF, "NAME");
    // Check if length spoken is valid
    return (sName == "" || GetStringLength(sName) > 32);
}
