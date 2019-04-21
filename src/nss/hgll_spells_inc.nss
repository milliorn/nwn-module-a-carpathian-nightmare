//Returns the level of the input bard spell. Returns -1 if the input is not a bard spell.
int GetBardSpellLevel(int nSpell);
//Returns the level of the input sorcerer spell. Returns -1 if the input is not a sorcerer spell.
int GetSorcSpellLevel(int nSpell);
//This returns the name of any input sorcerer or bard spell.
string GetSpellName(int nSpell);

int GetBardSpellLevel(int nSpell)
{
int nResult = -1; //Defaults to not a Bard Spell
    switch (nSpell/150)
    {
        case 0://0-149
        switch (nSpell/25)
        {
            case 0://0-24
            switch(nSpell)
            {
                case 4: nResult=3; break;
                case 8: nResult=2; break;
                case 9: nResult=2; break;
                case 13: nResult=2; break;
                case 15: nResult=3; break;
                case 16: nResult=1; break;
                case 20: nResult=3; break;
                case 21: nResult=2; break;
            }
            break;
            case 1://25-49
            switch(nSpell)
            {
                case 26: nResult=3; break;
                case 31: nResult=4; break;
                case 32: nResult=1; break;
                case 33: nResult=0; break;
                case 34: nResult=2; break;
                case 35: nResult=3; break;
                case 36: nResult=2; break;
                case 37: nResult=0; break;
                case 40: nResult=4; break;
                case 41: nResult=3; break;
                case 45: nResult=4; break;
            }
            break;
            case 2://50-74
            switch(nSpell)
            {
                case 54: nResult=3; break;
                case 66: nResult=1; break;
                case 67: nResult=5; break;
            }
            break;
            case 3://75-99
            switch(nSpell)
            {
                case 75: nResult=3; break;
                case 78: nResult=3; break;
                case 80: nResult=5; break;
                case 82: nResult=4; break;
                case 83: nResult=2; break;
                case 86: nResult=1; break;
                case 88: nResult=4; break;
                case 90: nResult=2; break;
                case 92: nResult=3; break;
                case 94: nResult=1; break;
            }
            break;
            case 4://100-124
            switch(nSpell)
            {
                case 100: nResult=0; break;
                case 102: nResult=1; break;
                case 113: nResult=6; break;
                case 118: nResult=5; break;
                case 120: nResult=2; break;
                case 121: nResult=5; break;
            }
            break;
            case 5://125-149
            switch(nSpell)
            {
                case 126: nResult=4; break;
                case 146: nResult=3; break;
                case 147: nResult=3; break;
            }
            break;
        }
        break;
        case 1://150-299
        switch (nSpell/25)
        {
            case 6://150-174
            switch (nSpell)
            {
                case 151: nResult=0; break;
                case 155: nResult=1; break;
                case 157: nResult=2; break;
                case 163: nResult=2; break;
                case 165: nResult=1; break;
                case 166: nResult=3; break;
                case 167: nResult=2; break;
                case 174: nResult=1; break;
            }
            break;
            case 7://175-199
            switch (nSpell)
            {
                case 175: nResult=2; break;
                case 176: nResult=3; break;
                case 177: nResult=4; break;
                case 179: nResult=5; break;
                case 180: nResult=6; break;
            }
            break;

       }
       break;
       case 2://300-449
       switch (nSpell/25)
       {
            case 12://300-324
            switch (nSpell)
            {
                case 321: nResult=1; break;
                case 322: nResult=3; break;
            }
            break;
            case 14://350-374
            switch (nSpell)
            {
                case 354: nResult=2; break;
                case 355: nResult=2; break;
                case 356: nResult=2; break;
                case 365: nResult=2; break;
                case 368: nResult=6; break;
                case 369: nResult=6; break;
                case 373: nResult=4; break;
            }
            break;
            case 15://375-399
            switch (nSpell)
            {
                case 376: nResult=4; break;
                case 377: nResult=3; break;
            }
            break;
            case 16://400-424
            switch (nSpell)
            {
                case 416: nResult=0; break;
            }
            break;
            case 17://425-449
            switch (nSpell)
            {
                case 436: nResult=1; break;
                case 442: nResult=1; break;
                case 445: nResult=6; break;
            }
            break;
        }
        break;
        case 3://450-569
        switch (nSpell/25)
        {
            case 18://450-474
            switch (nSpell)
            {
                case 456: nResult=1; break;
                case 457: nResult=2; break;
                case 458: nResult=3; break;
            }
            break;

            case 21://525-549
            switch (nSpell)
            {
                case 539: nResult=3; break;
                case 544: nResult=1; break;
                case 545: nResult=3; break;
            }
            break;
            case 22://550-569
            switch (nSpell)
            {
                case 569: nResult=2; break;
            }
            break;
        }
        break;
    }

return nResult;
}

