void main()

{
    object oPC = GetEnteringObject();
    string sName = GetName(oPC);
    string  sArea = GetTag(GetArea(oPC));

    if (GetIsDM(oPC)) return;

    if (sArea == "Arena")

    {
        SpeakString(sName + "<cÌwþ> has entered the </c>Arena", TALKVOLUME_SHOUT);
        return;
    }

    if (sArea == "GladiatorPit")

    {
        SpeakString(sName + "<cÌwþ> has entered the </c>Gladiator Pit", TALKVOLUME_SHOUT);
        return;
    }
}
 // Color Text Constsants
//const string TXT_COLOR_GRAY       = "<c°°°>"; // Gray
//const string TXT_COLOR_WHITE      = "<cóóó>"; // White
//const string TXT_COLOR_CYAN       = "<c óó>"; // Light Cyan
//const string TXT_COLOR_MAGENTA    = "<có ó>"; // Magenta
//const string TXT_COLOR_YELLOW     = "<cóó >"; // Yellow
//const string TXT_COLOR_RED        = "<có  >"; // Red
//const string TXT_COLOR_ORANGE     = "<cþf >"; // Orange
//const string TXT_COLOR_GREEN      = "<c ó >"; // Green
//const string TXT_COLOR_LIGHT_BLUE = "<cfÌþ>"; // Light BlueBlue
//const string TXT_COLOR_DARK_BLUE  = "<c fþ>"; // Dark Blue
//const string TXT_COLOR_PURPLE     = "<cÌwþ>";
//const string TXT_COLOR_NONE       = "";       // Default (no color)
//const string TXT_COLOR_END        = "</c>";   // (color end TAG)
//const string TXT_COLOR_DEFAULT    = TXT_COLOR_YELLOW;
