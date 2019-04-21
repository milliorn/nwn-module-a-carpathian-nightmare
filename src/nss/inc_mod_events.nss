#include "nwnx_time"
#include "nwnx_webhook"
#include "nwnx_admin"
#include "nwnx_creature"

// Color Text Constsants
//const string TXT_COLOR_GRAY       = "<c°°°>"; // Gray
//const string TXT_COLOR_WHITE      = "<cóóó>"; // White
//const string TXT_COLOR_CYAN       = "<c óó>"; // Light Cyan
//const string TXT_COLOR_MAGENTA    = "<có ó>"; // Magenta
//const string TXT_COLOR_YELLOW     = "<cóó >"; // Yellow
//const string TXT_COLOR_RED        = "<có  >"; // Red
//const string TXT_COLOR_ORANGE     = "<cþf >"; // Orange
//const string TXT_COLOR_GREEN      = "<c ó >"; // Green
//const string TXT_COLOR_LIGHT_BLUE = "<cfÌþ>"; // Light BlueBlue
//const string TXT_COLOR_DARK_BLUE  = "<c fþ>"; // Dark Blue
//const string TXT_COLOR_PURPLE     = "<cÌwþ>";
//const string TXT_COLOR_NONE       = "";       // Default (no color)
//const string TXT_COLOR_END        = "</c>";   // (color end TAG)
//const string TXT_COLOR_DEFAULT    = TXT_COLOR_YELLOW

const int ITEM_MAX_LVL = 250000;

// ILR Code
void ItemLevelRestriction(object oPC, object oItem);
void ItemLevelRestriction(object oPC, object oItem)
{
    int nCost = GetGoldPieceValue(oItem);
//  ILR Script
    if (nCost > ITEM_MAX_LVL)
    {
        AssignCommand(oPC, ActionUnequipItem(oItem));
        string sOutput = "<có  >ILR Script Activated: <cþf >" + GetName(oItem) + ".</c>";
        sOutput += "\n";
        sOutput += "<cþf >" + GetName(oItem) + "</c> Item Value: <cóóó>" + IntToString(GetGoldPieceValue(oItem)) + ".</c>";
        sOutput += "\n";
        sOutput += "<có  >This item exceeds the item value restriction cap.</c>";
        FloatingTextStringOnCreature(sOutput, oPC, FALSE);
    }
}

void PrintGPValue(object oItem);
void PrintGPValue(object oItem)
{
    string sDescribe = GetDescription(oItem, TRUE, TRUE),
           sGoldValue = IntToString(GetGoldPieceValue(oItem));

    if (GetPlotFlag(oItem) == FALSE)
    {
        string sOutput = "<cóó >Gold Piece Value:</c> <cþf >" + sGoldValue + "</c>";
        sOutput += "\n";
        sOutput += "\n";
        sOutput += sDescribe;
        SetDescription(oItem, sOutput, TRUE);
    }
}

//  Display a message and destroy the duped item if detected
void PurifyItem(object oItem, object oPC, int nIsEntering)
{
    string sDupeReport;
    if (GetLocalInt(oItem, "CRAFT_DUPLICATE"))
    {
        SendMessageToPC(oPC,("Destroyed: " + GetName(oItem) + "Crafting Duplicate"));
        //Note from Loki: The following block of code checks if
        //the function is being run as part of an "OnEnter"
        //script (as indicated y the function argument "nIsEntering".
        //If so, we note this in the log file.  Otherwise we send a
        //slightly shorter message.

        if (nIsEntering)
        sDupeReport = "Crafting Duplicate: '" + GetName(oItem) + "' detected on entering player: "+GetName(oPC)+".  Item destroyed.";
        else sDupeReport="Crafting Duplicate: '" + GetName(oItem) + "' detected on player: " + GetName(oPC) + ".  Item Destroyed.";
        DestroyObject(oItem);
        WriteTimestampedLogEntry(sDupeReport);
        SendMessageToAllDMs(sDupeReport);
    }
}

