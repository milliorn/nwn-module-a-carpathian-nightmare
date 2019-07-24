//::///////////////////////////////////////////////
//:: ACN OnDeath Boss Script
//:: acn_boss_death
//:://////////////////////////////////////////////
//:: Created By: Milliorn, Scarface, Moe
//:: Created On: 2006
//:://////////////////////////////////////////////
//#include "x3_inc_horse"
#include "inc_ai"

void main()
{
    //if (GetLocalInt(GetModule(),"X3_ENABLE_MOUNT_DB")&&GetIsObjectValid(GetMaster(OBJECT_SELF))) SetLocalInt(GetMaster(OBJECT_SELF),"bX3_STORE_MOUNT_INFO",TRUE);

    // Call to allies to let them know we're dead
    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);

    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

    object oItem = GetFirstItemInInventory(OBJECT_SELF);
    while (GetIsObjectValid(oItem) && GetLocalInt(oItem, "LOOT_DROP"))
    {
        DelayCommand(1.0, FloatingTextStringOnCreature("Loot Available", GetLastKiller(), TRUE));
        DeleteLocalInt(oItem, "LOOT_DROP");
        oItem = GetNextItemInInventory(OBJECT_SELF);
    }

    // Initial necessary var
    object oKiller = GetLastKiller();

    // Validate Killer as PC and not a DM
    while (GetIsObjectValid(GetMaster(oKiller)))
    {
        oKiller = GetMaster(oKiller);
    }

    if (!GetIsPC(oKiller) || GetIsDM(oKiller)) return;

    // Other vars
    object oModule = GetModule();
    object oArea = GetArea(OBJECT_SELF);
    object oPartyMember = GetFirstFactionMember(oKiller, TRUE);

    //float fTimer = 6.0;

    int iCR = FloatToInt(GetChallengeRating(OBJECT_SELF));
    int iLevel = 0;
    int iRewardXP = 0;
    int iRewardGP = 0;

    string sNpc = GetResRef(OBJECT_SELF);
    string sBoss = GetName(OBJECT_SELF, TRUE);
    //string sCheck = GetLocalString(oModule, sNpc);
    string sArea = "";
    string sName = "";
    string sInfo = "";
    string sAcct = "";
    string sKey  = "";
    string sPCArea = "";
    string sLvl = IntToString(iLevel);
    //string sMsg = sName + ", level " + sLvl + ", has slayed " + sBoss + "." ;

    // NOW get Killer info
    int iKillerLvl = GetHitDice(oKiller);
    int iMaxLvl = iKillerLvl + 5;
    int iMinLvl = iKillerLvl - 5;

    // and calculate Bonus
    if (iCR >= 40) iCR = 40;
    iRewardXP = ((iKillerLvl * iCR)* 30);
    iRewardGP = ((iKillerLvl * iCR) * 300);

    SpeakString("<c���> has been defeated by </c>"
    + GetName(oKiller) + "<c���> at </c>"
    + GetName(oArea) + "<c���> with"
    + CheckBossRating(OBJECT_SELF, oKiller) + ".", TALKVOLUME_SHOUT);

    // now that everything is figured out - loop through party to see who gets reward
    while (GetIsObjectValid(oPartyMember) == TRUE)
    {

            sName = GetName(oPartyMember, FALSE);
            sInfo = GetSubString(sName, 0, 32);
            sAcct = GetPCPlayerName(oPartyMember);
            sKey  = GetPCPublicCDKey(oPartyMember, TRUE);
            iLevel = GetHitDice(oPartyMember);
            sPCArea = GetTag(GetArea(oPartyMember));
            sArea = GetTag(GetArea(OBJECT_SELF));

         // Check if oPartyMember is in the same area, if not then skip
         // all code inside the statement and carry on with loop
         if (GetArea(oPartyMember) == oArea)
         {
            // Too high for Boss AND in the Boss Area - Port out without Reward
            if ((iLevel > iCR + 5) && (sPCArea == sArea))
            {
                AssignCommand(oPartyMember, ClearAllActions());
                AssignCommand(oPartyMember, ActionJumpToLocation(GetStartingLocation()));

                DelayCommand(5.0, FloatingTextStringOnCreature(sName + " is too High Level" +
                "to slay that Boss.  No Boss Reward", oPartyMember, TRUE));

                SendMessageToAllDMs("<c�  >PLAYER: </c>"+sName+" <c�  >CD KEY: </c>"+sKey+" <c�  >ACCT: </c>"
                +sAcct+" <c�  >has been ported out for being too high level!!!");
            }

            // not within 10 levels of Killer - no Reward
            /*else if ((iLevel < iMinLvl) || (iLevel > iMaxLvl))
            {
                DelayCommand(5.0,FloatingTextStringOnCreature(sName +
                " is not within 5 levels of Boss Killer", oPartyMember, TRUE));
            }*/
            /*
            // have received Boss Reward already - Port them out - no reward
            //else if (GetPersistentInt(oPartyMember, sBoss, "BOSS"))
            //else if (GetCampaignInt("BOSS", sBoss, oPartyMember))
            else if (NWNX_Redis_GET("nwserver:players:" + sKey + ":" + sName + ":boss:" + sBoss + ":death") == "TRUE")
            {
                DelayCommand(2.5, SendMessageToPC(oPartyMember, "You have already killed this BOSS - No Boss Reward"));
                DelayCommand(5.0,FloatingTextStringOnCreature("Already Killed Boss", oPartyMember));
                AssignCommand(oPartyMember, ClearAllActions());
                AssignCommand(oPartyMember, ActionJumpToLocation(GetStartingLocation()));
                SendMessageToAllDMs("<c�  >PLAYER: </c>"+sName+"<c�  > CD KEY: </c>"+sKey+"<c�  > ACCT: </c>"
                +sAcct+"<c�  > has been ported out for Boss Camping!!!");}

            // passed all tests - now give the Reward already - first set the Boss Tag...
            */else
            {
                //NWNX_Redis_SET("nwserver:players:" + sKey + ":" + sName + ":boss:" + sBoss + ":death", "TRUE");
                //SetCampaignInt("BOSS", sBoss, TRUE, oPartyMember);
                //SetPersistentInt(oPartyMember, sBoss, TRUE, 1, "BOSS");
                //SetPersistentInt(oPartyMember, sArea, TRUE, 1, "BOSS");
                DelayCommand(2.0, SendMessageToPC(oPartyMember, "MY GP reward is: "
                + IntToString(iRewardGP)+ " MY XP reward is: "
                + IntToString(iRewardXP)));
                GiveGoldToCreature(oPartyMember, iRewardGP);
                GiveXPToCreature(oPartyMember, iRewardXP);

                // if it's the Killer (and not previously disqualified) give Killer a gem
/*                if (oPartyMember == oKiller)GenerateSockets(oKiller);
                    SendMessageToAllDMs(sName+"<c � > slayed </c>" + sBoss +".  GP reward is: <c � >"
                    + IntToString(iRewardGP)+ "</c> XP reward is: <c � >"
                    + IntToString(iRewardXP)); */
            }
        }
        else
        {
            DelayCommand(5.0,FloatingTextStringOnCreature(sName + " must be in " +
            "same area as the Boss to receive reward!", oPartyMember));
        }

        oPartyMember = GetNextFactionMember(oKiller, TRUE);
    }
}
