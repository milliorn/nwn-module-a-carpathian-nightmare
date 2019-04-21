/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...

This file is used for constants and structs needed for the subrace system
*/



/*
//Includes
*/
#include "nwnx_creature"



/*
//constants
*/

object oMod = GetModule();

const int FIRST_LOG_IN_XP = 1;

// Class Type Binary Representation Constants
const int CLASS_RESTRICT_BARBARIAN              = 1;
const int CLASS_RESTRICT_BARD                   = 2;
const int CLASS_RESTRICT_CLERIC                 = 4;
const int CLASS_RESTRICT_DRUID                  = 8;
const int CLASS_RESTRICT_FIGHTER                = 16;
const int CLASS_RESTRICT_MONK                   = 32;
const int CLASS_RESTRICT_PALADIN                = 64;
const int CLASS_RESTRICT_RANGER                 = 128;
const int CLASS_RESTRICT_ROGUE                  = 256;
const int CLASS_RESTRICT_SORCERER               = 512;
const int CLASS_RESTRICT_WIZARD                 = 1024;
const int CLASS_RESTRICT_ARCANE_ARCHER          = 2048;
const int CLASS_RESTRICT_ASSASSIN               = 4096;
const int CLASS_RESTRICT_BLACKGUARD             = 8192;
const int CLASS_RESTRICT_DIVINE_CHAMPION        = 16384;
const int CLASS_RESTRICT_DRAGON_DISCIPLE        = 32768;
const int CLASS_RESTRICT_DWARVEN_DEFENDER       = 65536;
const int CLASS_RESTRICT_HARPER                 = 131072;
const int CLASS_RESTRICT_PALE_MASTER            = 262144;
const int CLASS_RESTRICT_PURPLE_DRAGON_KNIGHT   = 524288;
const int CLASS_RESTRICT_SHADOWDANCER           = 1048576;
const int CLASS_RESTRICT_SHIFTER                = 2097152;
const int CLASS_RESTRICT_WEAPON_MASTER          = 4194304;
const int CLASS_RESTRICT_NONE                   = 8388607;

// Racial Type Binary Representation Constants
const int RACE_RESTRICT_DWARF      = 1;
const int RACE_RESTRICT_ELF        = 2;
const int RACE_RESTRICT_GNOME      = 4;
const int RACE_RESTRICT_HALFELF    = 8;
const int RACE_RESTRICT_HALFLING   = 16;
const int RACE_RESTRICT_HALFORC    = 32;
const int RACE_RESTRICT_HUMAN      = 64;
const int RACE_RESTRICT_NONE       = 127;

// Alignment Binary Representation Constants
const int ALIGN_RESTRICT_GOOD       = 1;
const int ALIGN_RESTRICT_NEUTRAL1   = 2;
const int ALIGN_RESTRICT_EVIL       = 4;
const int ALIGN_RESTRICT_LAWFUL     = 8;
const int ALIGN_RESTRICT_NEUTRAL2   = 16;
const int ALIGN_RESTRICT_CHAOTIC    = 32;
const int ALIGN_RESTRICT_NONE        = 63;

// Subrace Messages
const string APPLYING_SUBRACE = "<cþ>Your subrace is being applied to your character. Please wait a moment.</c>";
const string APPLYING_SUBRACE_SKIN = "<cþ>Your subrace skin is being applied to your character.</c>";
const string APPLYING_SUBRACE_CLAW = "<cþ>Your subrace claws are being applied to your character.</c>";
const string APPLYING_SPELL_RESISTANCE = "<cþ>Your subrace spell resistance is being applied to your character.</c>";
const string SUBRACE_ITEMS_APPLIED = "<cþ>Your subrace items have been applied to your character.</c>";
const string INVALID_SUBRACE = "<cþ>Error:</c> <cþþþ>The subrace name you have entered doesn't exist.</c>";
const string INVALID_CLASS = "<cþ>Error:</c> <cþþþ>You have chosen an incorrect class for this subrace.</c>";
const string INVALID_RACE = "<cþ>Error:</c> <cþþþ>You have chosen an incorrect race for this subrace.</c>";
const string INVALID_ALIGNMENT = "<cþ>Error:</c> <cþþþ>You have chosen an incorrect alignment for this subrace.</c>";
const string INVALID_EQUIPMENT = "<cþ>Error:</c> <cþþþ>You can't equip this type of item onto your subrace.</c>";
const string RELEVEL_CHARACTER = "<cþþþ>You must re-level your character.</c>";