//  Cycle through all items that can be crafted in the radial menu
void PurifyAllItems(object oPC, int nIsEntering = FALSE, int nDeleteTempVars = FALSE);
void PurifyAllItems(object oPC, int nIsEntering = FALSE, int nDeleteTempVars = FALSE)
{
    PurifyItem(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC),oPC,nIsEntering);
    PurifyItem(GetItemInSlot(INVENTORY_SLOT_HEAD, oPC),oPC,nIsEntering);
    PurifyItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC),oPC,nIsEntering);
    PurifyItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC),oPC,nIsEntering);
    object oItem = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem))
    {
        PurifyItem(oItem,oPC,TRUE);
        oItem = GetNextItemInInventory(oPC);
    }

    if (nDeleteTempVars == FALSE) return;

    DeleteLocalInt(oPC, "CRAFT_DUPLICATE");
}

// Reset Faction Reputation to PC
void SetFactionsFriendly(object oPlayer);
void SetFactionsFriendly(object oPlayer)
{
    // * make friendly to Each of the 3 common factions
    AssignCommand(oPlayer, ClearAllActions());

    // * Note: waiting for Sophia to make SetStandardFactionReptuation to clear all personal reputation
    if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPlayer) <= 10)
    {
        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_MERCHANT, oPlayer) <= 10)
    {
        SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 80, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPlayer) <= 10)
    {
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 80, oPlayer);
    }
}

//Send Faction Message
void SendMsgToFactionWithinDistance(object oPC, string sMessage, float fDist);
void SendMsgToFactionWithinDistance(object oPC, string sMessage, float fDist)
{
    object oFaction = GetFirstFactionMember(oPC),
           oArea = GetArea(oPC);
    while (GetIsObjectValid(oFaction))
    {
        if (GetArea(oFaction) == oArea && GetDistanceBetween(oPC, oFaction) <= fDist)
        {
            DelayCommand(0.3, FloatingTextStringOnCreature(sMessage, oFaction));
        }
            oFaction = GetNextFactionMember(oPC);
    }
}

void HitPointsAntiCheatOnEnter(object oPC)
{
    object oMod = GetModule();
    string sPlayerID = GetName(oPC) + "_" + IntToString(GetXP(oPC));

    if (GetLocalInt(oMod, "PC_LOGGED_" + sPlayerID ))
    {
        effect eHPDam = EffectDamage(GetMaxHitPoints(oPC) - GetLocalInt(oMod, "PC_HP_" + sPlayerID), DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_ENERGY);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHPDam, oPC);
    }
}

void HitPointsAntiCheatOnExit(object oPC)
{
    object oMod = GetModule();
    string sPlayerID = GetName(oPC) + "_" + IntToString(GetXP(oPC));

    SetLocalInt(oMod, "PC_LOGGED_" + sPlayerID, TRUE);
    SetLocalInt(oMod, "PC_HP_" + sPlayerID, GetCurrentHitPoints(oPC));
}

//Send Player to Jail if they have a Jail Token
void SendPlayerToJail(object oPC);
void SendPlayerToJail(object oPC)
{
    AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("WP_JAIL"))));
}

