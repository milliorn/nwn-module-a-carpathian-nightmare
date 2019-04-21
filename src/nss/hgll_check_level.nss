/*// Legendary Level Checker
#include "x2_inc_switches"
#include "hgll_func_inc"
void main()
{
    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;

    object oPC = GetItemActivator();
    int iLevel = CheckLegendaryLevel(oPC);
    if (iLevel > 40)
    {
        FloatingTextStringOnCreature("Your legendary level is " + IntToString(iLevel), oPC);
    }
    else
    {
        FloatingTextStringOnCreature("You do not have any legendary levels yet", oPC);
    }
}
*/
// replacement code for Legendary Level Checker
#include "x2_inc_switches"
#include "hgll_const_inc"

void main()
{
    // Check we have the correct event firing the script
    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;


    object oPC = GetItemActivator();
    int ixp,
        idiff,
        iLvl = GetLocalInt(GetItemPossessedBy(oPC, plotItemTag), "nLegendLevel");

    string smax;

    if (iLvl<41) iLvl = GetHitDice(oPC);
    FloatingTextStringOnCreature("You are currently Level " + IntToString(iLvl), oPC, FALSE);

    if (iLvl <40)
    {
        FloatingTextStringOnCreature("You are not eligible for Legendary Levels", oPC, FALSE);return;
    }

    if (iLvl == 60)
    {
        FloatingTextStringOnCreature("You are a Demi-God!", oPC, TRUE);
        return;
    }

    ixp = GetXP(oPC);

    if (ixp < XP_REQ_LVL60) {idiff = (XP_REQ_LVL60 - ixp); smax = "Level 60";}
    if (ixp < XP_REQ_LVL59) {idiff = (XP_REQ_LVL59 - ixp); smax = "Level 59";}
    if (ixp < XP_REQ_LVL58) {idiff = (XP_REQ_LVL58 - ixp); smax = "Level 58";}
    if (ixp < XP_REQ_LVL57) {idiff = (XP_REQ_LVL57 - ixp); smax = "Level 57";}
    if (ixp < XP_REQ_LVL56) {idiff = (XP_REQ_LVL56 - ixp); smax = "Level 56";}
    if (ixp < XP_REQ_LVL55) {idiff = (XP_REQ_LVL55 - ixp); smax = "Level 55";}
    if (ixp < XP_REQ_LVL54) {idiff = (XP_REQ_LVL54 - ixp); smax = "Level 54";}
    if (ixp < XP_REQ_LVL53) {idiff = (XP_REQ_LVL53 - ixp); smax = "Level 53";}
    if (ixp < XP_REQ_LVL52) {idiff = (XP_REQ_LVL52 - ixp); smax = "Level 52";}
    if (ixp < XP_REQ_LVL51) {idiff = (XP_REQ_LVL51 - ixp); smax = "Level 51";}
    if (ixp < XP_REQ_LVL50) {idiff = (XP_REQ_LVL50 - ixp); smax = "Level 50";}
    if (ixp < XP_REQ_LVL49) {idiff = (XP_REQ_LVL49 - ixp); smax = "Level 49";}
    if (ixp < XP_REQ_LVL48) {idiff = (XP_REQ_LVL48 - ixp); smax = "Level 48";}
    if (ixp < XP_REQ_LVL47) {idiff = (XP_REQ_LVL47 - ixp); smax = "Level 47";}
    if (ixp < XP_REQ_LVL46) {idiff = (XP_REQ_LVL46 - ixp); smax = "Level 46";}
    if (ixp < XP_REQ_LVL45) {idiff = (XP_REQ_LVL45 - ixp); smax = "Level 45";}
    if (ixp < XP_REQ_LVL44) {idiff = (XP_REQ_LVL44 - ixp); smax = "Level 44";}
    if (ixp < XP_REQ_LVL43) {idiff = (XP_REQ_LVL43 - ixp); smax = "Level 43";}
    if (ixp < XP_REQ_LVL42) {idiff = (XP_REQ_LVL42 - ixp); smax = "Level 42";}
    if (ixp < XP_REQ_LVL41) {idiff = (XP_REQ_LVL41 - ixp); smax = "Level 41";}

    FloatingTextStringOnCreature("You need " + IntToString(idiff) + "xp for " + smax, oPC, FALSE);

}
