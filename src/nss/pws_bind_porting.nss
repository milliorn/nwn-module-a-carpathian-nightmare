#include "nw_i0_plot"
void main()
{
    object oPC = GetLastUsedBy(),
           oRecall = GetItemPossessedBy(oPC, "itm_carp_gem");
    string sBindPoint = GetLocalString(oRecall, "BINDING");
    location lBindPoint;
    effect eVis;

    if (sBindPoint != "")
    {
        lBindPoint = GetLocation(GetObjectByTag(sBindPoint));
        DelayCommand(1.5,(AssignCommand(oPC, JumpToLocation(lBindPoint))));
        eVis = EffectVisualEffect(VFX_IMP_HARM);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    }
}
