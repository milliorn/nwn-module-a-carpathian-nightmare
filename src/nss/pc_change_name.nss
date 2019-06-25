//::///////////////////////////////////////////////
//:: Milliorn's Name Changer
//:: pc_change_name
//:://////////////////////////////////////////////
/*
    Written By Scott Milliorn
*/
//////////////////////////////////////////////////

//#include "nwnx_names"
void main()
{
    // Vars
    object oPC = GetPCSpeaker(), oNPC = OBJECT_SELF;
    string sName = GetLocalString(oNPC, "NAME");

//  Put name change code here
    //NWNX_Names_SetName(oPC, sName);
}
