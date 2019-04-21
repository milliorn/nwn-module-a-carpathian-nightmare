/**
 *  $Id: zdlg_include_i.nss,v 1.2 2005/08/07 04:38:30 pspeed Exp $
 *
 *  Include file for using the Z-Dialog runtime conversation
 *  system.
 *
 *  This system allows a user to define conversation trees at
 *  runtime and handle the selections programmatically.  Really
 *  useful for menu systems without script explosion.
 *
 *  Copyright (c) 2004 Paul Speed - BSD licensed.
 *  NWN Tools - http://nwntools.sf.net/
 */
#include "pg_lists_i"

// Constants defined for dialog events
const int DLG_INIT = 0; // new dialog is started
const int DLG_PAGE_INIT = 1; // a new page is started
const int DLG_SELECTION = 2; // item is selected
const int DLG_ABORT = 3; // dialog was aborted
const int DLG_END = 4; // dialog ended normally

const string DLG_CURRENT_HANDLER = "currentDialog";
const string DLG_HANDLER = "dialog";
const string DLG_PROMPT = "zdlgPrompt";
const string DLG_RESPONSE_LIST = "zdlgResponseList";
const string DLG_RESPONSE_LIST_HOLDER = "zdlgResponseHolder";
const string DLG_EVENT_TYPE = "zdlgEventType";
const string DLG_EVENT_SELECTION = "zdlgEventSelection";
const string DLG_PAGE_ID = "zdlgPageId";
const string DLG_ITEM = "zdlgItem";
const string DLG_ITEM_CONVERSER = "zdlgConverser";
const string DLG_STATE = "zdlgState";

const string DLG_START_ENTRY = "zdlgStartEntry";
const string DLG_HAS_PREV = "zdlgHasPrevious";
const string DLG_HAS_NEXT = "zdlgHasNext";
const string DLG_HAS_END = "zdlgHasEnd";

// Some state constants that the zdlg_page_init check
// can use to determine current conversation state.
const int DLG_STATE_INIT = 0;
const int DLG_STATE_RUNNING = 1;
const int DLG_STATE_ENDED = -1;

// The base token for the dialog inserts.  +0 is the
// prompt.  +1 - +13 is the item text.  These values
// must match the .dlg file exactly.
const int DLG_BASE_TOKEN = 4200;

// Returns the current PC speaker for this dialog.
// This has some enhanced features to work around bioware
// limitations with item dialogs.
object GetPcDlgSpeaker();

// Sets the new current dialog handler script for the current conversation.
// This allows on the fly conversation changes and linking.  This must
// be called within a conversation related event.
void SetCurrentDlgHandlerScript( string script );

// Returns the current dialog handler script for the current conversation.
string GetCurrentDlgHandlerScript();

// Returns the current conversation's default dialog handler script if
// it has one defined.  This is used when there is otherwise
// not a current handler script set.
string GetDefaultDlgHandlerScript( object oNPC = OBJECT_SELF );

// Sets the prompt that will be displayed in the dialog
// when talking to the current speaker.
void SetDlgPrompt( string prompt );

// Returns the current prompt that will be displayed in the
// dialog when talking to the current speaker.
string GetDlgPrompt();

// Set to TRUE if the end dialog selection should be shown
// on every page.  FALSE if not.
void SetShowEndSelection( int flag );

// Returns TRUE if the end dialog selection should be shown
// on every page.  FALSE if not.
int GetShowEndSelection();

// Sets the list of responses that will be displayed in the
// dialog when talking to the current speaker.
void SetDlgResponseList( string listId, object oListHolder );

// Returns the list id for the list of responses that will be
// displayed in the dialog when talking to the current speaker.
string GetDlgResponseList();

// Returns the dialog type of event that caused the handler
// script to be executed.
int GetDlgEventType();

// Returns the selected item in a DLG_SELECTION event.
int GetDlgSelection();

