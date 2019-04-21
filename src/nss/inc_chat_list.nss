//List all Emote Commands
void ChatListEmotes(object oPC);
void ChatListEmotes(object oPC)
{
    SendMessageToPC(oPC, "<c ó >Emotes:</c>");

    SendMessageToPC(oPC, "<cþf >These are the emotes you can use in chat." +
    "  They can be typed into any chat channel except private channel." +
    "  Type *<name of shortcut> all in one word to access the emote.</c>");

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "<cfÌþ>Bad Idea <cþþþ>(<cfÌþ>*bi<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Beg <cþþþ>(<cfÌþ>*be<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Bend Forward <cþþþ>(<cfÌþ>*bf<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Bored <cþþþ>(<cfÌþ>*bo<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Cheer (Yes) <cþþþ>(<cfÌþ>*gr<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Conjure <cþþþ>(<cfÌþ>*co<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Dance <cþþþ>(<cfÌþ>*da<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Dodge <cþþþ>(<cfÌþ>*do<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Drunk <cþþþ>(<cfÌþ>*dr<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Duck <cþþþ>(<cfÌþ>*du<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Fall Back <cþþþ>(<cfÌþ>*fb<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Fall Front <cþþþ>(<cfÌþ>*ff<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Goodbye <cþþþ>(<cfÌþ>*go<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Greeting <cþþþ>(<cfÌþ>*gr<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Invoke <cþþþ>(<cfÌþ>*in<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Laugh <cþþþ>(<cfÌþ>*la<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Lean Over <cþþþ>(<cfÌþ>*lo<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Listen <cþþþ>(<cfÌþ>*li<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Meditate <cþþþ>(<cfÌþ>*me<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Moan <cþþþ>(<cfÌþ>*mo<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>No <cþþþ>(<cfÌþ>*no<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Puke <cþþþ>(<cfÌþ>*pu<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Read <cþþþ>(<cfÌþ>*re<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Salute <cþþþ>(<cfÌþ>*sa<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Search <cþþþ>(<cfÌþ>*se<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Sip <cþþþ>(<cfÌþ>*si<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Spasm <cþþþ>(<cfÌþ>*sp<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Squat <cþþþ>(<cfÌþ>*sq<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Steal <cþþþ>(<cfÌþ>*st<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Taunt <cþþþ>(<cfÌþ>*ta<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Tired <cþþþ>(<cfÌþ>*ti<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Worship <cþþþ>(<cfÌþ>*wo<cþþþ>)");
}

// List all Weapon Commands
void ChatListWeapons(object oPC);
void ChatListWeapons(object oPC)
{
    SendMessageToPC(oPC, "<c ó >Weapon VFX:</c>");

    SendMessageToPC(oPC, "<cþf >These are the commands you can use in chat." +
    "  They can be typed into any chat channel except private channel." +
    "  Type !<name of shortcut> all in one word to access the command.</c>");

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "<cfÌþ>Acid <cþþþ>(<cfÌþ>!wpac<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Cold <cþþþ>(<cfÌþ>!wpco<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Electric <cþþþ>(<cfÌþ>!da<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Evil <cþþþ>(<cfÌþ>!wpev<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Fire <cþþþ>(<cfÌþ>!wpfi<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Holy (Yes) <cþþþ>(<cfÌþ>!wpho<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Sonic <cþþþ>(<cfÌþ>!wpso<cþþþ>)");
}

// List all Dice Commands
void ChatListDice(object oPC);
void ChatListDice(object oPC)
{
    SendMessageToPC(oPC, "<c ó >Dice Rolls:</c>");

    SendMessageToPC(oPC, "<cþf >These are the commands you can use in chat." +
    "  They can be typed into any chat channel except private channel." +
    "  Type !<name of shortcut> all in one word to access the command.</c>");

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "<cfÌþ>!d10<cþþþ>");
    SendMessageToPC(oPC, "<cfÌþ>!d100<cþþþ>");
    SendMessageToPC(oPC, "<cfÌþ>!d12<cþþþ>");
    SendMessageToPC(oPC, "<cfÌþ>!d2<cþþþ>");
    SendMessageToPC(oPC, "<cfÌþ>!d20<cþþþ>");
    SendMessageToPC(oPC, "<cfÌþ>!d3<cþþþ>");
    SendMessageToPC(oPC, "<cfÌþ>!d4<cþþþ>");
    SendMessageToPC(oPC, "<cfÌþ>!d6<cþþþ>");
    SendMessageToPC(oPC, "<cfÌþ>!d8<cþþþ>");
}

// List all Alignment Commands
void ChatListAlignment(object oPC);
void ChatListAlignment(object oPC)
{
    SendMessageToPC(oPC, "<c ó >Alignments:</c>");

    SendMessageToPC(oPC, "<cþf >These are the commands you can use in chat." +
    "  They can be typed into any chat channel except private channel." +
    "  Type !<name of shortcut> all in one word to access the command.</c>");

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "<cfÌþ>Chaotic <cþþþ>(<cfÌþ>!align_chaotic<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Good <cþþþ>(<cfÌþ>!align_good<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Evil <cþþþ>(<cfÌþ>!align_evil<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Lawful <cþþþ>(<cfÌþ>!align_lawful<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Neutral <cþþþ>(<cfÌþ>!align_neutral<cþþþ>)");
}

