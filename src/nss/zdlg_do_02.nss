/**
 *  $Id: zdlg_do_02.nss,v 1.2 2005/08/07 04:38:30 pspeed Exp $
 *
 *  Entry selection script for the Z-Dialog system.
 *
 *  Copyright (c) 2004 Paul Speed - BSD licensed.
 *  NWN Tools - http://nwntools.sf.net/
 */
#include "zdlg_include_i"

const int ENTRY_NUM = 2;

void main()
{
    _DoDlgSelection( GetPCSpeaker(), ENTRY_NUM - 1 );
}