// Sets a page string that the handler scripts can use to track
// progress through the conversation.  This is really just a
// convenience function that tacks a local var onto the PC dlg
// speaker.  It has the added benefit of getting auto-cleaned
// with the dialog clean-up.
void SetDlgPageString( string page );

// Returns a page string that the handler scripts can use to track
// progress through the conversation.
string GetDlgPageString();

// Sets a page integer that the handler scripts can use to track
// progress through the conversation.  This is really just a
// convenience function that tacks a local var onto the PC dlg
// speaker.  It has the added benefit of getting auto-cleaned
// with the dialog clean-up.
void SetDlgPageInt( int page );

// Returns a page integer that the handler scripts can use to track
// progress through the conversation.
int GetDlgPageInt();

// Called to initiate a conversation programmatically between
// the dialog source and the object to converse with.  If
// dlgHandler is "" then the object's default script will be used.
void StartDlg( object oPC, object oObjectToConverseWith, string dlgHandler = "", int bPrivate = FALSE, int bPlayHello = TRUE, int bZoom = TRUE );

// Ends the current conversation and will fire the DLG_END event.
void EndDlg();


// Returns the current PC speaker for this dialog.
// This has some enhanced features to work around bioware
// limitations with item dialogs.
object GetPcDlgSpeaker()
{
    object oPC = GetPCSpeaker();
    if( oPC == OBJECT_INVALID )
        {
        // See if we're an item and if we're connected to a PC already.
        // Note: GetItemActivator won't work in multiplayer because other
        //       players will be trouncing on its state.
        oPC = GetLocalObject( OBJECT_SELF, DLG_ITEM_CONVERSER );
        }
    if( oPC == OBJECT_INVALID )
        PrintString( "WARNING: Unable to retrieve a PC speaker." );
    return( oPC );
}

// Sets the new current dialog handler script for the current conversation.
// This allows on the fly conversation changes and linking.  This must
// be called within a conversation related event.
void SetCurrentDlgHandlerScript( string script )
{
    SetLocalString( GetPcDlgSpeaker(), DLG_CURRENT_HANDLER, script );
}

// Returns the current dialog handler script for the current conversation.
string GetCurrentDlgHandlerScript()
{
    return( GetLocalString( GetPcDlgSpeaker(), DLG_CURRENT_HANDLER ) );
}

// Returns the current conversation's default dialog handler script if
// it has one defined.  This is used when there is otherwise
// not a current handler script set.
string GetDefaultDlgHandlerScript( object oNPC = OBJECT_SELF )
{
    return( GetLocalString( oNPC, DLG_HANDLER ) );
}

// Sets the prompt that will be displayed in the dialog
// when talking to the current speaker.
void SetDlgPrompt( string prompt )
{
    SetLocalString( GetPcDlgSpeaker(), DLG_PROMPT, prompt );
}

// Returns the current prompt that will be displayed in the
// dialog when talking to the current speaker.
string GetDlgPrompt()
{
    return( GetLocalString( GetPcDlgSpeaker(), DLG_PROMPT ) );
}

// Set to TRUE if the end dialog selection should be shown
// on every page.  FALSE if not.
void SetShowEndSelection( int flag )
{
    SetLocalInt( GetPcDlgSpeaker(), DLG_HAS_END, flag );
}

// Returns TRUE if the end dialog selection should be shown
// on every page.  FALSE if not.
int GetShowEndSelection()
{
    return( GetLocalInt( GetPcDlgSpeaker(), DLG_HAS_END ) );
}

// Sets the list of responses that will be displayed in the
// dialog when talking to the current speaker.
void SetDlgResponseList( string listId, object oListHolder )
{
    object oSpeaker = GetPcDlgSpeaker();
    SetLocalObject( oSpeaker, DLG_RESPONSE_LIST_HOLDER, oListHolder );
    SetLocalString( oSpeaker, DLG_RESPONSE_LIST, listId );
    //DeleteLocalInt( oSpeaker, DLG_HAS_PREV );
    //DeleteLocalInt( oSpeaker, DLG_HAS_NEXT );
    //DeleteLocalInt( oSpeaker, DLG_START_ENTRY );
}

