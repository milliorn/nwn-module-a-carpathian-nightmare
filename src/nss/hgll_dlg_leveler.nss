#include "zdlg_include_i"
#include "hgll_func_inc"

const string FIRST_PAGE = "skills_select";
const string SECOND_PAGE = "skills_confirm";
const string THIRD_PAGE = "feat_select";
const string FOURTH_PAGE = "feat_confirm";
const string FIFTH_PAGE = "stat_select";
const string SIXTH_PAGE = "stat_confirm";
const string SIXPOINTONE_PAGE = "spells_ask";
const string SIXPOINTTWO_PAGE = "spells_level";
const string SIXPOINTTHREE_PAGE = "spells_remove_select";
const string SIXPOINTFOUR_PAGE = "spells_replace_select";
const string SIXPOINTFIVE_PAGE = "spells_confirm";
const string SEVENTH_PAGE = "final_confirm";

void Init()
{
    string page = GetDlgPageString();
    int nSkill;
    int nFeat;
    int nCount = 0;
    int nCount2 = 0;
    int nCount3;
    string sCrossClass;
    object oPC = GetPcDlgSpeaker();

    if( page == "" )
        {
        if( GetElementCount(FIRST_PAGE, oPC) == 0 )
            {
            for(nSkill = 0; nSkill < SKILL_ALL_SKILLS; nSkill++) //loop through the skill constants
                {
                if (GetIsSkillAvailable(oPC, nSkill)) //if the PC can take the skill, it is displayed
                    {
                    if (GetCostOfSkill(GetControlClass(oPC), nSkill) == 2)
                        {
                        sCrossClass = " [Cross-Class]";
                        }
                    else
                        {
                        sCrossClass = "";
                        }
                    AddStringElement(GetNameOfSkill(nSkill) + sCrossClass, FIRST_PAGE, oPC );
                    ReplaceIntElement(nCount, nSkill, FIRST_PAGE, oPC); //store the skill int with the skill
                    DoDebug(oPC, "Response Number: " + IntToString(nCount) + ", Skill Number: " + IntToString(nSkill) + ".");
                    nCount ++;
                    }
                }
            AddStringElement ("I cannot or do not wish to select any more skills at this time.", FIRST_PAGE, oPC );
            }
        if( GetElementCount(SECOND_PAGE, oPC) == 0 )
            {
            AddStringElement("Yes.", SECOND_PAGE, oPC );
            AddStringElement("No. I want to start over.", SECOND_PAGE, oPC );
            }
        if( GetElementCount(THIRD_PAGE, oPC) == 0 )
            {
            if (GetGainsFeatOnLevelUp(oPC))
                {
                DelayCommand(0.2, ExecuteScript("hgll_featlist_01", oPC));//these scripts break up the below feat loop into 11 parts to avoid TMI errors
                DelayCommand(0.4, ExecuteScript("hgll_featlist_02", oPC));
                DelayCommand(0.6, ExecuteScript("hgll_featlist_03", oPC));
                DelayCommand(0.8, ExecuteScript("hgll_featlist_04", oPC));
                DelayCommand(1.0, ExecuteScript("hgll_featlist_05", oPC));
                DelayCommand(1.2, ExecuteScript("hgll_featlist_06", oPC));
                DelayCommand(1.4, ExecuteScript("hgll_featlist_07", oPC));
                DelayCommand(1.6, ExecuteScript("hgll_featlist_08", oPC));
                DelayCommand(1.8, ExecuteScript("hgll_featlist_09", oPC));
                DelayCommand(2.0, ExecuteScript("hgll_featlist_10", oPC));
                DelayCommand(2.2, ExecuteScript("hgll_featlist_11", oPC));
                /*
                for(nFeat = 0; nFeat < 1072; nFeat++)//loop through the feat constants
                    {
                    if (GetIsFeatAvailable(nFeat, oPC))//if the PC can take the feat, it is displayed
                        {
                        AddStringElement(GetNameOfFeat(nFeat), THIRD_PAGE, oPC );
                        ReplaceIntElement(nCount2, nFeat, THIRD_PAGE, oPC);//store the skill int with the skill
                        DoDebug(oPC, "Response Number: " + IntToString(nCount2) + ", Feat Number: " + IntToString(nFeat) + ".");
                        nCount2 ++;
                        }
                    }
                */
                }
            }
        if( GetElementCount(FOURTH_PAGE, oPC) == 0)
            {
            AddStringElement("Yes.", FOURTH_PAGE, oPC );
            AddStringElement("No. I want to start over.", FOURTH_PAGE, oPC );
            }
        if( GetElementCount(FIFTH_PAGE, oPC ) == 0)
            {
            AddStringElement("Strength", FIFTH_PAGE, oPC );
            ReplaceIntElement(0, ABILITY_STRENGTH, FIFTH_PAGE, oPC);
            AddStringElement("Dexterity", FIFTH_PAGE, oPC );
            ReplaceIntElement(1, ABILITY_DEXTERITY, FIFTH_PAGE, oPC);
            AddStringElement("Constitution", FIFTH_PAGE, oPC );
            ReplaceIntElement(2, ABILITY_CONSTITUTION, FIFTH_PAGE, oPC);
            AddStringElement("Intelligence", FIFTH_PAGE, oPC );
            ReplaceIntElement(3, ABILITY_INTELLIGENCE, FIFTH_PAGE, oPC);
            AddStringElement("Wisdom", FIFTH_PAGE, oPC );
            ReplaceIntElement(4, ABILITY_WISDOM, FIFTH_PAGE, oPC);
            AddStringElement("Charisma", FIFTH_PAGE, oPC );
            ReplaceIntElement(5, ABILITY_CHARISMA, FIFTH_PAGE, oPC);
            }
        if( GetElementCount(SIXTH_PAGE, oPC) == 0)
            {
            AddStringElement("Yes.", SIXTH_PAGE, oPC );
            AddStringElement("No. I want to start over.", SIXTH_PAGE, oPC );
            }
        if( GetElementCount(SIXPOINTONE_PAGE, oPC) == 0)
            {
            AddStringElement("Yes.", SIXPOINTONE_PAGE, oPC );
            AddStringElement("No.", SIXPOINTONE_PAGE, oPC );
            }
        if( GetElementCount(SIXPOINTTWO_PAGE, oPC) == 0)
            {
            for (nCount3 = 1; nCount3 < 10; nCount3++)
            {
                AddStringElement("Level " + IntToString(nCount3), SIXPOINTTWO_PAGE, oPC );
            }
            AddStringElement("Nevermind, I want to start over.", SIXPOINTTWO_PAGE, oPC );
            }
        if( GetElementCount(SIXPOINTFIVE_PAGE, oPC) == 0)     //skip 6.3 and 6.4 because the lists are totally dependant on 6.2
            {
            AddStringElement("Yes, and I want to change more spells.", SIXPOINTFIVE_PAGE, oPC );
            AddStringElement("Yes, and I'm done changing spells.", SIXPOINTFIVE_PAGE, oPC );
            AddStringElement("No, I want to start over.", SIXPOINTFIVE_PAGE, oPC );
            }
        if( GetElementCount(SEVENTH_PAGE, oPC ) == 0)
            {
            AddStringElement("Yes.", SEVENTH_PAGE, oPC );
            AddStringElement("No. I want to start over.", SEVENTH_PAGE, oPC );
            }
        }
}

