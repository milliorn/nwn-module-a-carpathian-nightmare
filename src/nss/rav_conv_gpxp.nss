// Gauntlet Token Prize Script
void main()
{
    // Variables
    object oPC = GetPCSpeaker();
    string sName = GetPCPlayerName(oPC);
    int iReward = 1200 + Random(10800);
    string sReward = IntToString(iReward);

    GiveGoldToCreature(oPC, iReward);
    GiveXPToCreature(oPC, iReward);
    SendMessageToAllDMs(sName+ "<c ó > Ravana Reward: <c ó >" + IntToString(iReward)+ "</c> GP/XP reward");
    FloatingTextStringOnCreature("<c ó > Ravana Reward: <c ó >" + IntToString(iReward)+ "</c> GP/XP reward", oPC);
}
