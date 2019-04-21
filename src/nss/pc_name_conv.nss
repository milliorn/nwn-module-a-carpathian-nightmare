//::///////////////////////////////////////////////
//:: Milliorn's Name Changer
//:: pc_name_conv
//:://////////////////////////////////////////////
/*
    Written By Scott Milliorn
*/
//////////////////////////////////////////////////
void main()
{
    BeginConversation();
    if (GetListenPatternNumber() == 1 &&
        GetLastSpeaker() == GetPCSpeaker())
    {
        string sName = GetMatchedSubstring(0);
        SetLocalString(OBJECT_SELF, "NAME", sName);
        SetCustomToken(2000, sName);
    }
}
