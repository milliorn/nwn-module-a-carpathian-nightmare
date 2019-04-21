void main()
{
    object oPC   = GetEnteringObject();
    object oExamine = GetObjectByTag("OmegaForgeWarning");

    if (!GetLocalInt(oPC, "EXAMINE_FORGE"))
    {
        if (GetIsPC(oPC) || !GetIsDM(oPC))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionExamine(oExamine));
            SetLocalInt(oPC, "EXAMINE_FORGE", TRUE);
        }
    }
}
