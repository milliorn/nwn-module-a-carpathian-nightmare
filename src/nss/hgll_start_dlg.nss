#include "zdlg_include_i"
#include "hgll_func_inc"
#include "nwnx_creature"
// This script fires off the leveling conversation, if the PC meets certain requirements.
// It goes onused of a placeable.
void main()
{
    object oPC = GetLastUsedBy();

    DeleteAddAbilityQue(oPC);
    DeleteAddFeatQue(oPC);
    DeleteAddSkillQue(oPC);
    DeleteAddSpellQue(oPC);

    ///Check for and remove all skill and feat adding gear because it is impossible to distinguish between feats on the character and feats on their gear.
    int nSkFtItemCheck = 0;
    int iCount;
    int iDruid = GetLevelByClass(CLASS_TYPE_DRUID, oPC);
    string sName = GetName(oPC);

    object oItem;
    for(iCount = 0; iCount < NUM_INVENTORY_SLOTS; iCount++)
        {
        oItem = GetItemInSlot(iCount, oPC);
        if(GetItemHasItemProperty(oItem, ITEM_PROPERTY_SKILL_BONUS) || GetItemHasItemProperty(oItem, ITEM_PROPERTY_BONUS_FEAT))
            {
            AssignCommand(oPC, ActionUnequipItem(oItem));
            nSkFtItemCheck = 1;
            }
        }
    if (nSkFtItemCheck == 1)
        {
        FloatingTextStringOnCreature("You were stripped of all gear with skill or feat bonuses. Please use the leveler again.", oPC, FALSE);
        return;
        }

//  Force an alignment selection if they are Neutral alignment and NOT Druid
    if (iDruid == 0)
    {
        switch( GetAlignmentGoodEvil(oPC))
        {
            case ALIGNMENT_NEUTRAL:
            {
/*                int nXP = GetXP(oPC);
                int nHD = GetHitDice(oPC);
                SetXP(oPC, (((nHD*(nHD-1))/2*1000)-1));
                DelayCommand(1.0, SetXP(oPC, nXP));
*/
                int iAlign = d2();

                if (iAlign == 1)
                {
                    AdjustAlignment(oPC, ALIGNMENT_GOOD, 100, FALSE);

                    FloatingTextStringOnCreature("<cþf > WARNING!  You were given"
                    + " a random alignment(Good) because you do not have a Druid Class"
                    + " Level to take Neutral alignment!.  Use !chat commands.  Read your journal.", oPC, FALSE);

                    SendMessageToAllDMs(sName + "<cþf > is attempted to levelup without a Good/Evil Alignment."
                    + " Player was give a random alignment: Good.</c>");
                }

                else if (iAlign == 2)
                {
                    AdjustAlignment(oPC, ALIGNMENT_EVIL, 100, FALSE);

                    FloatingTextStringOnCreature("<cþf > WARNING!  You were given"
                    + " a random alignment (Evil) because you do not have a Druid Class"
                    + " Level to take Neutral alignment!.  Use !chat commands.  Read your journal.", oPC, FALSE);

                    SendMessageToAllDMs(sName + "<cþf > is attempted to levelup without a Good/Evil Alignment."
                    + " Player was give a random alignment: Good.</c>");
                }
            }
        }
    }

/*//  This is to prevent a massive skill dump in legendary levels.  Without it you could max out a single skill.
    if (NWNX_Creature_GetSkillPointsRemaining(oPC) > 0)
    {
        FloatingTextStringOnCreature("You must relevel your character and use all your skill points before you can use the leveler.", oPC, FALSE);
        return;
    }
    /////////////
*/
    ExportSingleCharacter(oPC);//save the character here for future Leto edits
    ReplenishLimitedUseFeats(oPC);
    //struct xAbility base;
    int nCClass;
    int nSkillPoints;

    int nCheck = GetHasXPForNextLL(oPC);

    switch (nCheck)
    {
        //PC is at max level
        case -2:
            SendMessageToPC(oPC, "You are already level 60, and cannot advance any further.");
            break;
        case -1:
            SendMessageToPC(oPC, "You must be level 40 to gain legendary levels.");
            break;
        case 0:
            SendMessageToPC(oPC, "You still need " + IntToString(GetXPNeededForNextLL(oPC)) + " experience points before you can gain another level.");
            break;
        case 1:
            //covers any conditions you add other than level and experience
            //by default this always returns TRUE, you may set additional conditions
            if (GetCanGainLL(oPC))
                {
                //Get base abilities and skills
                //base = GetBaseAbilities(oPC);

                //get highest leveled class
                nCClass = GetControlClass(oPC);
                SetLocalInt(oPC, "nCClass", nCClass);

                //determine how many skill points player should have
                nSkillPoints =  NWNX_Creature_GetSkillPointsRemaining(oPC);
                nSkillPoints += GetSkillPointsGainedOnLevelUp(oPC);
                SetLocalInt(oPC, "PointsAvailable", nSkillPoints);

                //Declare Tracking Variables////////
                SetLocalString(oPC, "TrackChanges", "");//String to track description of changes to be made

                // Start up the conversation between ourselves and////////
                // the clicking player.  We make the conversation
                // private since it's really a menu selection and
                // not a real conversation.  We also don't want it to
                // play a hello.
                StartDlg( oPC, OBJECT_SELF, "hgll_dlg_leveler", TRUE, FALSE );
                }
            else
                {
                //explain why the conditions other than level and experience failed
                SendMessageToPC(oPC, "You are not able to take legendary levels with your current achievements.");
                }
            break;
    }
    DoDebug(oPC, "GetHasXPForNextLL returned "+IntToString(nCheck));
}