// List all Wings Commands
void ChatListWings(object oPC);
void ChatListWings(object oPC)
{
    SendMessageToPC(oPC, "<c ó >Wings:</c>");

    SendMessageToPC(oPC, "<cþf >These are the commands you can use in chat." +
    "  They can be typed into any chat channel except private channel." +
    "  Type !<name of shortcut> all in one word to access the command.</c>");

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "<cfÌþ>Angel <cþþþ>(<cfÌþ>!w_ang<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Bat <cþþþ>(<cfÌþ>!w_bat<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Bird <cþþþ>(<cfÌþ>!w_bir<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Butterfly <cþþþ>(<cfÌþ>!w_but<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Demon <cþþþ>(<cfÌþ>!w_dem<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Dragon <cþþþ>(<cfÌþ>!w_dra<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>None <cþþþ>(<cfÌþ>!w_non<cþþþ>)");
}

// List all Tails Commands
void ChatListTails(object oPC);
void ChatListTails(object oPC)
{
    SendMessageToPC(oPC, "<c ó >Tails:</c>");

    SendMessageToPC(oPC, "<cþf >These are the commands you can use in chat." +
    "  They can be typed into any chat channel except private channel." +
    "  Type !<name of shortcut> all in one word to access the command.</c>");

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "<cfÌþ>Bone <cþþþ>(<cfÌþ>!t_bon<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Devil <cþþþ>(<cfÌþ>!t_dev<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Lizard <cþþþ>(<cfÌþ>!t_liz<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>None <cþþþ>(<cfÌþ>!t_non<cþþþ>)");
}

// List all Player Commands
void ChatListPlayer(object oPC);
void ChatListPlayer(object oPC)
{
    SendMessageToPC(oPC, "<c ó >Player:</c>");

    SendMessageToPC(oPC, "<cþf >These are the commands you can use in chat." +
    "  They can be typed into any chat channel except private channel." +
    "  Type !<name of shortcut> all in one word to access the command.</c>");

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "<cfÌþ>Looking For Group <cþþþ>(<cfÌþ>!lfg<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Re-Equip <cþþþ>(<cfÌþ>!re_equip<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Save <cþþþ>(<cfÌþ>!save<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Re-Level <cþþþ>(<cfÌþ>!relevel<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Server <cþþþ>(<cfÌþ>!server<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>PvP <cþþþ>(<cfÌþ>!pvp<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Bounties <cþþþ>(<cfÌþ>!bounties<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Status: Like <cþþþ>(<cfÌþ>!like<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Status: Dislike <cþþþ>(<cfÌþ>!dislike<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Portrait <cþþþ>(<cfÌþ>!portrait<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Voice <cþþþ>(<cfÌþ>!voice<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Skin <cþþþ>(<cfÌþ>!skin<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Hair <cþþþ>(<cfÌþ>!hair<cþþþ>)");

}

// List all Eyes Commands
void ChatListEyes(object oPC);
void ChatListEyes(object oPC)
{
    SendMessageToPC(oPC, "<c ó >Eyes:</c>");

    SendMessageToPC(oPC, "<cþf >These are the commands you can use in chat." +
    "  They can be typed into any chat channel except private channel." +
    "  Type !<name of shortcut> all in one word to access the command.</c>");

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "<cfÌþ>Cyan <cþþþ>(<cfÌþ>!eyec<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Green <cþþþ>(<cfÌþ>!eyeg<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>None <cþþþ>(<cfÌþ>!eyen<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Orange <cþþþ>(<cfÌþ>!eyeo<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Purple <cþþþ>(<cfÌþ>!eyep<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Red Flame <cþþþ>(<cfÌþ>!eyer<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>White <cþþþ>(<cfÌþ>!eyew<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Yellow: Like <cþþþ>(<cfÌþ>!eyew<cþþþ>)");
}

// List all Head Commands
void ChatListHead(object oPC);
void ChatListHead(object oPC)
{
    SendMessageToPC(oPC, "<c ó >Heads:</c>");

    SendMessageToPC(oPC, "<cþf >These are the commands you can use in chat." +
    "  They can be typed into any chat channel except private channel." +
    "  Type !<name of shortcut> all in one word to access the command.</c>");

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "<cfÌþ>Next <cþþþ>(<cfÌþ>!headn<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Previous <cþþþ>(<cfÌþ>!headp<cþþþ>)");
}

// List all Arm Commands
void ChatListArm(object oPC);
void ChatListArm(object oPC)
{
    SendMessageToPC(oPC, "<c ó >Arms:</c>");

    SendMessageToPC(oPC, "<cþf >These are the commands you can use in chat." +
    "  They can be typed into any chat channel except private channel." +
    "  Type !<name of shortcut> all in one word to access the command.</c>");

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "<cfÌþ>Bone <cþþþ>(<cfÌþ>!armb<cþþþ>)");
    SendMessageToPC(oPC, "<cfÌþ>Normal <cþþþ>(<cfÌþ>!armn<cþþþ>)");
}

/*void main(){}