//  Wrapper to Unequip and ReEquip and item
void ReEquipItem(object oItem, object oPC);
void ReEquipItem(object oItem, object oPC)
{
        object oArms    = GetItemInSlot(INVENTORY_SLOT_ARMS, oPC),
               oBelt    = GetItemInSlot(INVENTORY_SLOT_BELT, oPC),
               oBoots   = GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC),
               oChest   = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC),
               oCloak   = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC),
               oHead    = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC),
               oLeftH   = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC),
               oLeftR   = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC),
               oNeck    = GetItemInSlot(INVENTORY_SLOT_NECK, oPC),
               oRightH  = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC),
               oRightR  = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);

        if (GetIsObjectValid(oArms))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oArms));
            AssignCommand(oPC, ActionEquipItem(oArms, INVENTORY_SLOT_ARMS));
        }

        if (GetIsObjectValid(oBelt))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oBelt));
            DelayCommand(0.1, AssignCommand(oPC, ActionEquipItem(oBelt, INVENTORY_SLOT_BELT)));
        }
        if (GetIsObjectValid(oBoots))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oBoots));
            DelayCommand(0.2, AssignCommand(oPC, ActionEquipItem(oBoots, INVENTORY_SLOT_BOOTS)));
        }
        if (GetIsObjectValid(oChest))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oChest));
            DelayCommand(0.3, AssignCommand(oPC, ActionEquipItem(oChest, INVENTORY_SLOT_CHEST)));
        }
        if (GetIsObjectValid(oCloak))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oCloak));
            DelayCommand(0.4, AssignCommand(oPC, ActionEquipItem(oCloak, INVENTORY_SLOT_CLOAK)));
        }
        if (GetIsObjectValid(oHead))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oHead));
            DelayCommand(0.5, AssignCommand(oPC, ActionEquipItem(oHead, INVENTORY_SLOT_HEAD)));
        }
        if (GetIsObjectValid(oLeftH))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oLeftH));
            DelayCommand(0.6, AssignCommand(oPC, ActionEquipItem(oLeftH, INVENTORY_SLOT_LEFTHAND)));
        }
        if (GetIsObjectValid(oLeftR))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oLeftR));
            DelayCommand(0.7, AssignCommand(oPC, ActionEquipItem(oLeftR, INVENTORY_SLOT_LEFTRING)));
        }
        if (GetIsObjectValid(oNeck))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oNeck));
            DelayCommand(0.8, AssignCommand(oPC, ActionEquipItem(oNeck, INVENTORY_SLOT_NECK)));
        }
        if (GetIsObjectValid(oRightH))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oRightH));
            DelayCommand(0.9, AssignCommand(oPC, ActionEquipItem(oRightH, INVENTORY_SLOT_RIGHTHAND)));
        }
        if (GetIsObjectValid(oRightR))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oRightR));
            DelayCommand(1.0, AssignCommand(oPC, ActionEquipItem(oRightR, INVENTORY_SLOT_RIGHTRING)));
        }
}

//  Use this to Apply Bounty Flag
void ApplyBountyFlag(object oPC);
void ApplyBountyFlag(object oPC)
{
    object oItem = GetItemPossessedBy(oPC, "itm_carp_gem");

    int iBounty = GetLocalInt(oItem, "BOUNTY");

    if(iBounty >= 1 && iBounty <= 3)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_FLAG_BLUE)), oPC);
    }
    else if(iBounty >= 4 && iBounty <= 6)
    {
        effect eEffect = GetFirstEffect(oPC);
        while(GetIsEffectValid(eEffect))
        {
            if (eEffect == EffectVisualEffect(VFX_DUR_FLAG_BLUE))
            {
                RemoveEffect(oPC, eEffect);
            }
            eEffect = GetNextEffect(oPC);
        }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_FLAG_RED)), oPC);
    }

    else if(iBounty >= 7 && iBounty <= 9)
    {
        effect eEffect = GetFirstEffect(oPC);
        while(GetIsEffectValid(eEffect))
        {
            if (eEffect == EffectVisualEffect(VFX_DUR_FLAG_RED))
            {
                RemoveEffect(oPC, eEffect);
            }
            eEffect = GetNextEffect(oPC);
        }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_FLAG_PURPLE_FIXED)), oPC);
    }

    else if(iBounty >= 10)
    {
        effect eEffect = GetFirstEffect(oPC);
        while(GetIsEffectValid(eEffect))
        {
            if (eEffect == EffectVisualEffect(VFX_DUR_FLAG_PURPLE_FIXED))
            {
                RemoveEffect(oPC, eEffect);
            }
            eEffect = GetNextEffect(oPC);
        }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_FLAG_GOLD_FIXED)), oPC);
    }
}

