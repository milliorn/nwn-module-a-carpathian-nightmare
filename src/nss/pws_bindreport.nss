// pws_bindreport by Brian "spilth" Kelly
// For Neverwinter Nights - Binding Stone Tutorial
void main()
{
    object oPC = GetPCSpeaker(),
           oRecall = GetItemPossessedBy(oPC, "itm_carp_gem");
    string sBindPointTag = GetLocalString(oRecall, "BINDING");
    object oBindPoint = GetObjectByTag(sBindPointTag);
    string sBindPointName = GetName(oBindPoint);

    if (sBindPointTag != "")
    {
        SpeakString("<cÍf >You are currently bound to the</c>" + sBindPointName);
    }
    else
    {
        // This will never happen if you use default binding points
        SpeakString("<c Í >You are not currently bound anywhere.</c>");
    }
}