// Returns the list id for the list of responses that will be
// displayed in the dialog when talking to the current speaker.
string GetDlgResponseList()
{
    return( GetLocalString( GetPcDlgSpeaker(), DLG_RESPONSE_LIST ) );
}

// Returns the dialog type of event that caused the handler
// script to be executed.
int GetDlgEventType()
{
    return( GetLocalInt( GetPcDlgSpeaker(), DLG_EVENT_TYPE ) );
}

// Returns the selected item in a DLG_SELECTION event.
int GetDlgSelection()
{
    return( GetLocalInt( GetPcDlgSpeaker(), DLG_EVENT_SELECTION ) );
}

// Sets a page string that the scripts can use to track
// progress through the conversation.
void SetDlgPageString( string page )
{
    object oSpeaker = GetPcDlgSpeaker();
    SetLocalString( oSpeaker, DLG_PAGE_ID, page );
    DeleteLocalInt( oSpeaker, DLG_HAS_PREV );
    DeleteLocalInt( oSpeaker, DLG_HAS_NEXT );
    DeleteLocalInt( oSpeaker, DLG_START_ENTRY );
}

// Returns a page string that the scripts can use to track
// progress through the conversation.
string GetDlgPageString()
{
    return( GetLocalString( GetPcDlgSpeaker(), DLG_PAGE_ID ) );
}

// Sets a page string that the scripts can use to track
// progress through the conversation.
void SetDlgPageInt( int page )
{
    SetLocalInt( GetPcDlgSpeaker(), DLG_PAGE_ID, page );
    //DeleteLocalInt( GetPcDlgSpeaker(), DLG_HAS_PREV );
    //DeleteLocalInt( GetPcDlgSpeaker(), DLG_HAS_NEXT );
    //DeleteLocalInt( GetPcDlgSpeaker(), DLG_START_ENTRY );
}

// Returns a page string that the scripts can use to track
// progress through the conversation.
int GetDlgPageInt()
{
    return( GetLocalInt( GetPcDlgSpeaker(), DLG_PAGE_ID ) );
}

// Called to initiate a conversation programmatically between
// the dialog source and the object to converse with.  If
// dlgHandler is "" then the object's default script will be used.
void StartDlg( object oPC, object oObjectToConverseWith, string dlgHandler = "",
               int bPrivate = FALSE, int bPlayHello = TRUE, int bZoom = TRUE )
{
    // Setup the conversation
    if( dlgHandler != "" )
        SetLocalString( oPC, DLG_CURRENT_HANDLER, dlgHandler );

    if( GetObjectType( oObjectToConverseWith ) == OBJECT_TYPE_ITEM )
        {
        // We presume that only one player can talk to an item at
        // a time... we could check, but we don't.
        SetLocalObject( oObjectToConverseWith, DLG_ITEM_CONVERSER, oPC );

        // We can't actually talk to items so we fudge it.
        SetLocalObject( oPC, DLG_ITEM, oObjectToConverseWith );
        oObjectToConverseWith = oPC;
        }

    string dlg = "zdlg_converse";
    if( !bZoom )
        dlg = "zdlg_converse_nz";

    AssignCommand( oObjectToConverseWith,
                   ActionStartConversation( oPC, dlg, bPrivate, bPlayHello ) );
}

// Ends the current conversation and will fire the DLG_END event.
void EndDlg()
{
    object oSpeaker = GetPcDlgSpeaker();
    SetLocalInt( oSpeaker, DLG_STATE, DLG_STATE_ENDED );
}


