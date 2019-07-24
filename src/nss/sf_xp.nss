//:://////////////////////////////////////////////
//:: Scarface's XP/GP System V2.1
//:: SF_XP
//:://////////////////////////////////////////////
/*
     All code created and written by Scarface
*/
//////////////////////////////////////////////////

#include "hgll_const_inc"

//:: CONSTANTS
//:: You can adjust these constants to suit your module

// XP modifier for adjusting XP reward given - higher means more XP
// Setting this to 1.0 will give 100% XP
// Setting this to 0.1 will give 10% XP
// Do NOT set this to 0
const float XP_MODIFIER = 1.0;

//The base xp reward based on the challenge level of the enemy
const float XP_REWARD_IMPOSSIBLE = 300.0;
const float XP_REWARD_OVERPOWERING = 150.0;
const float XP_REWARD_VERY_DIFFICULT = 100.0;
const float XP_REWARD_CHALLENGING = 75.0;
const float XP_REWARD_MODERATE = 50.0;
const float XP_REWARD_EASY = 37.0;
const float XP_REWARD_EFFORTLESS = 30.0;

// Minimum XP possible for all PC's
// Default is 5 XP
// Do NOT set this to 0
const float MIN_XP_F = 2.0;
const int MIN_XP = 2;

//These determine the challenge level range based on the challenge rating
//difference to the average party level
//anything higher than or equal to CR_IMPOSSIBLE will give the XP_REWARD_IMPOSSIBLE amount
//anything less than or equal to CR_EFFORTLESS will give the MIN_XP amount
//Impossible >= 5
//Overpowering > 2 and < 5
//Very Difficult > 0 and <= 2
//Challenging > -2 and <= 0
//Moderate > -4 and <= -2
//Easy > -6 and <= -4
//Effortless > -8 and <= -6
//If you change these constants change the notes above to prevent confusion
const float CR_IMPOSSIBLE = 5.0;
const float CR_OVERPOWERING = 2.0;
const float CR_VERY_DIFFICULT = 0.0;
const float CR_CHALLENGING = -2.0;
const float CR_MODERATE = -4.0;
const float CR_EASY = -6.0;
const float CR_EFFORTLESS = -8.0;

//this is the bonus XP percentage gained per challenge rating of the enemy
const float XP_PER_LEVEL_BONUS = 0.1;

// Reward gold to players for killing creatures?
// If TRUE use the GP_REWARD_MULTIPLIER const to multiply amount of gold rewarded
// TRUE = Yes     :     FALSE = No
const int REWARD_GP = TRUE;

// This will multiply the Gold rewarded if the REWARD_GP const above is set to TRUE
// Default is 0.5 (1.0 means equal to the amount of XP given, 2.0 would mean
// double the amount of gold and 0.5 would mean half).
// It basically multiplies the XP reward (GP_REWARD_MULTIPLIER x XP = GP Reward)
const float GP_REWARD_MULTIPLIER = 0.4;

// Bonus XP/GP reward for the dealing the killing blow to the creature
// Default is 0.1 = 10%
// If the REWARD_GP const above is set to FALSE then ONLY an XP bonus is given
// * Note * Changed so this will only apply if the killer is in party
const float KILLER_XP_GP_BONUS = 0.1;

// This will give an XP/GP bonus per player in the party
// Default is 0.1 = 10% per player
const float PARTY_XP_GP_BONUS = 0.1;

// Display floating text above each party member for XP/GP rewarded
// TRUE = Yes     :     FALSE = No
const int FLOATING_TEXT = TRUE;

// Distance between each party member and the dead creature to be
// included for XP reward
// Default is 15.0 meters
// I recommend you do NOT set this lower than about 5.0 meters
// otherwise you could end up not getting any XP/GP reward
const float PARTY_DIST = 45.0;

// Party level gap for minimal XP
// If the difference between highest level party member and the lowest
// level party member is greater than this, then XP/GP rewarded will be
// the minumum possible, this helps to stop powerleveling
// Default 10  (set to 40 to turn this feature off)
const int MAX_PARTY_GAP = 40;

// XP pentalty for each summon/familiar/henchman in the party within
// the specified distance set by the PARTY_DIST const
// Default 0.2 = 20% penalty per summon/familiar/henchman)
const float SUMMON_PENALTY = 0.0;

