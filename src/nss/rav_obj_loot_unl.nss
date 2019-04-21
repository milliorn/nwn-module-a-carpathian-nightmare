void main()
{
    object oPC = GetLastUnlocked();
    ActionCastSpellAtObject(SPELL_HORRID_WILTING, oPC, METAMAGIC_MAXIMIZE, TRUE, 60, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
}