//  This is used to check prohibited names on PC names
void NameChecker(object oPC);
void NameChecker(object oPC)
{
    string sName = GetStringUpperCase(GetName(oPC));
    string sAccount = GetStringUpperCase(GetPCPlayerName(oPC));

    if (FindSubString(sName, "SERVER")      >= 0  ||
        FindSubString(sName, "IDIOT")       >= 0  ||
        FindSubString(sName, "WANKER")      >= 0  ||
        FindSubString(sName, "MASTURBAT")   >= 0  ||
        FindSubString(sName, "SODOM")       >= 0  ||
        FindSubString(sName, "PUSSY")       >= 0  ||
        FindSubString(sName, "RETARD")      >= 0  ||
        FindSubString(sName, "DILDO")       >= 0  ||
        FindSubString(sName, "DOUCHE")      >= 0  ||
        FindSubString(sName, "DUMBASS")     >= 0  ||
        FindSubString(sName, "PISS")        >= 0  ||
        FindSubString(sName, "NIGGER")      >= 0  ||
        FindSubString(sName, "WHORE")       >= 0  ||
        FindSubString(sName, "DICKH")       >= 0  ||
        FindSubString(sName, "CUNT")        >= 0  ||
        FindSubString(sName, "COCK")        >= 0  ||
        FindSubString(sName, "MOTHERFUCK")  >= 0  ||
        FindSubString(sName, "BITCH")       >= 0  ||
        FindSubString(sName, "FUCK")        >= 0  ||
        FindSubString(sName, "SHIT")        >= 0  ||
        FindSubString(sName, "ASSHOLE")     >= 0  ||
        FindSubString(sName, "FAGGOT")      >= 0)
    {
        SpeakString("<cÌwþ> Entering Player: " + sName+
       "<có  > NAME IS PROHIBITED.", TALKVOLUME_SHOUT);

        WriteTimestampedLogEntry("Entering Player: " + sName+
       "<có  > NAME IS PROHIBITED.");

        ClearAllActions(FALSE);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oPC);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), oPC);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBlindness(), oPC);

        PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, ""+
        "OFFENSIVE NAMES ARE PROHIBITED!!!");

        DelayCommand(6.0, NWNX_Administration_DeletePlayerCharacter(oPC, FALSE));

        string sWebhookUrl = "/api/webhooks/472605187761242152/wqmbKttRf4VdSwhbg6C9fhy2GlQdtX8zCqohWwJesbyq3ImNx_s2AUpr0-E_p8m8VQo6/slack";
        string sPCName = "Player: " + GetName(oPC) + " - Account: " + GetPCPlayerName(oPC);
        string CurrentTime = NWNX_Time_GetSystemTime();
        string CurrentDate = NWNX_Time_GetSystemDate();
        string sMessage = sPCName + " - " + GetPCPublicCDKey(oPC) +  " - logged in with a prohibited name: " + CurrentTime + " on: " + CurrentDate + " (GMT)";
//      Send a message to ACN Discord Channel of the client logging in.
        NWNX_WebHook_SendWebHookHTTPS("discordapp.com",sWebhookUrl, sMessage , "Server");
    }

    else if (FindSubString(sAccount, "SERVER")      >= 0  ||
             FindSubString(sAccount, "PENIS")       >= 0  ||
             FindSubString(sAccount, "IDIOT")       >= 0  ||
             FindSubString(sAccount, "WANKER")      >= 0  ||
             FindSubString(sAccount, "MASTURBAT")   >= 0  ||
             FindSubString(sAccount, "SODOM")       >= 0  ||
             FindSubString(sAccount, "PUSSY")       >= 0  ||
             FindSubString(sAccount, "RETARD")      >= 0  ||
             FindSubString(sAccount, "DILDO")       >= 0  ||
             FindSubString(sAccount, "DOUCHE")      >= 0  ||
             FindSubString(sAccount, "DUMBASS")     >= 0  ||
             FindSubString(sAccount, "PISS")        >= 0  ||
             FindSubString(sAccount, "NIGGER")      >= 0  ||
             FindSubString(sAccount, "WHORE")       >= 0  ||
             FindSubString(sAccount, "DICKH")       >= 0  ||
             FindSubString(sAccount, "CUNT")        >= 0  ||
             FindSubString(sAccount, "COCK")        >= 0  ||
             FindSubString(sAccount, "MOTHERFUCK")  >= 0  ||
             FindSubString(sAccount, "BITCH")       >= 0  ||
             FindSubString(sAccount, "FUCK")        >= 0  ||
             FindSubString(sAccount, "SHIT")        >= 0  ||
             FindSubString(sAccount, "ASSH")        >= 0  ||
             FindSubString(sAccount, "FAGGOT")      >= 0)
    {
        SpeakString("<cÌwþ> Entering Player: " + sAccount +
        "<có  > NAME IS PROHIBITED.", TALKVOLUME_SHOUT);

        WriteTimestampedLogEntry("Entering Player: " + sAccount+
        "<có  > NAME IS PROHIBITED.");

        BootPC(oPC, "Offensive Names prohibited");

        string sWebhookUrl = "/api/webhooks/472605187761242152/wqmbKttRf4VdSwhbg6C9fhy2GlQdtX8zCqohWwJesbyq3ImNx_s2AUpr0-E_p8m8VQo6/slack";
        string sPCName = "Player: " + GetName(oPC) + " - Account: " + GetPCPlayerName(oPC);
        string CurrentTime = NWNX_Time_GetSystemTime();
        string CurrentDate = NWNX_Time_GetSystemDate();
        string sMessage = sPCName + " - " + GetPCPublicCDKey(oPC) +  " - logged in with a prohibited account name: " + CurrentTime + " on: " + CurrentDate + " (GMT)";
//      Send a message to ACN Discord Channel of the client logging in.
        NWNX_WebHook_SendWebHookHTTPS("discordapp.com",sWebhookUrl, sMessage , "Server");
    }

}

