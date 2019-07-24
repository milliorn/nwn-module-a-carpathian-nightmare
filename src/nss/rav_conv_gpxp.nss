// Gauntlet Token Prize Script
void main()
{
    // Variables
    object oPC = GetPCSpeaker();
    string sName = GetPCPlayerName(oPC);

    int iRewardGP = 24000 + Random(24000) + 1;    //1200 + d100(108);    //10800  + 1200 Old way
    string sRewardGP = IntToString(iRewardGP);

    int iRewardXP = 24000 + Random(24000) + 1;    //1200 + d100(108);    //10800  + 1200 Old way
    string sRewardXP = IntToString(iRewardXP);

    GiveGoldToCreature(oPC, iRewardGP);
    SetXP(oPC, GetXP(oPC) + iRewardXP);
    SendMessageToAllDMs(sName+ "<c ó > Ravana Reward: <c ó >" + IntToString(iRewardGP) + "</c>GP and <c ó >"
                                                              + IntToString(iRewardXP) + "</c>XP");
    FloatingTextStringOnCreature("<c ó > Ravana Reward: <c ó >" + IntToString(iRewardGP) + "</c>GP and <c ó >"
                                                                + IntToString(iRewardXP) + "</c>XP", oPC);
}