void CleanUp()
{
    // Delete the list we create in Init()
    object oPC = GetPcDlgSpeaker();
    int nX;
    DeleteList( FIRST_PAGE, oPC );
    DeleteList( SECOND_PAGE, oPC );
    DeleteList( THIRD_PAGE, oPC );
    DeleteList( FOURTH_PAGE, oPC );
    DeleteList( FIFTH_PAGE, oPC );
    DeleteList( SIXTH_PAGE, oPC );
    DeleteList( SIXPOINTONE_PAGE, oPC );
    DeleteList( SIXPOINTTWO_PAGE, oPC );
    DeleteList( SIXPOINTTHREE_PAGE, oPC );
    DeleteList( SIXPOINTFOUR_PAGE, oPC );
    DeleteList( SIXPOINTFIVE_PAGE, oPC );
    DeleteList( SEVENTH_PAGE, oPC );
    DeleteLocalInt(oPC, "SpellToRemove");
    DeleteLocalString(oPC, "SpellToRemove");
    DeleteLocalString(oPC, "SpellToAdd");
    DeleteLocalInt(oPC, "SpellToAdd");
    for(nX = 0; nX < 570; nX++)
        {
        DeleteLocalInt(oPC, "SpellRemoved"+IntToString(nX));
        DeleteLocalInt(oPC, "SpellAdded"+IntToString(nX));
        }
}