int GetSorcSpellLevel(int nSpell)
{
int nResult=-1;//Defaults to not a sorcerer spell
    switch (nSpell/150)
    {
        case 0://0-149
        switch (nSpell/25)
        {
            case 0://0-24
            switch (nSpell)
            {
        case 0: nResult=6; break;
        case 2: nResult=5; break;
        case 4: nResult=4; break;
        case 8: nResult=2; break;
        case 9: nResult=2; break;
        case 10: nResult=1; break;
        case 13: nResult=2; break;
        case 14: nResult=6; break;
        case 15: nResult=4; break;
        case 16: nResult=1; break;
        case 18: nResult=6; break;
        case 20: nResult=3; break;
        case 21: nResult=3; break;
        case 23: nResult=5; break;
        case 24: nResult=1; break;
            }
            break;
            case 1://25-49
            switch (nSpell)
            {
        case 25: nResult=5; break;
        case 26: nResult=4; break;
        case 27: nResult=4; break;
        case 28: nResult=7; break;
        case 30: nResult=8; break;
        case 36: nResult=2; break;
        case 37: nResult=0; break;
        case 39: nResult=7; break;
        case 40: nResult=5; break;
        case 41: nResult=3; break;
        case 44: nResult=9; break;
        case 45: nResult=5; break;
        case 47: nResult=4; break;
        case 49: nResult=2; break;
            }
            break;
            case 2://50-74
            switch (nSpell)
            {
        case 50: nResult=1; break;
        case 51: nResult=9; break;
        case 52: nResult=4; break;
        case 54: nResult=4; break;
        case 55: nResult=5; break;
        case 56: nResult=7; break;
        case 58: nResult=3; break;
        case 59: nResult=3; break;
        case 63: nResult=9; break;
        case 64: nResult=2; break;
        case 65: nResult=6; break;
        case 66: nResult=1; break;
        case 67: nResult=6; break;
        case 69: nResult=8; break;
        case 71: nResult=5; break;
        case 72: nResult=6; break;
        case 73: nResult=9; break;
        case 74: nResult=6; break;
            }
            break;
            case 3://75-99
            switch (nSpell)
            {
        case 75: nResult=3; break;
        case 78: nResult=3; break;
        case 82: nResult=5; break;
        case 83: nResult=3; break;
        case 86: nResult=1; break;
        case 88: nResult=4; break;
        case 89: nResult=8; break;
        case 90: nResult=2; break;
        case 92: nResult=3; break;
        case 93: nResult=2; break;
        case 94: nResult=2; break;
        case 95: nResult=5; break;
        case 96: nResult=5; break;
        case 98: nResult=4; break;
        case 99: nResult=5; break;
            }
            break;
            case 4://100-124
            switch (nSpell)
            {
        case 100: nResult=0; break;
        case 101: nResult=3; break;
        case 102: nResult=1; break;
        case 107: nResult=1; break;
        case 110: nResult=8; break;
        case 111: nResult=8; break;
        case 113: nResult=6; break;
        case 115: nResult=2; break;
        case 116: nResult=9; break;
        case 117: nResult=8; break;
        case 118: nResult=5; break;
        case 119: nResult=4; break;
        case 120: nResult=2; break;
        case 121: nResult=6; break;
        case 122: nResult=9; break;
        case 123: nResult=7; break;
            }
            break;
            case 5://125-149
            switch (nSpell)
            {
        case 127: nResult=4; break;
        case 128: nResult=6; break;
        case 130: nResult=4; break;
        case 131: nResult=9; break;
        case 132: nResult=7; break;
        case 134: nResult=8; break;
        case 135: nResult=7; break;
        case 137: nResult=3; break;
        case 141: nResult=7; break;
        case 143: nResult=1; break;
        case 144: nResult=0; break;
        case 145: nResult=4; break;
        case 146: nResult=4; break;
            }
            break;
        }
        break;
        case 1://150-299
        switch (nSpell/25)
        {
            case 6://150-174
            switch (nSpell)
            {
        case 150: nResult=2; break;
        case 151: nResult=0; break;
        case 155: nResult=1; break;
        case 157: nResult=2; break;
        case 158: nResult=6; break;
        case 159: nResult=4; break;
        case 160: nResult=7; break;
        case 161: nResult=9; break;
        case 165: nResult=1; break;
        case 166: nResult=3; break;
        case 169: nResult=7; break;
        case 171: nResult=3; break;
        case 172: nResult=4; break;
        case 174: nResult=1; break;
            }
            break;
            case 7://175-199
            switch (nSpell)
            {
        case 175: nResult=2; break;
        case 176: nResult=3; break;
        case 177: nResult=4; break;
        case 178: nResult=9; break;
        case 179: nResult=5; break;
        case 180: nResult=6; break;
        case 181: nResult=7; break;
        case 182: nResult=8; break;
        case 184: nResult=6; break;
        case 185: nResult=9; break;
        case 186: nResult=6; break;
        case 188: nResult=3; break;
        case 190: nResult=9; break;
        case 191: nResult=4; break;
        case 192: nResult=2; break;
        case 193: nResult=9; break;
            }
            break;
        }
        break;
        case 2://300-449
        switch (nSpell/25)
        {
            case 12://300-324
            switch (nSpell)
            {
        case 321: nResult=1; break;
        case 322: nResult=3; break;
            }
            break;
            case 14://350-374
            switch (nSpell)
            {
        case 354: nResult=2; break;
        case 355: nResult=2; break;
        case 356: nResult=2; break;
        case 365: nResult=2; break;
        case 367: nResult=8; break;
        case 368: nResult=4; break;
        case 369: nResult=5; break;
        case 370: nResult=3; break;
        case 371: nResult=1; break;
            }
            break;
            case 15://375-399
            switch (nSpell)
            {
        case 375: nResult=4; break;
        case 376: nResult=6; break;
        case 377: nResult=3; break;
            }
            break;
            case 16://400-424
            switch (nSpell)
            {
        case 415: nResult=1; break;
        case 416: nResult=0; break;
        case 417: nResult=1; break;
        case 419: nResult=2; break;
        case 424: nResult=0; break;
            }
            break;
            case 17://425-449
            switch (nSpell)
            {
        case 427: nResult=8; break;
        case 430: nResult=7; break;
        case 436: nResult=2; break;
        case 439: nResult=0; break;
        case 440: nResult=5; break;
        case 443: nResult=8; break;
        case 447: nResult=1; break;
        case 448: nResult=6; break;
            }
            break;
        }
        break;
        case 3://450-569
        switch (nSpell/25)
        {
            case 18://450-474
            switch (nSpell)
            {
        case 456: nResult=1; break;
        case 457: nResult=2; break;
        case 458: nResult=3; break;
        case 459: nResult=5; break;
        case 460: nResult=6; break;
        case 461: nResult=7; break;
        case 462: nResult=8; break;
        case 463: nResult=9; break;
            }
            break;
            case 19://475-499
            switch (nSpell)
            {
        case 485: nResult=6; break;
        case 486: nResult=6; break;
            }
            break;
            case 20://500-524
            switch (nSpell)
            {
        case 515: nResult=7; break;
        case 516: nResult=5; break;
        case 518: nResult=2; break;
        case 519: nResult=2; break;
        case 520: nResult=2; break;
        case 521: nResult=1; break;
        case 522: nResult=1; break;
        case 523: nResult=3; break;
        case 524: nResult=5; break;
            }
            break;
            case 21://525-549
            switch (nSpell)
            {
        case 526: nResult=3; break;
        case 527: nResult=2; break;
        case 528: nResult=6; break;
        case 533: nResult=9; break;
        case 534: nResult=1; break;
        case 539: nResult=3; break;
        case 541: nResult=8; break;
        case 542: nResult=2; break;
        case 543: nResult=1; break;
        case 544: nResult=1; break;
        case 545: nResult=3; break;
            }
            break;
            case 22://550-569
            switch (nSpell)
            {
        case 569: nResult=2; break;
            }
            break;
        }
        break;
    }
return nResult;
}

