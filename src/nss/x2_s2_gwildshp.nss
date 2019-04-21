//::///////////////////////////////////////////////
//:: Greater Wild Shape, Humanoid Shape
//:: x2_s2_gwildshp
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Allows the character to shift into one of these
    forms, gaining special abilities

    Credits must be given to mr_bumpkin from the NWN
    community who had the idea of merging item properties
    from weapon and armor to the creatures new forms.

*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-02
//:://////////////////////////////////////////////
//:: Modified By: Iznoghoud
//:: For NWN Version 1.64
// See ws_inc_shifter for details on the changes.
#include "ws_inc_shifter"

void main()
{
    //--------------------------------------------------------------------------
    // Declare major variables
    //--------------------------------------------------------------------------
    int    nSpell = GetSpellId();
    object oTarget = GetSpellTargetObject();
    effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
    int    nShifter = GetLevelByClass(CLASS_TYPE_SHIFTER);
    effect ePoly;
    int    nPoly;

    // Feb 13, 2004, Jon: Added scripting to take care of case where it's an NPC
    // using one of the feats. It will randomly pick one of the shapes associated
    // with the feat.
    switch(nSpell)
    {
        // Greater Wildshape I
        case 646: nSpell = Random(5)+658; break;
        // Greater Wildshape II
        case 675: switch(Random(3))
                  {
                    case 0: nSpell = 672; break;
                    case 1: nSpell = 678; break;
                    case 2: nSpell = 680;
                  }
                  break;
        // Greater Wildshape III
        case 676: switch(Random(3))
                  {
                    case 0: nSpell = 670; break;
                    case 1: nSpell = 673; break;
                    case 2: nSpell = 674;
                  }
                  break;
        // Greater Wildshape IV
        case 677: switch(Random(3))
                  {
                    case 0: nSpell = 679; break;
                    case 1: nSpell = 691; break;
                    case 2: nSpell = 694;
                  }
                  break;
        // Humanoid Shape
        case 681:  nSpell = Random(3)+682; break;
        // Undead Shape
        case 685:  nSpell = Random(3)+704; break;
        // Dragon Shape
        case 725:  nSpell = Random(3)+707; break;
        // Outsider Shape
        case 732:  nSpell = Random(3)+733; break;
        // Construct Shape
        case 737:  nSpell = Random(3)+738; break;
    }

    //--------------------------------------------------------------------------
    // Determine which form to use based on spell id, gender and level
    //--------------------------------------------------------------------------
    switch (nSpell)
    {

        //-----------------------------------------------------------------------
        // Greater Wildshape I - Wyrmling Shape
        //-----------------------------------------------------------------------
        case 658:  nPoly = POLYMORPH_TYPE_WYRMLING_RED; break;
        case 659:  nPoly = POLYMORPH_TYPE_WYRMLING_BLUE; break;
        case 660:  nPoly = POLYMORPH_TYPE_WYRMLING_BLACK; break;
        case 661:  nPoly = POLYMORPH_TYPE_WYRMLING_WHITE; break;
        case 662:  nPoly = POLYMORPH_TYPE_WYRMLING_GREEN; break;

        //-----------------------------------------------------------------------
        // Greater Wildshape II  - Minotaur, Gargoyle, Harpy
        //-----------------------------------------------------------------------
        case 672: if (nShifter < X2_GW2_EPIC_THRESHOLD)
                     nPoly = POLYMORPH_TYPE_HARPY;
                  else
                     nPoly = 97;
                  break;

        case 678: if (nShifter < X2_GW2_EPIC_THRESHOLD)
                     nPoly = POLYMORPH_TYPE_GARGOYLE;
                  else
                     nPoly = 98;
                  break;

        case 680: if (nShifter < X2_GW2_EPIC_THRESHOLD)
                     nPoly = POLYMORPH_TYPE_MINOTAUR;
                  else
                     nPoly = 96;
                  break;

        //-----------------------------------------------------------------------
        // Greater Wildshape III  - Drider, Basilisk, Manticore
        //-----------------------------------------------------------------------
        case 670: if (nShifter < X2_GW3_EPIC_THRESHOLD)
                     nPoly = POLYMORPH_TYPE_BASILISK;
                  else
                     nPoly = 99;
                  break;

        case 673: if (nShifter < X2_GW3_EPIC_THRESHOLD)
                     nPoly = POLYMORPH_TYPE_DRIDER;
                  else
                     nPoly = 100;
                  break;

        case 674: if (nShifter < X2_GW3_EPIC_THRESHOLD)
                     nPoly = POLYMORPH_TYPE_MANTICORE;
                  else
                     nPoly = 101;
                  break;

       //-----------------------------------------------------------------------
       // Greater Wildshape IV - Dire Tiger, Medusa, MindFlayer
       //-----------------------------------------------------------------------
        case 679: nPoly = POLYMORPH_TYPE_MEDUSA; break;
        case 691: nPoly = 68; break; // Mindflayer
        case 694: nPoly = 69; break; // DireTiger


       //-----------------------------------------------------------------------
       // Humanoid Shape - Kobold Commando, Drow, Lizard Crossbow Specialist
       //-----------------------------------------------------------------------
       case 682:
                 if(nShifter< 17)
                 {
                     if (GetGender(OBJECT_SELF) == GENDER_MALE) //drow
                         nPoly = 59;
                     else
                         nPoly = 70;
                 }
                 else
                 {
                     if (GetGender(OBJECT_SELF) == GENDER_MALE) //drow
                         nPoly = 105;
                     else
                         nPoly = 106;
                 }
                 break;
       case 683:
                 if(nShifter< 17)
                 {
                    nPoly = 82; break; // Lizard
                 }
                 else
                 {
                    nPoly =104; break; // Epic Lizard
                 }
       case 684: if(nShifter< 17)
                 {
                    nPoly = 83; break; // Kobold Commando
                 }
                 else
                 {
                    nPoly = 103; break; // Kobold Commando
                 }

       //-----------------------------------------------------------------------
       // Undead Shape - Spectre, Risen Lord, Vampire
       //-----------------------------------------------------------------------
       case 704: nPoly = 75; break; // Risen lord

       case 705: if (GetGender(OBJECT_SELF) == GENDER_MALE) // vampire
                     nPoly = 74;
                  else
                     nPoly = 77;
                 break;

       case 706: nPoly = 76; break; /// spectre

       //-----------------------------------------------------------------------
       // Dragon Shape - Red Blue and Green Dragons
       //-----------------------------------------------------------------------
       case 707: nPoly = 72; break; // Ancient Red   Dragon
       case 708: nPoly = 71; break; // Ancient Blue  Dragon
       case 709: nPoly = 73; break; // Ancient Green Dragon


       //-----------------------------------------------------------------------
       // Outsider Shape - Rakshasa, Azer Chieftain, Black Slaad
       //-----------------------------------------------------------------------
       case 733:   if (GetGender(OBJECT_SELF) == GENDER_MALE) //azer
                      nPoly = 85;
                    else // anything else is female
                      nPoly = 86;
                    break;

       case 734:   if (GetGender(OBJECT_SELF) == GENDER_MALE) //rakshasa
                      nPoly = 88;
                    else // anything else is female
                      nPoly = 89;
                    break;

       case 735: nPoly =87; break; // slaad

       //-----------------------------------------------------------------------
       // Construct Shape - Stone Golem, Iron Golem, Demonflesh Golem
       //-----------------------------------------------------------------------
       case 738: nPoly =91; break; // stone golem
       case 739: nPoly =92; break; // demonflesh golem
       case 740: nPoly =90; break; // iron golem

    }


    //--------------------------------------------------------------------------
    // Determine which items get their item properties merged onto the shifters
    // new form.
    //--------------------------------------------------------------------------
    int bWeapon;
    int bArmor;
    int bItems;
    int bCopyGlovesToClaws = FALSE;

    bWeapon = ShifterMergeWeapon(nPoly);

    if ( GW_ALWAYS_COPY_ARMOR_PROPS )
        bArmor = TRUE;
    else
        bArmor  = ShifterMergeArmor(nPoly);

    if ( GW_ALWAYS_COPY_ITEM_PROPS )
        bItems = TRUE;
    else
        bItems  = ShifterMergeItems(nPoly);

    //--------------------------------------------------------------------------
    // Send message to PC about which items get merged to this form
    //--------------------------------------------------------------------------
    string sMerge;
    sMerge = "Merged: "; // <c~¬þ>: This is a color code that makes the text behind it sort of light blue.
    if(bArmor) sMerge += "<cazþ>Armor, Helmet, Shield";
    if(bItems) sMerge += ",</c> <caþa>Rings, Amulet, Cloak, Boots, Belt, Bracers";
    if( bWeapon || GW_COPY_WEAPON_PROPS_TO_UNARMED == 1 )
        sMerge += ",</c> <cþAA>Weapon";
    else if ( GW_COPY_WEAPON_PROPS_TO_UNARMED == 2 )
        sMerge += ",</c> <cþAA>Gloves to unarmed attacks";
    else if (GW_COPY_WEAPON_PROPS_TO_UNARMED == 3 )
        sMerge += ",</c> <cþAA>Weapon (if you had one equipped) or gloves to unarmed attacks";
    else
        sMerge += ",</c> <cþAA>No weapon or gloves to unarmed attacks";
    SendMessageToPC(oTarget,sMerge + ".</c>");

    //--------------------------------------------------------------------------
    // Store the old objects so we can access them after the character has
    // changed into his new form
    //--------------------------------------------------------------------------
    object oWeaponOld;
    object oArmorOld;
    object oRing1Old ;
    object oRing2Old;
    object oAmuletOld;
    object oCloakOld ;
    object oBootsOld  ;
    object oBeltOld   ;
    object oHelmetOld;
    object oShield ;
    object oBracerOld;
    object oHideOld;

    int nServerSaving = GetLocalInt(OBJECT_SELF, "GW_ServerSave");
    if(nServerSaving != TRUE)
    {
        //if not polymorphed get items worn and store on player.
        oWeaponOld = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,OBJECT_SELF);
        oArmorOld  = GetItemInSlot(INVENTORY_SLOT_CHEST,OBJECT_SELF);
        oRing1Old  = GetItemInSlot(INVENTORY_SLOT_LEFTRING,OBJECT_SELF);
        oRing2Old  = GetItemInSlot(INVENTORY_SLOT_RIGHTRING,OBJECT_SELF);
        oAmuletOld = GetItemInSlot(INVENTORY_SLOT_NECK,OBJECT_SELF);
        oCloakOld  = GetItemInSlot(INVENTORY_SLOT_CLOAK,OBJECT_SELF);
        oBootsOld  = GetItemInSlot(INVENTORY_SLOT_BOOTS,OBJECT_SELF);
        oBeltOld   = GetItemInSlot(INVENTORY_SLOT_BELT,OBJECT_SELF);
        oHelmetOld = GetItemInSlot(INVENTORY_SLOT_HEAD,OBJECT_SELF);
        oShield    = GetItemInSlot(INVENTORY_SLOT_LEFTHAND,OBJECT_SELF);
        oBracerOld  = GetItemInSlot(INVENTORY_SLOT_ARMS,OBJECT_SELF);
        oHideOld = GetItemInSlot(INVENTORY_SLOT_CARMOUR,OBJECT_SELF);
        SetLocalObject(OBJECT_SELF,"GW_OldWeapon",oWeaponOld);
        SetLocalObject(OBJECT_SELF,"GW_OldArmor",oArmorOld);
        SetLocalObject(OBJECT_SELF,"GW_OldRing1",oRing1Old);
        SetLocalObject(OBJECT_SELF,"GW_OldRing2",oRing2Old);
        SetLocalObject(OBJECT_SELF,"GW_OldAmulet",oAmuletOld);
        SetLocalObject(OBJECT_SELF,"GW_OldCloak",oCloakOld);
        SetLocalObject(OBJECT_SELF,"GW_OldBoots",oBootsOld);
        SetLocalObject(OBJECT_SELF,"GW_OldBelt",oBeltOld);
        SetLocalObject(OBJECT_SELF,"GW_OldHelmet",oHelmetOld);
        SetLocalObject(OBJECT_SELF,"GW_OldBracer",oBracerOld);
        SetLocalObject(OBJECT_SELF,"GW_OldHide",oHideOld);

        if (GetIsObjectValid(oShield))
        {
            if (GetBaseItemType(oShield) !=BASE_ITEM_LARGESHIELD &&
                GetBaseItemType(oShield) !=BASE_ITEM_SMALLSHIELD &&
                GetBaseItemType(oShield) !=BASE_ITEM_TOWERSHIELD)
            {
                oShield = OBJECT_INVALID;
            }
        }
        SetLocalObject(OBJECT_SELF,"GW_OldShield",oShield);
    }
    else
    {
        //If server saving use items stored earlier.
        oWeaponOld =     GetLocalObject(OBJECT_SELF,"GW_OldWeapon");
        oArmorOld  =     GetLocalObject(OBJECT_SELF,"GW_OldArmor");
        oRing1Old  =     GetLocalObject(OBJECT_SELF,"GW_OldRing1");
        oRing2Old  =     GetLocalObject(OBJECT_SELF,"GW_OldRing2");
        oAmuletOld =     GetLocalObject(OBJECT_SELF,"GW_OldAmulet");
        oCloakOld  =     GetLocalObject(OBJECT_SELF,"GW_OldCloak");
        oBootsOld  =     GetLocalObject(OBJECT_SELF,"GW_OldBoots");
        oBeltOld   =     GetLocalObject(OBJECT_SELF,"GW_OldBelt");
        oHelmetOld =     GetLocalObject(OBJECT_SELF,"GW_OldHelmet");
        oShield    =     GetLocalObject(OBJECT_SELF,"GW_OldShield");
        oBracerOld =     GetLocalObject(OBJECT_SELF,"GW_OldBracer");
        oHideOld   =     GetLocalObject(OBJECT_SELF,"GW_OldHide");
        SetLocalInt(OBJECT_SELF, "GW_ServerSave", FALSE);
    }


    //--------------------------------------------------------------------------
    // Here the actual polymorphing is done
    //--------------------------------------------------------------------------
    ePoly = EffectPolymorph(nPoly);
    //--------------------------------------------------------------------------
    // Iznoghoud: Handle stacking item properties here.
    ePoly = AddStackablePropertiesToPoly ( OBJECT_SELF, ePoly, bWeapon, bItems, bArmor, oArmorOld, oRing1Old, oRing2Old, oAmuletOld, oCloakOld, oBracerOld, oBootsOld, oBeltOld, oHelmetOld, oShield, oWeaponOld, oHideOld);
    //--------------------------------------------------------------------------
    ePoly = ExtraordinaryEffect(ePoly);
    ClearAllActions(); // prevents an exploit
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoly, OBJECT_SELF);
    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));

    //--------------------------------------------------------------------------
    // This code handles the merging of item properties
    //--------------------------------------------------------------------------
    object oWeaponNew = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,OBJECT_SELF);
    object oArmorNew = GetItemInSlot(INVENTORY_SLOT_CARMOUR,OBJECT_SELF);
    object oClawLeft = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L,OBJECT_SELF);
    object oClawRight = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R,OBJECT_SELF);
    object oBite = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B,OBJECT_SELF);

    //identify weapon
    SetIdentified(oWeaponNew, TRUE);

    //--------------------------------------------------------------------------
    // ...Weapons
    //--------------------------------------------------------------------------
    if (bWeapon)
    {
        //------------------------------------------------------------------
        // Merge weapon properties...
        //------------------------------------------------------------------
        WildshapeCopyWeaponProperties(oTarget, oWeaponOld,oWeaponNew);
    }
    else
    {
        switch ( GW_COPY_WEAPON_PROPS_TO_UNARMED )
        {
        case 1: // Copy over weapon properties to claws/bite
            WildshapeCopyNonStackProperties(oWeaponOld,oClawLeft, TRUE);
            WildshapeCopyNonStackProperties(oWeaponOld,oClawRight, TRUE);
            WildshapeCopyNonStackProperties(oWeaponOld,oBite, TRUE);
            break;
        case 2: // Copy over glove properties to claws/bite
            WildshapeCopyNonStackProperties(oBracerOld,oClawLeft, FALSE);
            WildshapeCopyNonStackProperties(oBracerOld,oClawRight, FALSE);
            WildshapeCopyNonStackProperties(oBracerOld,oBite, FALSE);
            bCopyGlovesToClaws = TRUE;
            break;
        case 3: // Copy over weapon properties to claws/bite if wearing a weapon, otherwise copy gloves
            if ( GetIsObjectValid(oWeaponOld) )
            {
                WildshapeCopyNonStackProperties(oWeaponOld,oClawLeft, TRUE);
                WildshapeCopyNonStackProperties(oWeaponOld,oClawRight, TRUE);
                WildshapeCopyNonStackProperties(oWeaponOld,oBite, TRUE);
            }
            else
            {
                WildshapeCopyNonStackProperties(oBracerOld,oClawLeft, FALSE);
                WildshapeCopyNonStackProperties(oBracerOld,oClawRight, FALSE);
                WildshapeCopyNonStackProperties(oBracerOld,oBite, FALSE);
                bCopyGlovesToClaws = TRUE;
            }
            break;
        default: // Do not copy over anything
            break;
        };
    }

    //--------------------------------------------------------------------------
    // ...Armor
    //--------------------------------------------------------------------------
    if (bArmor)
    {
        //----------------------------------------------------------------------
        // Merge item properties from armor and helmet...
        //----------------------------------------------------------------------
        WildshapeCopyNonStackProperties(oArmorOld,oArmorNew);
        WildshapeCopyNonStackProperties(oHelmetOld,oArmorNew);
        WildshapeCopyNonStackProperties(oShield,oArmorNew);
        WildshapeCopyNonStackProperties(oHideOld,oArmorNew);
    }

    //--------------------------------------------------------------------------
    // ...Magic Items
    //--------------------------------------------------------------------------
    if (bItems)
    {
        //----------------------------------------------------------------------
        // Merge item properties from from rings, amulets, cloak, boots, belt
        //----------------------------------------------------------------------
        WildshapeCopyNonStackProperties(oRing1Old,oArmorNew);
        WildshapeCopyNonStackProperties(oRing2Old,oArmorNew);
        WildshapeCopyNonStackProperties(oAmuletOld,oArmorNew);
        WildshapeCopyNonStackProperties(oCloakOld,oArmorNew);
        WildshapeCopyNonStackProperties(oBootsOld,oArmorNew);
        WildshapeCopyNonStackProperties(oBeltOld,oArmorNew);
        WildshapeCopyNonStackProperties(oBracerOld,oArmorNew);
    }

    //--------------------------------------------------------------------------
    // Set artificial usage limits for special ability spells to work around
    // the engine limitation of not being able to set a number of uses for
    // spells in the polymorph radial
    //--------------------------------------------------------------------------
    ShifterSetGWildshapeSpellLimits(nSpell);

}