// Do you want XP to be divided between all PC's in the party within
// the specified distance set by the PARTY_DIST consts
// If set TRUE then XP will be divided between PC's so if the XP was 200
// and there were 2 PC's they would get 100 XP each
// If set FALSE they would get 200 XP each
// Default TRUE
const int PC_DIVIDE_XP = FALSE;



////////////////////////////////////////////////////////////////////////////////
// PC Level Max XP consts
////////////////////////////////////////////////////////////////////////////////
// You can set the maximum XP possible for each PC level for more control
// Do NOT set any of these lower than the MIN_XP const above
// Default is 600 XP max possible for all levels
// * NOTE: This is ONLY a maximum possible, PC's will still get there normal
//         XP based on the XP_MODIFIER const.
const int
LEVEL_1_MAX_XP = 300,  //100
LEVEL_2_MAX_XP = 310,  //110
LEVEL_3_MAX_XP = 320,  //120
LEVEL_4_MAX_XP = 330,  //130
LEVEL_5_MAX_XP = 340,  //140
LEVEL_6_MAX_XP = 350,  //150
LEVEL_7_MAX_XP = 360,  //160
LEVEL_8_MAX_XP = 370,  //170
LEVEL_9_MAX_XP = 380,  //180
LEVEL_10_MAX_XP = 390, //190
LEVEL_11_MAX_XP = 400, //200
LEVEL_12_MAX_XP = 410, //210
LEVEL_13_MAX_XP = 420, //220
LEVEL_14_MAX_XP = 430, //230
LEVEL_15_MAX_XP = 440, //240
LEVEL_16_MAX_XP = 450, //250
LEVEL_17_MAX_XP = 460, //260
LEVEL_18_MAX_XP = 470, //270
LEVEL_19_MAX_XP = 480, //280
LEVEL_20_MAX_XP = 490, //290
LEVEL_21_MAX_XP = 500, //300
LEVEL_22_MAX_XP = 510, //310
LEVEL_23_MAX_XP = 520, //320
LEVEL_24_MAX_XP = 530, //330
LEVEL_25_MAX_XP = 540, //340
LEVEL_26_MAX_XP = 550, //350
LEVEL_27_MAX_XP = 560, //360
LEVEL_28_MAX_XP = 570, //370
LEVEL_29_MAX_XP = 580, //380
LEVEL_30_MAX_XP = 590, //390
LEVEL_31_MAX_XP = 600, //400
LEVEL_32_MAX_XP = 610, //410
LEVEL_33_MAX_XP = 620, //420
LEVEL_34_MAX_XP = 630, //430
LEVEL_35_MAX_XP = 640, //440
LEVEL_36_MAX_XP = 650, //450
LEVEL_37_MAX_XP = 660, //460
LEVEL_38_MAX_XP = 670, //470
LEVEL_39_MAX_XP = 680, //480
LEVEL_40_MAX_XP = 700; /*, //500
LEVEL_41_MAX_XP = 700,
LEVEL_42_MAX_XP = 700,
LEVEL_43_MAX_XP = 700,
LEVEL_44_MAX_XP = 700,
LEVEL_45_MAX_XP = 700,
LEVEL_46_MAX_XP = 700,
LEVEL_47_MAX_XP = 700,
LEVEL_48_MAX_XP = 700,
LEVEL_49_MAX_XP = 700,
LEVEL_50_MAX_XP = 700,
LEVEL_51_MAX_XP = 700,
LEVEL_52_MAX_XP = 700,
LEVEL_53_MAX_XP = 700,
LEVEL_54_MAX_XP = 700,
LEVEL_55_MAX_XP = 700,
LEVEL_56_MAX_XP = 700,
LEVEL_57_MAX_XP = 700,
LEVEL_58_MAX_XP = 700,
LEVEL_59_MAX_XP = 700,
LEVEL_60_MAX_XP = 700;
*/

////////////////////////////////////////////////////////////////////////////////
//:: DO NOT TOUCH ANYTHING BELOW HERE !!!!!
////////////////////////////////////////////////////////////////////////////////
// Declare the functions

//Get the max XP the player is supposed to receive based on the MAX_HP constants
//oPC - the object of the player character
int GetMaxXP(object oPC);

//Calculate the base xp based on average party level and enemy challenge rating
//fLevel - average party level
//fCR - challenge rating of enemy
float CalculateXP(float fLevel, float fCR);