void PageInit()
{
    string page = GetDlgPageString();
    object oPC= GetPcDlgSpeaker();

    if( page == "" || page == "skill")
        {
        // Then just give the first prompt.
        SetDlgPrompt("Please select a skill to add a point to." +
                     " You have " + IntToString(GetLocalInt(oPC, "PointsAvailable")) +
                     " points remaining to spend.");
        SetDlgResponseList( FIRST_PAGE, oPC );
        }
    else if( page == "skillresponse" )
        {
        SetDlgPrompt("You selected " + GetLocalString(oPC, "LastResponse") +
                     ". Is that the skill you want?");
        SetDlgResponseList( SECOND_PAGE, oPC );
        }
    else if( page == "feat" )
        {
        SetDlgPrompt("Please select the feat you would like to gain this level.");
        SetDlgResponseList( THIRD_PAGE, oPC );
        }
    else if( page == "featresponse" )
        {
        SetDlgPrompt("You selected " + GetLocalString(oPC, "LastResponse") +
                     ". Is that the feat you want?");
        SetDlgResponseList( FOURTH_PAGE, oPC );
        }
    else if( page == "stat" )
        {
        SetDlgPrompt( "Please select the stat you would like to gain this level.");
        SetDlgResponseList( FIFTH_PAGE, oPC );
        }
    else if( page == "statresponse" )
        {
        SetDlgPrompt( "You selected " + GetLocalString(oPC, "LastResponse") +
                      ". Is that the stat you want?");
        SetDlgResponseList( SIXTH_PAGE, oPC );
        }
    else if( page == "spells_ask" )
        {
        SetDlgPrompt( "Would you like to change any of your spell selections?");
        SetDlgResponseList( SIXPOINTONE_PAGE, oPC );
        }
    else if( page == "spells_level" )
        {
        SetDlgPrompt( "What level spell would you like to change?");
        SetDlgResponseList( SIXPOINTTWO_PAGE, oPC );
        }
    else if( page == "spells_remove_select" )
        {
        SetDlgPrompt( "What spell would you like to remove?");
        SetDlgResponseList( SIXPOINTTHREE_PAGE, oPC );
        }
    else if( page == "spells_replace_select" )
        {
        SetDlgPrompt( "What spell would you like to have instead of " + GetLocalString(oPC, "SpellToRemove") + "?");
        SetDlgResponseList( SIXPOINTFOUR_PAGE, oPC );
        }
    else if( page == "spells_confirm" )
        {
        SetDlgPrompt( "You have chosen to remove " + GetLocalString(oPC, "SpellToRemove") + " and replace it with " + GetLocalString(oPC, "SpellToAdd") + ". Is that correct?");
        SetDlgResponseList( SIXPOINTFIVE_PAGE, oPC );
        }
    else if( page == "finish" )
        {
        SetDlgPrompt( "You will gain the maximum number of hitpoints automatically, as well as any saving throw bonuses. You have selected " +
                      GetLocalString(oPC, "TrackChanges") +
                      "are these the selections you want?");
        SetDlgResponseList( SEVENTH_PAGE, oPC );
        }
}