// Returns the number of responses that will be displayed
// in the dialog when talking to the specified speaker.
// The speaker can be specified for looping optimization
// so that the functions don't have to retrieve it every time.
int GetDlgResponseCount( object oSpeaker )
{
    object oHolder = GetLocalObject( oSpeaker, DLG_RESPONSE_LIST_HOLDER );
    string listId = GetLocalString( oSpeaker, DLG_RESPONSE_LIST );
    return( GetElementCount( listId, oHolder ) );
}

// Returns the response string for the specified entry.
// The speaker can be specified for looping optimization
// so that the functions don't have to retrieve it every time.
string GetDlgResponse( int num, object oSpeaker )
{
    object oHolder = GetLocalObject( oSpeaker, DLG_RESPONSE_LIST_HOLDER );
    string listId = GetLocalString( oSpeaker, DLG_RESPONSE_LIST );
    return( GetStringElement( num, listId, oHolder ) );
}

// Sets up the previous/next buttons
void _SetDlgPreviousNext( object oSpeaker, int hasPrevious, int hasNext )
{
    SetLocalInt( oSpeaker, DLG_HAS_PREV, hasPrevious );
    SetLocalInt( oSpeaker, DLG_HAS_NEXT, hasNext );
}

// Returns true if the "previous" entry is turned on in the
// response list
int _HasDlgPrevious( object oSpeaker )
{
    return( GetLocalInt( oSpeaker, DLG_HAS_PREV ) );
}

// Returns true if the "next" entry is turned on in the
// response list
int _HasDlgNext( object oSpeaker )
{
    return( GetLocalInt( oSpeaker, DLG_HAS_NEXT ) );
}

// Returns true if the "end" entry is turned on in the
// response list
int _HasDlgEnd( object oSpeaker )
{
    return( GetLocalInt( oSpeaker, DLG_HAS_END ) );
}

// Sets the starting entry for when a response list is
// broken into multiple pages.
void _SetDlgFirstResponse( object oSpeaker, int start )
{
    SetLocalInt( oSpeaker, DLG_START_ENTRY, start );
}

// Returns the starting entry for when a response list is
// broken into multiple pages.
int _GetDlgFirstResponse( object oSpeaker )
{
    return( GetLocalInt( oSpeaker, DLG_START_ENTRY ) );
}

// Sets the token for the response string and returns true
// if there is a valid response entry for the specified num.
int _SetupDlgResponse( int num, object oSpeaker )
{
    int hasNext = _HasDlgNext( oSpeaker );
    int hasPrev = _HasDlgPrevious( oSpeaker );
    int hasEnd = _HasDlgEnd( oSpeaker );
    if( (hasNext || hasPrev || hasEnd) && num >= 10 )
        {
        if( hasNext && num == 10 )
            {
            SetCustomToken( DLG_BASE_TOKEN + 11, "Next" );
            return( TRUE );
            }
        if( hasPrev && num == 11 )
            {
            SetCustomToken( DLG_BASE_TOKEN + 12, "Previous" );
            return( TRUE );
            }
        if( hasEnd && num == 12 )
            {
            SetCustomToken( DLG_BASE_TOKEN + 13, "End" );
            return( TRUE );
            }
        return( FALSE );
        }

    int i = _GetDlgFirstResponse( oSpeaker ) + num;
    int count = GetDlgResponseCount( oSpeaker );
    if( i < count )
        {
        string response = GetDlgResponse( i, oSpeaker );
        SetCustomToken( DLG_BASE_TOKEN + num + 1, response );
        return( TRUE );
        }
    return( FALSE );
}