//Gives the XP and GP to the player and displays messages
//oKiller - the object that performed the killing blow
//nXP - The amount of XP and GP to be awarded
//fKillerBonus - the amount to give for landing the killing blow
//nDiff - largest level difference in the party
//nPlayer - number of PCs in the party
void GiveXP(object oKiller, int nXP, float fKillerBonus, int nDiff, int nPlayer);

//Determines the level of the player based on how much XP they have
//oPC - the object of a Player Character
int GetLevelFromXP(object oPC);

//Displays the information to the player for debug purposes
void XPDebugMessage(object oPC, float fCR, int nDiff, int nLoLevel, int nHiLevel, float fAvLevel);


////////////////////////////////////////////////////////////////////////////////

void main()
{
    // Define major variables
    object oKiller = GetLastKiller();

    //If it is not a valid object to receive XP stop here
    if (!GetIsPC(oKiller) && !GetIsPC(GetMaster(oKiller)) && !GetIsPC(GetTrapCreator(oKiller)))
        return;

    //Finish making major variables
    object oParty = GetFirstFactionMember(oKiller, FALSE);
    float fCR = GetChallengeRating(OBJECT_SELF);
    float fDist;
    int nPlayer;
    int nSummon;
    int nTotalLevel;
    int nHD;
    int nXPToGive;
    int nHiLevel = 0;
    int nLoLevel = 40;

    // Calculate the amount of members oPC's Party
    while (GetIsObjectValid(oParty))
    {
        // Make sure the party member is NOT dead and are within the specified distance
        fDist = GetDistanceToObject(oParty);
        if (!GetIsDead(oParty) && fDist >= 0.0 && fDist <= PARTY_DIST)
        {
                // Party member is a player
                if(GetIsPC(oParty))
                {
                    // Number of players
                    nPlayer++;

                    // Get total level of all PC party members
                    nTotalLevel += GetLevelFromXP(oParty);

                    // GetHighest/lowest party members
                    nHD = GetLevelFromXP(oParty);
                    if (nHD > nHiLevel) nHiLevel = nHD;
                    if (nHD < nLoLevel) nLoLevel = nHD;
                }
                // Party member is a summon/familiar/henchman
                else
                {
                    nSummon++;
                }
        }
        oParty = GetNextFactionMember(oKiller, FALSE);
    }

    // This check is to stop the "DIVIDED BY ZERO" error message
    if (!nPlayer) nPlayer = 1;

    // Get average party level calculate difference between highest and lowest
    float fAvLevel = (IntToFloat(nTotalLevel) / nPlayer);
    int nDiff = abs(nHiLevel - nLoLevel);

    // Calculate XP
    float nBaseXP = CalculateXP(fAvLevel, fCR);
    int nXP = FloatToInt(nBaseXP * XP_MODIFIER);

    // Lets make sure the XP reward is within consts parameters
    int nMaxXP = GetMaxXP(oKiller);

    // Calculate Penalties based on consts
    float fPenalty = (nXP *(nSummon * SUMMON_PENALTY));

    if (PC_DIVIDE_XP)
    {
        nXPToGive = ((nXP - FloatToInt(fPenalty)) / nPlayer);
    }
    else
    {
        nXPToGive = (nXP - FloatToInt(fPenalty));
    }

    // If there is more than 1 player in the party then calculate
    // XP Bonuses based on consts
    float fPartyBonus;
    float fKillerBonus;
    if (nPlayer > 1)
    {
        fPartyBonus = (nXP * (PARTY_XP_GP_BONUS * nPlayer));
        fKillerBonus = (nXPToGive * KILLER_XP_GP_BONUS);
        nXPToGive = FloatToInt(fPartyBonus) + nXPToGive;
    }

    GiveXP(oKiller, nXPToGive, fKillerBonus, nDiff, nPlayer);
    XPDebugMessage(oKiller, fCR, nDiff, nLoLevel, nHiLevel, fAvLevel);
}