//  Used on newly created PC's to strip inventory and gold then assign default
//  inventory and gold
void StripPC(object oPC);
void StripPC(object oPC)
{
    object oItem = GetFirstItemInInventory(oPC);
    object oValid = GetItemPossessedBy(oPC, "itm_carp_gem");
    int iGold = GetGold(oPC);

    while (GetIsObjectValid(oItem))
    {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }

    ClearAllActions(FALSE);
    AssignCommand(oPC, TakeGoldFromCreature(iGold, oPC, TRUE));
    CreateItemOnObject("itm_carp_gem", oPC);
    CreateItemOnObject("itm_sequencer", oPC);
    CreateItemOnObject("hgll_check_level", oPC);
    GiveGoldToCreature(oPC, 200);
    SetXP(oPC, 1);
}

//  Raise a PC with full HP, Spells, Feats
void Raise(object oPlayer);
void Raise(object oPlayer)
{
        effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION),
               eBad = GetFirstEffect(oPlayer);

        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oPlayer)), oPlayer);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPlayer);

        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
                {
                    //Remove effect if it is negative.
                    RemoveEffect(oPlayer, eBad);
                }
            eBad = GetNextEffect(oPlayer);
        }
        //Fire cast spell at event for the specified target
        SignalEvent(oPlayer, EventSpellCastAt(OBJECT_SELF, SPELL_RESTORATION, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oPlayer);
}

// * Applies an XP and GP penalty
// * to the player respawning
void ApplyPenalty(object oDead);
void ApplyPenalty(object oDead)
{
    object oBag, oGrave;
    int nGoldToTake = GetGold(oDead)/10, // 15%
        nXP, nPenalty, nHD, nMin, nNewXP;
    float fX = IntToFloat(d100() - 50) / 20.0,
          fY = IntToFloat(d100() - 50) / 20.0;
    location lLocation = GetLocation(oDead);
    vector vRandom = (GetPositionFromLocation(lLocation) + Vector(fX, fY));
    string sName = GetName(oDead);

    // * a cap of 15000gp taken from you
    if (nGoldToTake > 10000)
    {
        nGoldToTake = 10000;
    }


    lLocation = Location(GetArea(oDead), vRandom, GetFacing(oDead));
    oBag = CreateObject(OBJECT_TYPE_PLACEABLE, "bagofgold", lLocation);
    AssignCommand(oBag, TakeGoldFromCreature(nGoldToTake, oDead, TRUE));
    SetName(oBag, "<cúúú>"+sName+"<cúú> Pile of Gold");
    SetLocalInt(oBag, "gold", nGoldToTake);
    DelayCommand(1500.0, DestroyObject(oBag));

    nXP = GetXP(oDead);
    nPenalty = 50 * GetHitDice(oDead);
    nHD = GetHitDice(oDead);
    // * You can not lose a level with this respawning
    nMin = ((nHD * (nHD - 1)) / 2) * 1000;
    nNewXP = nXP - nPenalty;
    if (nNewXP < nMin)
       nNewXP = nMin + 1;
    SetXP(oDead, nNewXP);
    lLocation = GetLocation(oDead);
    oGrave = CreateObject(OBJECT_TYPE_PLACEABLE, "headstone001", lLocation);
    SetName(oGrave, "<cúúú>"+sName+"<cú> Rotting Corpse");
    SetLocalInt (oGrave,"xp_dropped", nPenalty);
    SetLocalString(oGrave, "NAME", sName);
    DelayCommand(1500.0, DestroyObject(oGrave));
    DelayCommand(4.0, FloatingTextStrRefOnCreature(58299, oDead, FALSE));
    DelayCommand(4.8, FloatingTextStrRefOnCreature(58300, oDead, FALSE));

    if (GetXP(oDead) == 0)
    {
        SetXP(oDead, 1);
    }
}

