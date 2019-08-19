#include "nwnx_webhook"
#include "nwnx_player"
#include "nwnx_admin"
#include "inc_cheat"
#include "x2_inc_itemprop"
#include "inc_mod_events"
#include "acn_subfunc"
#include "inc_private"

void main()
{
    object  oItem,
            oPC = GetEnteringObject(),
            oItemNeck = GetItemInSlot(INVENTORY_SLOT_NECK, oPC),
            oLeftHand = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC),
            oRightHand = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC),
            oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC),
            oCarpGem = GetItemPossessedBy(oPC, "itm_carp_gem"),
            oModule = GetModule();

    string  sName = GetName(oPC),
            sAccount = GetPCPlayerName(oPC),
            sArea = GetTag(GetArea(oPC)),
            sCDKEY = GetPCPublicCDKey(oPC, TRUE);

    int iPCTot = 0;

    object oPlayer = GetFirstPC();
    while (oPlayer != OBJECT_INVALID)
    {
        iPCTot++;
        oPlayer = GetNextPC();
    }

    string sOnline = " with " + IntToString(iPCTot) + " players online.";
    string sWebhookUrl = sDiscordHook;
    string sPCName = "Player: " + GetName(oPC) + " - Account: " + GetPCPlayerName(oPC);
    string sMessage = sPCName + " - logged in" + sOnline;

    //  Send a message to ACN Discord Channel of the client logging in.
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", sWebhookUrl, sMessage , "Server");

    //  Load Server Journal Entries
    AddJournalQuestEntry("JOURNAL_ACN_FAQ", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_UPDATES", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_NERFS_FEATS", 1, oPC,TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_RULES_ITEMS", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_PK_BONUS", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_RULES_SERVER", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_SPELLS_0", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_SPELLS_1", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_SPELLS_2", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_CL_CH_A_B", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_CL_CH_C_M", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_CL_CH_N_P", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_CL_CH_Q_Z", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_FEATURES", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_CHAT", 1, oPC, TRUE, TRUE, FALSE);
    AddJournalQuestEntry("JOURNAL_UMD", 1, oPC, TRUE, TRUE, FALSE);
/*
    oItem = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem))
    {
        ItemLevelRestriction(oPC, oItem);
        oItem = GetNextItemInInventory(oPC);
    }
*/
    //  Redundant check to Boot PC if they have an illegal character and somehow bypassed the ELC
    if(GetSubRace(oPC) == "ILLEGAL_CHARACTER")
    {
        NWNX_Administration_DeletePlayerCharacter(oPC , FALSE);
        return;
    }

    //  Run DM Verification code
    if (GetIsDM(oPC))
    {
        if (GetIsGM(oPC))
        {
            SendMessageToAllDMs("<c ó >Entering DM's CD Key VERIFIED: </c>" +
            sName + "<c ó > Account: </c>" + GetPCPlayerName(GetEnteringObject())+
            "<c ó > IP: </c>" + GetPCIPAddress(oPC));

            WriteTimestampedLogEntry("Player: "+sName+" Account: "+sAccount+" - ID: "
            +sCDKEY+" IP: "+GetPCIPAddress(oPC));
            return;
        }

        else
        {
            SendMessageToAllDMs("<có  >Entering DM's CD Key DENIED: </c>" + sName+
            "<có  > Account: </c>"+GetPCPlayerName(GetEnteringObject())+ "<có  > IP: </c>"+GetPCIPAddress(oPC));

            WriteTimestampedLogEntry("Entering DM's CD Key DENIED: " + sName+
            " Account: "+GetPCPlayerName(GetEnteringObject())+ " IP: "+GetPCIPAddress(oPC));
            BootPC(oPC);
            return;
        }
    }
    //  Redundant DM check to break the script if its a DM.
    if (!GetIsPC(oPC)) return;

    //  Only show IP of login to DM channel
    SendMessageToAllDMs(GetPCIPAddress(oPC));

    //  Write a server log of the entering PC
    string sBIC = NWNX_Player_GetBicFileName(oPC);

    WriteTimestampedLogEntry("Player: " + sName + " Account: " + sAccount + " ID: "
    + sCDKEY + " IP: " + GetPCIPAddress(oPC) + " BIC: " + sBIC);

    //  Verify PC Name isn't banned for being offensive
    NameChecker(oPC);

    //  Check if the player has a legal character - ELC Check if new and do a new player strip down
    if (!GetIsObjectValid(oCarpGem))
    {
        if(!GetIsCharacterLegal(oPC)) return;
        else StripPC(oPC);
    }

    //  Check for duped items from the radial crafting menu
    PurifyAllItems(oPC, TRUE, TRUE);

    //  Notify Server on Shout of a Login.
    SpeakString("<c ó >Player: <cfÌþ>" + sName +
    "<c ó > - Account: <cfÌþ>" + sAccount +
    "<c ó > - ID: <cfÌþ>" + sCDKEY, TALKVOLUME_SHOUT);

    //  Automated visual upon PC entering the module casted on the starting location.
    DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), GetStartingLocation()));

    //  Apply Auto-Haste
    ApplyHaste(oPC);

    //  Load PC HP's
    HitPointsAntiCheatOnEnter(oPC);

    //  Load Bounty System Flag
    ApplyBountyFlag(oPC);

    //  Stop Custom pets from spamming
    SetLocalInt(oPC, "SUMMONSPAM", TRUE);
    DelayCommand(1.0, SetLocalInt(oPC, "SUMMONSPAM", FALSE));

    //  Apply subraces
    ACN_SubRace_OnEnter(oPC);

    //  Chat Cooldown Var
    DelayCommand(0.9, DeleteLocalInt(oPC, "PC_CHAT"));
}
