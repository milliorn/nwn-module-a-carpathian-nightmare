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
        string sXP = GetMatchedSubstring(0);
        SetLocalString(OBJECT_SELF, "EXP", sXP);
        SetCustomToken(1111, sXP);
    }
}