// Determine Base Item Type
int nGetIsWeapon(object oItem);
int nGetIsWeapon(object oItem)
{
    switch (GetBaseItemType(oItem))
    {

        case BASE_ITEM_BASTARDSWORD:
        case BASE_ITEM_BATTLEAXE:
        case BASE_ITEM_CLUB:
        case BASE_ITEM_DAGGER:
        case BASE_ITEM_DIREMACE:
        case BASE_ITEM_DOUBLEAXE:
        case BASE_ITEM_DWARVENWARAXE:
        case BASE_ITEM_GREATAXE:
        case BASE_ITEM_GREATSWORD:
        case BASE_ITEM_HALBERD:
        case BASE_ITEM_HANDAXE:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_HEAVYFLAIL:
        case BASE_ITEM_KAMA:
        case BASE_ITEM_KATANA:
        case BASE_ITEM_KUKRI:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_LIGHTFLAIL:
        case BASE_ITEM_LIGHTHAMMER:
        case BASE_ITEM_LIGHTMACE:
        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_LONGSWORD:
        case BASE_ITEM_MAGICSTAFF:
        case BASE_ITEM_MORNINGSTAR:
        case BASE_ITEM_QUARTERSTAFF:
        case BASE_ITEM_RAPIER:
        case BASE_ITEM_SCIMITAR:
        case BASE_ITEM_SCYTHE:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_SHORTSPEAR:
        case BASE_ITEM_SHORTSWORD:
        case BASE_ITEM_SICKLE:
        case BASE_ITEM_SLING:
        case BASE_ITEM_TRIDENT:
        case BASE_ITEM_TWOBLADEDSWORD:
        case BASE_ITEM_WARHAMMER:
        case BASE_ITEM_WHIP:

        {
            return TRUE;

        }
    }
    return FALSE;
}

//  Check for Traps being set in NO PvP area
void CheckForTraps(object oArea, object oPC);
void CheckForTraps(object oArea, object oPC)
{
    object oTrap = GetNearestTrapToObject(oPC, FALSE);
    string sName = GetName(oPC),
           sLogInName = GetPCPlayerName(oPC),
           sCDKEY = GetPCPublicCDKey(oPC, TRUE);

    if (GetIsObjectValid(oTrap) && GetTrapCreator(oTrap) == oPC)
    {
        SetTrapActive(oTrap, FALSE);
        SetTrapDetectable(oTrap, FALSE);
        SetTrapDetectDC(oTrap, 0);
        SetTrapDisabled(oTrap);
        SetTrapDisarmable(oTrap, TRUE);
        SetTrapDisarmDC(oTrap, 0);
        SetTrapRecoverable(oTrap, TRUE);
        SpeakString("<cú>Player: </c>"+sName+
        "<cú> - Account: </c>"+sLogInName+"<cú> - ID: </c>"+sCDKEY+
        " has set a trap in NO PVP area!", TALKVOLUME_SHOUT);
        ClearAllActions(FALSE);
    }
}

