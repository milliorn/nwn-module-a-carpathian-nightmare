int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oChest = GetNearestObjectByTag("ChestofNames");
    object oItem  = GetFirstItemInInventory(oChest);
    int iArtifact = GetGoldPieceValue(oItem);
    int iGold = GetGold(oPC);
    if (iGold >= iArtifact) return FALSE;
    return TRUE;
}