// Called to clean-up the current conversation related
// resources.
void _CleanupDlg( object oSpeaker )
{
    // See if the PC was associated with an item
    object oItem = GetLocalObject( oSpeaker, DLG_ITEM );
    if( oItem != OBJECT_INVALID )
        {
        DeleteLocalObject( oItem, DLG_ITEM_CONVERSER );
        }

    DeleteLocalInt( oSpeaker, DLG_STATE );
    DeleteLocalObject( oSpeaker, DLG_RESPONSE_LIST_HOLDER );
    DeleteLocalString( oSpeaker, DLG_RESPONSE_LIST );
    DeleteLocalString( oSpeaker, DLG_PROMPT );
    DeleteLocalString( oSpeaker, DLG_CURRENT_HANDLER );
    DeleteLocalInt( oSpeaker, DLG_PAGE_ID );
    DeleteLocalString( oSpeaker, DLG_PAGE_ID );
    DeleteLocalObject( oSpeaker, DLG_ITEM );
    DeleteLocalInt( oSpeaker, DLG_HAS_PREV );
    DeleteLocalInt( oSpeaker, DLG_HAS_NEXT );
    DeleteLocalInt( oSpeaker, DLG_HAS_END );
    DeleteLocalInt( oSpeaker, DLG_START_ENTRY );
}

// Sends the specified dialog event to the specified NPC
// using the current script handler.  The selection parameter
// is used for select events.  The speaker is provided for
// event specific paramaters to be stored onto.
void _SendDlgEvent( object oSpeaker, int dlgEvent, int selection = -1, object oNPC = OBJECT_SELF )
{
    string dlg = GetCurrentDlgHandlerScript();
    if( oNPC == oSpeaker )
        oNPC = GetLocalObject( oSpeaker, DLG_ITEM );

    SetLocalInt( oSpeaker, DLG_EVENT_TYPE, dlgEvent );
    SetLocalInt( oSpeaker, DLG_EVENT_SELECTION, selection );
    ExecuteScript( dlg, oNPC );
    DeleteLocalInt( oSpeaker, DLG_EVENT_TYPE );
    DeleteLocalInt( oSpeaker, DLG_EVENT_SELECTION );
}

void _DoDlgSelection( object oSpeaker, int selection, object oNPC = OBJECT_SELF )
{
    // Check to see if this is one or our internal events
    int first = _GetDlgFirstResponse( oSpeaker );

    switch( selection )
        {
        case 10:
            if( _HasDlgNext( oSpeaker ) )
                {
                // Next page
                _SetDlgFirstResponse( oSpeaker, first + 10 );
                return;
                }
            break;
        case 11:
            if( _HasDlgPrevious( oSpeaker ) )
                {
                // Previous page
                _SetDlgFirstResponse( oSpeaker, first - 10 );
                return;
                }
            break;
        case 12:
            if( _HasDlgEnd( oSpeaker ) )
                {
                // End dialog
                EndDlg();
                return;
                }
            break;
        }

    selection += first;

    _SendDlgEvent( oSpeaker, DLG_SELECTION, selection, oNPC );
}

// Returns the current conversation state.
int _GetDlgState( object oSpeaker )
{
    return( GetLocalInt( oSpeaker, DLG_STATE ) );
}

// Called by the dialog internals to initialize the page
// and possibly the conversation
void _InitializePage( object oSpeaker, object oNPC = OBJECT_SELF )
{
    int state = GetLocalInt( oSpeaker, DLG_STATE );
    string dlg = GetCurrentDlgHandlerScript();
    if( oNPC == oSpeaker )
        oNPC = GetLocalObject( oSpeaker, DLG_ITEM );

    // See if the NPC has a dialog file defined
    if( dlg == "" )
        {
        // Try to see if they have a default defined
        dlg = GetDefaultDlgHandlerScript( oNPC );
        SetCurrentDlgHandlerScript( dlg );
        state = 0;
        }

    // If we aren't initialized
    if( state == DLG_STATE_INIT )
        {
        // Then we'll send the conversation init event
        _SendDlgEvent( oSpeaker, DLG_INIT, -1, oNPC );
        SetLocalInt( oSpeaker, DLG_STATE, DLG_STATE_RUNNING );
        }

    // Send the page initialization event
    _SendDlgEvent( oSpeaker, DLG_PAGE_INIT, -1, oNPC );
}

/*
//I keep this here to uncomment when compiling to test for
//errors that can't be found otherwise.  Just ignore it.
void main()
{

}*/