//  Prevent traps from being stacked by determing a specified distance in meters
void NoTrapStacking(object oPC, object oItem);
void NoTrapStacking(object oPC, object oItem)
{
    string sTrapResRef = GetResRef(oItem);
    object oNewTrap = GetNearestTrapToObject(oPC, FALSE);
    object oOldTrap = GetNearestObject(OBJECT_TYPE_TRIGGER, oNewTrap, 1);
    string sName = GetName(oPC),
           sLogInName = GetPCPlayerName(oPC),
           sCDKEY = GetPCPublicCDKey(oPC, TRUE);
    float fTrapSpacing = GetDistanceBetween(oNewTrap, oOldTrap);
    int iTrapSpacing = FloatToInt(fTrapSpacing);

    if (iTrapSpacing <= 2)
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            SetTrapActive(oNewTrap, FALSE);
            SetTrapDetectable(oNewTrap, FALSE);
            SetTrapDetectDC(oNewTrap, 0);
            SetTrapDisabled(oNewTrap);
            SetTrapDisarmable(oNewTrap, TRUE);
            SetTrapDisarmDC(oNewTrap, 0);
            SetTrapRecoverable(oNewTrap, TRUE);

            CreateItemOnObject(sTrapResRef, oPC, 1);

            FloatingTextStringOnCreature("Traps cannot be stacked", oPC, FALSE);

            SendMessageToAllDMs("<cþf >Player: </c>"+sName+
            "<cþf > Account: </c>"+sLogInName+"<cþf > - ID: </c>"+sCDKEY+
            "<cþf > has tried to stack traps!");
        }
}

//  Check items being dropped and determine what action to take
void CheckDroppedItem(object oItem, object oPC);
void CheckDroppedItem(object oItem, object oPC)
{
    object oDropped = (GetNearestObject(OBJECT_TYPE_ITEM, oPC));
    int nGold = 0;
    int nMaxValue = GetGoldPieceValue(oItem);
    float nMultiplier = 0.1;
    string sString = "Asterius";

    if (oDropped == oItem)
    {
        if (GetLocalString(oItem, "NO_AMMO_SALE") == "TRUE")
        {
            FloatingTextStringOnCreature("Market bought " + GetName(oItem) + " for "
            + "1 gp.", oPC);
            GiveGoldToCreature(oPC, 1);
            DestroyObject(oItem);
            return;
        }

        if (GetName(oItem, TRUE) == sString)
        {
            FloatingTextStringOnCreature("Market bought " + GetName(oItem) + " for "
            + "1 gp.", oPC);
            GiveGoldToCreature(oPC, 1);
            DestroyObject(oItem);
            return;
        }

        if (GetObjectType(oItem) != OBJECT_TYPE_ITEM)
        {
            FloatingTextStringOnCreature("You may only break down items for gold!", oPC, FALSE);
            CopyItem(oItem, oPC, TRUE);
            DestroyObject(oItem);
            return;
        }

        if (GetPlotFlag(oItem))
        {
            FloatingTextStringOnCreature("You cannot break down plot items!", oPC, FALSE);
            CopyItem(oItem, oPC, TRUE);
            DestroyObject(oItem);
            return;
        }
/*
        if (GetBaseItemType(oItem) == BASE_ITEM_ARROW       ||
            GetBaseItemType(oItem) == BASE_ITEM_BOLT        ||
            GetBaseItemType(oItem) == BASE_ITEM_BULLET      ||
            GetBaseItemType(oItem) == BASE_ITEM_DART        ||
            GetBaseItemType(oItem) == BASE_ITEM_SHURIKEN    ||
            GetBaseItemType(oItem) == BASE_ITEM_TRAPKIT     ||
            GetBaseItemType(oItem) == BASE_ITEM_THROWINGAXE)
        {
            FloatingTextStringOnCreature("Market bought " + GetName(oItem) + " for "
            + "1 gp.", oPC);
            GiveGoldToCreature(oPC, 1);
            CopyItem(oItem, GetObjectByTag("MarketMerchant"), TRUE);
            DestroyObject(oItem);
            return;
        }
*/
        nGold = FloatToInt(GetGoldPieceValue(oItem) * nMultiplier);

        if (nGold < 1)
        {
            nGold = 1;
        }

        FloatingTextStringOnCreature("Market bought " + GetName(oItem) + " for "
        + IntToString(nGold) + " gp.", oPC);
        GiveGoldToCreature(oPC, nGold);
        CopyItem(oItem, GetObjectByTag("MarketMerchant"), TRUE);
        DestroyObject(oItem);
    }
}

