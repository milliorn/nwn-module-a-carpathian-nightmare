void main()
{
    object oPC   = GetEnteringObject();
    object oExamine = GetObjectByTag("EXAMINE_ME");

        if (!GetLocalInt(oPC, "EXAMINE"))
        {
            if (GetIsPC(oPC) || !GetIsDM(oPC))
            {
                if (GetXP(oPC) <= 2)
                {
                    AssignCommand(oPC, ClearAllActions());
                    AssignCommand(oPC, ActionExamine(oExamine));
                    SetLocalInt(oPC, "EXAMINE", TRUE);
                }
            }
        }
}