float CalculateXP(float fLevel, float fCR)
{
    //Get the difference between that average party level and the enemy CR
    float fDiff = fCR - fLevel;

    //ensure there is a min value
    float xpReward = MIN_XP_F;

    //Determine the xp to give based on the challenge level of the enemy
    if (fDiff >= CR_IMPOSSIBLE)
        xpReward = XP_REWARD_IMPOSSIBLE;
    else if (fDiff > CR_OVERPOWERING && fDiff < CR_IMPOSSIBLE)
        xpReward = XP_REWARD_OVERPOWERING;
    else if (fDiff > CR_VERY_DIFFICULT && fDiff <= CR_OVERPOWERING)
        xpReward = XP_REWARD_VERY_DIFFICULT;
    else if (fDiff > CR_CHALLENGING && fDiff <= CR_VERY_DIFFICULT)
        xpReward = XP_REWARD_CHALLENGING;
    else if (fDiff > CR_MODERATE && fDiff <= CR_CHALLENGING)
        xpReward = XP_REWARD_MODERATE;
    else if (fDiff > CR_EASY && fDiff <= CR_MODERATE)
        xpReward = XP_REWARD_EASY;
    else if(fDiff > CR_EFFORTLESS && fDiff <= CR_EASY)
        xpReward = XP_REWARD_EFFORTLESS;

    //return the value after increasing it based on the enemy challenge rating
    return xpReward * (1.0 + (XP_PER_LEVEL_BONUS * fCR));
}