string GetSpellName(int nSpell)
{
string sResult = "";

    switch (nSpell/150)
    {
        case 0://0-149
        switch (nSpell/25)
        {
            case 0://0-24
            switch (nSpell)
            {
        case 0: sResult = "Acid Fog"; break;
        case 2: sResult = "Animate Dead"; break;
        case 4: sResult = "Bestow Curse"; break;
        case 8: sResult = "Blindness and Deafness"; break;
        case 9: sResult = "Bull's Strength"; break;
        case 10: sResult = "Burning Hands"; break;
        case 13: sResult = "Cat's Grace"; break;
        case 14: sResult = "Chain Lightning"; break;
        case 15: sResult = "Charm Monster"; break;
        case 16: sResult = "Charm Person"; break;
        case 18: sResult = "Circle of Death"; break;
        case 20: sResult = "Clairaudience and Clairvoyance"; break;
        case 21: sResult = "Clarity"; break;
        case 23: sResult = "Cloudkill"; break;
        case 24: sResult = "Color Spray"; break;
            }
            break;
            case 1://25-49
            switch (nSpell)
            {
        case 25: sResult = "Cone of Cold"; break;
        case 26: sResult = "Confusion"; break;
        case 27: sResult = "Contagion"; break;
        case 28: sResult = "Control Undead"; break;
        case 30: sResult = "Create Undead"; break;
        case 31: sResult = "Cure Critical Wounds"; break;
        case 32: sResult = "Cure Light Wounds"; break;
        case 33: sResult = "Cure Minor Wounds"; break;
        case 34: sResult = "Cure Moderate Wounds"; break;
        case 35: sResult = "Cure Serious Wounds"; break;
        case 36: sResult = "Darkness"; break;
        case 37: sResult = "Daze"; break;
        case 39: sResult = "Delayed Blast Fireball"; break;
        case 40: sResult = "Dismissal"; break;
        case 41: sResult = "Dispel Magic"; break;
        case 44: sResult = "Dominate Monster"; break;
        case 45: sResult = "Dominate Person"; break;
        case 47: sResult = "Elemental Shield"; break;
        case 49: sResult = "Endurance"; break;
            }
            break;
            case 2://50-74
            switch (nSpell)
            {
        case 50: sResult = "Endure Elements"; break;
        case 51: sResult = "Energy Drain"; break;
        case 52: sResult = "Enervation"; break;
        case 54: sResult = "Fear"; break;
        case 55: sResult = "Feeblemind"; break;
        case 56: sResult = "Finger of Death"; break;
        case 58: sResult = "Fireball"; break;
        case 59: sResult = "Flame Arrow"; break;
        case 63: sResult = "Gate"; break;
        case 64: sResult = "Ghoul Touch"; break;
        case 65: sResult = "Globe of Invulnerability"; break;
        case 66: sResult = "Grease"; break;
        case 67: sResult = "Greater Dispelling"; break;
        case 69: sResult = "Greater Planar Binding"; break;
        case 71: sResult = "Greater Shadow Conjuration"; break;
        case 72: sResult = "Greater Spell Breach"; break;
        case 73: sResult = "Greater Spell Mantle"; break;
        case 74: sResult = "Greater Stoneskin"; break;
            }
            break;
            case 3://75-99
            switch (nSpell)
            {
        case 75: sResult = "Gust of Wind"; break;
        case 78: sResult = "Haste"; break;
        case 80: sResult = "Healing Circle"; break;
        case 82: sResult = "Hold Monster"; break;
        case 83: sResult = "Hold Person"; break;
        case 86: sResult = "Identify"; break;
        case 88: sResult = "Improved Invisibility"; break;
        case 89: sResult = "Incendiary Cloud"; break;
        case 90: sResult = "Invisibility"; break;
        case 92: sResult = "Invisibility Sphere"; break;
        case 93: sResult = "Knock"; break;
        case 94: sResult = "Lesser Dispel"; break;
        case 95: sResult = "Lesser Mind Blank"; break;
        case 96: sResult = "Lesser Planar Binding"; break;
        case 97: sResult = "Lesser Restoration"; break;
        case 98: sResult = "Lesser Spell Breach"; break;
        case 99: sResult = "Lesser Spell Mantle"; break;
            }
            break;
            case 4://100-124
            switch (nSpell)
            {
        case 100: sResult = "Light"; break;
        case 101: sResult = "Lightning Bolt"; break;
        case 102: sResult = "Mage Armor"; break;
        case 107: sResult = "Magic Missle"; break;
        case 110: sResult = "Mass Blindness and Deafness"; break;
        case 111: sResult = "Mass Charm"; break;
        case 113: sResult = "Mass Haste"; break;
        case 115: sResult = "Melf's Acid Arrow"; break;
        case 116: sResult = "Meteor Swarm"; break;
        case 117: sResult = "Mind Blank"; break;
        case 118: sResult = "Mind Fog"; break;
        case 119: sResult = "Minor Globe of Invulnerability"; break;
        case 120: sResult = "Ghostly Visage"; break;
        case 121: sResult = "Ethereal Visage"; break;
        case 122: sResult = "Mordenkainen's Disjunction"; break;
        case 123: sResult = "Mordenkainen's Sword"; break;
            }
            break;
            case 5://125-149
            switch (nSpell)
            {
        case 126: sResult = "Neutralize Poison"; break;
        case 127: sResult = "Phantasmal Killer"; break;
        case 128: sResult = "Planar Binding"; break;
        case 130: sResult = "Polymorph Self"; break;
        case 131: sResult = "Power Word Kill"; break;
        case 132: sResult = "Power Word Stun"; break;
        case 134: sResult = "Premonition"; break;
        case 135: sResult = "Premonition"; break;
        case 137: sResult = "Protection from Elements"; break;
        case 141: sResult = "Protection from Spells"; break;
        case 143: sResult = "Ray of Enfeeblement"; break;
        case 144: sResult = "Ray of Frost"; break;
        case 145: sResult = "Remove Blindness and Deafness"; break;
        case 146: sResult = "Remove Curse"; break;
        case 147: sResult = "Remove Disease"; break;
            }
            break;
        }
        break;
        case 1://150-299
        switch (nSpell/25)
        {
            case 6://150-174
            switch (nSpell)
            {
        case 150: sResult = "Resist Elements"; break;
        case 151: sResult = "Resistance"; break;
        case 155: sResult = "Scare"; break;
        case 157: sResult = "See Invisibility"; break;
        case 158: sResult = "Shades"; break;
        case 159: sResult = "Shadow Conjuration"; break;
        case 160: sResult = "Shadow Shield"; break;
        case 161: sResult = "Shapechange"; break;
        case 163: sResult = "Silence"; break;
        case 165: sResult = "Sleep"; break;
        case 166: sResult = "Slow"; break;
        case 167: sResult = "Sound Burst"; break;
        case 169: sResult = "Spell Mantle"; break;
        case 171: sResult = "Stinking Cloud"; break;
        case 172: sResult = "Stoneskin"; break;
        case 174: sResult = "Summon Creature I"; break;
            }
            break;
            case 7://175-199
            switch (nSpell)
            {
        case 175: sResult = "Summon Creature II"; break;
        case 176: sResult = "Summon Creature III"; break;
        case 177: sResult = "Summon Creature IV"; break;
        case 178: sResult = "Summon Creature IX"; break;
        case 179: sResult = "Summon Creature V"; break;
        case 180: sResult = "Summon Creature VI"; break;
        case 181: sResult = "Summon Creature VII"; break;
        case 182: sResult = "Summon Creature VIII"; break;
        case 184: sResult = "Tenser's Transformation"; break;
        case 185: sResult = "Timestop"; break;
        case 186: sResult = "True Seeing"; break;
        case 188: sResult = "Vampric Touch"; break;
        case 190: sResult = "Wail of the Banshee"; break;
        case 191: sResult = "Wall of Fire"; break;
        case 192: sResult = "Web"; break;
        case 193: sResult = "Weird"; break;
            }
            break;

        }
        break;
        case 2://300-449
        switch (nSpell/25)
        {
            case 12://300-324
            switch (nSpell)
            {
        case 321: sResult = "Protection from Alignment"; break;
        case 322: sResult = "Magic Circle Against Alignment"; break;
            }
            break;
            case 14://350-374
            switch (nSpell)
            {
        case 354: sResult = "Eagle's Splendor"; break;
        case 355: sResult = "Owl's Wisdom"; break;
        case 356: sResult = "Fox's Cunning"; break;
        case 365: sResult = "Ultravision"; break;
        case 367: sResult = "Horrid Wilting"; break;
        case 368: sResult = "Ice Storm"; break;
        case 369: sResult = "Energy Buffer"; break;
        case 370: sResult = "Negative Energy Burst"; break;
        case 371: sResult = "Negative Energy Ray"; break;
        case 373: sResult = "War Cry"; break;
            }
            break;
            case 15://375-399
            switch (nSpell)
            {
        case 376: sResult = "Legend Lore"; break;
        case 377: sResult = "Find Traps"; break;
            }
            break;
            case 16://400-424
            switch (nSpell)
            {
        case 415: sResult = "True Strike"; break;
        case 416: sResult = "Flare"; break;
        case 417: sResult = "Shield"; break;
        case 419: sResult = "Continual Flame"; break;
        case 424: sResult = "Acid Splash"; break;
            }
            break;
            case 17://425-449
            switch (nSpell)
            {
        case 427: sResult = "Sunburst"; break;
        case 430: sResult = "Banishment"; break;
        case 436: sResult = "Balagarn's Iron Horn"; break;
        case 439: sResult = "Electric Jolt"; break;
        case 440: sResult = "Firebrand"; break;
        case 441: sResult = "Wounding Whispers"; break;
        case 442: sResult = "Amplify"; break;
        case 443: sResult = "Greater Sanctuary"; break;
        case 445: sResult = "Dirge"; break;
        case 447: sResult = "Isaac's Lesser Missle Storm"; break;
        case 448: sResult = "Isaac's Greater Missle Storm"; break;
            }
            break;
        }
        break;
        case 3://450-569
        switch (nSpell/25)
        {
            case 18://450-474
            switch (nSpell)
            {
        case 456: sResult = "Expeditious Retreat"; break;
        case 457: sResult = "Tasha's Hideous Laughter"; break;
        case 458: sResult = "Displacement"; break;
        case 459: sResult = "Bigby's Interposing Hand"; break;
        case 460: sResult = "Bigby's Forceful Hand"; break;
        case 461: sResult = "Bigby's Grasping Hand"; break;
        case 462: sResult = "Bigby's Clenched Fist"; break;
        case 463: sResult = "Bigby's Crushing Hand"; break;
            }
            break;
            case 19://475-499
            switch (nSpell)
            {
        case 485: sResult = "Flesh to Stone"; break;
        case 486: sResult = "Stone to Flesh"; break;
            }
            break;
            case 20://500-524
            switch (nSpell)
            {
        case 515: sResult = "Great Thunderclap"; break;
        case 516: sResult = "Ball Lightning"; break;
        case 518: sResult = "Combust"; break;
        case 519: sResult = "Death Armor"; break;
        case 520: sResult = "Gedlee's Electric Loop"; break;
        case 521: sResult = "Horizikaul's Boom"; break;
        case 522: sResult = "Ironguts"; break;
        case 523: sResult = "Mestil's Acid Breath"; break;
        case 524: sResult = "Mestil's Acid Sheath"; break;
            }
            break;
            case 21://525-549
            switch (nSpell)
            {
        case 526: sResult = "Scintillating Sphere"; break;
        case 527: sResult = "Stone Bones"; break;
        case 528: sResult = "Undeath to Death"; break;
        case 533: sResult = "Black Blade of Disaster"; break;
        case 534: sResult = "Shelgarn's Persistent Blade"; break;
        case 539: sResult = "Keen Edge"; break;
        case 541: sResult = "Blackstaff"; break;
        case 542: sResult = "Flame Weapon"; break;
        case 543: sResult = "Ice Dagger"; break;
        case 544: sResult = "Magic Weapon"; break;
        case 545: sResult = "Greater Magic Weapon"; break;
            }
            break;
            case 22://550-569
            switch (nSpell)
            {
        case 569: sResult = "Cloud of Bewilderment"; break;
            }
            break;
        }
        break;
    }
return sResult;
}

//void main(){}
