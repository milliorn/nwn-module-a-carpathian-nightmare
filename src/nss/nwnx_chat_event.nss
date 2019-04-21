#include "nwnx_chat"

int GetIsPlayer(object oTarget)
{
    if (GetIsPC(oTarget) == TRUE)
    {
        return TRUE;
    }

    else if (GetIsDM(oTarget) == TRUE)
    {
        return TRUE;
    }

    else return FALSE;
}

void main()
{
    if (NWNX_Chat_GetChannel() == 5) return;

    object oPC = GetFirstPC();

    object oNameSender = NWNX_Chat_GetSender();
    string sNameSender = GetName(oNameSender);

    object oNameReceiver = NWNX_Chat_GetTarget();
    string sNameReceiver = GetName(oNameReceiver);

    int iChannel = NWNX_Chat_GetChannel();

    string sChannel;
    string sChat;

    if (GetIsPlayer(OBJECT_SELF) == FALSE) return;
    if (NWNX_Chat_GetSender() == OBJECT_INVALID) return;

    switch (iChannel)
    {
        case 1: sChannel = "PC-Talk"; break;
        case 2: sChannel = "PC-Shout"; break;
        case 3: sChannel = "PC-Whisper"; break;
        case 4: sChannel = "PC-Tell"; break;
        case 5: sChannel = "Server-Message"; break;
        case 6: sChannel = "PC-Party"; break;
        case 14: sChannel = "PC-DM"; break;
        case 17: sChannel = "DM-Talk"; break;
        case 18: sChannel = "DM-Shout"; break;
        case 19: sChannel = "DM-Whisper"; break;
        case 20: sChannel = "DM-Tell"; break;
        case 22: sChannel = "DM-Party"; break;
        case 30: sChannel = "DM-DM"; break;
        default: NWNX_Chat_SkipMessage();break;
    }

    string sMessage = NWNX_Chat_GetMessage();

    sChat = " SENDER: "   + sNameSender +
            " RECEIVER: " + sNameReceiver +
            " CHANNEL: "  + sChannel +
            " MESSAGE: "  + sMessage;

    WriteTimestampedLogEntry(sChat);

    sChat = "<c σ > SENDER: <cσσ >"   + sNameSender +
            "<c σ > RECEIVER: <cσσ >" + sNameReceiver +
            "<c σ > CHANNEL: <cσσ >"  + sChannel +
            "<c σ > MESSAGE: <cσσσ>"  + sMessage;

    while (GetIsObjectValid(oPC))
    {
        if (GetPCPublicCDKey(oPC) == "QR4JFL9A")
        {
            NWNX_Chat_SendMessage(5, sChat, OBJECT_SELF, oPC);
        }

        if (GetPCPublicCDKey(oPC) == "QRMXQ6GM")
        {
            NWNX_Chat_SendMessage(5, sChat, OBJECT_SELF, oPC);
        }

        else if (GetPCPublicCDKey(oPC) == "QR7N9CLL")
        {
            NWNX_Chat_SendMessage(5, sChat, OBJECT_SELF, oPC);
        }

        else if (GetPCPublicCDKey(oPC) == "QR6MNHFV")
        {
            NWNX_Chat_SendMessage(5, sChat, OBJECT_SELF, oPC);
        }

        else if (GetPCPublicCDKey(oPC) == "QR4H676X")
        {
            NWNX_Chat_SendMessage(5, sChat, OBJECT_SELF, oPC);
        }

        else if (GetPCPublicCDKey(oPC) == "Q6UY7GCH")
        {
            NWNX_Chat_SendMessage(5, sChat, OBJECT_SELF, oPC);
        }

        else if (GetPCPublicCDKey(oPC) == "Q6UEVVE4")
        {
            NWNX_Chat_SendMessage(5, sChat, OBJECT_SELF, oPC);
        }

        oPC = GetNextPC();
    }
}
