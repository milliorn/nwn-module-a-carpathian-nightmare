// Token Conversation Starting Conditional Script
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    return(GetIsObjectValid(GetItemPossessedBy(oPC, "gauntlet_token")));
}
