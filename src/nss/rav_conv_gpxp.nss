// Gauntlet Token Prize Script
void main()
{
    // Variables
    object oPC = GetPCSpeaker();
    string sName = GetPCPlayerName(oPC);
    int iReward = 1200 + d100(108);    //10800  + 1200
    string sReward = IntToString(iReward);

    GiveGoldToCreature(oPC, iReward);
    GiveXPToCreature(oPC, iReward);
    SendMessageToAllDMs(sName+ "<c � > Ravana Reward: <c � >" + IntToString(iReward)+ "</c> GP/XP reward");
    FloatingTextStringOnCreature("<c � > Ravana Reward: <c � >" + IntToString(iReward)+ "</c> GP/XP reward", oPC);
}
