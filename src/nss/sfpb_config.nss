//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_config
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////

/* WARNING!!!!! Please Read...

   If any changes are made to this script, you must
   use the "Build Module" option in toolset and check
   the "Scripts" box in order to compile (build) all
   scripts, failing to do so will result in any changes
   in thi sscript being overwritten back to its original
   state.....
*/

// Set this TRUE if you want the banking system to use
// the players CD Key, or FALSE to use the players
// account name.
// I recommend using the players CD Keys, it is a much
// secure option.
const int USE_CD_KEY = TRUE;

// Do you want players to be able to share items and gold
// between their own characters....
// If this is set TRUE, then players will be able to retrieve
// their items and gold with any of their own characters, if set
// FALSE, then they will only be able to retrieve items or gold
// that were saved on particular characters.
const int CHARACTER_SHARING = TRUE;

// Set the maximum amount of items allowed to be stored
// per player. I strongly recommend setting this no higher
// than 100. I cannot garuntee the system will function without
// any ill effects if you exceed this.
const int MAX_ITEMS = 30;

// For testing purposes, if testing this system in single player
// mode, make sure this is set TRUE. Please bare in mind that
// if testing this in single player mode or with a local vault
// server any items saved to the database will re-appear into the
// characters inventory because the character is not saved in the
// same way as a server vault.
const int SINGLE_PLAYER_MODE = TRUE;

////////////////////////////////////////////////////////////////////////////////
// DO NOT TOUCH ANY FUNCTIONS OR CONSANTS BELOW THIS LINE!!!!!!!
////////////////////////////////////////////////////////////////////////////////

const string DATABASE_GOLD = "ACN_GOLD_BANK";
const string DATABASE_ITEM = "ACN_ITEM_BANK";

string SF_GetPlayerID(object oPC)
{
    string sID;
    if (USE_CD_KEY)
        sID = GetPCPublicCDKey(oPC, SINGLE_PLAYER_MODE);
    else
        sID = GetPCPlayerName(oPC);
    if (!CHARACTER_SHARING)
        sID += "_" + GetName(oPC);
    return GetSubString(sID, 0, 20);
}

////////////////////////////////////////////////////////////////////////////////

/*void main (){}
