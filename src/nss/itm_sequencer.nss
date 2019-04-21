//::///////////////////////////////////////////////
//::Rod of Fast Buffing Item Event Script
/*
    This is the event script for the rod of fast
    buffing. This rod allows casters to group
    all their buffing spells into a single action
*/
//:://////////////////////////////////////////////
#include "x2_inc_switches"

//showing spell names is a 2da file hit. When storing
//a lot of spells this can cause a significant delay
//When this value is false it will just show spell
//ID numbers.
const int knShowSpellName = TRUE;

//used to store the number of spells on the rod
const string ksNumSpells = "NumSpells";
//used as a base to store a spell ID to cast
const string ksCastSpellId = "CastSpells";
//stores the spell name when you store a spell.
const string ksCastSpellName = "SpellName";

void main()
{
    int nEvent = GetUserDefinedItemEventNumber();

    object oPC;         //The caster
    object oItem;       //This item
    object oTarget;
    int nSpellId;       //Used to hold the ID of the current spell;
    int nNumOfSpells;   //Used to hold the current number of spells on the rod
    int nHostile = StringToInt(Get2DAString("spells","HostileSetting",GetSpellId()));
    int n;
    string strSpellName;//Used to hold the Spell Name

    int nResult = X2_EXECUTE_SCRIPT_CONTINUE;

    int nID = GetSpellId();
    string sSpell = IntToString(nID);

    //this handles "use" or activation of item.
    if (nEvent ==  X2_ITEM_EVENT_ACTIVATE)
    {
        oItem = GetItemActivated();
        oPC = GetItemActivator();

        //Disable use in combat
/*        if(GetIsInCombat(oPC))
        {
            FloatingTextStringOnCreature("<cú>Can't use rod in combat"t" oPC, FALSE);
            return;
        }
*/
        //get number of spells stored
        nNumOfSpells = GetLocalInt(oItem, ksNumSpells);
        FloatingTextStringOnCreature("Attempting to fast cast " + IntToString(nNumOfSpells) + " spells.", oPC, FALSE);

        if (oItem == GetItemActivatedTarget())
        {
            for(n = 1; n <= nNumOfSpells; n++)
            {
                DeleteLocalInt(oItem, ksCastSpellId + IntToString(n));
            }
            SetLocalInt(oItem, ksNumSpells , 0);
            FloatingTextStringOnCreature("Spells deleted.", oPC, FALSE);
            return;
        }
        else
        {
//            SetLocalInt(oPC, "SEQUENCER", TRUE);
//            DelayCommand(1.0, DeleteLocalInt(oPC, "SEQUENCER"));
            //iterate through array of spells and store casting action
            int n;
            for(n = 1; n <= nNumOfSpells; n++)
            {
                //get spell id stored at location n
                nSpellId = GetLocalInt(oItem, ksCastSpellId + IntToString(n));

                //Get the name of the spell stored at location n
                strSpellName = GetLocalString(oItem, ksCastSpellName + IntToString(n));

                FloatingTextStringOnCreature("Casting spell "
                            + strSpellName
                            + " at postion "
                            + IntToString(n)
                            + " on item", oPC, FALSE);

                if(0 != nSpellId //if there was a valid spell id stored
                && 1 <= GetHasSpell(nSpellId, oPC)) //and the caster has access to the spell
                {
                    //Store cast action. The key here is to set cheatcasting
                    //to false and level to 0. This will cause the caster
                    //to cast the spell himself using the first available
                    //slot.

                    AssignCommand(oPC, ActionCastSpellAtObject(nSpellId, oPC, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
                }
            }
        }
    } //This Event Handles storing the spells
    else if (nEvent ==  X2_ITEM_EVENT_SPELLCAST_AT)
    {
        oItem = GetSpellTargetObject();
        nSpellId = GetSpellId();
        oPC = OBJECT_SELF;
        nNumOfSpells = GetLocalInt(oItem, ksNumSpells) + 1;

        SetLocalInt(oItem, ksNumSpells , nNumOfSpells);
        SetLocalInt(oItem, ksCastSpellId + IntToString(nNumOfSpells), nSpellId);


    if(nHostile ==1)
    {
        FloatingTextStrRefOnCreature(83885,OBJECT_SELF);
        return;// TRUE; // no hostile spells on sequencers, sorry ya munchkins :)
    }
        strSpellName = (knShowSpellName)
                        ? Get2DAString("spells", "Label", nSpellId)
                        : IntToString(nSpellId);

        SetLocalString(oItem, ksCastSpellName + IntToString(nNumOfSpells), strSpellName);

        FloatingTextStringOnCreature("Storing "
                          + strSpellName
                          + " at postion "
                          + IntToString(nNumOfSpells)
                          + " on item", oPC, FALSE);

        nResult = X2_EXECUTE_SCRIPT_END;

    }

    //Pass the return value back to the calling script
    SetExecutedScriptReturnValue(nResult);
}
