// pws_binding by Brian "spilth" Kelly
// For Neverwinter Nights - Binding Stone Tutorial
//NO_PORTALS var

void main()
{
    // Binding Objects needs to know who to "talk" to...
    object oUser = GetLastUsedBy(),
           oRecall = GetItemPossessedBy(oUser, "itm_carp_gem");
    string sBindPoint, sObjectTag, sPCName;
    if (GetIsPC(oUser))
    {
        sBindPoint = GetLocalString(oRecall, "BINDING");
        sObjectTag = GetTag(OBJECT_SELF);
        if (sBindPoint != sObjectTag)
        {
            // Kick off the conversation called "pws_binding"
            BeginConversation("pws_binding", oUser);

        }
        else
        {
            // They're already bound here
            sPCName = GetName(oUser);
            SpeakString("You are already bound to this location, " + sPCName);
        }
    }
}

