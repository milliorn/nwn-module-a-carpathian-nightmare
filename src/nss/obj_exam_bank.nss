void main()
{
    object oPC   = GetEnteringObject();
    object oExamine = GetObjectByTag("SFPB_Chest");

    if (!GetLocalInt(oPC, "EXAMINE_BANK"))
    {
        if (GetIsPC(oPC) || !GetIsDM(oPC))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionExamine(oExamine));
            SetLocalInt(oPC, "EXAMINE_BANK", TRUE);
        }
    }
}
