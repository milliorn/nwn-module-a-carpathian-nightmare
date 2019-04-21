void main()
{
    object oPC = GetEnteringObject();
    string sName = GetName(oPC, FALSE);
    string sCDKEY = GetPCPublicCDKey(oPC, TRUE);

        if (sCDKEY == "QR4JFL9A"    ||  //milliorn
            sCDKEY == "QRMXQ6GM"    ||  //milliorn
            sCDKEY == "QR7N9CLL"    ||  //Cain
            sCDKEY == "QR6MNHFV"    ||  //sakuta
            sCDKEY == "QR4H676X"    ||  //Vermillion
            sCDKEY == "Q6UY7GCH"    ||  //Methonash
            sCDKEY == "Q6UEVVE4")       //sixonfive
        {
            return;
        }

        AssignCommand(oPC, ActionJumpToLocation(GetStartingLocation()));
        SendMessageToAllDMs("<có  >WARNING!!! </c>" + sName + " <có  >tried to access </c>"
        + GetName(GetArea(oPC)));
}
