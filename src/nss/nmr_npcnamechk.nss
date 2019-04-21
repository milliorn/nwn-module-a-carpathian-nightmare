// Written by: Ne0nx3r0
// for the Dot Hack Project mod,
// http://www.dothackproject.net/
// Ne0nx3r0@hotmail.com

void main()
{
    object oPC = GetPCSpeaker();
    object oChest = GetNearestObjectByTag("ChestofNames");
    object oItem  = GetFirstItemInInventory(oChest);
    int i = 0;
    int nMatch = GetListenPatternNumber();
    int iArtifact = GetGoldPieceValue(oItem);
    string sqname = GetMatchedSubstring(0);  //Name
    string sValue = IntToString(iArtifact);



    FloatingTextStringOnCreature("Name Received:" + sqname, oPC, FALSE);
    SetCustomToken(3201,"<cú>" + sqname + "</c>");
    SetLocalString(OBJECT_SELF,"current_name",sqname);
    SetCustomToken(3202, sValue);
}