string PVP_GetRandomShoutString()
{
    string sAction;
    switch (Random(25))
    {
        case 0: sAction = "pk'd"; break;
        case 1: sAction = "destroyed"; break;
        case 2: sAction = "crushed"; break;
        case 3: sAction = "eradicated"; break;
        case 4: sAction = "annihilated"; break;
        case 5: sAction = "exterminated"; break;
        case 7: sAction = "neutralized"; break;
        case 8: sAction = "slaughtered"; break;
        case 9: sAction = "gutted"; break;
        case 10: sAction = "smashed"; break;
        case 11: sAction = "wrecked"; break;
        case 12: sAction = "butchered"; break;
        case 13: sAction = "mutilated"; break;
        case 14: sAction = "slayed"; break;
        case 15: sAction = "pulverized"; break;
        case 16: sAction = "eliminated"; break;
        case 17: sAction = "obliterated"; break;
        case 18: sAction = "purged"; break;
        case 19: sAction = "decimated"; break;
        case 20: sAction = "murdered"; break;
        case 21: sAction = "massacred"; break;
        case 22: sAction = "eviscerated"; break;
        case 23: sAction = "crushed"; break;
        case 24: sAction = "assassinated"; break;

    }

    return sAction;
}

//  Strip all buffs and reapply Haste
void RemoveAllEffects(object oCreature);
void RemoveAllEffects(object oCreature)
{
    effect eCurrentEffect = GetFirstEffect(oCreature);
    while (GetIsEffectValid(eCurrentEffect))
    {
        RemoveEffect(oCreature,eCurrentEffect);
        eCurrentEffect = GetNextEffect(oCreature);
    }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oCreature);
}

//  Max HP script by Ynnead.  Currently the .ini file for the server or nwnx
//  doesn't properly work for unknown reasons.
void OnLevel_MaxHP(object oPC);
void OnLevel_MaxHP(object oPC)
{
    //Determine how much HP the player should gain
    int nClass = NWNX_Creature_GetClassByLevel(oPC, GetHitDice(oPC));
    int nClassDie = 0;
    int nFeatBonus = 0;

    if(GetHasFeat(FEAT_TOUGHNESS, oPC))
        nFeatBonus = 1;

    switch(nClass)
    {
        case CLASS_TYPE_DWARVENDEFENDER:
        case CLASS_TYPE_BARBARIAN:
            nClassDie = 12; break;
        case CLASS_TYPE_DIVINECHAMPION:
        case CLASS_TYPE_WEAPON_MASTER:
        case CLASS_TYPE_PALADIN:
        case CLASS_TYPE_RANGER:
        case CLASS_TYPE_BLACKGUARD:
        case CLASS_TYPE_FIGHTER:
            nClassDie = 10; break;
        case CLASS_TYPE_SHADOWDANCER:
        case CLASS_TYPE_DRUID:
        case CLASS_TYPE_ARCANE_ARCHER:
        case CLASS_TYPE_MONK:
        case CLASS_TYPE_SHIFTER:
        case CLASS_TYPE_CLERIC:
            nClassDie = 8; break;
        case CLASS_TYPE_ROGUE:
        case CLASS_TYPE_ASSASSIN:
        case CLASS_TYPE_BARD:
        case CLASS_TYPE_HARPER:
        case CLASS_TYPE_PALEMASTER:
            nClassDie = 6; break;
        case CLASS_TYPE_SORCERER:
        case CLASS_TYPE_WIZARD:
            nClassDie = 4; break;
        case CLASS_TYPE_DRAGONDISCIPLE:
        {
            int rddLevel = GetLevelByClass(CLASS_TYPE_DRAGONDISCIPLE, oPC);

            if(rddLevel >= 6)
                nClassDie = 10;
            else if(rddLevel >= 4)
                nClassDie = 8;
            else
                nClassDie = 6;
        }
    }

    //Tell the player how much HP they gained after leveling
    int conMod = (GetAbilityScore(oPC, ABILITY_CONSTITUTION, TRUE) - 10) / 2;
    int maxHP = nClassDie + nFeatBonus + conMod;

    DelayCommand(1.0, FloatingTextStringOnCreature("<cfÌþ>You gain </c>" + IntToString(maxHP) +
    "<cfÌþ> hitpoints from gaining a level.</c>", oPC, FALSE));

    //This function changes only the 'role' the player makes for how much HP was gained on that level
    NWNX_Creature_SetMaxHitPointsByLevel(oPC, GetHitDice(oPC), nClassDie);
}

/*void main() {}
