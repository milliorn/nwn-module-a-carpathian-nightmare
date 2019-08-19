void main()
{
    object oEnter = GetEnteringObject();
    int iObjectType = OBJECT_TYPE_CREATURE;
    string sTemplate = "murzhagultroll";
    location lLocation  = GetLocation(oEnter);
    object oModule = GetModule();
    int iRoll = d20();

    if (GetIsPC(oEnter))
    {
        if (iRoll == 20)
        {
            //SetLocalString(oModule, "TROLL", "TRUE");
            CreateObject(iObjectType, sTemplate, lLocation, TRUE);
            FloatingTextStringOnCreature("You see a <c ó >Green</c> Troll run away.", oEnter, TRUE);
        }
    }
}
