void main()
{
    object oPC = GetLastUsedBy();
    object oModule = GetModule();
    string sPlayer = GetName(oPC);
    string sKey = GetPCPublicCDKey(oPC);
    int iLevel = GetHitDice(oPC);

    if (GetLocalString(oModule, sPlayer) == sKey)
    {
        FloatingTextStringOnCreature("<c ó >Anti Spamming Code - <cóóó>", oPC);
        SendMessageToPC(oPC, "<c ó >Anti Spamming Code - <cóóó>");
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionForceMoveToLocation(GetLocation(GetWaypointByTag("NW_DEATH_TEMPLE")), TRUE));
        SendMessageToAllDMs("<cþf >(Magic Mushroom) Anti Spamming Code fired on </c>"+ sPlayer);
        return;
    }

    if (iLevel <= 5)
    {
        ActionCastSpellAtObject(SPELL_AID, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_AMPLIFY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_BARKSKIN, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_CLARITY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_DARKVISION, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_DEAFENING_CLANG, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_DEATH_WARD, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_DISPLACEMENT, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_ENTROPIC_SHIELD, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_FREEDOM_OF_MOVEMENT, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_CAMOFLAGE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_GHOSTLY_VISAGE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_IRONGUTS, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_LESSER_MIND_BLANK, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_MONSTROUS_REGENERATION, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_CAMOFLAGE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_BULLS_STRENGTH, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_CATS_GRACE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_EAGLE_SPLEDOR, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_ENDURANCE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_FOXS_CUNNING, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_OWLS_WISDOM, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_INVISIBILITY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_SPELL_RESISTANCE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_SEE_INVISIBILITY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_DARKFIRE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_KEEN_EDGE, oPC, TRUE);

        SetLocalString(oModule, sPlayer, sKey);
        DelayCommand(6.0, DeleteLocalString(oModule, sPlayer));
        return;
    }

    else
    {
        ActionCastSpellAtObject(SPELL_SANCTUARY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_INVISIBILITY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_SEE_INVISIBILITY, oPC, TRUE);

        SetLocalString(oModule, sPlayer, sKey);
        DelayCommand(6.0, DeleteLocalString(oModule, sPlayer));
    }
}
