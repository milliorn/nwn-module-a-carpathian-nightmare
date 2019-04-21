//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_conv
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
void main()
{
    BeginConversation();
    if (GetListenPatternNumber() == 1 &&
        GetLastSpeaker() == GetPCSpeaker())
    {
        string sGold = GetMatchedSubstring(0);
        SetLocalString(OBJECT_SELF, "GOLD", sGold);
        SetCustomToken(1000, sGold);
    }
}
