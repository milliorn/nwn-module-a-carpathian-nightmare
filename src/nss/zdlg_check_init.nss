/**
 *  $Id: zdlg_check_init.nss,v 1.2 2005/08/07 04:38:30 pspeed Exp $
 *
 *  Dialog Page initialization for the Z-Dialog system.
 *
 *  Copyright (c) 2004 Paul Speed - BSD licensed.
 *  NWN Tools - http://nwntools.sf.net/
 */
#include "zdlg_include_i"

int StartingConditional()
{
    object oSpeaker = GetPCSpeaker();
    //PrintString( "Talking to:" + GetName(oSpeaker) );

    // Check to see if the conversation is done.  This
    // is the only way we can end a conversation programmatically
    // without making the user abort.
    int state =_GetDlgState( oSpeaker );
    if( state == DLG_STATE_ENDED )
        return( FALSE );

    int hasPrev = _HasDlgPrevious( oSpeaker );
    int hasNext = _HasDlgNext( oSpeaker );

    if( !hasPrev && !hasNext )
        {
        // Initialize the page and possibly the entire conversation
        _InitializePage( oSpeaker );
        }

    // To debug missing entries when they happen
    /*SetCustomToken( 4201, "Unset 1" );
    SetCustomToken( 4202, "Unset 2" );
    SetCustomToken( 4203, "Unset 3" );
    SetCustomToken( 4204, "Unset 4" );
    SetCustomToken( 4205, "Unset 5" );
    SetCustomToken( 4206, "Unset 6" );
    SetCustomToken( 4207, "Unset 7" );
    SetCustomToken( 4208, "Unset 8" );
    SetCustomToken( 4209, "Unset 9" );
    SetCustomToken( 4210, "Unset 10" );
    SetCustomToken( 4211, "Unset 11" );
    SetCustomToken( 4212, "Unset 12" );
    SetCustomToken( 4213, "Unset 13" );*/

    // Initialize the values from the dialog configuration
    SetCustomToken( DLG_BASE_TOKEN, GetDlgPrompt() );

    int first = _GetDlgFirstResponse( oSpeaker );
    int count = GetDlgResponseCount( oSpeaker );

    // In a multipage response list we reserver entry 13
    // for an End Dialog for later configurability.
    hasPrev = FALSE;
    int maxCount = 13;
    if( first > 0 )
        {
        hasPrev = TRUE;
        maxCount = 10;
        }

    hasNext = FALSE;
    if( count - first >= maxCount )
        hasNext = TRUE;

    // Setup the state to show the previous and next
    // buttons.
    _SetDlgPreviousNext( oSpeaker, hasPrev, hasNext );

    return TRUE;
}
