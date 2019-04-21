// pws_bind by Brian "spilth" Kelly
// For Neverwinter Nights - Binding Stone Tutorial
void main()
{
    object oPC      = GetPCSpeaker(),
           oRecall  = GetItemPossessedBy(oPC, "itm_carp_gem");
    effect eVis     = EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_HOLY);

    SetLocalString(oRecall, "BINDING", GetTag(OBJECT_SELF));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);

    string sBindPointTag    = GetLocalString(oRecall, "BINDING");
    object oBindPoint       = GetObjectByTag(sBindPointTag);
    string sBindPointName   = GetName(oBindPoint);

    SpeakString("<cÍf >You are now bound to the </c>" + sBindPointName);
}
