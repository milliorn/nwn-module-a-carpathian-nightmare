void main()
{
    object oPC = GetEnteringObject();
    location iLoc = GetLocation(GetWaypointByTag("DM_ROOM"));
    string sCDKEY = GetPCPublicCDKey(oPC, TRUE);

        if (sCDKEY == "QR4JFL9A"    ||  //milliorn
            sCDKEY == "QRMXQ6GM"    ||  //milliorn
            sCDKEY == "QR7N9CLL"    ||  //Cain
            sCDKEY == "QR6MNHFV"    ||  //sakuta
            sCDKEY == "QR4H676X"    ||  //Vermillion
            sCDKEY == "Q6UY7GCH"    ||  //Methonash
            sCDKEY == "Q6UEVVE4")       //sixonfive
        {
            AssignCommand(oPC, JumpToLocation(iLoc));
        }
}