void GiveXP(object oKiller, int nXPToGive, float fKillerBonus, int nDiff, int nPlayer)
{
    int nMaxXP;
    float fDist;
    // Get first party members (Only PC's)
    object oParty = GetFirstFactionMember(oKiller);
    // Loops through all party members
    while (GetIsObjectValid(oParty))
    {
        // Make sure the party member is NOT dead and are within the specified distance
        fDist = GetDistanceToObject(oParty);
        if (GetIsPC(oParty))
        {
            if (!GetIsDead(oParty) && fDist >= 0.0 && fDist <= PARTY_DIST)
            {
                // Reward the killer with bonus if specified in consts
                nMaxXP = GetMaxXP(oParty);
                if (nXPToGive > nMaxXP)
                {
                    nXPToGive = nMaxXP;
                }
                else if (nXPToGive < MIN_XP)
                {
                    nXPToGive = MIN_XP;
                }
                if (oKiller == oParty && nPlayer > 1)
                {
                    if (nDiff > MAX_PARTY_GAP)
                    {
                        FloatingTextStringOnCreature("Party level difference is too great", oParty);
                        nXPToGive = MIN_XP;
                    }
                    if (FLOATING_TEXT)
                    {
                        if (KILLER_XP_GP_BONUS > 0.0)
                        {
                            FloatingTextStringOnCreature("Killer Bonus", oParty, FALSE);
                        }
                        FloatingTextStringOnCreature(IntToString(nXPToGive + FloatToInt(fKillerBonus))+"XP", oParty, FALSE);
                    }
                    if (REWARD_GP)
                    {
                        if (FLOATING_TEXT)
                        {
                            FloatingTextStringOnCreature(IntToString(FloatToInt((IntToFloat(nXPToGive) + fKillerBonus) * GP_REWARD_MULTIPLIER))+"GP", oParty, FALSE);
                        }
                        GiveGoldToCreature(oParty, FloatToInt((IntToFloat(nXPToGive) + fKillerBonus) * GP_REWARD_MULTIPLIER));
                    }
                    //GiveXPToCreature(oParty, (nXPToGive + FloatToInt(fKillerBonus)));
                    SetXP(oParty, GetXP(oParty) + nXPToGive + FloatToInt(fKillerBonus));
                }
                // Reward other party members
                else
                {
                    if (FLOATING_TEXT)
                    {
                        DelayCommand(0.1, FloatingTextStringOnCreature(IntToString(nXPToGive)+"XP", oParty, FALSE));
                    }
                    if (REWARD_GP)
                    {
                        if (FLOATING_TEXT)
                        {
                            DelayCommand(0.1, FloatingTextStringOnCreature(IntToString(FloatToInt((IntToFloat(nXPToGive) + fKillerBonus) * GP_REWARD_MULTIPLIER))+"GP", oParty, FALSE));
                        }
                        GiveGoldToCreature(oParty, FloatToInt((IntToFloat(nXPToGive) + fKillerBonus) * GP_REWARD_MULTIPLIER));
                    }
                    //GiveXPToCreature(oParty, nXPToGive);
                    SetXP(oParty, GetXP(oParty) + nXPToGive);
                }
            }
        }
        oParty = GetNextFactionMember(oKiller);
    }
}
// This is my function for returning the max XP for the PC's level based on the consts
int GetMaxXP(object oPC)
{
    int iMaxXP;
    switch(GetLevelFromXP(oPC))
    {
        case 1: iMaxXP = LEVEL_1_MAX_XP; break;
        case 2: iMaxXP = LEVEL_2_MAX_XP; break;
        case 3: iMaxXP = LEVEL_3_MAX_XP; break;
        case 4: iMaxXP = LEVEL_4_MAX_XP; break;
        case 5: iMaxXP = LEVEL_5_MAX_XP; break;
        case 6: iMaxXP = LEVEL_6_MAX_XP; break;
        case 7: iMaxXP = LEVEL_7_MAX_XP; break;
        case 8: iMaxXP = LEVEL_8_MAX_XP; break;
        case 9: iMaxXP = LEVEL_9_MAX_XP; break;
        case 10: iMaxXP = LEVEL_10_MAX_XP; break;
        case 11: iMaxXP = LEVEL_11_MAX_XP; break;
        case 12: iMaxXP = LEVEL_12_MAX_XP; break;
        case 13: iMaxXP = LEVEL_13_MAX_XP; break;
        case 14: iMaxXP = LEVEL_14_MAX_XP; break;
        case 15: iMaxXP = LEVEL_15_MAX_XP; break;
        case 16: iMaxXP = LEVEL_16_MAX_XP; break;
        case 17: iMaxXP = LEVEL_17_MAX_XP; break;
        case 18: iMaxXP = LEVEL_18_MAX_XP; break;
        case 19: iMaxXP = LEVEL_19_MAX_XP; break;
        case 20: iMaxXP = LEVEL_20_MAX_XP; break;
        case 21: iMaxXP = LEVEL_21_MAX_XP; break;
        case 22: iMaxXP = LEVEL_22_MAX_XP; break;
        case 23: iMaxXP = LEVEL_23_MAX_XP; break;
        case 24: iMaxXP = LEVEL_24_MAX_XP; break;
        case 25: iMaxXP = LEVEL_25_MAX_XP; break;
        case 26: iMaxXP = LEVEL_26_MAX_XP; break;
        case 27: iMaxXP = LEVEL_27_MAX_XP; break;
        case 28: iMaxXP = LEVEL_28_MAX_XP; break;
        case 29: iMaxXP = LEVEL_29_MAX_XP; break;
        case 30: iMaxXP = LEVEL_30_MAX_XP; break;
        case 31: iMaxXP = LEVEL_31_MAX_XP; break;
        case 32: iMaxXP = LEVEL_32_MAX_XP; break;
        case 33: iMaxXP = LEVEL_33_MAX_XP; break;
        case 34: iMaxXP = LEVEL_34_MAX_XP; break;
        case 35: iMaxXP = LEVEL_35_MAX_XP; break;
        case 36: iMaxXP = LEVEL_36_MAX_XP; break;
        case 37: iMaxXP = LEVEL_37_MAX_XP; break;
        case 38: iMaxXP = LEVEL_38_MAX_XP; break;
        case 39: iMaxXP = LEVEL_39_MAX_XP; break;
        case 40: iMaxXP = LEVEL_40_MAX_XP; break;
/*        case 41: iMaxXP = LEVEL_41_MAX_XP; break;
        case 42: iMaxXP = LEVEL_42_MAX_XP; break;
        case 43: iMaxXP = LEVEL_43_MAX_XP; break;
        case 44: iMaxXP = LEVEL_44_MAX_XP; break;
        case 45: iMaxXP = LEVEL_45_MAX_XP; break;
        case 46: iMaxXP = LEVEL_46_MAX_XP; break;
        case 47: iMaxXP = LEVEL_47_MAX_XP; break;
        case 48: iMaxXP = LEVEL_48_MAX_XP; break;
        case 49: iMaxXP = LEVEL_49_MAX_XP; break;
        case 50: iMaxXP = LEVEL_50_MAX_XP; break;
        case 51: iMaxXP = LEVEL_51_MAX_XP; break;
        case 52: iMaxXP = LEVEL_52_MAX_XP; break;
        case 53: iMaxXP = LEVEL_53_MAX_XP; break;
        case 54: iMaxXP = LEVEL_54_MAX_XP; break;
        case 55: iMaxXP = LEVEL_55_MAX_XP; break;
        case 56: iMaxXP = LEVEL_56_MAX_XP; break;
        case 57: iMaxXP = LEVEL_57_MAX_XP; break;
        case 58: iMaxXP = LEVEL_58_MAX_XP; break;
        case 59: iMaxXP = LEVEL_59_MAX_XP; break;
        case 60: iMaxXP = LEVEL_60_MAX_XP; break;*/
    }
    return iMaxXP;
}
// This new function will get the players level determined by XP rather than
// the players level to stop exploiting
int GetLevelFromXP(object oPC)
{
    int iXP = GetXP(oPC);

    /*if (iXP >= XP_REQ_LVL60) iXP = 60;
    else if (iXP >= XP_REQ_LVL59) iXP = 59;
    else if (iXP >= XP_REQ_LVL58) iXP = 58;
    else if (iXP >= XP_REQ_LVL57) iXP = 57;
    else if (iXP >= XP_REQ_LVL56) iXP = 56;
    else if (iXP >= XP_REQ_LVL55) iXP = 55;
    else if (iXP >= XP_REQ_LVL54) iXP = 54;
    else if (iXP >= XP_REQ_LVL53) iXP = 53;
    else if (iXP >= XP_REQ_LVL52) iXP = 52;
    else if (iXP >= XP_REQ_LVL51) iXP = 51;
    else if (iXP >= XP_REQ_LVL50) iXP = 50;
    else if (iXP >= XP_REQ_LVL49) iXP = 49;
    else if (iXP >= XP_REQ_LVL48) iXP = 48;
    else if (iXP >= XP_REQ_LVL47) iXP = 47;
    else if (iXP >= XP_REQ_LVL46) iXP = 46;
    else if (iXP >= XP_REQ_LVL45) iXP = 45;
    else if (iXP >= XP_REQ_LVL44) iXP = 44;
    else if (iXP >= XP_REQ_LVL43) iXP = 43;
    else if (iXP >= XP_REQ_LVL42) iXP = 42;
    else if (iXP >= XP_REQ_LVL41) iXP = 41;
    else*/ if (iXP >= 780000) iXP = 40;
    else if (iXP >= 741000) iXP = 39;
    else if (iXP >= 703000) iXP = 38;
    else if (iXP >= 666000) iXP = 37;
    else if (iXP >= 630000) iXP = 36;
    else if (iXP >= 595000) iXP = 35;
    else if (iXP >= 561000) iXP = 34;
    else if (iXP >= 528000) iXP = 33;
    else if (iXP >= 496000) iXP = 32;
    else if (iXP >= 465000) iXP = 31;
    else if (iXP >= 435000) iXP = 30;
    else if (iXP >= 406000) iXP = 29;
    else if (iXP >= 378000) iXP = 28;
    else if (iXP >= 351000) iXP = 27;
    else if (iXP >= 325000) iXP = 26;
    else if (iXP >= 300000) iXP = 25;
    else if (iXP >= 276000) iXP = 24;
    else if (iXP >= 253000) iXP = 23;
    else if (iXP >= 231000) iXP = 22;
    else if (iXP >= 210000) iXP = 21;
    else if (iXP >= 190000) iXP = 20;
    else if (iXP >= 171000) iXP = 19;
    else if (iXP >= 153000) iXP = 18;
    else if (iXP >= 136000) iXP = 17;
    else if (iXP >= 120000) iXP = 16;
    else if (iXP >= 105000) iXP = 15;
    else if (iXP >= 91000) iXP = 14;
    else if (iXP >= 78000) iXP = 13;
    else if (iXP >= 66000) iXP = 12;
    else if (iXP >= 55000) iXP = 11;
    else if (iXP >= 45000) iXP = 10;
    else if (iXP >= 36000) iXP = 9;
    else if (iXP >= 28000) iXP = 8;
    else if (iXP >= 21000) iXP = 7;
    else if (iXP >= 15000) iXP = 6;
    else if (iXP >= 10000) iXP = 5;
    else if (iXP >= 6000) iXP = 4;
    else if (iXP >= 3000) iXP = 3;
    else if (iXP >= 1000) iXP = 2;
    else                  iXP = 1;
    return iXP;
}
void XPDebugMessage(object oPC, float fCR, int nDiff, int nLoLevel, int nHiLevel, float fAvLevel)
{
    object oParty = GetFirstFactionMember(oPC);
    while (GetIsObjectValid(oParty))
    {
        SendMessageToPC(oParty, "\nDebug Info"+
                                "\nCreature CR: "+FloatToString(fCR)+
                                "\nHighest Level PC: "+IntToString(nHiLevel)+
                                "\nLowest Level PC: "+IntToString(nLoLevel)+
                                "\nLevel Difference: "+IntToString(nDiff)+
                                "\nAverage Party Level: "+FloatToString(fAvLevel));

        oParty = GetNextFactionMember(oPC);
    }
}
