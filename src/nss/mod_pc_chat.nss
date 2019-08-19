//::///////////////////////////////////////////////
//:: Name: Chat Tools - Beta
//:: FileName mod_pc_chat
//::
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: By: Scott Milliorn
//:: Created On: 26th August 2008
//:: Updated On: 3rd October 2018
//:://////////////////////////////////////////////
#include "inc_mod_events"
#include "inc_chat"
#include "inc_chat_emotes"
#include "inc_chat_list"

void main()
{

    object oPC = GetPCChatSpeaker();

    //  If we are not a PC or DM then we stop here
    if (!GetIsPC(oPC) && !GetIsDM(oPC)) return;

    string sPCName = GetName(oPC, TRUE),
           sLogInName = GetPCPlayerName(oPC),
           sCDKEY = GetPCPublicCDKey(oPC, TRUE),
           sPCLevel = IntToString(GetHitDice(oPC)),
           sText = GetStringUpperCase(GetPCChatMessage()),
           sMsg = GetPCChatMessage();

    int iSpam = GetLocalInt(oPC, "PC_CHAT"),
        iLegLvl = GetLocalInt(GetItemPossessedBy(oPC, "hgll_check_level"), "nLegendLevel");

    //  Adjust level if we are legendary
    if (iLegLvl > 40) sPCLevel = IntToString(iLegLvl);

    DelayCommand(0.6, DeleteLocalInt(oPC, "PC_CHAT"));

    if (GetLocalInt(oPC, "PC_CHAT") >= 3)
    {
        SetPCChatMessage("");
        AssignCommand(oPC, BootPC(oPC, "You have been kicked from the server for SPAMMING CHAT!"));
        SpeakString(sPCName + "has been booted for spamming chat.", TALKVOLUME_SHOUT);
        WriteTimestampedLogEntry("Player: " + sPCName +
        " Account: " + sLogInName + " ID: " + sCDKEY + " has been booted for spamming chat.");
        return;
    }

    if (GetLocalInt(oPC, "PC_CHAT") == 2)
    {
        SetPCChatMessage("");
        FloatingTextStringOnCreature("LAST CHANCE DO NOT SPAM CHAT!", oPC, FALSE);
        SetLocalInt(oPC, "PC_CHAT", iSpam + 1);
        return;
    }

    if (GetLocalInt(oPC, "PC_CHAT") == 1)
    {
        SetPCChatMessage("");
        FloatingTextStringOnCreature("Please do not spam chat!", oPC, FALSE);
        SetLocalInt(oPC, "PC_CHAT", iSpam + 1);
        return;
    }

    SetLocalInt(oPC, "PC_CHAT", 1);
//    DelayCommand(0.6, DeleteLocalInt(oPC, "PC_CHAT"));

    if (GetLocalInt(oPC, "PORTRAIT"))
    {
        string sPortrait = GetPCChatMessage();
        int iPortrait = StringToInt(sPortrait);
        SetPortraitId(oPC, iPortrait);
        DeleteLocalInt(oPC, "PORTRAIT");
        SetPCChatMessage("");
        SendMessageToPC(oPC, "Portrait changed");
        return;
    }

    else if (GetLocalInt(oPC, "VOICE"))
    {
        string sVoice = GetPCChatMessage();
        int iVoice = StringToInt(sVoice);
        NWNX_Creature_SetSoundset(oPC, iVoice);
        DeleteLocalInt(oPC, "VOICE");
        SetPCChatMessage("");
        SendMessageToPC(oPC, "Voice changed");
        return;
    }

    else if (GetLocalInt(oPC, "SKIN"))
    {
        string sSkin = GetPCChatMessage();
        int iSkin = StringToInt(sSkin);
        SetColor(oPC, COLOR_CHANNEL_SKIN, iSkin);
        DeleteLocalInt(oPC, "SKIN");
        SetPCChatMessage("");
        SendMessageToPC(oPC, "Skin changed");
        return;
    }

    else if (GetLocalInt(oPC, "HAIR"))
    {
        string sHair = GetPCChatMessage();
        int iHair = StringToInt(sHair);
        SetColor(oPC, COLOR_CHANNEL_HAIR, iHair);
        DeleteLocalInt(oPC, "HAIR");
        SetPCChatMessage("");
        SendMessageToPC(oPC, "Hair changed");
        return;
    }

    if (TestStringAgainstPattern(sText, "!dm_leader") && GetIsGM(oPC))
    {
        object oLeader = GetFactionLeader(oPC);
        object oLeaderArea = GetArea(oLeader);
        object oArea = GetArea(OBJECT_SELF);
        location lTarget = GetLocation(oLeader);

        SetPCChatMessage("");

        if (oLeader == oPC)
        {
            FloatingTextStringOnCreature("<cσ  >You are the leader.", oPC);
            return;
        }

        else if (GetArea(oLeader) == OBJECT_INVALID || oLeader == OBJECT_INVALID)
        {
            FloatingTextStringOnCreature("<cσ  >Unable to port to leader."
            + " Try again in a few seconds", oPC, FALSE);
            return;
        }

        else
        {
            DelayCommand(1.5, AssignCommand(oPC, JumpToLocation(lTarget)));
            return;
        }
    }

    if (TestStringAgainstPattern(sText, "!dm_room"))
    {
        string sName1 = GetName(oPC);

        if (GetIsGM(oPC))
        {
            SetPCChatMessage("");
            DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("DM_ROOM")))));
            FloatingTextStringOnCreature("<cσ  >Porting to DM Room.", oPC, FALSE);
            return;
        }
    }

    if (TestStringAgainstPattern(sText, "!dm_resetmod"))
    {
        if (GetIsGM(oPC))
        {
            SetPCChatMessage("");

            WriteTimestampedLogEntry(sPCName +
            " has activated SERVER RESET!!!Account: "
            + GetPCPlayerName( oPC )+ " CD Key: "
            + GetPCPublicCDKey( oPC )+ " IP: "
            + GetPCIPAddress( oPC ));

            SpeakString(sPCName +
            " has activated SERVER RESET!!!Account: "
            + GetPCPlayerName( oPC )+ " CD Key: "
            + GetPCPublicCDKey( oPC ), TALKVOLUME_SHOUT);

            ExportAllCharacters();
            ExecuteScript("ws_saveall_sub", OBJECT_SELF);
            ExecuteScript("mod_shutdown", OBJECT_SELF);
            return;
        }
        else
        {
            WriteTimestampedLogEntry(sPCName +
            " has attempted SERVER RESET!!!Account: "
            + GetPCPlayerName(oPC) + " CD Key: "
            + GetPCPublicCDKey(oPC) + " IP: "
            + GetPCIPAddress(oPC));

            SendMessageToAllDMs(sPCName +
            " has attempted SERVER RESET!!!Account: "
            + GetPCPlayerName(oPC) + " CD Key: "
            + GetPCPublicCDKey(oPC));
            return;
        }
    }

    if(GetPCPublicCDKey(oPC, TRUE) == "QR4JFL9A" || GetPCPublicCDKey(oPC, TRUE) == "QRMXQ6GM")
    {
        if (TestStringAgainstPattern(sText, "!dm_plot"))
        {
            SetPCChatMessage("");

            if (GetPlotFlag(oPC) == FALSE)
            {
                SetPlotFlag(oPC, TRUE);
                SendMessageToPC(oPC, "Plot set to true.");
                return;
            }

            if(GetPlotFlag(oPC) == TRUE)
            {
                SetPlotFlag(oPC, FALSE);
                SendMessageToPC(oPC, "Plot set to false.");
                return;
            }
        }

        if (TestStringAgainstPattern(sText, "!dm_rez"))
        {
                SetPCChatMessage("");
                Raise(oPC);
                ForceRest(oPC);
                SendMessageToPC(oPC, "DM Resurrection.");
                return;
        }

        else if (TestStringAgainstPattern(sText, "!dm_gold"))
        {
                SetPCChatMessage("");
                GiveGoldToCreature(oPC, 10000000);
                SendMessageToPC(oPC, "10 Million GP.");
                return;
        }

        else if (TestStringAgainstPattern(sText, "!dm_60"))
        {
                SetPCChatMessage("");
                GiveXPToCreature(oPC, 17498600);
                SendMessageToPC(oPC, "Level 60.");
                return;
        }

        else if (TestStringAgainstPattern(sText, "!dm_givelevel"))
        {
            SetPCChatMessage("");
            int nHD = GetHitDice(oPC);
            int nTargetLevel = nHD + 1;

            if (nTargetLevel > 40) nTargetLevel = 40;
            int nTargetXP = (( nTargetLevel * ( nTargetLevel - 1 )) / 2 * 1000 );

            SetXP(oPC, nTargetXP);
            SendMessageToPC(oPC, "Give Level.");
            return;
        }

        else if (TestStringAgainstPattern(sText, "!dm_takelevel"))
        {
            SetPCChatMessage("");
            int nHD = GetHitDice(oPC);
            int nTargetLevel = nHD - 1;

            if (nTargetLevel < 1) nTargetLevel = 1;
            int nTargetXP = (( nTargetLevel * ( nTargetLevel - 1 )) / 2 * 1000 );

            SetXP(oPC, nTargetXP);

            if (GetXP(oPC) == 0) SetXP(oPC, 1);

            SendMessageToPC(oPC, "Take Level");
            return;
        }
    }

    switch (GetPCChatVolume())
    {
        // we only process shout from here, other chat are hooked in the events_chat script
        case TALKVOLUME_SHOUT:
        {
            // if the player used shout, but shouldn't be allowed to, disable shout and set talk channel
            if (SF_GetIsShoutBanned(oPC))
            {
                // the player is banned from shout, process their shout through the talk channel
                SetPCChatMessage("");
                // tell the player they cannot shout until server reset, or until a dm removes the shout ban
                //FloatingTextStringOnCreature (MSG_SHOUT_BANNED_1, oPC);
                return;
            }
            // no break needed, we don't want to exit the switch, but continue to default
        default:
        }
    }
    // get the code (if any)
    string sCode = GetStringLeft (sMsg, 1);
    // remove the ! code from the string
    sMsg = GetStringRight (sMsg, GetStringLength(sMsg) - 1);
    // emote processes with '*'
    if (sCode == "*")
    {
        int iVictory = d3();
        int iMoan = d3();
        // emote codes         0  3  6  9  12 15 18 21 24 27 30 33 36 39 42
        switch (FindSubString("go du do si gr bo bi re sa da st ta ch no pu", sMsg))
        {
            case 0: // goodbye
            DoGoodbye(oPC);
            break;

            case 3: // duck
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_DODGE_DUCK);
            break;

            case 6: // dodge
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_DODGE_SIDE);
            break;

            case 9: // sip
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_DRINK);
            DoBelch(oPC);
            break;

            case 12: // greeting
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_GREETING);
            DoHello(oPC);
            break;

            case 15: // bored
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_PAUSE_BORED);
            PlayVoiceChat(VOICE_CHAT_BORED, oPC);
            break;

            case 18:    // Bad Idea
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
            PlayVoiceChat(VOICE_CHAT_BADIDEA, oPC);
            break;

            case 21:    // read
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_READ);
            break;

            case 24:    // salute
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_SALUTE);
            break;

            case 27:    // Dance
            DoShriek(oPC);
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_SPASM);
            break;

            case 30:    // steal
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_STEAL);
            break;

            case 33:    // taunt
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_TAUNT);
            PlayVoiceChat(VOICE_CHAT_TAUNT, oPC);
            break;

            case 36:    // cheer
            PlayVoiceChat(VOICE_CHAT_CHEER, oPC);
            if (iVictory == 1)      DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_VICTORY1);
            else if (iVictory == 2) DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_VICTORY2);
            else                    DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_VICTORY3);
            break;

            case 39:    // No
            DoHeadShake(oPC);
            break;

            case 42:    // Puke
            DoPuke(oPC);
            break;
        }
        // emote codes         0  3  6  9  12 15 18 21 24 27 30 33 36 39 42 45 48 51
        switch (FindSubString("co in fb ff lo bf li se me mo dr ti sq sc la be wo sp", sMsg))
        {
            case 0:     // conjure
            DoLoopAnimation(oPC, ANIMATION_LOOPING_CONJURE1);
            break;

            case 3:     // invoke
            DoLoopAnimation(oPC, ANIMATION_LOOPING_CONJURE2);
            break;

            case 6:     // Fall Back
            DoLoopAnimation(oPC, ANIMATION_LOOPING_DEAD_BACK);
            PlayVoiceChat(VOICE_CHAT_DEATH,oPC);
            break;

            case 9:    // Fall Front
            DoLoopAnimation(oPC, ANIMATION_LOOPING_DEAD_FRONT);
            PlayVoiceChat(VOICE_CHAT_NEARDEATH, oPC);
            break;

            case 12:    // Lean Over
            DoLoopAnimation(oPC, ANIMATION_LOOPING_GET_LOW);
            break;

            case 15:    // Bend Forward
            DoLoopAnimation(oPC, ANIMATION_LOOPING_GET_MID);
            break;

            case 18:    // Listen
            DoLoopAnimation(oPC, ANIMATION_LOOPING_LISTEN);
            break;

            case 21:    // Search
            DoLoopAnimation(oPC, ANIMATION_LOOPING_LOOK_FAR);
            PlayVoiceChat(VOICE_CHAT_LOOKHERE, oPC);
            break;

            case 24:    // Meditate
            DoLoopAnimation(oPC, ANIMATION_LOOPING_MEDITATE);
            break;

            case 27:    // Moan
            DoLoopAnimation(oPC, ANIMATION_LOOPING_PAUSE);
            //int iMoan = d3();
            if (iMoan == 1)      PlayVoiceChat(VOICE_CHAT_PAIN1, oPC);
            else if (iMoan == 2) PlayVoiceChat(VOICE_CHAT_PAIN2, oPC);
            else                 PlayVoiceChat(VOICE_CHAT_PAIN3, oPC);
            break;

            case 30:    // Drunk
            PlayVoiceChat(VOICE_CHAT_POISONED, oPC);
            DoLoopAnimation(oPC, ANIMATION_LOOPING_PAUSE_DRUNK);
            break;

            case 33:    // Tired
            PlayVoiceChat(VOICE_CHAT_REST, oPC);
            DoLoopAnimation(oPC, ANIMATION_LOOPING_PAUSE_TIRED);
            break;

            case 36:    // Squat
            DoLoopAnimation(oPC, ANIMATION_LOOPING_SIT_CHAIR);
            break;

            case 39:    // Sit Cross
            DoLoopAnimation(oPC, ANIMATION_LOOPING_SIT_CROSS);
            PlayVoiceChat(VOICE_CHAT_TALKTOME, oPC);
            break;

            case 42:    // Laugh
            DoLoopAnimation(oPC, ANIMATION_LOOPING_TALK_LAUGHING);
            PlayVoiceChat(VOICE_CHAT_LAUGH, oPC);
            break;

            case 45:    // Beg
            DoLoopAnimation(oPC, ANIMATION_LOOPING_TALK_PLEADING);
            break;

            case 48:    // Worship
            DoLoopAnimation(oPC, ANIMATION_LOOPING_WORSHIP);
            break;

            case 51:    // Spasm
            DoLoopAnimation(oPC, ANIMATION_LOOPING_SPASM);
            break;
        }
    }

    else if (sCode == "!")
    {
        // weapon visual codes 0    5    10   15   20   25   30
        switch (FindSubString("wpev wpso wpac wpco wpho wpfi wpel", sMsg))
        {
            case 0:  SetPCChatMessage ("");
                     ApplyWeaponEffects(oPC, ITEM_VISUAL_EVIL);
                     break;

            case 5:  SetPCChatMessage ("");
                     ApplyWeaponEffects(oPC, ITEM_VISUAL_SONIC);
                     break;

            case 10: SetPCChatMessage("");
                     ApplyWeaponEffects(oPC, ITEM_VISUAL_ACID);
                     break;

            case 15: SetPCChatMessage("");
                     ApplyWeaponEffects(oPC, ITEM_VISUAL_COLD);
                     break;

            case 20: SetPCChatMessage("");
                     ApplyWeaponEffects(oPC, ITEM_VISUAL_HOLY);
                     break;

            case 25: SetPCChatMessage("");
                     ApplyWeaponEffects(oPC, ITEM_VISUAL_FIRE);
                     break;

            case 30: SetPCChatMessage("");
                     ApplyWeaponEffects(oPC, ITEM_VISUAL_ELECTRICAL);
                     break;
        }
        // Player codes        0   4        13   18      26     33  37
        switch (FindSubString("lfg re_equip save relevel server pvp bounties", sMsg))
        {
            // Looking For Party
            case 0: SetPCChatMessage("");
                    SpeakString("<cσ σ>" + sPCName + "<c σσ> - Level: <cσ σ>" + sPCLevel + "<c σσ> is looking for a party!", TALKVOLUME_SHOUT);
                    break;

            // Re-Equip all equipped items
            case 4: SetPCChatMessage("");
                    ChatReEquipItem(oPC);
                    break;

            case 13: SetPCChatMessage("");
                     ChatSaveCharacter(oPC);
                     break;

            // Relevel Character
            case 18: SetPCChatMessage("");
                     ChatRelevelPC(oPC);
                     break;

            // Display all online players
            case 26: SetPCChatMessage("");
                     ChatServer();
                     break;

            // Display PvP stats
            case 33: SetPCChatMessage("");
                     ChatPvP(oPC);
                     break;

            case 37: SetPCChatMessage("");
                     ChatBounties(oPC);
                     break;
        }
        // dice rolls          0    5
        switch (FindSubString("like dislike", sMsg))
        {
            case 0:
            {
                SetPCChatMessage("");
                SpeakString("<cσ σ>" +sPCName + " <c σσ> status has been set to <cσ  >Neutral.", TALKVOLUME_SHOUT);
                // Loop all PC's in the module and set this PC to dislike them - uh oh
                object oDislike = GetFirstPC();
                while (GetIsObjectValid(oPC))
                {
                    // Set to dislike
                    SetPCLike(oPC, oDislike);
                    // Get next PC
                    oPC = GetNextPC();
                }
                //break;
            }
            break;
            case 5:
            {
                SetPCChatMessage("");
                SpeakString("<cσ σ>" +sPCName +
                " <c σσ> status has been set to <cσ  >Hostile.", TALKVOLUME_SHOUT);
                // Loop all PC's in the module and set this PC to dislike them - uh oh
                object oDislike = GetFirstPC();
                while (GetIsObjectValid(oPC))
                {
                    // Set to dislike
                    SetPCDislike(oPC, oDislike);
                    // Get next PC
                    oPC = GetNextPC();
                }
               // break;
            }
            break;
        }

        // dice rolls          0   4    9   13 16  20 23 26 29
        switch (FindSubString("d10 d100 d12 d2 d20 d3 d4 d6 d8", sMsg))
        {
            case 0:     SetPCChatMessage(sPCName + "<cσσσ> d10 roll = </c>" + IntToString(d10()));
                        //SpeakString(sPCName+ "<cσσσ> d10 roll = </c>" + IntToString(d10()), TALKVOLUME_SHOUT);
                        break;

            case 4:     SetPCChatMessage(sPCName + "<cσσσ> % roll = </c>" + IntToString(d100()));
                        //SpeakString(sPCName+ "<cσσσ> % roll = </c>" + IntToString(d100()), TALKVOLUME_SHOUT);
                        break;

            case 9:     SetPCChatMessage(sPCName + "<cσσσ> d12 roll = </c>" + IntToString(d12()));
                        //SpeakString(sPCName+ "<cσσσ> d12 roll = </c>" + IntToString(d12()), TALKVOLUME_SHOUT);
                        break;

            case 13:    SetPCChatMessage(sPCName + "<cσσσ> d2 roll = </c>" + IntToString(d2()));
                        //SpeakString(sPCName+ "<cσσσ> d2 roll = </c>" + IntToString(d2()), TALKVOLUME_SHOUT);
                        break;

            case 16:    SetPCChatMessage(sPCName + "<cσσσ> d20 roll = </c>" + IntToString(d20()));
                        //SpeakString(sPCName+ "<cσσσ> d20 roll = </c>" + IntToString(d20()), TALKVOLUME_SHOUT);
                        break;

            case 20:    SetPCChatMessage(sPCName + "<cσσσ> d3 roll = </c>" + IntToString(d3()));
                        //SpeakString(sPCName+ "<cσσσ> d3 roll = </c>" + IntToString(d3()), TALKVOLUME_SHOUT);
                        break;

            case 23:    SetPCChatMessage(sPCName + "<cσσσ> d4 roll = </c>" + IntToString(d4()));
                        //SpeakString(sPCName+ "<cσσσ> d4 roll = </c>" + IntToString(d4()), TALKVOLUME_SHOUT);
                        break;

            case 26:    SetPCChatMessage(sPCName + "<cσσσ> d6 roll = </c>" + IntToString(d6()));
                        //SpeakString(sPCName+ "<cσσσ> d6 roll = </c>" + IntToString(d6()), TALKVOLUME_SHOUT);
                        break;

            case 29:    SetPCChatMessage(sPCName + "<cσσσ> d8 roll = </c>" + IntToString(d8()));
                        //SpeakString(sPCName+ "<cσσσ> d8 roll = </c>" + IntToString(d8()), TALKVOLUME_SHOUT);
                        break;
        }
        // Change Alignments    0          11         22            36           49
        switch (FindSubString("align_good align_evil align_chaotic align_lawful align_neutral", sMsg))
        {
            case 0:     SetPCChatMessage("");
                        AdjustAlignment(oPC, ALIGNMENT_GOOD, 100, FALSE);
                        FloatingTextStringOnCreature("You shifted to a Good alignment.", oPC, FALSE);
                        break;

            case 11:    SetPCChatMessage("");
                        AdjustAlignment(oPC, ALIGNMENT_EVIL, 100, FALSE);
                        FloatingTextStringOnCreature("You shifted to an Evil alignment.", oPC, FALSE);
                        break;

            case 22:    SetPCChatMessage("");
                        AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 100, FALSE);
                        FloatingTextStringOnCreature("You shifted to a Chaotic alignment.", oPC, FALSE);
                        break;

            case 36:    SetPCChatMessage("");
                        AdjustAlignment(oPC, ALIGNMENT_LAWFUL, 100, FALSE);
                        FloatingTextStringOnCreature("You shifted to a Lawful alignment.", oPC, FALSE);
                        break;

            case 49:    //if(GetLevelByClass(CLASS_TYPE_DRUID, OBJECT_SELF) == TRUE)
                        //{
                            SetPCChatMessage("");
                            AdjustAlignment(oPC, ALIGNMENT_NEUTRAL, 100, FALSE);
                            FloatingTextStringOnCreature("You shifted to a Neutral alignment.", oPC, FALSE);
                            break;
                            //return;
                        //}

                        /*else
                        {
                            SetPCChatMessage("");
                            FloatingTextStringOnCreature("You must take one Druid class level to "+
                            "shift to a neutral alignment.", oPC, FALSE);
                            return;
                        }*/
        }
        //                     0     6    12     18    24    30    36
        switch (FindSubString("w_ang w_bat w_bir w_but w_dem w_dra w_non", sMsg))
        {
            case 0:     SetPCChatMessage("");
                        SetCreatureWingType(CREATURE_WING_TYPE_ANGEL, oPC);
                        break;

            case 6:     SetPCChatMessage("");
                        SetCreatureWingType(CREATURE_WING_TYPE_BAT, oPC);
                        break;

            case 12:    SetPCChatMessage("");
                        SetCreatureWingType(CREATURE_WING_TYPE_BIRD, oPC);
                        break;

            case 18:    SetPCChatMessage("");
                        SetCreatureWingType(CREATURE_WING_TYPE_BUTTERFLY, oPC);
                        break;

            case 24:    SetPCChatMessage("");
                        SetCreatureWingType(CREATURE_WING_TYPE_DEMON, oPC);
                        break;

            case 30:    SetPCChatMessage("");
                        SetCreatureWingType(CREATURE_WING_TYPE_DRAGON, oPC);
                        break;

            case 36:    SetPCChatMessage("");
                        SetCreatureWingType(CREATURE_WING_TYPE_NONE, oPC);
                        break;
        }
        //                     0     6     12    18
        switch (FindSubString("t_bon t_dev t_liz t_non", sMsg))
        {
            case 0:     SetPCChatMessage("");
                        SetCreatureTailType(CREATURE_TAIL_TYPE_BONE, oPC);
                        break;

            case 6:     SetPCChatMessage("");
                        SetCreatureTailType(CREATURE_TAIL_TYPE_DEVIL, oPC);
                        break;

            case 12:    SetPCChatMessage("");
                        SetCreatureTailType(CREATURE_TAIL_TYPE_LIZARD, oPC);
                        break;

            case 18:    SetPCChatMessage("");
                        SetCreatureTailType(CREATURE_TAIL_TYPE_NONE, oPC);
                        break;
        }
        //                     0      7    12     19   24        34    40    46   51    57
        switch (FindSubString("emotes wpnv player dice alignment wings tails eyes heads arms", sMsg))
        {
            case 0:     SetPCChatMessage("");
                        ChatListEmotes(oPC);
                        break;

            case 7:     SetPCChatMessage("");
                        ChatListWeapons(oPC);
                        break;

            case 12:    SetPCChatMessage("");
                        ChatListPlayer(oPC);
                        break;

            case 19:    SetPCChatMessage("");
                        ChatListDice(oPC);
                        break;

            case 24:    SetPCChatMessage("");
                        ChatListAlignment(oPC);
                        break;

            case 34:    SetPCChatMessage("");
                        ChatListWings(oPC);
                        break;

            case 40:    SetPCChatMessage("");
                        ChatListTails(oPC);
                        break;

            case 46:    SetPCChatMessage("");
                        ChatListEyes(oPC);
                        break;

            case 51:    SetPCChatMessage("");
                        ChatListHead(oPC);
                        break;

            case 57:    SetPCChatMessage("");
                        ChatListArm(oPC);
                        break;
        }
        //   Eyes visual codes 0    5    10   15   20   25   30   35
        switch (FindSubString("eyec eyeg eyen eyeo eyep eyer eyew eyey", sMsg))
        {
            case 0:  SetPCChatMessage ("");
                     ChatEyesCyan(oPC);
                     break;

            case 5:  SetPCChatMessage ("");
                     ChatEyesGreen(oPC);
                     break;

            case 10: SetPCChatMessage("");
                     ChatEyesNone(oPC);
                     break;

            case 15: SetPCChatMessage("");
                     ChatEyesOrange(oPC);
                     break;

            case 20: SetPCChatMessage("");
                     ChatEyesPurple(oPC);
                     break;

            case 25: SetPCChatMessage("");
                     ChatEyesRed(oPC);
                     break;

            case 30: SetPCChatMessage("");
                     ChatEyesWhite(oPC);
                     break;

            case 35: SetPCChatMessage("");
                     ChatEyesYellow(oPC);
                     break;
        }
        //                     0     6
        switch (FindSubString("headn headp", sMsg))
        {
            case 0:     SetPCChatMessage("");
                        ChatHeadNext(oPC);
                        break;

            case 6:     SetPCChatMessage("");
                        ChatHeadPrevious(oPC);
                        break;
        }
        //                     0    5
        switch (FindSubString("armb armn", sMsg))
        {
            case 0:     SetPCChatMessage("");
                        ChatArmBone(oPC);
                        break;

            case 5:     SetPCChatMessage("");
                        ChatArmNormal(oPC);
                        break;
        }
        //                     0        9     15   20
        switch (FindSubString("portrait voice skin hair", sMsg))
        {
            case 0:
            if (!GetLocalInt(oPC, "PORTRAIT"))
            {
                SetPCChatMessage("");
                SetLocalInt(oPC, "PORTRAIT", 1);
                FloatingTextStringOnCreature("<cσσσ>Type the </c>number<cσσσ> of the </c>portrait " +
                "<cσσσ>found in the </c>portraits.2da<cσσσ> file and press </c>Enter.", oPC, FALSE);
                break;
            }

            case 9:
            if (!GetLocalInt(oPC, "VOICE"))
            {
                SetPCChatMessage("");
                SetLocalInt(oPC, "VOICE", 1);
                FloatingTextStringOnCreature("<cσσσ>Type the </c>number<cσσσ> of the </c>soundset " +
                "<cσσσ>found in the </c>soundset.2da<cσσσ> file and press </c>Enter.", oPC, FALSE);
                break;
            }

            case 15:
            if (!GetLocalInt(oPC, "SKIN"))
            {
                SetPCChatMessage("");
                SetLocalInt(oPC, "SKIN", 1);
                FloatingTextStringOnCreature("<cσσσ>Type the </c>number<cσσσ> of the </c>color " +
                "<cσσσ>found in the </c>ACN Forums<cσσσ> and press </c>Enter.", oPC, FALSE);
                break;
            }

            case 20:
            if (!GetLocalInt(oPC, "HAIR"))
            {
                SetPCChatMessage("");
                SetLocalInt(oPC, "HAIR", 1);
                FloatingTextStringOnCreature("<cσσσ>Type the </c>number<cσσσ> of the </c>color " +
                "<cσσσ>found in the </c>ACN Forum<cσσσ> and press </c>Enter.", oPC, FALSE);
                break;
            }
        }
    }
}
