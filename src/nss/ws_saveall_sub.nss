//==//////////////////////////////////////////////////////////
// ws_saveall_sub
// Created by: Iznoghoud
// Created on: 26th December 2003
// Last Modified: 19th January 3004
/*
 This script works in conjunction with my Greater Wildshape
 script to preserve the item bonuses while the shifter is in
 polymorphed shape, after an ExportAllCharacters() or
 ExportSingleCharacter() is done.
*/
//==//////////////////////////////////////////////////////////

#include "ws_inc_shifter"

// Refires nSpell on oPc. If oPC was attacking something, it will make oPC start
// attacking again after the spell is cast.
void ReFireSpell(object oPC, int nSpell);

void main()
{
    object oPC = OBJECT_SELF;

    int nSpell = ScanForPolymorphEffect(oPC);

    if ( nSpell < 0 ) // If not applied by a spell, return
    {
        return;
    }
    // Note: Druid wildshapes will have their duration renewed!
    // There is no way to get the duration left on an effect.
    // Change the number 396 to 405 to not allow druid wildshapes' properties to be reapplied.
    else if ( ( nSpell >= 387 && nSpell <= 396 ) ||       // Shapechange, Polymorph Self
           nSpell == SPELL_TENSERS_TRANSFORMATION )  // Tensers Transformation
    {
        return;
    }
    else
    {
        DelayCommand(0.01, ReFireSpell(oPC, nSpell));
    }
}

void ReFireSpell(object oPC, int nSpell)
{
    // This is neccesary so the spell can be re-fired on the player.
    // Otherwise, if the shifter was in combat, it would wait in the action
    // queue until the player stopped fighting. When in combat, it will make
    // the shifter start attacking again.
    object oAttackee = GetAttackTarget(oPC);

    // We clear all actions if the player is not resting.
    if ( !GetIsResting(oPC) )
    {
        AssignCommand(oPC, ClearAllActions());
    }

    // Re-fire the spell on the shifter.
    SetLocalInt(oPC, "GW_ServerSave", TRUE);

    //ActionCastSpellAtObject(nSpell, oPC, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
    AssignCommand(oPC, ActionCastSpellAtObject(nSpell, oPC, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));

    // Start attacking our target again if we had one.
    if ( GetIsObjectValid(oAttackee) )
    {
        // If we do not delaycommand here again, the stackable properties won't be re-applied.
        AssignCommand(oPC, DelayCommand(0.01, ActionAttack(oAttackee)));
    }


}