void HandleSelection()
{
    string page = GetDlgPageString();
    object oPC= GetPcDlgSpeaker();
    int nElements;
    int selection = GetDlgSelection();
    int nSkill;
    int nFeat;
    int nStat;
    int nHP;
    string sName;
    string sTrack;
    string sChange;
    string sCrossClass;
    int nChange;
    int nTInt;
    int nSLRSkill;
    int nSLRCount;
    int nSpell, nSpell2;
    int nSpellCount;
    int nPointsAvailable;
    int nLevel;
    int nConCla = GetControlClass(oPC);
    int nSpellLevel;
    if( page == "" || page == "skill")
        {
        nElements = GetElementCount(FIRST_PAGE, oPC);
        if (selection == (nElements -1))//last element - they can't (or don't want to) select any more skills
            {
            if (GetGainsFeatOnLevelUp(oPC))//if not, and they get a feat, go to the feat page
                {
                SetDlgPageString( "feat" );
                }
            else if (GetGainsStatOnLevelUp(oPC))//if no skill points left, and no feat is received this level, and they get a stat, go to the stat page
                {
                SpeakString( "You did not recieve a feat this level.", TALKVOLUME_TALK );
                SetDlgPageString( "stat" );
                }
            else if ((nConCla == 1) || (nConCla == 9))//if they are a bard or a sorc
                {
                SetDlgPageString( "spells_ask" );
                }
            else //if no skill points left, and no feat or stat is received this level, go to the final page
                {
                SpeakString( "You did not recieve a feat or a stat point this level.", TALKVOLUME_TALK );
                SetDlgPageString( "finish" );
                }
            }
        else //they selected a skill
            {
            nSkill = GetIntElement( selection, FIRST_PAGE, oPC );
            //add to last selection string and int
            sName = GetNameOfSkill(nSkill);
            DoDebug(oPC, "Skill selected: " + sName);
            SetLocalString(oPC, "LastResponse", sName);
            SetLocalInt(oPC, "LastResponseInt", nSkill);
            SetLocalInt(oPC, "SkillIndex", selection);
            SetDlgPageString( "skillresponse" );
            }
        }
    else if ( page == "skillresponse" )
        {
        switch( selection )
            {
            case 0: // Yes
                sTrack = GetLocalString(oPC, "TrackChanges");//String to track description of changes to be made
                sChange = GetLocalString(oPC, "LastResponse") + ", ";
                nChange = GetLocalInt(oPC, "LastResponseInt");

                DoDebug(oPC, "LastResponseInt: " + IntToString(nChange));

                QueAddSkill(nChange, oPC);
                sTrack += sChange;
                SetLocalString(oPC, "TrackChanges", sTrack);

                // subtract cost of skill from points available
                nPointsAvailable = GetLocalInt(oPC, "PointsAvailable");
                nPointsAvailable = nPointsAvailable - (GetCostOfSkill(GetControlClass(oPC), nChange));
                SetLocalInt(oPC, "PointsAvailable", nPointsAvailable);

                // if they have maxed out the skill or don't have points left for it remove it from the list
                DeleteList(FIRST_PAGE, oPC);

                if( GetElementCount(FIRST_PAGE, oPC) == 0 )
                    {
                    for(nSLRSkill = 0; nSLRSkill < SKILL_ALL_SKILLS; nSLRSkill++) //loop through the skill constants
                        {
                        if (GetIsSkillAvailable(oPC, nSLRSkill)) //if the PC can take the skill, it is displayed
                            {
                            if (GetCostOfSkill(GetControlClass(oPC), nSLRSkill) == 2)
                                {
                                sCrossClass = " [Cross-Class]";
                                }
                            else
                                {
                                sCrossClass = "";
                                }
                            AddStringElement(GetNameOfSkill(nSLRSkill) + sCrossClass, FIRST_PAGE, oPC );
                            ReplaceIntElement(nSLRCount, nSLRSkill, FIRST_PAGE, oPC); //store the skill int with the skill
                            DoDebug(oPC, "Response Number: " + IntToString(nSLRCount) + ", Skill Number: " + IntToString(nSLRSkill) + ".");
                            nSLRCount ++;
                            }
                        }
                    AddStringElement ("I cannot or do not wish to select any more skills at this time.", FIRST_PAGE, oPC );
                    }
                // if they have skill points left, go back to start page
                if (nPointsAvailable > 0)
                    {
                    SetDlgPageString( "skill" );
                    }
                else if (GetGainsFeatOnLevelUp(oPC))//if not, and they get a feat, go to the feat page
                    {
                    SetDlgPageString( "feat" );
                    }
                else if (GetGainsStatOnLevelUp(oPC))//if no skill points left, and no feat is received this level, and they get a stat, go to the stat page
                    {
                    SpeakString( "You did not recieve a feat this level.", TALKVOLUME_TALK );
                    SetDlgPageString( "stat" );
                    }
                else if ((nConCla == 1) || (nConCla == 9))//if they are a bard or a sorc
                    {
                    SetDlgPageString( "spells_ask" );
                    }
                else //if no skill points left, and no feat or stat is received this level, go to the final page
                    {
                    SpeakString( "You did not recieve a feat or a stat point this level.", TALKVOLUME_TALK );
                    SetDlgPageString( "finish" );
                    }
                break;
            case 1: // No
                EndDlg();
                DeleteAddAbilityQue(oPC);
                DeleteAddFeatQue(oPC);
                DeleteAddSkillQue(oPC);
                DeleteAddSpellQue(oPC);
                break;
            }
        }
    else if ( page == "feat" )
        {
        nFeat = GetIntElement( selection, THIRD_PAGE, oPC );
        //add to last selection string and int
        sName = GetNameOfFeat(nFeat);
        SetLocalString(oPC, "LastResponse", sName);
        SetLocalInt(oPC, "LastResponseInt", nFeat);
        SetDlgPageString( "featresponse" );
        }
    else if ( page == "featresponse" )
        {
        switch( selection )
            {
            case 0: // Yes
                sTrack = GetLocalString(oPC, "TrackChanges");//String to track description of changes to be made
                sChange = GetLocalString(oPC, "LastResponse") + ", ";
                nChange = GetLocalInt(oPC, "LastResponseInt");
                QueAddFeat(nChange, oPC);

                //update level track string
                sTrack += sChange;
                SetLocalString(oPC, "TrackChanges", sTrack);

                if (GetGainsStatOnLevelUp(oPC))
                    {
                    SetDlgPageString( "stat" );
                    }
                else if ((nConCla == 1) || (nConCla == 9))//if they are a bard or a sorc
                    {
                    SetDlgPageString( "spells_ask" );
                    }
                else
                    {
                    SpeakString( "You did not recieve a stat point this level.", TALKVOLUME_TALK );
                    SetDlgPageString( "finish" );
                    }
                break;
            case 1: // No
                EndDlg();
                DeleteAddAbilityQue(oPC);
                DeleteAddFeatQue(oPC);
                DeleteAddSkillQue(oPC);
                DeleteAddSpellQue(oPC);
                break;
            }
        }
    else if ( page == "stat" )
        {
        nStat = GetIntElement( selection, FIFTH_PAGE, oPC );
        //add to last selection string and int
        sName = GetNameOfAbility(nStat);
        SetLocalString(oPC, "LastResponse", sName);
        SetLocalInt(oPC, "LastResponseInt", nStat);
        DoDebug(oPC, "Stat Int: " + IntToString(nStat));
        SetDlgPageString( "statresponse" );
        }
    else if ( page == "statresponse" )
        {
        switch( selection )
            {
            case 0: // Yes
                sTrack = GetLocalString(oPC, "TrackChanges");//String to track description of changes to be made
                sChange = GetLocalString(oPC, "LastResponse") + ", ";
                nChange = GetLocalInt(oPC, "LastResponseInt");

                //get ready to add ability for final confirmation
                QueAddAbility(nChange, oPC);

                sTrack += sChange;
                SetLocalString(oPC, "TrackChanges", sTrack);

                if ((nConCla == 1) || (nConCla == 9))//if they are a bard or a sorc
                    {
                    SetDlgPageString( "spells_ask" );
                    }
                else SetDlgPageString( "finish" );
                break;
            case 1: // No
                EndDlg();
                DeleteAddAbilityQue(oPC);
                DeleteAddFeatQue(oPC);
                DeleteAddSkillQue(oPC);
                DeleteAddSpellQue(oPC);
                break;
            }
        }
    else if ( page == "spells_ask" )
        {
        switch( selection )
            {
            case 0: // Yes - they want to change a spell selection
                SetDlgPageString( "spells_level" );
                break;
            case 1: // No
                SetDlgPageString( "finish" );
                break;
            }
        }
    else if ( page == "spells_level" )
        {
        nElements = GetElementCount(SIXPOINTTWO_PAGE, oPC);
        if (selection == (nElements -1))//last element - they don't want to change spells, abort
            {
                EndDlg();
                DeleteAddAbilityQue(oPC);
                DeleteAddFeatQue(oPC);
                DeleteAddSkillQue(oPC);
                DeleteAddSpellQue(oPC);
            }
        else
            {
            nSpellLevel = selection + 1; //the spell level they want to change a spell in
            SetLocalInt(oPC, "nSpellLevelSelected", nSpellLevel);
            //build a list of all spells of that level that they know
            //includes GetHasSpell and those selected by this system
            //track with LocalInts SpellAddxxx and SpellRemoveXXX
            DeleteList(SIXPOINTTHREE_PAGE, oPC);//must build the next page here based on their selection
            if( GetElementCount(SIXPOINTTHREE_PAGE, oPC) == 0 )
                {
                if (nConCla == 1)//they're a bard
                    {
                    for(nSpell = 0; nSpell < 570; nSpell++) //loop through the spell constants
                        {
                        if ((GetHasSpell(nSpell, oPC) || GetLocalInt(oPC, "SpellAdded"+IntToString(nSpell))) && (!GetLocalInt(oPC, "SpellRemoved"+IntToString(nSpell))) && (GetBardSpellLevel(nSpell) == nSpellLevel)) //if the PC Has the spell or an int indicates they have selected it to replace one they had previous, and there is no int indicating they replaced it, and it's the right level, display it
                            {

                            AddStringElement(GetSpellName(nSpell), SIXPOINTTHREE_PAGE, oPC );
                            ReplaceIntElement(nSpellCount, nSpell, SIXPOINTTHREE_PAGE, oPC); //store the spell int with the spell
                            DoDebug(oPC, "Response Number: " + IntToString(nSpellCount) + ", Spell Number: " + IntToString(nSpell) + ".");
                            nSpellCount ++;
                            }
                        }
                    AddStringElement ("Nevermind, I don't want to replace any more spells.", SIXPOINTTHREE_PAGE, oPC );
                    }
                else  //they're a sorcerer
                    {
                    for(nSpell = 0; nSpell < 570; nSpell++) //loop through the spell constants
                        {
                        if ((GetHasSpell(nSpell, oPC) || GetLocalInt(oPC, "SpellAdded"+IntToString(nSpell))) && (!GetLocalInt(oPC, "SpellRemoved"+IntToString(nSpell))) && (GetSorcSpellLevel(nSpell) == nSpellLevel)) //if the PC Has the spell or an int indicates they have selected it to replace one they had previous, and there is no int indicating they replaced it, and it's the right level, display it
                            {

                            AddStringElement(GetSpellName(nSpell), SIXPOINTTHREE_PAGE, oPC );
                            ReplaceIntElement(nSpellCount, nSpell, SIXPOINTTHREE_PAGE, oPC); //store the spell int with the spell
                            DoDebug(oPC, "Response Number: " + IntToString(nSpellCount) + ", Spell Number: " + IntToString(nSpell) + ".");
                            nSpellCount ++;
                            }
                        }
                    AddStringElement ("Nevermind, I don't want to replace any more spells.", SIXPOINTTHREE_PAGE, oPC );
                    }
                }
            SetDlgPageString( "spells_remove_select" );
            }
        }
    else if ( page == "spells_remove_select" )
        {
        nElements = GetElementCount(SIXPOINTTHREE_PAGE, oPC);
        if (selection == (nElements -1))//last element - they don't want to change spells, abort
            {
            SetDlgPageString( "finish" );
            }
        else
            {
            nSpell = GetIntElement( selection, SIXPOINTTHREE_PAGE, oPC );
            //add to last selection string and int
            sName = GetSpellName(nSpell);
            DoDebug(oPC, "Spell selected: " + sName);
            SetLocalString(oPC, "SpellToRemove", sName);//used in dialogue text
            SetLocalInt(oPC, "SpellToRemove", nSpell);
            SetLocalInt(oPC, "SpellRemoved"+IntToString(nSpell), 2);//tracks whats spells the pc 'has' currently - would do this at confirm to avoid mess but we need it to build the next page
            DeleteList(SIXPOINTFOUR_PAGE, oPC);//must build the next page here based on their selection
            if( GetElementCount(SIXPOINTFOUR_PAGE, oPC) == 0 )
                {
                if (nConCla == 1)//they're a bard
                    {
                    nSpellLevel = GetBardSpellLevel(nSpell);
                    for(nSpell = 0; nSpell < 570; nSpell++) //loop through the spell constants
                        {
                        if (((!GetHasSpell(nSpell, oPC)) || GetLocalInt(oPC, "SpellRemoved"+IntToString(nSpell))) && (!GetLocalInt(oPC, "SpellAdded"+IntToString(nSpell))) && (GetBardSpellLevel(nSpell) == nSpellLevel)) //if the PC does not have the spell and no int indicates they have selected it to replace one they had previously, and there is no int indicating they selected it, and it's the right level, display it
                            {

                            AddStringElement(GetSpellName(nSpell), SIXPOINTFOUR_PAGE, oPC );
                            ReplaceIntElement(nSpellCount, nSpell, SIXPOINTFOUR_PAGE, oPC); //store the spell int with the spell
                            DoDebug(oPC, "Response Number: " + IntToString(nSpellCount) + ", Spell Number: " + IntToString(nSpell) + ".");
                            nSpellCount ++;
                            }
                        }
                    AddStringElement ("Nevermind, I don't want to replace " + sName + ".", SIXPOINTFOUR_PAGE, oPC );
                    }
                else  //they're a sorcerer
                    {
                    nSpellLevel = GetSorcSpellLevel(nSpell);
                    for(nSpell = 0; nSpell < 570; nSpell++) //loop through the spell constants
                        {
                        if (((!GetHasSpell(nSpell, oPC)) || GetLocalInt(oPC, "SpellRemoved"+IntToString(nSpell))) && (!GetLocalInt(oPC, "SpellAdded"+IntToString(nSpell))) && (GetSorcSpellLevel(nSpell) == nSpellLevel)) //if the PC does not have the spell and no int indicates they have selected it to replace one they had previously, and there is no int indicating they selected it, and it's the right level, display it
                            {

                            AddStringElement(GetSpellName(nSpell), SIXPOINTFOUR_PAGE, oPC );
                            ReplaceIntElement(nSpellCount, nSpell, SIXPOINTFOUR_PAGE, oPC); //store the spell int with the spell
                            DoDebug(oPC, "Response Number: " + IntToString(nSpellCount) + ", Spell Number: " + IntToString(nSpell) + ".");
                            nSpellCount ++;
                            }
                        }
                    AddStringElement ("Nevermind, I don't want to replace " + sName + ".", SIXPOINTFOUR_PAGE, oPC );
                    }
                }
            SetDlgPageString( "spells_replace_select" );
            }
        }
    else if ( page == "spells_replace_select" )
        {
        nElements = GetElementCount(SIXPOINTFOUR_PAGE, oPC);
        if (selection == (nElements -1))//last element - they don't want to change spells, abort
            {
            nSpell = GetLocalInt(oPC, "SpellToRemove");//clear up the spells ints and send em back to beginning of spells dialoge
            DeleteLocalInt(oPC, "SpellToRemove");
            DeleteLocalString(oPC, "SpellToRemove");
            DeleteLocalInt(oPC, "SpellRemoved"+IntToString(nSpell));
            SetDlgPageString( "spells_ask" );
            }
        else
            {
            nSpell = GetIntElement( selection, SIXPOINTFOUR_PAGE, oPC );
            //add to last selection string and int
            sName = GetSpellName(nSpell);
            DoDebug(oPC, "Spell selected: " + sName);
            SetLocalString(oPC, "SpellToAdd", sName);//used in dialogue text
            SetLocalInt(oPC, "SpellToAdd", nSpell);
            SetLocalInt(oPC, "SpellAdded"+IntToString(nSpell), 2);//tracks whats spells the pc 'has' currently - would do this at confirm to avoid mess but we need it to build the next page
            SetDlgPageString( "spells_confirm" );
            }
        }
    else if ( page == "spells_confirm" )
        {
        switch( selection )
            {
            case 0://Yes, change more
                sTrack = GetLocalString(oPC, "TrackChanges");//String to track description of changes to be made
                sChange = "replace " + GetLocalString(oPC, "SpellToRemove") + " with " + GetLocalString(oPC, "SpellToAdd") + ", ";
                nSpell = GetLocalInt(oPC, "SpellToRemove");
                nSpell2 = GetLocalInt(oPC, "SpellToAdd");

                //add and remove spells
                QueAddSpell(nSpell2, GetLocalInt(oPC, "nSpellLevelSelected"), oPC);
                QueRemoveSpell(nSpell, GetLocalInt(oPC, "nSpellLevelSelected"), oPC);

                sTrack += sChange;
                SetLocalString(oPC, "TrackChanges", sTrack);
                //cleanup locals
                DeleteLocalInt(oPC, "SpellRemoved"+IntToString(nSpell2));//delete this int, if it exists, because we just added the spell
                DeleteLocalInt(oPC, "SpellAdded"+IntToString(nSpell));//delete this int, if it exists, because we just removed the spell
                DeleteLocalInt(oPC, "SpellToRemove");
                DeleteLocalString(oPC, "SpellToRemove");
                DeleteLocalString(oPC, "SpellToAdd");
                DeleteLocalInt(oPC, "SpellToAdd");
                SetDlgPageString( "spells_level" );
                break;
            case 1://Yes, and done
                sTrack = GetLocalString(oPC, "TrackChanges");//String to track description of changes to be made
                sChange = "replace " + GetLocalString(oPC, "SpellToRemove") + " with " + GetLocalString(oPC, "SpellToAdd") + ", ";
                nSpell = GetLocalInt(oPC, "SpellToRemove");
                nSpell2 = GetLocalInt(oPC, "SpellToAdd");

                //add and remove spells
                QueAddSpell(nSpell2, GetLocalInt(oPC, "nSpellLevelSelected"), oPC);
                QueRemoveSpell(nSpell, GetLocalInt(oPC, "nSpellLevelSelected"), oPC);

                sTrack += sChange;
                SetLocalString(oPC, "TrackChanges", sTrack);
                //cleanup locals
                DeleteLocalInt(oPC, "SpellRemoved"+IntToString(nSpell2));//delete this int, if it exists, because we just added the spell
                DeleteLocalInt(oPC, "SpellAdded"+IntToString(nSpell));//delete this int, if it exists, because we just removed the spell
                DeleteLocalInt(oPC, "SpellToRemove");
                DeleteLocalString(oPC, "SpellToRemove");
                DeleteLocalString(oPC, "SpellToAdd");
                DeleteLocalInt(oPC, "SpellToAdd");
                SetDlgPageString( "finish" );
                break;
            case 2://No
                nSpell = GetLocalInt(oPC, "SpellToRemove");//clear up the spells ints and send em back to beginning of spells dialoge
                DeleteLocalInt(oPC, "SpellToRemove");
                DeleteLocalString(oPC, "SpellToRemove");
                DeleteLocalInt(oPC, "SpellRemoved"+IntToString(nSpell));
                nSpell2 = GetLocalInt(oPC, "SpellToAdd");
                DeleteLocalString(oPC, "SpellToAdd");//used in dialogue text
                DeleteLocalInt(oPC, "SpellToAdd");
                DeleteLocalInt(oPC, "SpellAdded"+IntToString(nSpell2));
                SetDlgPageString( "spells_ask" );
                break;
            }
        }
    else if ( page == "finish" )
        {
        switch( selection )
            {
            case 0: // Yes
                 //calcualate hit point gain
                 nHP = GetHitPointsGainedOnLevelUp(oPC);

                //Get level and increment it
                 nLevel = CheckLegendaryLevel(oPC);

                 //add HP
                 AddHitPoints(nHP, nLevel, oPC);

                 //level up saves if they are set to increase
                 if (GetGainsSavesOnLevelUp(oPC))
                    ModifySaves(oPC);

                 //check to see if any skill points left over
                 nPointsAvailable = GetLocalInt(oPC, "PointsAvailable");

                 //if so, store them for use for next level
                 NWNX_Creature_SetSkillPointsRemaining(oPC, nPointsAvailable);

                 //add the skills feats abilities and spells requested
                 ExecuteAddSkillQue(oPC);
                 ExecuteAddFeatQue(oPC);
                 ExecuteAddSpellQue(oPC);
                 ExecuteRemoveSpellQue(oPC);
                 ExecuteAddAbilityQue(oPC);

                 //increment level
                 nLevel++;
                 SetLocalInt(GetItemPossessedBy(oPC, plotItemTag), "nLegendLevel", nLevel);

                 EndDlg();
                 break;
            case 1: // No
                EndDlg();
                break;
            }
            //clean up local variables
            DeleteAddSkillQue(oPC);
            DeleteAddFeatQue(oPC);
            DeleteAddSpellQue(oPC);
            DeleteRemoveSpellQue(oPC);
            DeleteAddAbilityQue(oPC);

            //Display summary to player
            FloatingTextStringOnCreature("You are now level " + IntToString(nLevel) + ".", oPC, FALSE);
            SendMessageToPC(oPC, "You chose " + GetLocalString(oPC, "TrackChanges") + " and gained " + IntToString(nHP) + " hitpoints.");
        }
}

void main()
{
    int iEvent = GetDlgEventType();
    switch( iEvent )
        {
        case DLG_INIT:
            Init();
            break;
        case DLG_PAGE_INIT:
            PageInit();
            break;
        case DLG_SELECTION:
            HandleSelection();
            break;
        case DLG_ABORT:
            SpeakString( "Legendary leveler conversation ended.", TALKVOLUME_TALK );
            CleanUp();
            break;
        case DLG_END:
            SpeakString( "Legendary leveler conversation ended.", TALKVOLUME_TALK );
            CleanUp();
            break;
        }
}
