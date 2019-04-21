//::///////////////////////////////////////////////
//::
//::  Bounty/PKing system
//::
//:://////////////////////////////////////////////
#include "inc_pvp_system"
#include "inc_mod_events"
#include "nwnx_time"
#include "nwnx_webhook"

//Bounty Reward constants (This is multiplied by the Dead PCs Level)
const int GP_REWARD = 1000, // GP Reward(This is multiplied by the
          XP_REWARD = 1000,  // dead players character level
          GP_BONUS_MULTIPLIER = 10, // Multipliers for ending a
          XP_BONUS_MULTIPLIER = 10; // PCs killing spree
                                   // Default is 2(Double reward)

void main()
{
    //Define objects
    object oDead    = GetLastPlayerDied(),
           oKiller  = GetLastHostileActor(oDead);

    if (GetIsEncounterCreature(oKiller)) return;

    object oFam = GetAssociate (ASSOCIATE_TYPE_FAMILIAR, GetMaster(oKiller));
    object oSummoned = GetAssociate (ASSOCIATE_TYPE_SUMMONED, GetMaster(oKiller));

    if (GetIsObjectValid(GetMaster(oFam)))
    {
        oKiller = GetMaster(oFam);
    }

    else if(GetIsObjectValid(GetMaster(oSummoned)))
    {
        oKiller = GetMaster(oSummoned);
    }

    string sTag = GetTag(OBJECT_SELF);
    string sLeft = GetStringLeft(sTag, 3);

    if (sLeft == "SU_" && GetIsPossessedFamiliar(oKiller))
    {
        oKiller = GetMaster(oKiller);
    }

    // Check if oDead is a player
    if (!GetIsPC(oDead)) return;
    else if (!GetIsPC(oKiller)) return;
    else if (GetIsDM(oKiller)) return;

    AdjustPlayerStats();
    AssignCommand(oKiller, ClearAllActions());

    // More objects
    object oArea          = GetArea(oDead),
           oRecall_Dead   = GetItemPossessedBy(oDead, "itm_carp_gem"),
           oRecall_Killer = GetItemPossessedBy(oKiller, "itm_carp_gem");

    //Define effects
    effect eBlood1 = EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE),
           eBlood2 = EffectVisualEffect(VFX_COM_BLOOD_SPARK_LARGE),
           eSmoke  = EffectVisualEffect(VFX_IMP_DEATH_L);

    //Define integers
    int iDead_HD       = GetHitDice(oDead),
        iKiller_HD     = GetHitDice(oKiller),

        iRandom        = Random(999) +1,

        iBounty_Killer = GetLocalInt(oRecall_Killer, "BOUNTY"),
        iBounty_Dead   = GetLocalInt(oRecall_Dead, "BOUNTY"),

        iWin_Killer  = GetLocalInt(oRecall_Killer, "ACN_KILL"),
        iLose_Dead   = GetLocalInt(oRecall_Dead, "ACN_DEATH"),
        iLose_Killer = GetLocalInt(oRecall_Killer, "ACN_DEATH"),

        iScore       = (iWin_Killer - iLose_Killer),

        iDead_LL = GetLocalInt(GetItemPossessedBy(oDead, "hgll_check_level"), "nLegendLevel"),
        iKiller_LL = GetLocalInt(GetItemPossessedBy(oKiller, "plotItemTag"), "nLegendLevel");

    if (iDead_LL > 40) iDead_HD = iDead_LL;
    if (iKiller_LL > 40) iKiller_HD = iKiller_LL;

    //Define strings
    string sRating       = CheckPCCR(oDead, oKiller),
           sAction       = "<cσ  >" + PVP_GetRandomShoutString() + "</c>",
           sDead         = "<cσσσ>" + GetName(oDead) + "</c>",
           sKiller       = "<cσσσ>" + GetName(oKiller) + "</c>",
           sArea         = "<c σσ>" + GetName(oArea) + "</c>",

           sLevel_Dead    = "<cσσσ>" + IntToString(iDead_HD) + "</c>",
           sLevel_Killer  = "<cσσσ>" + IntToString(iKiller_HD) + "</c>",
           sBounty_Dead   = "<cσσσ>" + IntToString(iBounty_Dead) + "</c>",
           sBounty_Killer = "<cσσσ>" + IntToString(iBounty_Killer) + "</c>",
           sWin_Killer    = "<cσσσ>" + IntToString(iWin_Killer) + "</c>",
           sLose_Dead     = "<cσσσ>" + IntToString(iLose_Dead) + "</c>",
           sScore         = "<cσσσ>" + IntToString(iScore) + "</c>",
           sTime          = "<cσσσ>" + NWNX_Time_GetSystemTime() + "</c>",
           sDate          = "<cσσσ>" + NWNX_Time_GetSystemDate() + "</c>",

           sWebhookUrl = "/api/webhooks/472605187761242152/wqmbKttRf4VdSwhbg6C9fhy2GlQdtX8zCqohWwJesbyq3ImNx_s2AUpr0-E_p8m8VQo6/slack";

    string sMessage;

    //Apply effects to dead PC
    DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, eBlood1, oDead));
    DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, eBlood2, oDead));
    DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eSmoke, oDead));

    //Play Evil Laugh to signal PK
    object oPC;
    oPC = GetFirstPC();
    while(GetIsObjectValid(oPC))
    {
        AssignCommand(oPC, PlaySound("vs_nx2mephm_107"));
        oPC = GetNextPC();
    }

        //Check if dead PC had a bounty on his head
         if (iBounty_Dead >=1 && iBounty_Dead <10)
         {
            //Reward the bounty to oKiller
            GiveXPToCreature(oKiller, XP_REWARD + iRandom);
            GiveGoldToCreature(oKiller, GP_REWARD + iRandom);

            //Shout Message
            SpeakString("Bounty settled.  " + sDead + " was " + sAction + " by "
            + sKiller + " and has been rewarded.  "
            + sKiller + " has " + sWin_Killer +" kills.  "
            + sDead + " has " + sLose_Dead + " deaths.  "
            + sKiller + " score is: " + sScore + ".  GMT: "
            + sTime + " on: "
            + sDate + ".", TALKVOLUME_SHOUT);

            //Discord Message
            sMessage = "Bounty settled.  " + GetName(oDead) + " was killed by "
            + GetName(oKiller) + " and has been rewarded.  "
            + GetName(oKiller) + " has " + IntToString(iWin_Killer) +" kills.  "
            + GetName(oDead) + " has " + IntToString(iLose_Dead) + " deaths.  "
            + GetName(oKiller) + " score is: " + IntToString(iScore) + ".  GMT: "
            + NWNX_Time_GetSystemTime() + " on: "
            + NWNX_Time_GetSystemDate() + ".";

            //Send a message to ACN Discord Channel of the client logging in.
            NWNX_WebHook_SendWebHookHTTPS("discordapp.com", sWebhookUrl, sMessage , "Server");

            //Delete the dead pc's bounty
            DeleteLocalInt(oRecall_Dead, "BOUNTY");

            //Jail player
            DelayCommand(0.5, Raise(oDead));
            DelayCommand(0.7, SendPlayerToJail(oDead));

            //End script
            return;
        }

        else if (iBounty_Dead >= 10)
        {
            //Reward the bounty to oKiller
            GiveXPToCreature(oKiller, XP_REWARD + iRandom * XP_BONUS_MULTIPLIER);
            GiveGoldToCreature(oKiller, GP_REWARD + iRandom * GP_BONUS_MULTIPLIER);

            // Shout Message
            SpeakString(sDead + " killing spree is over and was " + sAction+ " by "
            + sKiller + " with " + sBounty_Dead + " player kills.  Double bounty has been rewarded.  "
            + sKiller + " has " + sWin_Killer + " kills.  "
            + sDead + " has " + sLose_Dead + " deaths.  "
            + sKiller + "score is: " + sScore + ".  GMT: "
            + sTime + " on: "
            + sDate + ".", TALKVOLUME_SHOUT);

            //Discord Message
            sMessage = GetName(oDead) + " killing spree is over and was killed by "
            + GetName(oKiller) + " with " + IntToString(iBounty_Dead) + " player kills.  "
            + GetName(oKiller) + " has " + IntToString(iWin_Killer) + " kills.  "
            + GetName(oDead) + " has " + IntToString(iLose_Dead) + " deaths.  "
            + GetName(oKiller) + "score is: " + IntToString(iScore) + ".  GMT: "
            + NWNX_Time_GetSystemTime() + " on: "
            + NWNX_Time_GetSystemDate() + ".";

            //Send a message to ACN Discord Channel of the client logging in.
            NWNX_WebHook_SendWebHookHTTPS("discordapp.com", sWebhookUrl, sMessage , "Server");

            //Delete the dead pc's bounty
            DeleteLocalInt(oRecall_Dead, "BOUNTY");

            //Jail player
            DelayCommand(0.5, Raise(oDead));
            DelayCommand(0.7, SendPlayerToJail(oDead));

            //End Script
            return;
        }

        else
        {
            // Get Bounty Count
            iBounty_Killer = GetLocalInt(oRecall_Killer, "BOUNTY")+1;

            if (iBounty_Killer >= 10)
            {
                SpeakString(sKiller + " - Level: " + sLevel_Killer + " " + sAction + " "
                + sDead + " - Level: " + sLevel_Dead + " with "+ sRating +
                " on a killing spree at location: "
                + sArea + " with " + sBounty_Killer + " player kills!  "
                + sKiller + " has " + sWin_Killer + " kills.  "
                + sDead + " has " + sLose_Dead + " deaths.  "
                + sKiller + " score is: " + sScore + ".  GMT: "
                + sTime + " on: "
                + sDate + ".", TALKVOLUME_SHOUT);

                //Discord Message
                sMessage = GetName(oKiller) + " - Level: " + IntToString(iKiller_HD) + " killed "
                + GetName(oDead) + " - Level: " + IntToString(iDead_HD) + " with "+ DiscordPCCR(oDead, oKiller) +
                " and is on a killing spree at location: "
                + GetName(oArea) + " with " + IntToString(iBounty_Killer) + " player kills!  "
                + GetName(oKiller) + " has " + IntToString(iWin_Killer) + " kills.  "
                + GetName(oDead) + " has " + IntToString(iLose_Dead) + " deaths.  "
                + GetName(oKiller) + " score is: " + IntToString(iScore) + ".  GMT: "
                + NWNX_Time_GetSystemTime() + " on: "
                + NWNX_Time_GetSystemDate() + ".";

                 //Send a message to ACN Discord Channel of the client logging in.
                NWNX_WebHook_SendWebHookHTTPS("discordapp.com", sWebhookUrl, sMessage , "Server");

                GiveGoldToCreature(oKiller, iRandom * GP_BONUS_MULTIPLIER);
                GiveXPToCreature(oKiller, iRandom * XP_BONUS_MULTIPLIER);
            }

            else
            {
                // Get gender
                string sGender;

                if (GetGender(oKiller) == GENDER_MALE)
                {
                    sGender = "his";
                }

                else
                {
                    sGender = "her";
                }

                SpeakString(sKiller + " - Level: " + sLevel_Killer + " " + sAction + " "
                + sDead + " - Level: " + sLevel_Dead + " with a "
                + sRating + " at location: " + sArea + ".  "
                + sKiller + " now has a bounty over " + sGender +" head.  "
                + sKiller + " has " + sWin_Killer + " kills.  "
                + sDead + " has " + sLose_Dead + " deaths.  "
                + sKiller + " score is: " + sScore + ".  GMT: "
                + sTime + " on: "
                + sDate + ".", TALKVOLUME_SHOUT);

                //Discord Message
                sMessage = GetName(oKiller) + " - Level: " + IntToString(iKiller_HD) + " killed "
                + GetName(oDead) + " - Level: " + IntToString(iDead_HD) + ".  "
                + GetName(oKiller) + " now has a bounty over " + sGender + " head.  "
                + GetName(oKiller) + " has " + IntToString(iWin_Killer) + " kills.  "
                + GetName(oDead) + " has " + IntToString(iLose_Dead) + " deaths.  "
                + GetName(oKiller) + " score is: " + IntToString(iScore) + ".  GMT: "
                + NWNX_Time_GetSystemTime() + " on: "
                + NWNX_Time_GetSystemDate() + ".";

                 //Send a message to ACN Discord Channel of the client logging in.
                NWNX_WebHook_SendWebHookHTTPS("discordapp.com", sWebhookUrl, sMessage , "Server");

                GiveGoldToCreature(oKiller, iRandom + iDead_HD);
                GiveXPToCreature(oKiller, iRandom + iKiller_HD);
            }

                // Set the bounty variable
                SetLocalInt(oRecall_Killer, "BOUNTY", iBounty_Killer);

                // Apply bounty flag
                ApplyBountyFlag(oKiller);
        }
}
