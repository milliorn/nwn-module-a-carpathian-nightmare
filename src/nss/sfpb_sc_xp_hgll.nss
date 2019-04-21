#include "hgll_const_inc"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iLvl = GetLocalInt(GetItemPossessedBy(oPC, plotItemTag), "nLegendLevel");
    if (iLvl<41) return FALSE;
    else return TRUE;
}
