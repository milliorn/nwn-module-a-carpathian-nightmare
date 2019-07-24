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
    SendMessageToAllDMs(sName+ "<c � > Ravana Reward: <c � >" + IntToString(iRewardGP) + "</c>GP and <c � >"
                                                              + IntToString(iRewardXP) + "</c>XP");
    FloatingTextStringOnCreature("<c � > Ravana Reward: <c � >" + IntToString(iRewardGP) + "</c>GP and <c � >"
                                                                + IntToString(iRewardXP) + "</c>XP", oPC);
}
