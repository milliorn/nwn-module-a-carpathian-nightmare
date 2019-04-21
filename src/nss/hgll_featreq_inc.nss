//--------------------------------DECLARATIONS--------------------------------//

// This function determines what class controls the character's advancement during legendary
// levels. First it checks the character's It returns the class type with the most levels.
// If the character has two classes that tie for most number of levels, it will return the
// class the character took first. It returns -1 on an error.
int GetControlClass(object oPC);
// This function returns the cost of taking a certain skill based on the class.  Return
// values are: 1 for class skill, 2 for cross-class skill, -1 for class forbidden skill (default),
// and -2 for CLASS_TYPE input error. The switches essentially reconstruct the 2da. They also
// conveniently mirror the skill chart order in the HotU book. This allows users to alter skill
// costs and availabilities, and is faster than a 2da or int cache lookup.
int GetCostOfSkill(int nClass, int nSkill);
// This function returns TRUE if the PC has the stat or stats required to take nFeat,
// or if nFeat has no required stats.
int GetAreFeatStatReqsMet(int nFeat, object oPC);
// This function returns TRUE if the PC has the skill or skills required to take nFeat,
// or if nFeat has no required skills.
int GetAreFeatSkillReqsMet(int nFeat, object oPC);
// This function returns TRUE if the PC has the feat or feats required to take nFeat,
// or if nFeat has no required feats.
int GetAreFeatFeatReqsMet(int nFeat, object oPC);
// This function returns TRUE if the feat is only available at first level. Returns -3 on error.
int GetIsFeatFirstLevelOnly(int nFeat);
// This function returns true if a feat is of the devastating critical type.
int GetIsFeatDevCrit(int nFeat);
// This function returns TRUE if the PC has the ability to cast spells of the level required
// by the feat specified. It returns TRUE if the feat has no spell level requirement, and
// always returns FALSE for Sap.
int GetHasRequiredSpellLevelForFeat(object oPC, int nFeat);
// This function returns the name of the designated feat.
string GetNameOfFeat(int nFeat);
// This function returns TRUE if the feat is restricted to a limited number of uses per day.
int GetIsFeatLimitedUses(int nFeat);

//----------------------------------FUNCTIONS---------------------------------//

int GetControlClass(object oPC)
{
int nL1 = GetLevelByPosition(1, oPC);
int nL2 = GetLevelByPosition(2, oPC);
int nL3 = GetLevelByPosition(3, oPC);
//class 1 highest
if ((nL1 > nL2) && (nL1 > nL3)) return GetClassByPosition(1, oPC);
//class 2 highest
else if ((nL2 > nL1) && (nL2 > nL3)) return GetClassByPosition(2, oPC);
//class 3 highest
else if ((nL3 > nL1) && (nL3 > nL2)) return GetClassByPosition(3, oPC);
//class 1 and 2 tied for highest
else if (nL1 == nL2) return GetClassByPosition(1, oPC);
//class 1 and 3 tied for highest
else if (nL1 == nL3) return GetClassByPosition(1, oPC);
//class 2 and 3 tied for highest
else if (nL2 == nL3) return GetClassByPosition(2, oPC);
//return -1 on error
else return -1;
}

int GetCostOfSkill(int nClass, int nSkill)
{
switch(nClass) //These switches essentially reconstruct the 2da. They also conveniently mirror
    {          //the skill chart order in the HotU book. This allows users to alter skill costs
               //and availabilities as well, and is faster than a 2da or int cache lookup.
    case CLASS_TYPE_BARBARIAN://barbarian
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;//animal empathy
            case SKILL_CONCENTRATION:    return 2; break;//concentration
            case SKILL_DISABLE_TRAP:     return 2; break;//disable trap
            case SKILL_DISCIPLINE:       return 1; break;//discipline
            case SKILL_HEAL:             return 1; break;//heal
            case SKILL_HIDE:             return 2; break;//hide
            case SKILL_LISTEN:           return 1; break;//listen
            case SKILL_LORE:             return 1; break;//lore
            case SKILL_MOVE_SILENTLY:    return 2; break;//move silently
            case SKILL_OPEN_LOCK:        return 2; break;//open lock
            case SKILL_PARRY:            return 1; break;//parry
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 2; break;//persuade
            case SKILL_PICK_POCKET:      return 2; break;//pick pocket
            case SKILL_SEARCH:           return 2; break;//search
            case SKILL_SET_TRAP:         return 2; break;//set trap
            case SKILL_SPELLCRAFT:       return 2; break;//spellcraft
            case SKILL_SPOT:             return 2; break;//spot
            case SKILL_TAUNT:            return 1; break;//taunt
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;//appraise
            case SKILL_TUMBLE:           return 2; break;//tumble
            case SKILL_CRAFT_TRAP:       return 1; break;//craft trap
            case SKILL_BLUFF:            return 2; break;//bluff
            case SKILL_INTIMIDATE:       return 1; break;//intimidate
            case SKILL_CRAFT_ARMOR:      return 1; break;//craft armor
            case SKILL_CRAFT_WEAPON:     return 1; break;//craft weapon
            case SKILL_RIDE:             return 1; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_BARD://bard
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 1; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 1; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 1; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 1; break;
            case SKILL_PERFORM:          return 1; break;//perform
            case SKILL_PERSUADE:         return 1; break;
            case SKILL_PICK_POCKET:      return 1; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 1; break;
            case SKILL_SPOT:             return 2; break;
            case SKILL_TAUNT:            return 1; break;
            case SKILL_USE_MAGIC_DEVICE: return 1; break;//UMD
            case SKILL_APPRAISE:         return 1; break;
            case SKILL_TUMBLE:           return 1; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 1; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_CLERIC://cleric
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 2; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 2; break;
            case SKILL_LISTEN:           return 2; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 2; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 1; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 1; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 1; break;
            case SKILL_SPOT:             return 2; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_DRUID://druid
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return 1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 2; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 2; break;
            case SKILL_LISTEN:           return 2; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 2; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 1; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 1; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 1; break;
            case SKILL_SPOT:             return 2; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_FIGHTER://fighter
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 1; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 2; break;
            case SKILL_LISTEN:           return 2; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 2; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 1; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 2; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 2; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 1; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_MONK://monk
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 1; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 1; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 1; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 1; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 1; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 1; break;
//            case SKILL_SPOT:             return 2; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 1; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_PALADIN://paladin
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 1; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 2; break;
            case SKILL_LISTEN:           return 2; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 2; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 1; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 1; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 2; break;
            case SKILL_TAUNT:            return 1; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 1; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_RANGER://ranger
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return 1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 1; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 1; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 1; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 1; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 2; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 1; break;
            case SKILL_SET_TRAP:         return 1; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 1; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 1; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_ROGUE://rogue
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 2; break;
            case SKILL_DISABLE_TRAP:     return 1; break;
            case SKILL_DISCIPLINE:       return 2; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 1; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 1; break;
            case SKILL_OPEN_LOCK:        return 1; break;
            case SKILL_PARRY:            return 1; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 1; break;
            case SKILL_PICK_POCKET:      return 1; break;
            case SKILL_SEARCH:           return 1; break;
            case SKILL_SET_TRAP:         return 1; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 1; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return 1; break;//UMD
            case SKILL_APPRAISE:         return 1; break;
            case SKILL_TUMBLE:           return 1; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 1; break;
            case SKILL_INTIMIDATE:       return 1; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_SORCERER://sorceror
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 2; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 2; break;
            case SKILL_LISTEN:           return 2; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 2; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 2; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 2; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 1; break;
            case SKILL_SPOT:             return 2; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_WIZARD://wizard
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 2; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 2; break;
            case SKILL_LISTEN:           return 2; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 2; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 2; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 2; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 1; break;
            case SKILL_SPOT:             return 2; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_SHADOWDANCER://shadowdancer
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 2; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 2; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 1; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 1; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 2; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 1; break;
            case SKILL_PICK_POCKET:      return 1; break;
            case SKILL_SEARCH:           return 1; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 1; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 1; break;
            case SKILL_CRAFT_TRAP:       return 2; break;
            case SKILL_BLUFF:            return 1; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 2; break;
            case SKILL_CRAFT_WEAPON:     return 2; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;

        }
    case CLASS_TYPE_HARPER://harper scout
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 2; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 1; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 1; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 1; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 2; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 1; break;
            case SKILL_PICK_POCKET:      return 1; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 2; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 1; break;
            case SKILL_TUMBLE:           return 1; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 1; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_ARCANE_ARCHER://arcane archer
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 2; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 2; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 1; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 1; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 2; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 2; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 1; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 1; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_ASSASSIN://assassin
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 2; break;
            case SKILL_DISABLE_TRAP:     return 1; break;
            case SKILL_DISCIPLINE:       return 2; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 1; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 1; break;
            case SKILL_OPEN_LOCK:        return 1; break;
            case SKILL_PARRY:            return 2; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 2; break;
            case SKILL_PICK_POCKET:      return 1; break;
            case SKILL_SEARCH:           return 1; break;
            case SKILL_SET_TRAP:         return 1; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 1; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return 1; break;//UMD
            case SKILL_APPRAISE:         return 1; break;
            case SKILL_TUMBLE:           return 1; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 1; break;
            case SKILL_INTIMIDATE:       return 1; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_BLACKGUARD://blackguard
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 1; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 2; break;
            case SKILL_LISTEN:           return 2; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 2; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 1; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 1; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 2; break;
            case SKILL_TAUNT:            return 1; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 1; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 1; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_DIVINE_CHAMPION://CoT
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 2; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 1; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 2; break;
            case SKILL_LISTEN:           return 2; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 2; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 1; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 2; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 1; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 1; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_WEAPON_MASTER://weaponmaster
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 2; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 1; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 2; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 2; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 2; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 2; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 1; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 2; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 1; break;
            case SKILL_CRAFT_ARMOR:      return 2; break;
            case SKILL_CRAFT_WEAPON:     return 2; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_PALEMASTER://palemaster
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 2; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 1; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 1; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 2; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 1; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 1; break;
            case SKILL_SPOT:             return 2; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_SHIFTER://shifter
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return 1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 2; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 1; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 2; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 2; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 1; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 1; break;
//            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 1; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_DWARVEN_DEFENDER://dwarven defender
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 1; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 2; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 2; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 1; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 2; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 2; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 2; break;
            case SKILL_SPOT:             return 1; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
    case CLASS_TYPE_DRAGON_DISCIPLE://dragon disciple
        switch(nSkill){
            case SKILL_ANIMAL_EMPATHY:   return -1; break;
            case SKILL_CONCENTRATION:    return 1; break;
            case SKILL_DISABLE_TRAP:     return 2; break;
            case SKILL_DISCIPLINE:       return 1; break;
            case SKILL_HEAL:             return 1; break;
            case SKILL_HIDE:             return 2; break;
            case SKILL_LISTEN:           return 1; break;
            case SKILL_LORE:             return 1; break;
            case SKILL_MOVE_SILENTLY:    return 2; break;
            case SKILL_OPEN_LOCK:        return 2; break;
            case SKILL_PARRY:            return 1; break;
            case SKILL_PERFORM:          return -1; break;//perform
            case SKILL_PERSUADE:         return 1; break;
            case SKILL_PICK_POCKET:      return 2; break;
            case SKILL_SEARCH:           return 1; break;
            case SKILL_SET_TRAP:         return 2; break;
            case SKILL_SPELLCRAFT:       return 1; break;
            case SKILL_SPOT:             return 1; break;
            case SKILL_TAUNT:            return 2; break;
            case SKILL_USE_MAGIC_DEVICE: return -1; break;//UMD
            case SKILL_APPRAISE:         return 2; break;
            case SKILL_TUMBLE:           return 2; break;
            case SKILL_CRAFT_TRAP:       return 1; break;
            case SKILL_BLUFF:            return 2; break;
            case SKILL_INTIMIDATE:       return 2; break;
            case SKILL_CRAFT_ARMOR:      return 1; break;
            case SKILL_CRAFT_WEAPON:     return 1; break;
            case SKILL_RIDE:             return 2; break;//ride
            default: return -1;
        }
        default: return -2;
    }
return -3;
}

int GetAreFeatStatReqsMet(int nFeat, object oPC)
{
//initialize the bools to be changed if false and checked at the end
int nStr = TRUE;
int nDex = TRUE;
int nCon = TRUE;
int nInt = TRUE;
int nWis = TRUE;
int nCha = TRUE;

if (nFeat < 495)
    {
    if (nFeat < 35)
        {
        switch(nFeat)
            {
case FEAT_AMBIDEXTERITY: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >= 15); break;
case FEAT_CLEAVE: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 13); break;
case FEAT_DEFLECT_ARROWS: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >= 13); break;
case FEAT_DISARM: nInt = (GetAbilityScore(oPC, ABILITY_INTELLIGENCE, TRUE) >= 13); break;
case FEAT_DODGE: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >= 13); break;
case FEAT_IMPROVED_DISARM: nInt = (GetAbilityScore(oPC, ABILITY_INTELLIGENCE, TRUE) >= 13); break;
case FEAT_IMPROVED_KNOCKDOWN: nInt = (GetAbilityScore(oPC, ABILITY_INTELLIGENCE, TRUE) >= 13); break;
case FEAT_IMPROVED_PARRY: nInt = (GetAbilityScore(oPC, ABILITY_INTELLIGENCE, TRUE) >= 13); break;
case FEAT_IMPROVED_POWER_ATTACK: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 13); break;
case FEAT_MOBILITY: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >= 13); break;
case FEAT_POWER_ATTACK: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 13); break;
case FEAT_RAPID_SHOT: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >= 13); break;
            }
        }
    else
        {
        switch(nFeat)
            {
//case 38: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >=13); break; FEAT DELETED IN 2DA
case FEAT_STUNNING_FIST: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >=13); nWis = (GetAbilityScore(oPC, ABILITY_WISDOM, TRUE) >=13); break;
case FEAT_EXPERTISE: nInt = (GetAbilityScore(oPC, ABILITY_INTELLIGENCE, TRUE) >=13); break;
case FEAT_IMPROVED_EXPERTISE: nInt = (GetAbilityScore(oPC, ABILITY_INTELLIGENCE, TRUE) >=13); break;
case FEAT_GREAT_CLEAVE: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >=13); break;
case FEAT_SPRING_ATTACK: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >=13); break;
case FEAT_CIRCLE_KICK: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >=15); break;
case FEAT_ZEN_ARCHERY: nWis = (GetAbilityScore(oPC, ABILITY_WISDOM, TRUE) >=13); break;
case FEAT_DIVINE_MIGHT: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 13); nCha = (GetAbilityScore(oPC, ABILITY_CHARISMA, TRUE) >=13); break;
case FEAT_DIVINE_SHIELD: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >=13); nCha = (GetAbilityScore(oPC, ABILITY_CHARISMA, TRUE) >=13); break;
case FEAT_EPIC_BLINDING_SPEED: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >=25); break;
case FEAT_EPIC_DAMAGE_REDUCTION_3: nCon = (GetAbilityScore(oPC, ABILITY_CONSTITUTION, TRUE) >=21); break;
            }
        }
    }
else if (nFeat < 532)
    {
    if (nFeat < 513)
        {
        switch(nFeat)
            {
case FEAT_EPIC_DEVASTATING_CRITICAL_CLUB:
case FEAT_EPIC_DEVASTATING_CRITICAL_DAGGER:
case FEAT_EPIC_DEVASTATING_CRITICAL_DART:
case FEAT_EPIC_DEVASTATING_CRITICAL_HEAVYCROSSBOW:
case FEAT_EPIC_DEVASTATING_CRITICAL_LIGHTCROSSBOW:
case FEAT_EPIC_DEVASTATING_CRITICAL_LIGHTMACE:
case FEAT_EPIC_DEVASTATING_CRITICAL_MORNINGSTAR:
case FEAT_EPIC_DEVASTATING_CRITICAL_QUARTERSTAFF:
case FEAT_EPIC_DEVASTATING_CRITICAL_SHORTSPEAR:
case FEAT_EPIC_DEVASTATING_CRITICAL_SICKLE:
case FEAT_EPIC_DEVASTATING_CRITICAL_SLING:
case FEAT_EPIC_DEVASTATING_CRITICAL_UNARMED:
case FEAT_EPIC_DEVASTATING_CRITICAL_LONGBOW:
case FEAT_EPIC_DEVASTATING_CRITICAL_SHORTBOW:
case FEAT_EPIC_DEVASTATING_CRITICAL_SHORTSWORD:
case FEAT_EPIC_DEVASTATING_CRITICAL_RAPIER:
case FEAT_EPIC_DEVASTATING_CRITICAL_SCIMITAR:
case FEAT_EPIC_DEVASTATING_CRITICAL_LONGSWORD: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 25); break;
            }
        }
    else
        {
        switch(nFeat)
            {
case FEAT_EPIC_DEVASTATING_CRITICAL_GREATSWORD:
case FEAT_EPIC_DEVASTATING_CRITICAL_HANDAXE:
case FEAT_EPIC_DEVASTATING_CRITICAL_THROWINGAXE:
case FEAT_EPIC_DEVASTATING_CRITICAL_BATTLEAXE:
case FEAT_EPIC_DEVASTATING_CRITICAL_GREATAXE:
case FEAT_EPIC_DEVASTATING_CRITICAL_HALBERD:
case FEAT_EPIC_DEVASTATING_CRITICAL_LIGHTHAMMER:
case FEAT_EPIC_DEVASTATING_CRITICAL_LIGHTFLAIL:
case FEAT_EPIC_DEVASTATING_CRITICAL_WARHAMMER:
case FEAT_EPIC_DEVASTATING_CRITICAL_HEAVYFLAIL:
case FEAT_EPIC_DEVASTATING_CRITICAL_KAMA:
case FEAT_EPIC_DEVASTATING_CRITICAL_KUKRI:
case FEAT_EPIC_DEVASTATING_CRITICAL_SHURIKEN:
case FEAT_EPIC_DEVASTATING_CRITICAL_SCYTHE:
case FEAT_EPIC_DEVASTATING_CRITICAL_KATANA:
case FEAT_EPIC_DEVASTATING_CRITICAL_BASTARDSWORD:
case FEAT_EPIC_DEVASTATING_CRITICAL_DIREMACE:
case FEAT_EPIC_DEVASTATING_CRITICAL_DOUBLEAXE:
case FEAT_EPIC_DEVASTATING_CRITICAL_TWOBLADEDSWORD: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 25); break;
            }
        }
    }
else if (nFeat < 746)
    {
    if (nFeat < 727)
        {
        switch(nFeat)
            {
case FEAT_EPIC_IMPROVED_KI_STRIKE_4: nWis = (GetAbilityScore(oPC, ABILITY_WISDOM, TRUE) >= 21); break;
case FEAT_EPIC_OVERWHELMING_CRITICAL_CLUB:
case FEAT_EPIC_OVERWHELMING_CRITICAL_DAGGER:
case FEAT_EPIC_OVERWHELMING_CRITICAL_DART:
case FEAT_EPIC_OVERWHELMING_CRITICAL_HEAVYCROSSBOW:
case FEAT_EPIC_OVERWHELMING_CRITICAL_LIGHTCROSSBOW:
case FEAT_EPIC_OVERWHELMING_CRITICAL_LIGHTMACE:
case FEAT_EPIC_OVERWHELMING_CRITICAL_MORNINGSTAR:
case FEAT_EPIC_OVERWHELMING_CRITICAL_QUARTERSTAFF:
case FEAT_EPIC_OVERWHELMING_CRITICAL_SHORTSPEAR:
case FEAT_EPIC_OVERWHELMING_CRITICAL_SICKLE:
case FEAT_EPIC_OVERWHELMING_CRITICAL_SLING:
case FEAT_EPIC_OVERWHELMING_CRITICAL_UNARMED:
case FEAT_EPIC_OVERWHELMING_CRITICAL_LONGBOW:
case FEAT_EPIC_OVERWHELMING_CRITICAL_SHORTBOW:
case FEAT_EPIC_OVERWHELMING_CRITICAL_SHORTSWORD:
case FEAT_EPIC_OVERWHELMING_CRITICAL_RAPIER:
case FEAT_EPIC_OVERWHELMING_CRITICAL_SCIMITAR:
case FEAT_EPIC_OVERWHELMING_CRITICAL_LONGSWORD: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 23); break;
            }
        }
    else
        {
        switch(nFeat)
            {
case FEAT_EPIC_OVERWHELMING_CRITICAL_GREATSWORD:
case FEAT_EPIC_OVERWHELMING_CRITICAL_HANDAXE:
case FEAT_EPIC_OVERWHELMING_CRITICAL_THROWINGAXE:
case FEAT_EPIC_OVERWHELMING_CRITICAL_BATTLEAXE:
case FEAT_EPIC_OVERWHELMING_CRITICAL_GREATAXE:
case FEAT_EPIC_OVERWHELMING_CRITICAL_HALBERD:
case FEAT_EPIC_OVERWHELMING_CRITICAL_LIGHTHAMMER:
case FEAT_EPIC_OVERWHELMING_CRITICAL_LIGHTFLAIL:
case FEAT_EPIC_OVERWHELMING_CRITICAL_WARHAMMER:
case FEAT_EPIC_OVERWHELMING_CRITICAL_HEAVYFLAIL:
case FEAT_EPIC_OVERWHELMING_CRITICAL_KAMA:
case FEAT_EPIC_OVERWHELMING_CRITICAL_KUKRI:
case FEAT_EPIC_OVERWHELMING_CRITICAL_SHURIKEN:
case FEAT_EPIC_OVERWHELMING_CRITICAL_SCYTHE:
case FEAT_EPIC_OVERWHELMING_CRITICAL_KATANA:
case FEAT_EPIC_OVERWHELMING_CRITICAL_BASTARDSWORD:
case FEAT_EPIC_OVERWHELMING_CRITICAL_DIREMACE:
case FEAT_EPIC_OVERWHELMING_CRITICAL_DOUBLEAXE:
case FEAT_EPIC_OVERWHELMING_CRITICAL_TWOBLADEDSWORD: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 23); break;
            }
        }
    }
else
    {
    if (nFeat < 840)
        {
        switch(nFeat)
            {
case FEAT_EPIC_PERFECT_HEALTH: nCon = (GetAbilityScore(oPC, ABILITY_CONSTITUTION, TRUE) >= 25); break;
case FEAT_EPIC_SELF_CONCEALMENT_10:
case FEAT_EPIC_SELF_CONCEALMENT_20:
case FEAT_EPIC_SELF_CONCEALMENT_30:
case FEAT_EPIC_SELF_CONCEALMENT_40:
case FEAT_EPIC_SELF_CONCEALMENT_50: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >= 30); break;
case FEAT_EPIC_GREAT_SMITING_1:
case FEAT_EPIC_GREAT_SMITING_2:
case FEAT_EPIC_GREAT_SMITING_3:
case FEAT_EPIC_GREAT_SMITING_4:
case FEAT_EPIC_GREAT_SMITING_5:
case FEAT_EPIC_GREAT_SMITING_6:
case FEAT_EPIC_GREAT_SMITING_7:
case FEAT_EPIC_GREAT_SMITING_8:
case FEAT_EPIC_GREAT_SMITING_9:
case FEAT_EPIC_GREAT_SMITING_10: nCha = (GetAbilityScore(oPC, ABILITY_CHARISMA, TRUE) >= 25); break;
            }
        }
    else
        {
        switch(nFeat)
            {
case FEAT_EPIC_IMPROVED_STUNNING_FIST_1: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >= 19); nWis = (GetAbilityScore(oPC, ABILITY_WISDOM, TRUE) >= 19); break;
case 854/*FEAT_EPIC_PLANAR_TURNING*/: nWis = (GetAbilityScore(oPC, ABILITY_WISDOM, TRUE) >= 25); nCha = (GetAbilityScore(oPC, ABILITY_CHARISMA, TRUE) >= 25); break;
case FEAT_EPIC_DODGE: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >= 25); break;
case FEAT_WHIRLWIND_ATTACK: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >= 13); nInt = (GetAbilityScore(oPC, ABILITY_INTELLIGENCE, TRUE) >= 13); break;
case FEAT_IMPROVED_WHIRLWIND: nDex = (GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) >= 23); break;
case FEAT_MIGHTY_RAGE: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 21); nCon = (GetAbilityScore(oPC, ABILITY_CONSTITUTION, TRUE) >= 21); break;
case FEAT_EPIC_WILD_SHAPE_DRAGON: nWis = (GetAbilityScore(oPC, ABILITY_WISDOM, TRUE) >= 30); break;
case FEAT_EPIC_DEVASTATING_CRITICAL_DWAXE: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 25); break;
case FEAT_EPIC_OVERWHELMING_CRITICAL_DWAXE: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 23); break;
case FEAT_EPIC_THUNDERING_RAGE: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 25); break;
case FEAT_EPIC_DEVASTATING_CRITICAL_WHIP: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 25); break;
case FEAT_EPIC_OVERWHELMING_CRITICAL_WHIP: nStr = (GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) >= 23); break;
case FEAT_EPIC_OUTSIDER_SHAPE: nWis = (GetAbilityScore(oPC, ABILITY_WISDOM, TRUE) >= 25); break;
case FEAT_EPIC_CONSTRUCT_SHAPE: nWis = (GetAbilityScore(oPC, ABILITY_WISDOM, TRUE) >= 27); break;
            }
        }
    }
return (nStr && nDex && nCon && nInt && nWis && nCha);
}

int GetAreFeatSkillReqsMet(int nFeat, object oPC)
{
int nReturn = TRUE;
if (nFeat < 200)
    {
    if (nFeat < 180)
        {
        switch(nFeat)
            {
case FEAT_SKILL_FOCUS_ANIMAL_EMPATHY: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_ANIMAL_EMPATHY) > 0); break;
case FEAT_SKILL_FOCUS_CONCENTRATION: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_CONCENTRATION) > 0); break;
case FEAT_SKILL_FOCUS_DISABLE_TRAP: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_DISABLE_TRAP) > 0); break;
case FEAT_SKILL_FOCUS_DISCIPLINE: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_DISCIPLINE) > 0); break;
case FEAT_SKILL_FOCUS_HEAL: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_HEAL) > 0); break;
case FEAT_SKILL_FOCUS_HIDE: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_HIDE) > 0); break;
case FEAT_SKILL_FOCUS_LISTEN: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_LISTEN) > 0); break;
            }
        }
    else
        {
        switch(nFeat)
            {
case FEAT_SKILL_FOCUS_LORE: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_LORE) > 0); break;
case FEAT_SKILL_FOCUS_MOVE_SILENTLY: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_MOVE_SILENTLY) > 0); break;
case FEAT_SKILL_FOCUS_OPEN_LOCK: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_OPEN_LOCK) > 0); break;
case FEAT_SKILL_FOCUS_PARRY: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_PARRY) > 0); break;
case FEAT_SKILL_FOCUS_PERFORM: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_PERFORM) > 0); break;
case FEAT_SKILL_FOCUS_PERSUADE: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_PERSUADE) > 0); break;
case FEAT_SKILL_FOCUS_PICK_POCKET: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_PICK_POCKET) > 0); break;
case FEAT_SKILL_FOCUS_SEARCH: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_SEARCH) > 0); break;
case FEAT_SKILL_FOCUS_SET_TRAP: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_SET_TRAP) > 0); break;
case FEAT_SKILL_FOCUS_SPELLCRAFT: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_SPELLCRAFT) > 0); break;
case FEAT_SKILL_FOCUS_SPOT: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_SPOT) > 0); break;
case FEAT_SKILL_FOCUS_TAUNT: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_TAUNT) > 0); break;
case FEAT_SKILL_FOCUS_USE_MAGIC_DEVICE: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_USE_MAGIC_DEVICE) > 0); break;
            }
        }
    }
else if (nFeat < 600)
    {
    if (nFeat < 590)
        {
        switch(nFeat)
            {
case 378: nReturn = (GetCostOfSkill(GetControlClass(oPC), 11) > 0); break;
case 404: nReturn = (GetCostOfSkill(GetControlClass(oPC), 20) > 0); break;
case 406: nReturn = (GetCostOfSkill(GetControlClass(oPC), 21) > 0); break;
case 407: nReturn = (GetCostOfSkill(GetControlClass(oPC), 22) > 0); break;
case 423: nReturn = (GetCostOfSkill(GetControlClass(oPC), 11) > 0); break;
case 424: nReturn = (GetCostOfSkill(GetControlClass(oPC), 11) > 0); break;
case 587: nReturn = (GetSkillRank(SKILL_ANIMAL_EMPATHY, oPC, TRUE) > 19); break;
case 588: nReturn = (GetSkillRank(SKILL_APPRAISE, oPC, TRUE) > 19); break;
case 589: nReturn = (GetSkillRank(SKILL_CONCENTRATION, oPC, TRUE) > 19); break;
            }
        }
    else
        {
        switch(nFeat)
            {
case 590: nReturn = (GetSkillRank(SKILL_CRAFT_TRAP, oPC, TRUE) > 19); break;
case 591: nReturn = (GetSkillRank(SKILL_DISABLE_TRAP, oPC, TRUE) > 19); break;
case 592: nReturn = (GetSkillRank(SKILL_DISCIPLINE, oPC, TRUE) > 19); break;
case 593: nReturn = (GetSkillRank(SKILL_HEAL, oPC, TRUE) > 19); break;
case 594: nReturn = (GetSkillRank(SKILL_HIDE, oPC, TRUE) > 19); break;
case 595: nReturn = (GetSkillRank(SKILL_LISTEN, oPC, TRUE) > 19); break;
case 596: nReturn = (GetSkillRank(SKILL_LORE, oPC, TRUE) > 19); break;
case 597: nReturn = (GetSkillRank(SKILL_MOVE_SILENTLY, oPC, TRUE) > 19); break;
case 598: nReturn = (GetSkillRank(SKILL_OPEN_LOCK, oPC, TRUE) > 19); break;
case 599: nReturn = (GetSkillRank(SKILL_PARRY, oPC, TRUE) > 19); break;
            }
        }
    }
else if (nFeat < 860)
    {
    if (nFeat < 610)
        {
        switch(nFeat)
            {
case 600: nReturn = (GetSkillRank(SKILL_PERFORM, oPC, TRUE) > 19); break;
case 601: nReturn = (GetSkillRank(SKILL_PERSUADE, oPC, TRUE) > 19); break;
case 602: nReturn = (GetSkillRank(SKILL_PICK_POCKET, oPC, TRUE) > 19); break;
case 603: nReturn = (GetSkillRank(SKILL_SEARCH, oPC, TRUE) > 19); break;
case 604: nReturn = (GetSkillRank(SKILL_SET_TRAP, oPC, TRUE) > 19); break;
case 605: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 19); break;
case 606: nReturn = (GetSkillRank(SKILL_SPOT, oPC, TRUE) > 19); break;
case 607: nReturn = (GetSkillRank(SKILL_TAUNT, oPC, TRUE) > 19); break;
case 608: nReturn = (GetSkillRank(SKILL_TUMBLE, oPC, TRUE) > 19); break;
case 609: nReturn = (GetSkillRank(SKILL_USE_MAGIC_DEVICE, oPC, TRUE) > 19); break;
            }
        }
    else
        {
        switch(nFeat)
            {
case 696: nReturn = (GetSkillRank(SKILL_CONCENTRATION, oPC, TRUE) > 24); break;
case 748:
case 749:
case 750:
case 751:
case 752: nReturn = (GetSkillRank(SKILL_HIDE, oPC, TRUE) > 29 && GetSkillRank(SKILL_TUMBLE, oPC, TRUE) > 29);break;
case 856: nReturn = (GetSkillRank(SKILL_TUMBLE, oPC, TRUE) > 29); break;
case 857:
case 858:
case 859: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 29); break;
            }
        }
    }
else
    {
    if (nFeat < 900)
        {
        switch(nFeat)
            {
case 860: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 23); break;
case 861: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 23); break;
case 862: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 23); break;
case 863: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 26); break;
case 864: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 26); break;
case 865: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 26); break;
case 870: nReturn = (GetSkillRank(SKILL_PERFORM, oPC, TRUE) > 24); break;
case 874: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 14); break;
case 875: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 21); break;
case 876: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 31); break;
case 877: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 25); break;
case 878: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 24); break;
            }
        }
    else
        {
        switch(nFeat)
            {
case 911: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_CRAFT_ARMOR) > 0); break;
case 912: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_CRAFT_WEAPON) > 0); break;
case 913: nReturn = (GetSkillRank(SKILL_CRAFT_ARMOR, oPC, TRUE) > 19); break;
case 914: nReturn = (GetSkillRank(SKILL_CRAFT_WEAPON, oPC, TRUE) > 19); break;
case 915: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_BLUFF) > 0); break;
case 916: nReturn = (GetCostOfSkill(GetControlClass(oPC), SKILL_INTIMIDATE) > 0); break;
case 917: nReturn = (GetSkillRank(SKILL_BLUFF, oPC, TRUE) > 19); break;
case 918: nReturn = (GetSkillRank(SKILL_INTIMIDATE, oPC, TRUE) > 19); break;
case 989: nReturn = (GetSkillRank(SKILL_INTIMIDATE, oPC, TRUE) > 24); break;
case 990: nReturn = (GetSkillRank(SKILL_SPELLCRAFT, oPC, TRUE) > 33); break;
            }
        }
    }
return nReturn;
}

int GetAreFeatFeatReqsMet(int nFeat, object oPC)
{
int nPRF1 = TRUE, nPRF2 = TRUE, nORF1 = TRUE, nORF2 = FALSE, nORF3 = FALSE, nORF4 = FALSE, nORF5 = FALSE;//these match columns from the 2da
if (nFeat < 250)//nORF1 defaults to true so that feats without "Or Feat" Requirements will return for them
    {           //Likewise nPRF1 & 2 default to true for feats that have no prerequisite feats
    if (nFeat < 50)
        {
        if (nFeat < 10)
            {
            switch (nFeat)
                {
case 2: nPRF1 = GetHasFeat(3, oPC); nPRF2 = GetHasFeat(4, oPC); break;
case 4: nPRF1 = GetHasFeat(3, oPC); break;
case 6: nPRF1 = GetHasFeat(28, oPC); break;
case 8: nPRF1 = GetHasFeat(21, oPC); break;
                }
            }
        else if (nFeat < 20)
            {
            switch (nFeat)
                {
case 13: nPRF1 = GetHasFeat(294, oPC); break;
case 15: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); nORF3 = GetHasFeat(49, oPC); nORF4 = GetHasFeat(50, oPC); nORF5 = GetHasFeat(51, oPC); break;
case 16: nPRF1 = GetHasFeat(9, oPC); break;
case 17: nPRF1 = GetHasFeat(23, oPC); break;
case 19: nPRF1 = GetHasFeat(28, oPC); break;

                }
            }
        else if (nFeat < 30)
            {
            switch (nFeat)
                {
case 20: nPRF1 = GetHasFeat(41, oPC); nPRF2 = GetHasFeat(1, oPC); break;
case 26: nPRF1 = GetHasFeat(10, oPC); break;
                }
            }
        else if (nFeat < 40)
            {
            switch (nFeat)
                {
case 30: nPRF1 = GetHasFeat(27, oPC); break;
//case FEAT_SAP: nPRF1 = GetHasFeat(5, oPC); break; SAP is not allowed
case FEAT_SAP: nPRF1 = FALSE; break;
//case 38: nPRF1 = GetHasFeat(31, oPC); break; DELETED in feat.2da
case 38: nPRF1 = FALSE; break;
case 39: nPRF1 = GetHasFeat(21, oPC); break;
                }
            }
        else //<50
            {
            switch (nFeat)
                {
case 43: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); nORF3 = GetHasFeat(49, oPC); nORF4 = GetHasFeat(50, oPC); nORF5 = GetHasFeat(51, oPC); break;
case 47: nPRF1 = GetHasFeat(43, oPC); break;
                }
            }
        }
    else if (nFeat < 100)
        {
        if (nFeat < 60)
            {
            switch (nFeat)
                {
case 52: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); nORF3 = GetHasFeat(49, oPC); nORF4 = GetHasFeat(50, oPC); nORF5 = GetHasFeat(51, oPC); break;
case 53: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); nORF3 = GetHasFeat(50, oPC); nORF4 = GetHasFeat(51, oPC); break;
case 54: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(49, oPC); nORF3 = GetHasFeat(50, oPC); nORF4 = GetHasFeat(51, oPC); break;
case 55: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(49, oPC); nORF3 = GetHasFeat(50, oPC); nORF4 = GetHasFeat(51, oPC); break;
case 56: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(50, oPC); break;
case 57: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(50, oPC); break;
case 58: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); nORF3 = GetHasFeat(49, oPC); nORF4 = GetHasFeat(50, oPC); nORF5 = GetHasFeat(51, oPC); break;
case 59: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); break;
                }
            }
        else if (nFeat < 70)
            {
            switch (nFeat)
                {
case 60: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); break;
case 61: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); nORF3 = GetHasFeat(49, oPC); nORF4 = GetHasFeat(50, oPC); break;
case 63: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(256, oPC); break;
case 64: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(50, oPC); nORF3 = GetHasFeat(256, oPC); break;
case 65: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(50, oPC); break;
case 66: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(50, oPC); nORF3 = GetHasFeat(256, oPC); break;
case 67: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(48, oPC); break;
case 68: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(256, oPC); break;
case 69: nPRF1 = GetHasFeat(45, oPC); break;
                }
            }
        else if (nFeat < 80)
            {
            switch (nFeat)
                {
case 70: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(49, oPC); nORF3 = GetHasFeat(50, oPC); break;
case 71: nPRF1 = GetHasFeat(45, oPC); break;
case 72: nPRF1 = GetHasFeat(45, oPC); break;
case 73: nPRF1 = GetHasFeat(45, oPC); break;
case 74: nPRF1 = GetHasFeat(45, oPC); break;
case 75: nPRF1 = GetHasFeat(45, oPC); break;
case 76: nPRF1 = GetHasFeat(45, oPC); break;
case 77: nPRF1 = GetHasFeat(45, oPC); break;
case 78: nPRF1 = GetHasFeat(45, oPC); break;
case 79: nORF1 = GetHasFeat(44, oPC); nORF2 = GetHasFeat(49, oPC); break;
                }
            }
        else if (nFeat < 90)
            {
            switch (nFeat)
                {
case 80: nPRF1 = GetHasFeat(44, oPC); break;
case 81: nPRF1 = GetHasFeat(44, oPC); break;
case 82: nORF1 = GetHasFeat(44, oPC); nORF2 = GetHasFeat(49, oPC); break;
case 83: nPRF1 = GetHasFeat(44, oPC); break;
case 84: nPRF1 = GetHasFeat(44, oPC); break;
case 85: nORF1 = GetHasFeat(44, oPC); break;
case 86: nPRF1 = GetHasFeat(44, oPC); break;
case 87: nPRF1 = GetHasFeat(44, oPC); break;
case 88: nPRF1 = GetHasFeat(44, oPC); break;
case 89: nPRF1 = GetHasFeat(44, oPC); break;
                }
            }
        else //<100
            {
            switch (nFeat)
                {
case 90: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); nORF3 = GetHasFeat(49, oPC); nORF4 = GetHasFeat(50, oPC); nORF5 = GetHasFeat(51, oPC); break;
case 91: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); nORF3 = GetHasFeat(50, oPC); nORF4 = GetHasFeat(50, oPC); nORF5 = GetHasFeat(51, oPC); break;
case 92: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(49, oPC); nORF3 = GetHasFeat(50, oPC); nORF4 = GetHasFeat(51, oPC); break;
case 93: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(49, oPC); nORF3 = GetHasFeat(50, oPC); nORF4 = GetHasFeat(51, oPC); break;
case 94: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(50, oPC); break;
case 95: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(50, oPC); break;
case 96: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); nORF3 = GetHasFeat(49, oPC); nORF4 = GetHasFeat(50, oPC); nORF5 = GetHasFeat(51, oPC); break;
case 97: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); break;
case 98: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); break;
case 99: nORF1 = GetHasFeat(46, oPC); nORF2 = GetHasFeat(48, oPC); nORF3 = GetHasFeat(49, oPC); nORF4 = GetHasFeat(50, oPC); break;
                }
            }
        }
    else if (nFeat < 150)
        {
        if (nFeat < 110)
            {
            switch (nFeat)
                {
case 101: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(256, oPC); break;
case 102: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(50, oPC); nORF3 = GetHasFeat(256, oPC); break;
case 103: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(50, oPC); break;
case 104: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(50, oPC); nORF3 = GetHasFeat(256, oPC); break;
case 105: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(48, oPC); break;
case 106: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(256, oPC); break;
case 107: nPRF1 = GetHasFeat(45, oPC); break;
case 108: nORF1 = GetHasFeat(45, oPC); nORF2 = GetHasFeat(49, oPC); nORF3 = GetHasFeat(50, oPC); break;
case 109: nPRF1 = GetHasFeat(45, oPC); break;
                }
            }
        else if (nFeat < 120)
            {
            switch (nFeat)
                {
case 110: nPRF1 = GetHasFeat(45, oPC); break;
case 111: nPRF1 = GetHasFeat(45, oPC); break;
case 112: nPRF1 = GetHasFeat(45, oPC); break;
case 113: nPRF1 = GetHasFeat(45, oPC); break;
case 114: nPRF1 = GetHasFeat(45, oPC); break;
case 115: nPRF1 = GetHasFeat(45, oPC); break;
case 116: nPRF1 = GetHasFeat(45, oPC); break;
case 117: nORF1 = GetHasFeat(44, oPC); nORF2 = GetHasFeat(49, oPC); break;
case 118: nPRF1 = GetHasFeat(44, oPC); break;
case 119: nPRF1 = GetHasFeat(44, oPC); break;
                }
            }
        else if (nFeat < 130)
            {
            switch (nFeat)
                {
case 120: nORF1 = GetHasFeat(44, oPC); nORF2 = GetHasFeat(49, oPC); break;
case 121: nPRF1 = GetHasFeat(44, oPC); break;
case 122: nPRF1 = GetHasFeat(44, oPC); break;
case 123: nPRF1 = GetHasFeat(44, oPC); break;
case 124: nPRF1 = GetHasFeat(44, oPC); break;
case 125: nPRF1 = GetHasFeat(44, oPC); break;
case 126: nPRF1 = GetHasFeat(44, oPC); break;
case 127: nPRF1 = GetHasFeat(44, oPC); break;
case 128: nPRF1 = GetHasFeat(90, oPC); break;
case 129: nPRF1 = GetHasFeat(91, oPC); break;
                }
            }
        else if (nFeat < 140)
            {
            switch (nFeat)
                {
case 130: nPRF1 = GetHasFeat(92, oPC); break;
case 131: nPRF1 = GetHasFeat(93, oPC); break;
case 132: nPRF1 = GetHasFeat(94, oPC); break;
case 133: nPRF1 = GetHasFeat(95, oPC); break;
case 134: nPRF1 = GetHasFeat(96, oPC); break;
case 135: nPRF1 = GetHasFeat(97, oPC); break;
case 136: nPRF1 = GetHasFeat(98, oPC); break;
case 137: nPRF1 = GetHasFeat(99, oPC); break;
case 138: nPRF1 = GetHasFeat(100, oPC); break;
case 139: nPRF1 = GetHasFeat(101, oPC); break;
                }
            }
        else //<150
            {
            switch (nFeat)
                {
case 140: nPRF1 = GetHasFeat(102, oPC); break;
case 141: nPRF1 = GetHasFeat(103, oPC); break;
case 142: nPRF1 = GetHasFeat(104, oPC); break;
case 143: nPRF1 = GetHasFeat(105, oPC); break;
case 144: nPRF1 = GetHasFeat(106, oPC); break;
case 145: nPRF1 = GetHasFeat(107, oPC); break;
case 146: nPRF1 = GetHasFeat(108, oPC); break;
case 147: nPRF1 = GetHasFeat(109, oPC); break;
case 148: nPRF1 = GetHasFeat(110, oPC); break;
case 149: nPRF1 = GetHasFeat(111, oPC); break;
                }
            }
        }
    else
        {
        if (nFeat < 160)
            {
            switch (nFeat)
                {
case 150: nPRF1 = GetHasFeat(112, oPC); break;
case 151: nPRF1 = GetHasFeat(113, oPC); break;
case 152: nPRF1 = GetHasFeat(114, oPC); break;
case 153: nPRF1 = GetHasFeat(115, oPC); break;
case 154: nPRF1 = GetHasFeat(116, oPC); break;
case 155: nPRF1 = GetHasFeat(117, oPC); break;
case 156: nPRF1 = GetHasFeat(118, oPC); break;
case 157: nPRF1 = GetHasFeat(119, oPC); break;
case 158: nPRF1 = GetHasFeat(120, oPC); break;
case 159: nPRF1 = GetHasFeat(121, oPC); break;
                }
            }
        else
            {
            switch (nFeat)
                {
case 160: nPRF1 = GetHasFeat(122, oPC); break;
case 161: nPRF1 = GetHasFeat(123, oPC); break;
case 162: nPRF1 = GetHasFeat(124, oPC); break;
case 163: nPRF1 = GetHasFeat(125, oPC); break;
case 164: nPRF1 = GetHasFeat(126, oPC); break;
case 165: nPRF1 = GetHasFeat(127, oPC); break;
                }
            }
        }
    }
else if (nFeat < 500)
    {
    if (nFeat < 400)
        {
        switch (nFeat)
            {
case 390: nPRF1 = GetHasFeat(389, oPC); break;
case 391: nPRF1 = GetHasFeat(28, oPC); nPRF2 = GetHasFeat(6, oPC); break;
case 392: nPRF1 = GetHasFeat(26, oPC); nPRF2 = GetHasFeat(10, oPC); break;
case 393: nPRF1 = GetHasFeat(35, oPC); break;
case 394: nPRF1 = GetHasFeat(166, oPC); break;
case 395: nPRF1 = GetHasFeat(167, oPC); break;
case 396: nPRF1 = GetHasFeat(168, oPC); break;
case 397: nPRF1 = GetHasFeat(169, oPC); break;
case 398: nPRF1 = GetHasFeat(170, oPC); break;
case 399: nPRF1 = GetHasFeat(171, oPC); break;
            }
        }
    else if (nFeat < 450)
        {
        if (nFeat < 410)
            {
            switch (nFeat)
                {
case 400: nPRF1 = GetHasFeat(172, oPC); break;
case 401: nPRF1 = GetHasFeat(36, oPC); break;
case 409: nPRF1 = GetHasFeat(21, oPC); break;
                }
            }
        else if (nFeat < 420)
            {
            switch (nFeat)
                {
case 410: nPRF1 = GetHasFeat(39, oPC); break;
case 413: nPRF1 = GetHasFeat(28, oPC); nPRF2 = GetHasFeat(294, oPC); break;
case 414: nPRF1 = GetHasFeat(28, oPC); nPRF2 = GetHasFeat(294, oPC); break;
case 415: nPRF1 = GetHasFeat(35, oPC); break;
case 416: nPRF1 = GetHasFeat(166, oPC); break;
case 417: nPRF1 = GetHasFeat(167, oPC); break;
case 418: nPRF1 = GetHasFeat(168, oPC); break;
case 419: nPRF1 = GetHasFeat(169, oPC); break;
                }
            }
        else if (nFeat < 430)
            {
            switch (nFeat)
                {
case 420: nPRF1 = GetHasFeat(170, oPC); break;
case 421: nPRF1 = GetHasFeat(171, oPC); break;
case 422: nPRF1 = GetHasFeat(172, oPC); break;
                }
            }
        else //<450
            {
            switch (nFeat)
                {
case 446: nPRF1 = GetHasFeat(445, oPC); break;
case 447: nPRF1 = GetHasFeat(446, oPC); break;
case 448: nPRF1 = GetHasFeat(447, oPC); break;
case 449: nPRF1 = GetHasFeat(448, oPC); break;
                }
            }
        }
    else //<500
        {
        if (nFeat < 460)
            {
            switch (nFeat)
                {
case 452: nPRF1 = GetHasFeat(451, oPC); break;
case 456: nPRF1 = GetHasFeat(455, oPC); break;
case 457: nPRF1 = GetHasFeat(456, oPC); break;
case 458: nPRF1 = GetHasFeat(457, oPC); break;
case 459: nPRF1 = GetHasFeat(458, oPC); break;
                }
            }
        else if (nFeat < 470)
            {
            switch (nFeat)
                {
case 461: nPRF1 = GetHasFeat(460, oPC); break;
case 462: nPRF1 = GetHasFeat(461, oPC); break;
case 464: nPRF1 = GetHasFeat(463, oPC); break;
case 465: nPRF1 = GetHasFeat(464, oPC); break;
case 466: nPRF1 = GetHasFeat(465, oPC); break;
case 467: nPRF1 = GetHasFeat(466, oPC); break;
                }
            }
        else //<500
            {
            switch (nFeat)
                {
case 493: nPRF1 = GetHasFeat(492, oPC); break;
case 494: nPRF1 = GetHasFeat(493, oPC); break;
case 495: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(709, oPC); break;
case 496: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(710, oPC); break;
case 497: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(711, oPC); break;
case 498: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(712, oPC); break;
case 499: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(713, oPC); break;
                }
            }
        }
    }
else if (nFeat < 750)
    {
    if (nFeat < 550)
        {
        if (nFeat < 510)
            {
            switch (nFeat)
                {
case 500: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(714, oPC); break;
case 501: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(715, oPC); break;
case 502: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(716, oPC); break;
case 503: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(717, oPC); break;
case 504: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(718, oPC); break;
case 505: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(719, oPC); break;
case 506: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(720, oPC); break;
case 507: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(721, oPC); break;
case 508: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(722, oPC); break;
case 509: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(723, oPC); break;
                }
            }
        else if (nFeat < 520)
            {
            switch (nFeat)
                {
case 510: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(724, oPC); break;
case 511: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(725, oPC); break;
case 512: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(726, oPC); break;
case 513: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(727, oPC); break;
case 514: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(728, oPC); break;
case 515: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(729, oPC); break;
case 516: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(730, oPC); break;
case 517: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(731, oPC); break;
case 518: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(732, oPC); break;
case 519: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(733, oPC); break;
                }
            }
        else if (nFeat < 530)
            {
            switch (nFeat)
                {
case 520: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(734, oPC); break;
case 521: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(735, oPC); break;
case 522: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(736, oPC); break;
case 523: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(737, oPC); break;
case 524: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(738, oPC); break;
case 525: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(739, oPC); break;
case 526: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(740, oPC); break;
case 527: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(741, oPC); break;
case 528: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(742, oPC); break;
case 529: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(743, oPC); break;
                }
            }
        else if (nFeat < 540)
            {
            switch (nFeat)
                {
case 530: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(744, oPC); break;
case 531: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(745, oPC); break;
case 534: nPRF1 = GetHasFeat(533, oPC); break;
case 535: nPRF1 = GetHasFeat(534, oPC); break;
case 536: nPRF1 = GetHasFeat(535, oPC); break;
case 537: nPRF1 = GetHasFeat(536, oPC); break;
case 538: nPRF1 = GetHasFeat(537, oPC); break;
case 539: nPRF1 = GetHasFeat(538, oPC); break;
                }
            }
        else //<550
            {
            switch (nFeat)
                {
case 540: nPRF1 = GetHasFeat(539, oPC); break;
case 541: nPRF1 = GetHasFeat(540, oPC); break;
case 542: nPRF1 = GetHasFeat(541, oPC); break;
case 544: nPRF1 = GetHasFeat(543, oPC); break;
case 545: nPRF1 = GetHasFeat(544, oPC); break;
case 546: nPRF1 = GetHasFeat(545, oPC); break;
case 547: nPRF1 = GetHasFeat(546, oPC); break;
case 548: nPRF1 = GetHasFeat(547, oPC); break;
case 549: nPRF1 = GetHasFeat(548, oPC); break;
                }
            }
        }
    else if (nFeat < 600)
        {
        if (nFeat < 560)
            {
            switch (nFeat)
                {
case 550: nPRF1 = GetHasFeat(549, oPC); break;
case 551: nPRF1 = GetHasFeat(550, oPC); break;
case 552: nPRF1 = GetHasFeat(551, oPC); break;
case 554: nPRF1 = GetHasFeat(553, oPC); break;
case 555: nPRF1 = GetHasFeat(554, oPC); break;
case 556: nPRF1 = GetHasFeat(555, oPC); break;
case 557: nPRF1 = GetHasFeat(556, oPC); break;
case 558: nPRF1 = GetHasFeat(557, oPC); break;
case 559: nPRF1 = GetHasFeat(558, oPC); break;
                }
            }
        else if (nFeat < 570)
            {
            switch (nFeat)
                {
case 560: nPRF1 = GetHasFeat(559, oPC); break;
case 561: nPRF1 = GetHasFeat(560, oPC); break;
case 562: nPRF1 = GetHasFeat(561, oPC); break;
case 564: nPRF1 = GetHasFeat(563, oPC); break;
case 565: nPRF1 = GetHasFeat(564, oPC); break;
case 566: nPRF1 = GetHasFeat(565, oPC); break;
case 567: nPRF1 = GetHasFeat(566, oPC); break;
case 568: nPRF1 = GetHasFeat(567, oPC); break;
case 569: nPRF1 = GetHasFeat(568, oPC); break;
                }
            }
        else if (nFeat < 580)
            {
            switch (nFeat)
                {
case 570: nPRF1 = GetHasFeat(569, oPC); break;
case 571: nPRF1 = GetHasFeat(570, oPC); break;
case 572: nPRF1 = GetHasFeat(571, oPC); break;
case 574: nPRF1 = GetHasFeat(573, oPC); break;
case 575: nPRF1 = GetHasFeat(574, oPC); break;
case 576: nPRF1 = GetHasFeat(575, oPC); break;
case 577: nPRF1 = GetHasFeat(576, oPC); break;
case 578: nPRF1 = GetHasFeat(577, oPC); break;
case 579: nPRF1 = GetHasFeat(578, oPC); break;
                }
            }
        else
            {
            switch (nFeat)
                {
case 580: nPRF1 = GetHasFeat(579, oPC); break;
case 581: nPRF1 = GetHasFeat(580, oPC); break;
case 582: nPRF1 = GetHasFeat(581, oPC); break;
                }
            }
        }
    else if (nFeat < 650)
        {
        if (nFeat < 620)
            {
            switch (nFeat)
                {
case 610: nPRF1 = GetHasFeat(393, oPC); break;
case 611: nPRF1 = GetHasFeat(394, oPC); break;
case 612: nPRF1 = GetHasFeat(395, oPC); break;
case 613: nPRF1 = GetHasFeat(396, oPC); break;
case 614: nPRF1 = GetHasFeat(397, oPC); break;
case 615: nPRF1 = GetHasFeat(398, oPC); break;
case 616: nPRF1 = GetHasFeat(399, oPC); break;
case 617: nPRF1 = GetHasFeat(400, oPC); break;
case 618: nPRF1 = GetHasFeat(401, oPC); break;
case 619: nPRF1 = GetHasFeat(15, oPC); break;
                }
            }
        else if (nFeat < 630)
            {
            switch (nFeat)
                {
case 620: nPRF1 = GetHasFeat(90, oPC); break;
case 621: nPRF1 = GetHasFeat(91, oPC); break;
case 622: nPRF1 = GetHasFeat(92, oPC); break;
case 623: nPRF1 = GetHasFeat(93, oPC); break;
case 624: nPRF1 = GetHasFeat(94, oPC); break;
case 625: nPRF1 = GetHasFeat(95, oPC); break;
case 626: nPRF1 = GetHasFeat(96, oPC); break;
case 627: nPRF1 = GetHasFeat(97, oPC); break;
case 628: nPRF1 = GetHasFeat(98, oPC); break;
case 629: nPRF1 = GetHasFeat(99, oPC); break;
                }
            }
        else if (nFeat < 640)
            {
            switch (nFeat)
                {
case 630: nPRF1 = GetHasFeat(100, oPC); break;
case 631: nPRF1 = GetHasFeat(101, oPC); break;
case 632: nPRF1 = GetHasFeat(102, oPC); break;
case 633: nPRF1 = GetHasFeat(103, oPC); break;
case 634: nPRF1 = GetHasFeat(104, oPC); break;
case 635: nPRF1 = GetHasFeat(105, oPC); break;
case 636: nPRF1 = GetHasFeat(106, oPC); break;
case 637: nPRF1 = GetHasFeat(107, oPC); break;
case 638: nPRF1 = GetHasFeat(108, oPC); break;
case 639: nPRF1 = GetHasFeat(109, oPC); break;
                }
            }
        else //<650
            {
            switch (nFeat)
                {
case 640: nPRF1 = GetHasFeat(110, oPC); break;
case 641: nPRF1 = GetHasFeat(111, oPC); break;
case 642: nPRF1 = GetHasFeat(112, oPC); break;
case 643: nPRF1 = GetHasFeat(113, oPC); break;
case 644: nPRF1 = GetHasFeat(114, oPC); break;
case 645: nPRF1 = GetHasFeat(115, oPC); break;
case 646: nPRF1 = GetHasFeat(116, oPC); break;
case 647: nPRF1 = GetHasFeat(117, oPC); break;
case 648: nPRF1 = GetHasFeat(118, oPC); break;
case 649: nPRF1 = GetHasFeat(120, oPC); break;
                }
            }
        }
    else if (nFeat < 700)
        {
        if (nFeat < 660)
            {
            switch (nFeat)
                {
case 650: nPRF1 = GetHasFeat(121, oPC); break;
case 651: nPRF1 = GetHasFeat(122, oPC); break;
case 652: nPRF1 = GetHasFeat(123, oPC); break;
case 653: nPRF1 = GetHasFeat(125, oPC); break;
case 654: nPRF1 = GetHasFeat(126, oPC); break;
case 655: nPRF1 = GetHasFeat(127, oPC); break;
case 657: nPRF1 = GetHasFeat(47, oPC); nPRF2 = GetHasFeat(619, oPC); break;
case 658: nPRF1 = GetHasFeat(128, oPC); nPRF2 = GetHasFeat(620, oPC); break;
case 659: nPRF1 = GetHasFeat(129, oPC); nPRF2 = GetHasFeat(621, oPC); break;
                }
            }
        else if (nFeat < 670)
            {
            switch (nFeat)
                {
case 660: nPRF1 = GetHasFeat(130, oPC); nPRF2 = GetHasFeat(622, oPC); break;
case 661: nPRF1 = GetHasFeat(131, oPC); nPRF2 = GetHasFeat(623, oPC); break;
case 662: nPRF1 = GetHasFeat(132, oPC); nPRF2 = GetHasFeat(624, oPC); break;
case 663: nPRF1 = GetHasFeat(133, oPC); nPRF2 = GetHasFeat(625, oPC); break;
case 664: nPRF1 = GetHasFeat(134, oPC); nPRF2 = GetHasFeat(626, oPC); break;
case 665: nPRF1 = GetHasFeat(135, oPC); nPRF2 = GetHasFeat(627, oPC); break;
case 666: nPRF1 = GetHasFeat(136, oPC); nPRF2 = GetHasFeat(628, oPC); break;
case 667: nPRF1 = GetHasFeat(137, oPC); nPRF2 = GetHasFeat(629, oPC); break;
case 668: nPRF1 = GetHasFeat(138, oPC); nPRF2 = GetHasFeat(630, oPC); break;
case 669: nPRF1 = GetHasFeat(139, oPC); nPRF2 = GetHasFeat(631, oPC); break;
                }
            }
        else if (nFeat < 680)
            {
            switch (nFeat)
                {
case 670: nPRF1 = GetHasFeat(140, oPC); nPRF2 = GetHasFeat(632, oPC); break;
case 671: nPRF1 = GetHasFeat(141, oPC); nPRF2 = GetHasFeat(633, oPC); break;
case 672: nPRF1 = GetHasFeat(142, oPC); nPRF2 = GetHasFeat(634, oPC); break;
case 673: nPRF1 = GetHasFeat(143, oPC); nPRF2 = GetHasFeat(635, oPC); break;
case 674: nPRF1 = GetHasFeat(144, oPC); nPRF2 = GetHasFeat(636, oPC); break;
case 675: nPRF1 = GetHasFeat(145, oPC); nPRF2 = GetHasFeat(637, oPC); break;
case 676: nPRF1 = GetHasFeat(146, oPC); nPRF2 = GetHasFeat(638, oPC); break;
case 677: nPRF1 = GetHasFeat(147, oPC); nPRF2 = GetHasFeat(639, oPC); break;
case 678: nPRF1 = GetHasFeat(148, oPC); nPRF2 = GetHasFeat(640, oPC); break;
case 679: nPRF1 = GetHasFeat(149, oPC); nPRF2 = GetHasFeat(641, oPC); break;
                }
            }
        else if (nFeat < 690)
            {
            switch (nFeat)
                {
case 680: nPRF1 = GetHasFeat(150, oPC); nPRF2 = GetHasFeat(642, oPC); break;
case 681: nPRF1 = GetHasFeat(151, oPC); nPRF2 = GetHasFeat(643, oPC); break;
case 682: nPRF1 = GetHasFeat(152, oPC); nPRF2 = GetHasFeat(644, oPC); break;
case 683: nPRF1 = GetHasFeat(153, oPC); nPRF2 = GetHasFeat(645, oPC); break;
case 684: nPRF1 = GetHasFeat(154, oPC); nPRF2 = GetHasFeat(646, oPC); break;
case 685: nPRF1 = GetHasFeat(155, oPC); nPRF2 = GetHasFeat(647, oPC); break;
case 686: nPRF1 = GetHasFeat(156, oPC); nPRF2 = GetHasFeat(648, oPC); break;
case 687: nPRF1 = GetHasFeat(158, oPC); nPRF2 = GetHasFeat(649, oPC); break;
case 688: nPRF1 = GetHasFeat(159, oPC); nPRF2 = GetHasFeat(650, oPC); break;
case 689: nPRF1 = GetHasFeat(160, oPC); nPRF2 = GetHasFeat(651, oPC); break;
                }
            }
        else //<700
            {
            switch (nFeat)
                {
case 690: nPRF1 = GetHasFeat(161, oPC); nPRF2 = GetHasFeat(652, oPC); break;
case 691: nPRF1 = GetHasFeat(163, oPC); nPRF2 = GetHasFeat(653, oPC); break;
case 692: nPRF1 = GetHasFeat(164, oPC); nPRF2 = GetHasFeat(654, oPC); break;
case 693: nPRF1 = GetHasFeat(165, oPC); nPRF2 = GetHasFeat(655, oPC); break;
case 696: nPRF1 = GetHasFeat(7, oPC); break;
case 697: nPRF1 = GetHasFeat(344, oPC); break;
case 698: nPRF1 = GetHasFeat(697, oPC); break;
case 699: nPRF1 = GetHasFeat(215, oPC); break;
                }
            }
        }
    else //<750
        {
        if (nFeat < 710)
            {
            switch (nFeat)
                {
case 700: nPRF1 = GetHasFeat(699, oPC); break;
case 701: nPRF1 = GetHasFeat(700, oPC); break;
case 702: nPRF1 = GetHasFeat(701, oPC); break;
case 703: nPRF1 = GetHasFeat(702, oPC); break;
case 704: nPRF1 = GetHasFeat(703, oPC); break;
case 705: nPRF1 = GetHasFeat(704, oPC); break;
case 706: nPRF1 = GetHasFeat(705, oPC); break;
case 707: nPRF1 = GetHasFeat(706, oPC); break;
case 708: nPRF1 = GetHasFeat(707, oPC); break;
case 709: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(15, oPC); break;
                }
            }
        else if (nFeat < 720)
            {
            switch (nFeat)
                {
case 710: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(52, oPC); break;
case 711: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(53, oPC); break;
case 712: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(54, oPC); break;
case 713: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(55, oPC); break;
case 714: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(56, oPC); break;
case 715: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(57, oPC); break;
case 716: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(58, oPC); break;
case 717: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(59, oPC); break;
case 718: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(60, oPC); break;
case 719: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(61, oPC); break;
                }
            }
        else if (nFeat < 730)
            {
            switch (nFeat)
                {
case 720: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(62, oPC); break;
case 721: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(63, oPC); break;
case 722: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(64, oPC); break;
case 723: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(65, oPC); break;
case 724: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(66, oPC); break;
case 725: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(67, oPC); break;
case 726: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(68, oPC); break;
case 727: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(69, oPC); break;
case 728: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(70, oPC); break;
case 729: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(71, oPC); break;
                }
            }
        else if (nFeat < 740)
            {
            switch (nFeat)
                {
case 730: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(72, oPC); break;
case 731: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(73, oPC); break;
case 732: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(74, oPC); break;
case 733: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(75, oPC); break;
case 734: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(76, oPC); break;
case 735: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(77, oPC); break;
case 736: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(78, oPC); break;
case 737: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(79, oPC); break;
case 738: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(80, oPC); break;
case 739: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(82, oPC); break;
                }
            }
        else //750
            {
            switch (nFeat)
                {
case 740: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(83, oPC); break;
case 741: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(84, oPC); break;
case 742: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(85, oPC); break;
case 743: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(87, oPC); break;
case 744: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(88, oPC); break;
case 745: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(89, oPC); break;
case 746: nPRF1 = GetHasFeat(292, oPC); break;
case 747: nPRF1 = GetHasFeat(14, oPC); break;
case 748: nPRF1 = GetHasFeat(212, oPC); break;
case 749: nPRF1 = GetHasFeat(748, oPC); break;
                }
            }
        }
    }
else
    {
    if (nFeat < 800)
        {
        if (nFeat < 760)
            {
            switch (nFeat)
                {
case 750: nPRF1 = GetHasFeat(749, oPC); break;
case 751: nPRF1 = GetHasFeat(750, oPC); break;
case 752: nPRF1 = GetHasFeat(751, oPC); break;
case 753: nPRF1 = GetHasFeat(377, oPC); break;
case 755: nPRF1 = GetHasFeat(754, oPC); break;
case 756: nPRF1 = GetHasFeat(755, oPC); break;
case 757: nPRF1 = GetHasFeat(756, oPC); break;
case 758: nPRF1 = GetHasFeat(757, oPC); break;
case 759: nPRF1 = GetHasFeat(758, oPC); break;
                }
            }
        else if (nFeat < 770)
            {
            switch (nFeat)
                {
case 760: nPRF1 = GetHasFeat(759, oPC); break;
case 761: nPRF1 = GetHasFeat(760, oPC); break;
case 762: nPRF1 = GetHasFeat(761, oPC); break;
case 763: nPRF1 = GetHasFeat(762, oPC); break;
case 765: nPRF1 = GetHasFeat(764, oPC); break;
case 766: nPRF1 = GetHasFeat(765, oPC); break;
case 767: nPRF1 = GetHasFeat(766, oPC); break;
case 768: nPRF1 = GetHasFeat(767, oPC); break;
case 769: nPRF1 = GetHasFeat(768, oPC); break;
                }
            }
        else if (nFeat < 780)
            {
            switch (nFeat)
                {
case 770: nPRF1 = GetHasFeat(769, oPC); break;
case 771: nPRF1 = GetHasFeat(770, oPC); break;
case 772: nPRF1 = GetHasFeat(771, oPC); break;
case 773: nPRF1 = GetHasFeat(772, oPC); break;
case 775: nPRF1 = GetHasFeat(774, oPC); break;
case 776: nPRF1 = GetHasFeat(775, oPC); break;
case 777: nPRF1 = GetHasFeat(776, oPC); break;
case 778: nPRF1 = GetHasFeat(777, oPC); break;
case 779: nPRF1 = GetHasFeat(778, oPC); break;
                }
            }
        else if (nFeat < 790)
            {
            switch (nFeat)
                {
case 780: nPRF1 = GetHasFeat(779, oPC); break;
case 781: nPRF1 = GetHasFeat(780, oPC); break;
case 782: nPRF1 = GetHasFeat(781, oPC); break;
case 783: nPRF1 = GetHasFeat(782, oPC); break;
case 785: nPRF1 = GetHasFeat(784, oPC); break;
case 786: nPRF1 = GetHasFeat(785, oPC); break;
case 787: nPRF1 = GetHasFeat(786, oPC); break;
case 788: nPRF1 = GetHasFeat(787, oPC); break;
case 789: nPRF1 = GetHasFeat(788, oPC); break;
                }
            }
        else //<800
            {
            switch (nFeat)
                {
case 790: nPRF1 = GetHasFeat(789, oPC); break;
case 791: nPRF1 = GetHasFeat(790, oPC); break;
case 792: nPRF1 = GetHasFeat(791, oPC); break;
case 793: nPRF1 = GetHasFeat(792, oPC); break;
case 795: nPRF1 = GetHasFeat(794, oPC); break;
case 796: nPRF1 = GetHasFeat(795, oPC); break;
case 797: nPRF1 = GetHasFeat(796, oPC); break;
case 798: nPRF1 = GetHasFeat(797, oPC); break;
case 799: nPRF1 = GetHasFeat(798, oPC); break;
                }
            }
        }
    else if (nFeat < 850)
        {
        if (nFeat < 810)
            {
            switch (nFeat)
                {
case 800: nPRF1 = GetHasFeat(799, oPC); break;
case 801: nPRF1 = GetHasFeat(800, oPC); break;
case 802: nPRF1 = GetHasFeat(801, oPC); break;
case 803: nPRF1 = GetHasFeat(802, oPC); break;
case 805: nPRF1 = GetHasFeat(804, oPC); break;
case 806: nPRF1 = GetHasFeat(805, oPC); break;
case 807: nPRF1 = GetHasFeat(806, oPC); break;
case 808: nPRF1 = GetHasFeat(807, oPC); break;
case 809: nPRF1 = GetHasFeat(808, oPC); break;
                }
            }
        else if (nFeat < 820)
            {
            switch (nFeat)
                {
case 810: nPRF1 = GetHasFeat(809, oPC); break;
case 811: nPRF1 = GetHasFeat(810, oPC); break;
case 812: nPRF1 = GetHasFeat(811, oPC); break;
case 813: nPRF1 = GetHasFeat(812, oPC); break;
case 815: nPRF1 = GetHasFeat(814, oPC); break;
case 816: nPRF1 = GetHasFeat(815, oPC); break;
case 817: nPRF1 = GetHasFeat(816, oPC); break;
case 818: nPRF1 = GetHasFeat(817, oPC); break;
case 819: nPRF1 = GetHasFeat(818, oPC); break;
                }
            }
        else if (nFeat < 830)
            {
            switch (nFeat)
                {
case 820: nPRF1 = GetHasFeat(819, oPC); break;
case 821: nPRF1 = GetHasFeat(820, oPC); break;
case 822: nPRF1 = GetHasFeat(821, oPC); break;
case 823: nPRF1 = GetHasFeat(822, oPC); break;
case 824: nORF1 = GetHasFeat(472, oPC); nORF2 = GetHasFeat(301, oPC); break;
case 825: nPRF1 = GetHasFeat(824, oPC); break;
case 826: nPRF1 = GetHasFeat(825, oPC); break;
case 827: nPRF1 = GetHasFeat(826, oPC); break;
case 828: nPRF1 = GetHasFeat(827, oPC); break;
case 829: nPRF1 = GetHasFeat(828, oPC); break;
                }
            }
        else if (nFeat < 840)
            {
            switch (nFeat)
                {
case 830: nPRF1 = GetHasFeat(829, oPC); break;
case 831: nPRF1 = GetHasFeat(830, oPC); break;
case 832: nPRF1 = GetHasFeat(831, oPC); break;
case 833: nPRF1 = GetHasFeat(832, oPC); break;
case 834: nORF1 = GetHasFeat(351, oPC); nORF2 = GetHasFeat(1006, oPC); nORF3 = GetHasFeat(1011, oPC); break;
case 835: nPRF1 = GetHasFeat(834, oPC); break;
case 836: nPRF1 = GetHasFeat(835, oPC); break;
case 837: nPRF1 = GetHasFeat(836, oPC); break;
case 838: nPRF1 = GetHasFeat(837, oPC); break;
case 839: nPRF1 = GetHasFeat(838, oPC); break;
                }
            }
        else //<850
            {
            switch (nFeat)
                {
case 840: nPRF1 = GetHasFeat(839, oPC); break;
case 841: nPRF1 = GetHasFeat(840, oPC); break;
case 842: nPRF1 = GetHasFeat(841, oPC); break;
case 843: nPRF1 = GetHasFeat(842, oPC); break;
case 844: nPRF1 = GetHasFeat(39, oPC); nPRF2 = GetHasFeat(21, oPC); break;
case 845: nPRF1 = GetHasFeat(844, oPC); break;
case 846: nPRF1 = GetHasFeat(845, oPC); break;
case 847: nPRF1 = GetHasFeat(846, oPC); break;
case 848: nPRF1 = GetHasFeat(847, oPC); break;
case 849: nPRF1 = GetHasFeat(848, oPC); break;
                }
            }
        }
    else if (nFeat < 900)
        {
        if (nFeat < 860)
            {
            switch (nFeat)
                {
case 850: nPRF1 = GetHasFeat(849, oPC); break;
case 851: nPRF1 = GetHasFeat(850, oPC); break;
case 852: nPRF1 = GetHasFeat(851, oPC); break;
case 853: nPRF1 = GetHasFeat(852, oPC); break;
case 854: nPRF1 = GetHasFeat(294, oPC); break;
case 856: nPRF1 = GetHasFeat(212, oPC); nPRF2 = GetHasFeat(223, oPC); break;
case 857: nPRF1 = GetHasFeat(29, oPC); break;
case 858: nPRF1 = GetHasFeat(857, oPC); break;
case 859: nPRF1 = GetHasFeat(858, oPC); break;
                }
            }
        else if (nFeat < 870)
            {
            switch (nFeat)
                {
case 860: nPRF1 = GetHasFeat(33, oPC); break;
case 861: nPRF1 = GetHasFeat(860, oPC); break;
case 862: nPRF1 = GetHasFeat(861, oPC); break;
case 863: nPRF1 = GetHasFeat(37, oPC); break;
case 864: nPRF1 = GetHasFeat(863, oPC); break;
case 865: nPRF1 = GetHasFeat(864, oPC); break;
case 867: nPRF1 = GetHasFeat(392, oPC); nPRF2 = GetHasFeat(389, oPC); break;
case 868: nPRF1 = GetHasFeat(867, oPC); break;
case 869: nPRF1 = GetHasFeat(331, oPC); break;
                }
            }
        else if (nFeat < 880)
            {
            switch (nFeat)
                {
case 870: nPRF1 = GetHasFeat(373, oPC); break;
case 872: nPRF1 = GetHasFeat(903, oPC); break;
case 873: nORF1 = GetHasFeat(338, oPC); nORF2 = GetHasFeat(903, oPC); break;
case 879: nPRF1 = GetHasFeat(98, oPC); break;
                }
            }
        else if (nFeat < 890)
            {
            switch (nFeat)
                {
case 880: nPRF1 = GetHasFeat(117, oPC); break;
case 881: nPRF1 = GetHasFeat(118, oPC); break;
case 887: nPRF1 = GetHasFeat(886, oPC); break;
case 888: nPRF1 = GetHasFeat(887, oPC); break;
                }
            }
        else //<900
            {
            switch (nFeat)
                {
case 893: nPRF1 = GetHasFeat(892, oPC); break;
case 897: nPRF1 = GetHasFeat(893, oPC); break;
                }
            }
        }
    else if (nFeat < 950)
        {
        if (nFeat < 910)
            {
            switch (nFeat)
                {
case 900: nPRF1 = GetHasFeat(898, oPC); break;
case 901: nPRF1 = GetHasFeat(900, oPC); break;
case 903: nPRF1 = GetHasFeat(901, oPC); break;
case 905: nPRF1 = GetHasFeat(904, oPC); break;
case 906: nPRF1 = GetHasFeat(905, oPC); break;
case 907: nPRF1 = GetHasFeat(906, oPC); break;
case 908: nPRF1 = GetHasFeat(907, oPC); break;
                }
            }
        else if (nFeat < 920)
            {
            switch (nFeat)
                {
case 910: nORF1 = GetHasFeat(301, oPC); nORF2 = GetHasFeat(472, oPC); break;
case 919: nPRF1 = GetHasFeat(43, oPC); break;
                }
            }
        else if (nFeat < 930)
            {
            switch (nFeat)
                {
case 920: nPRF1 = GetHasFeat(90, oPC); break;
case 921: nPRF1 = GetHasFeat(94, oPC); break;
case 922: nPRF1 = GetHasFeat(95, oPC); break;
case 923: nPRF1 = GetHasFeat(96, oPC); break;
case 924: nPRF1 = GetHasFeat(97, oPC); break;
case 925: nPRF1 = GetHasFeat(103, oPC); break;
case 926: nPRF1 = GetHasFeat(104, oPC); break;
case 927: nPRF1 = GetHasFeat(105, oPC); break;
case 928: nPRF1 = GetHasFeat(106, oPC); break;
case 929: nPRF1 = GetHasFeat(107, oPC); break;
                }
            }
        else if (nFeat < 940)
            {
            switch (nFeat)
                {
case 930: nPRF1 = GetHasFeat(108, oPC); break;
case 931: nPRF1 = GetHasFeat(110, oPC); break;
case 932: nPRF1 = GetHasFeat(111, oPC); break;
case 933: nPRF1 = GetHasFeat(112, oPC); break;
case 934: nPRF1 = GetHasFeat(113, oPC); break;
case 935: nPRF1 = GetHasFeat(114, oPC); break;
case 936: nPRF1 = GetHasFeat(115, oPC); break;
case 937: nPRF1 = GetHasFeat(116, oPC); break;
case 938: nPRF1 = GetHasFeat(121, oPC); break;
case 939: nPRF1 = GetHasFeat(122, oPC); break;
                }
            }
        else //<950
            {
            switch (nFeat)
                {
case 940: nPRF1 = GetHasFeat(123, oPC); break;
case 941: nPRF1 = GetHasFeat(125, oPC); break;
case 942: nPRF1 = GetHasFeat(126, oPC); break;
case 943: nPRF1 = GetHasFeat(127, oPC); break;
                }
            }
        }
    else if (nFeat < 1000)
        {
        if (nFeat < 960)
            {
            switch (nFeat)
                {
case 950: nPRF1 = GetHasFeat(949, oPC); break;
case 951: nPRF1 = GetHasFeat(950, oPC); break;
case 952: nPRF1 = GetHasFeat(44, oPC); break;
case 953: nPRF1 = GetHasFeat(952, oPC); break;
case 954: nPRF1 = GetHasFeat(44, oPC); break;
case 955: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(958, oPC); break;
case 956: nPRF1 = GetHasFeat(952, oPC); break;
case 957: nPRF1 = GetHasFeat(953, oPC); nPRF2 = GetHasFeat(956, oPC); break;
case 958: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(954, oPC); break;
case 959: nPRF1 = GetHasFeat(952, oPC); break;
                }
            }
        else if (nFeat < 990)
            {
            switch (nFeat)
                {
case 988: nPRF1 = GetHasFeat(329, oPC); break;
case 989: nPRF1 = GetHasFeat(329, oPC); break;
                }
            }
        else //<1000
            {
            switch (nFeat)
                {
case 993: nPRF1 = GetHasFeat(44, oPC); break;
case 994: nPRF1 = GetHasFeat(993, oPC); break;
case 995: nPRF1 = GetHasFeat(44, oPC); break;
case 996: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(999, oPC); break;
case 997: nPRF1 = GetHasFeat(993, oPC); break;
case 998: nPRF1 = GetHasFeat(994, oPC); nPRF2 = GetHasFeat(997, oPC); break;
case 999: nPRF1 = GetHasFeat(391, oPC); nPRF2 = GetHasFeat(995, oPC); break;
                }
            }
        }
    else  //through 1071
        {
        if (nFeat < 1010)
            {
            switch (nFeat)
                {
case 1000: nPRF1 = GetHasFeat(993, oPC); break;
case 1002: nPRF1 = GetHasFeat(435, oPC); break;
case 1003: nPRF1 = GetHasFeat(475, oPC); break;
                }
            }
        else if (nFeat < 1050)
            {
            switch (nFeat)
                {
case 1045: nPRF1 = GetHasFeat(449, oPC); break;
case 1046: nPRF1 = GetHasFeat(1045, oPC); break;
case 1047: nPRF1 = GetHasFeat(1046, oPC); break;
case 1048: nPRF1 = GetHasFeat(1047, oPC); break;
case 1049: nPRF1 = GetHasFeat(1048, oPC); break;
                }
            }
        else if (nFeat < 1060)
            {
            switch (nFeat)
                {
case 1050: nPRF1 = GetHasFeat(1049, oPC); break;
case 1051: nPRF1 = GetHasFeat(1050, oPC); break;
case 1052: nPRF1 = GetHasFeat(1051, oPC); break;
case 1053: nPRF1 = GetHasFeat(1052, oPC); break;
case 1054: nPRF1 = GetHasFeat(1053, oPC); break;
case 1055: nPRF1 = GetHasFeat(1054, oPC); break;
case 1056: nPRF1 = GetHasFeat(1055, oPC); break;
case 1057: nPRF1 = GetHasFeat(1056, oPC); break;
case 1058: nPRF1 = GetHasFeat(1057, oPC); break;
case 1059: nPRF1 = GetHasFeat(1058, oPC); break;
                }
            }
        else //through 1071
            {
            switch (nFeat)
                {
case 1060: nPRF1 = GetHasFeat(903, oPC); break;
case 1061: nPRF1 = GetHasFeat(903, oPC); break;
case 1067: nPRF1 = GetHasFeat(334, oPC); break;
case 1070: nPRF1 = GetHasFeat(466, oPC); break;
case 1071: nPRF1 = GetHasFeat(884, oPC); break;
case 1072: nPRF1 = GetHasFeat(45, oPC); break;
case 1073: nPRF1 = GetHasFeat(1072, oPC); break;
case 1074: nPRF1 = GetHasFeat(45, oPC); break;
case 1075: nPRF1 = GetHasFeat(1078, oPC); break;
case 1076: nPRF1 = GetHasFeat(1072, oPC); break;
case 1077: nPRF1 = GetHasFeat(1073, oPC); break;
case 1078: nPRF1 = GetHasFeat(1074, oPC); break;
case 1079: nPRF1 = GetHasFeat(1072, oPC); break;

                }
            }
        }
    }
return ((nPRF1 && nPRF2) && (nORF1 || nORF2 || nORF3 || nORF4 || nORF5));
}

int GetIsFeatFirstLevelOnly(int nFeat)
{
switch(nFeat)
    {
    case 378: return TRUE; break;
    case 379: return TRUE; break;
    case 380: return TRUE; break;
    case 381: return TRUE; break;
    case 382: return TRUE; break;
    case 384: return TRUE; break;
    case 386: return TRUE; break;
    case 388: return TRUE; break;
    default : return FALSE; break;
    }
return -3;
}

int GetIsFeatDevCrit(int nFeat)
{
if (nFeat > 494 && nFeat <532) return TRUE;
else if (nFeat == 955 || nFeat == 996 || nFeat == 1075) return TRUE;
else return FALSE;
}

int GetHasRequiredSpellLevelForFeat(object oPC, int nFeat)
{
int nReturn = TRUE;
switch(nFeat)
    {
    case 7: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 12: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 33: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 35: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 36: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 37: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 166: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 167: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 168: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 169: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 170: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 171: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 172: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 1) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 2) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 4)); break;
    case 11: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 3) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 4) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 3) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 3) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 4) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 8) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 8)); break;
    case 25: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 5) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 6) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 5) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 5) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 7) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 11) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 11)); break;
    case 29: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 7) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 8) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 7) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 7) || (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 10) || (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 14) || (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 14)); break;
    case 31: nReturn = FALSE; break;
    case 610: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 611: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 612: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 613: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 614: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 615: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 616: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 617: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 857: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 858: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 859: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 860: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 861: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 862: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 863: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 864: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    case 865: nReturn = ((GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 17) || (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 18) || ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) + (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)/2)) >= 17) || (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 17)); break;
    default: nReturn = TRUE; break;
    }
return nReturn;
}

string GetNameOfFeat(int nFeat)
{
string sName;
if (nFeat < 250)
    {
    if (nFeat < 50)
        {
        if (nFeat < 10)
            {
            switch (nFeat)
                {
case 0: sName = "Alertness"; break;
case 1: sName = "Ambidexterity"; break;
case 2: sName = "Armor Proficiency Heavy"; break;
case 3: sName = "Armor Proficiency Light"; break;
case 4: sName = "Armor Proficiency Medium"; break;
case 5: sName = "Called Shot"; break;
case 6: sName = "Cleave"; break;
case 7: sName = "Combat Casting"; break;
case 8: sName = "Deflect Arrows"; break;
case 9: sName = "Disarm"; break;
                }
            }
        else if (nFeat < 20)
            {
            switch (nFeat)
                {
case 10: sName = "Dodge"; break;
case 11: sName = "Empower Spell"; break;
case 12: sName = "Extend Spell"; break;
case 13: sName = "Extra Turning"; break;
case 14: sName = "Great Fortitude"; break;
case 15: sName = "Improved Critical Club"; break;
case 16: sName = "Improved Disarm"; break;
case 17: sName = "Improved Knockdown"; break;
case 18: sName = "Improved Parry"; break;
case 19: sName = "Improved Power Attack"; break;
                }
            }
        else if (nFeat < 30)
            {
            switch (nFeat)
                {
case 20: sName = "Improved Two Weapon Fighting"; break;
case 21: sName = "Improved Unarmed Strike"; break;
case 22: sName = "Iron Will"; break;
case 23: sName = "Knockdown"; break;
case 24: sName = "Lightning Reflexes"; break;
case 25: sName = "Maximize Spell"; break;
case 26: sName = "Mobility"; break;
case 27: sName = "Point Blank Shot"; break;
case 28: sName = "Power Attack"; break;
case 29: sName = "Quicken Spell"; break;
                }
            }
        else if (nFeat < 40)
            {
            switch (nFeat)
                {
case 30: sName = "Rapid Shot"; break;
case 31: sName = "Sap"; break;
case 32: sName = "Shield Proficiency"; break;
case 33: sName = "Silence Spell"; break;
case 34: sName = "Skill Focus Animal Empathy"; break;
case 35: sName = "Spell Focus Abjuration"; break;
case 36: sName = "Spell Penetration"; break;
case 37: sName = "Still Spell"; break;
case 39: sName = "Stunning Fist"; break;
                }
            }
        else //<50
            {
            switch (nFeat)
                {
case 40: sName = "Toughness"; break;
case 41: sName = "Two Weapon Fighting"; break;
case 42: sName = "Weapon Finesse"; break;
case 43: sName = "Weapon Focus Club"; break;
case 44: sName = "Weapon Proficiency Exotic"; break;
case 45: sName = "Weapon Proficiency Martial"; break;
case 46: sName = "Weapon Proficiency Simple"; break;
case 47: sName = "Weapon Specialization Club"; break;
case 48: sName = "Weapon Proficiency Druid"; break;
case 49: sName = "Weapon Proficiency Monk"; break;
                }
            }
        }
    else if (nFeat < 100)
        {
        if (nFeat < 60)
            {
            switch (nFeat)
                {
case 50: sName = "Weapon Proficiency Rogue"; break;
case 51: sName = "Weapon Proficiency Wizard"; break;
case 52: sName = "Improved Critical Dagger"; break;
case 53: sName = "Improved Critical Dart"; break;
case 54: sName = "Improved Critical Heavy Crossbow"; break;
case 55: sName = "Improved Critical Light Crossbow"; break;
case 56: sName = "Improved Critical Light Mace"; break;
case 57: sName = "Improved Critical Morning Star"; break;
case 58: sName = "Improved Critical Staff"; break;
case 59: sName = "Improved Critical Spear"; break;
                }
            }
        else if (nFeat < 70)
            {
            switch (nFeat)
                {
case 60: sName = "Improved Critical Sickle"; break;
case 61: sName = "Improved Critical Sling"; break;
case 62: sName = "Improved Critical Unarmed Strike"; break;
case 63: sName = "Improved Critical Longbow"; break;
case 64: sName = "Improved Critical Shortbow"; break;
case 65: sName = "Improved Critical Short Sword"; break;
case 66: sName = "Improved Critical Rapier"; break;
case 67: sName = "Improved Critical Scimitar"; break;
case 68: sName = "Improved Critical Long Sword"; break;
case 69: sName = "Improved Critical Great Sword"; break;
                }
            }
        else if (nFeat < 80)
            {
            switch (nFeat)
                {
case 70: sName = "Improved Critical Hand Axe"; break;
case 71: sName = "Improved Critical Throwing Axe"; break;
case 72: sName = "Improved Critical Battle Axe"; break;
case 73: sName = "Improved Critical Great Axe"; break;
case 74: sName = "Improved Critical Halberd"; break;
case 75: sName = "Improved Critical Light Hammer"; break;
case 76: sName = "Improved Critical Light Flail"; break;
case 77: sName = "Improved Critical War Hammer"; break;
case 78: sName = "Improved Critical Heavy Flail"; break;
case 79: sName = "Improved Critical Kama"; break;
                }
            }
        else if (nFeat < 90)
            {
            switch (nFeat)
                {
case 80: sName = "Improved Critical Kukri"; break;
case 82: sName = "Improved Critical Shuriken"; break;
case 83: sName = "Improved Critical Scythe"; break;
case 84: sName = "Improved Critical Katana"; break;
case 85: sName = "Improved Critical Bastard Sword"; break;
case 87: sName = "Improved Critical Dire Mace"; break;
case 88: sName = "Improved Critical Double Axe"; break;
case 89: sName = "Improved Critical Two Bladed Sword"; break;
                }
            }
        else //<100
            {
            switch (nFeat)
                {
case 90: sName = "Weapon Focus Dagger"; break;
case 91: sName = "Weapon Focus Dart"; break;
case 92: sName = "Weapon Focus Heavy Crossbow"; break;
case 93: sName = "Weapon Focus Light Crossbow"; break;
case 94: sName = "Weapon Focus Light Mace"; break;
case 95: sName = "Weapon Focus Morning Star"; break;
case 96: sName = "Weapon Focus Staff"; break;
case 97: sName = "Weapon Focus Spear"; break;
case 98: sName = "Weapon Focus Sickle"; break;
case 99: sName = "Weapon Focus Sling"; break;
                }
            }
        }
    else if (nFeat < 150)
        {
        if (nFeat < 110)
            {
            switch (nFeat)
                {
case 100: sName = "Weapon Focus Unarmed Strike"; break;
case 101: sName = "Weapon Focus Longbow"; break;
case 102: sName = "Weapon Focus Shortbow"; break;
case 103: sName = "Weapon Focus Short Sword"; break;
case 104: sName = "Weapon Focus Rapier"; break;
case 105: sName = "Weapon Focus Scimitar"; break;
case 106: sName = "Weapon Focus Long Sword"; break;
case 107: sName = "Weapon Focus Great Sword"; break;
case 108: sName = "Weapon Focus Hand Axe"; break;
case 109: sName = "Weapon Focus Throwing Axe"; break;
                }
            }
        else if (nFeat < 120)
            {
            switch (nFeat)
                {
case 110: sName = "Weapon Focus Battle Axe"; break;
case 111: sName = "Weapon Focus Great Axe"; break;
case 112: sName = "Weapon Focus Halberd"; break;
case 113: sName = "Weapon Focus Light Hammer"; break;
case 114: sName = "Weapon Focus Light Flail"; break;
case 115: sName = "Weapon Focus War Hammer"; break;
case 116: sName = "Weapon Focus Heavy Flail"; break;
case 117: sName = "Weapon Focus Kama"; break;
case 118: sName = "Weapon Focus Kukri"; break;
                }
            }
        else if (nFeat < 130)
            {
            switch (nFeat)
                {
case 120: sName = "Weapon Focus Shuriken"; break;
case 121: sName = "Weapon Focus Scythe"; break;
case 122: sName = "Weapon Focus Katana"; break;
case 123: sName = "Weapon Focus Bastard Sword"; break;
case 125: sName = "Weapon Focus Dire Mace"; break;
case 126: sName = "Weapon Focus Double Axe"; break;
case 127: sName = "Weapon Focus Two Bladed Sword"; break;
case 128: sName = "Weapon Specialization Dagger"; break;
case 129: sName = "Weapon Specialization Dart"; break;
                }
            }
        else if (nFeat < 140)
            {
            switch (nFeat)
                {
case 130: sName = "Weapon Specialization Heavy Crossbow"; break;
case 131: sName = "Weapon Specialization Light Crossbow"; break;
case 132: sName = "Weapon Specialization Light Mace"; break;
case 133: sName = "Weapon Specialization Morning Star"; break;
case 134: sName = "Weapon Specialization Staff"; break;
case 135: sName = "Weapon Specialization Spear"; break;
case 136: sName = "Weapon Specialization Sickle"; break;
case 137: sName = "Weapon Specialization Sling"; break;
case 138: sName = "Weapon Specialization Unarmed Strike"; break;
case 139: sName = "Weapon Specialization Longbow"; break;
                }
            }
        else //<150
            {
            switch (nFeat)
                {
case 140: sName = "Weapon Specialization Shortbow"; break;
case 141: sName = "Weapon Specialization Short Sword"; break;
case 142: sName = "Weapon Specialization Rapier"; break;
case 143: sName = "Weapon Specialization Scimitar"; break;
case 144: sName = "Weapon Specialization Long Sword"; break;
case 145: sName = "Weapon Specialization Great Sword"; break;
case 146: sName = "Weapon Specialization Hand Axe"; break;
case 147: sName = "Weapon Specialization Throwing Axe"; break;
case 148: sName = "Weapon Specialization Battle Axe"; break;
case 149: sName = "Weapon Specialization Great Axe"; break;
                }
            }
        }
    else if (nFeat < 200)
        {
        if (nFeat < 160)
            {
            switch (nFeat)
                {
case 150: sName = "Weapon Specialization Halberd"; break;
case 151: sName = "Weapon Specialization Light Hammer"; break;
case 152: sName = "Weapon Specialization Light Flail"; break;
case 153: sName = "Weapon Specialization War Hammer"; break;
case 154: sName = "Weapon Specialization Heavy Flail"; break;
case 155: sName = "Weapon Specialization Kama"; break;
case 156: sName = "Weapon Specialization Kukri"; break;
case 158: sName = "Weapon Specialization Shuriken"; break;
case 159: sName = "Weapon Specialization Scythe"; break;
                }
            }
        else if (nFeat < 170)
            {
            switch (nFeat)
                {
case 160: sName = "Weapon Specialization Katana"; break;
case 161: sName = "Weapon Specialization Bastard Sword"; break;
case 163: sName = "Weapon Specialization Dire Mace"; break;
case 164: sName = "Weapon Specialization Double Axe"; break;
case 165: sName = "Weapon Specialization Two Bladed Sword"; break;
case 166: sName = "Spell Focus Conjuration"; break;
case 167: sName = "Spell Focus Divination"; break;
case 168: sName = "Spell Focus Enchantment"; break;
case 169: sName = "Spell Focus Evocation"; break;
                }
            }
        else if (nFeat < 180)
            {
            switch (nFeat)
                {
case 170: sName = "Spell Focus Illusion"; break;
case 171: sName = "Spell Focus Necromancy"; break;
case 172: sName = "Spell Focus Transmutation"; break;
case 173: sName = "Skill Focus Concentration"; break;
case 174: sName = "Skill Focus Disable Trap"; break;
case 175: sName = "Skill Focus Discipline"; break;
case 177: sName = "Skill Focus Heal"; break;
case 178: sName = "Skill Focus Hide"; break;
case 179: sName = "Skill Focus Listen"; break;
                }
            }
        else if (nFeat < 190)
            {
            switch (nFeat)
                {
case 180: sName = "Skill Focus Lore"; break;
case 181: sName = "Skill Focus Move Silently"; break;
case 182: sName = "Skill Focus Open Lock"; break;
case 183: sName = "Skill Focus Parry"; break;
case 184: sName = "Skill Focus Perform"; break;
case 185: sName = "Skill Focus Persuade"; break;
case 186: sName = "Skill Focus Pick Pocket"; break;
case 187: sName = "Skill Focus Search"; break;
case 188: sName = "Skill Focus Set Trap"; break;
case 189: sName = "Skill Focus Spellcraft"; break;
                }
            }
        else //<200
            {
            switch (nFeat)
                {
case 190: sName = "Skill Focus Spot"; break;
case 192: sName = "Skill Focus Taunt"; break;
case 193: sName = "Skill Focus Use Magic Device"; break;
case 194: sName = "Barbarian Endurance"; break;
case 195: sName = "Uncanny Dodge 1"; break;
case 196: sName = "Damage Reduction"; break;
case 197: sName = "Bardic Knowledge"; break;
case 198: sName = "Nature Sense"; break;
case 199: sName = "Animal Companion"; break;
                }
            }
        }
    else //<250
        {
        if (nFeat < 210)
            {
            switch (nFeat)
                {
case 200: sName = "Woodland Stride"; break;
case 201: sName = "Trackless Step"; break;
case 202: sName = "Resist Natures Lure"; break;
case 203: sName = "Venom Immunity"; break;
case 204: sName = "Flurry Of Blows"; break;
case 206: sName = "Evasion"; break;
case 207: sName = "Monk Endurance"; break;
case 208: sName = "Still Mind"; break;
case 209: sName = "Purity Of Body"; break;
                }
            }
        else if (nFeat < 220)
            {
            switch (nFeat)
                {
case 211: sName = "Wholeness Of Body"; break;
case 212: sName = "Improved Evasion"; break;
case 213: sName = "Ki Strike"; break;
case 214: sName = "Diamond Body"; break;
case 215: sName = "Diamond Soul"; break;
case 216: sName = "Perfect Self"; break;
case 217: sName = "Divine Grace"; break;
case 219: sName = "Divine Health"; break;
                }
            }
        else if (nFeat < 230)
            {
            switch (nFeat)
                {
case 221: sName = "Sneak Attack"; break;
case 222: sName = "Crippling Strike"; break;
case 223: sName = "Defensive Roll"; break;
case 224: sName = "Opportunist"; break;
case 225: sName = "Skill Mastery"; break;
case 226: sName = "Uncanny Reflex"; break;
case 227: sName = "Stonecunning"; break;
case 228: sName = "Darkvision"; break;
case 229: sName = "Hardiness Versus Poisons"; break;
                }
            }
        else if (nFeat < 240)
            {
            switch (nFeat)
                {
case 230: sName = "Hardiness Versus Spells"; break;
case 231: sName = "Battle Training Versus Orcs"; break;
case 232: sName = "Battle Training Versus Goblins"; break;
case 233: sName = "Battle Training Versus Giants"; break;
case 234: sName = "Skill Affinity Lore"; break;
case 235: sName = "Immunity To Sleep"; break;
case 236: sName = "Hardiness Versus Enchantments"; break;
case 237: sName = "Skill Affinity Listen"; break;
case 238: sName = "Skill Affinity Search"; break;
case 239: sName = "Skill Affinity Spot"; break;
                }
            }
        else //<250
            {
            switch (nFeat)
                {
case 240: sName = "Keen Sense"; break;
case 241: sName = "Hardiness Versus Illusions"; break;
case 242: sName = "Battle Training Versus Reptilians"; break;
case 243: sName = "Skill Affinity Concentration"; break;
case 244: sName = "Partial Skill Affinity Listen"; break;
case 245: sName = "Partial Skill Affinity Search"; break;
case 246: sName = "Partial Skill Affinity Spot"; break;
case 247: sName = "Skill Affinity Move Silently"; break;
case 248: sName = "Lucky"; break;
case 249: sName = "Fearless"; break;
                }
            }
        }
    }
else if (nFeat < 500)
    {
    if (nFeat < 300)
        {
        if (nFeat < 260)
            {
            switch (nFeat)
                {
case 250: sName = "Good Aim"; break;
case 251: sName = "Uncanny Dodge 2"; break;
case 252: sName = "Uncanny Dodge 3"; break;
case 253: sName = "Uncanny Dodge 4"; break;
case 254: sName = "Uncanny Dodge 5"; break;
case 255: sName = "Uncanny Dodge 6"; break;
case 256: sName = "Weapon Proficiency Elf"; break;
case 257: sName = "Bard Songs"; break;
case 258: sName = "Quick To Master"; break;
case 259: sName = "Slippery Mind"; break;
                }
            }
        else if (nFeat < 270)
            {
            switch (nFeat)
                {
case 260: sName = "Monk Ac Bonus"; break;
case 261: sName = "Favored Enemy Dwarf"; break;
case 262: sName = "Favored Enemy Elf"; break;
case 263: sName = "Favored Enemy Gnome"; break;
case 264: sName = "Favored Enemy Halfling"; break;
case 265: sName = "Favored Enemy Halfelf"; break;
case 266: sName = "Favored Enemy Halforc"; break;
case 267: sName = "Favored Enemy Human"; break;
case 268: sName = "Favored Enemy Aberration"; break;
case 269: sName = "Favored Enemy Animal"; break;
                }
            }
        else if (nFeat < 280)
            {
            switch (nFeat)
                {
case 270: sName = "Favored Enemy Beast"; break;
case 271: sName = "Favored Enemy Construct"; break;
case 272: sName = "Favored Enemy Dragon"; break;
case 273: sName = "Favored Enemy Goblinoid"; break;
case 274: sName = "Favored Enemy Monstrous"; break;
case 275: sName = "Favored Enemy Orc"; break;
case 276: sName = "Favored Enemy Reptilian"; break;
case 277: sName = "Favored Enemy Elemental"; break;
case 278: sName = "Favored Enemy Fey"; break;
case 279: sName = "Favored Enemy Giant"; break;
                }
            }
        else if (nFeat < 290)
            {
            switch (nFeat)
                {
case 280: sName = "Favored Enemy Magical Beast"; break;
case 281: sName = "Favored Enemy Outsider"; break;
case 284: sName = "Favored Enemy Shapechanger"; break;
case 285: sName = "Favored Enemy Undead"; break;
case 286: sName = "Favored Enemy Vermin"; break;
case 289: sName = "Weapon Proficiency Creature"; break;
                }
            }
        else //<300
            {
            switch (nFeat)
                {
case 290: sName = "Weapon Specialization Creature"; break;
case 291: sName = "Weapon Focus Creature"; break;
case 292: sName = "Improved Critical Creature"; break;
case 293: sName = "Barbarian Rage"; break;
case 294: sName = "Turn Undead"; break;
case 296: sName = "Quivering Palm"; break;
case 297: sName = "Empty Body"; break;
case 299: sName = "Lay On Hands"; break;
                }
            }
        }
    else if (nFeat < 350)
        {
        if (nFeat < 310)
            {
            switch (nFeat)
                {
case 300: sName = "Aura Of Courage"; break;
case 301: sName = "Smite Evil"; break;
case 302: sName = "Remove Disease"; break;
case 303: sName = "Summon Familiar"; break;
case 304: sName = "Elemental Shape"; break;
case 305: sName = "Wild Shape"; break;
case 306: sName = "War Domain Power"; break;
case 307: sName = "Strength Domain Power"; break;
case 308: sName = "Protection Domain Power"; break;
case 309: sName = "Luck Domain Power"; break;
                }
            }
        else if (nFeat < 320)
            {
            switch (nFeat)
                {
case 310: sName = "Death Domain Power"; break;
case 311: sName = "Air Domain Power"; break;
case 312: sName = "Animal Domain Power"; break;
case 313: sName = "Destruction Domain Power"; break;
case 314: sName = "Earth Domain Power"; break;
case 315: sName = "Evil Domain Power"; break;
case 316: sName = "Fire Domain Power"; break;
case 317: sName = "Good Domain Power"; break;
case 318: sName = "Healing Domain Power"; break;
case 319: sName = "Knowledge Domain Power"; break;
                }
            }
        else if (nFeat < 330)
            {
            switch (nFeat)
                {
case 320: sName = "Magic Domain Power"; break;
case 321: sName = "Plant Domain Power"; break;
case 322: sName = "Sun Domain Power"; break;
case 323: sName = "Travel Domain Power"; break;
case 324: sName = "Trickery Domain Power"; break;
case 325: sName = "Water Domain Power"; break;
case 326: sName = "Barbarian Rage"; break;
case 327: sName = "Barbarian Rage"; break;
case 328: sName = "Barbarian Rage"; break;
case 329: sName = "Barbarian Rage"; break;
                }
            }
        else if (nFeat < 340)
            {
            switch (nFeat)
                {
case 330: sName = "Barbarian Rage"; break;
case 331: sName = "Barbarian Rage"; break;
case 332: sName = "Damage Reduction"; break;
case 333: sName = "Damage Reduction"; break;
case 334: sName = "Damage Reduction"; break;
case 335: sName = "Wild Shape"; break;
case 336: sName = "Wild Shape"; break;
case 337: sName = "Wild Shape"; break;
case 338: sName = "Wild Shape"; break;
case 339: sName = "Wild Shape"; break;
                }
            }
        else //<350
            {
            switch (nFeat)
                {
case 340: sName = "Elemental Shape"; break;
case 341: sName = "Elemental Shape"; break;
case 342: sName = "Elemental Shape"; break;
case 343: sName = "Ki Strike"; break;
case 344: sName = "Ki Strike"; break;
case 345: sName = "Sneak Attack"; break;
case 346: sName = "Sneak Attack"; break;
case 347: sName = "Sneak Attack"; break;
case 348: sName = "Sneak Attack"; break;
case 349: sName = "Sneak Attack"; break;
                }
            }
        }
    else if (nFeat < 400)
        {
        if (nFeat < 360)
            {
            switch (nFeat)
                {
case 350: sName = "Sneak Attack"; break;
case 351: sName = "Sneak Attack"; break;
case 352: sName = "Sneak Attack"; break;
case 353: sName = "Sneak Attack"; break;
case 354: sName = "Lowlightvision"; break;
case 355: sName = "Bard Songs"; break;
case 356: sName = "Bard Songs"; break;
case 357: sName = "Bard Songs"; break;
case 358: sName = "Bard Songs"; break;
case 359: sName = "Bard Songs"; break;
                }
            }
        else if (nFeat < 370)
            {
            switch (nFeat)
                {
case 360: sName = "Bard Songs"; break;
case 361: sName = "Bard Songs"; break;
case 362: sName = "Bard Songs"; break;
case 363: sName = "Bard Songs"; break;
case 364: sName = "Bard Songs"; break;
case 365: sName = "Bard Songs"; break;
case 366: sName = "Bard Songs"; break;
case 367: sName = "Bard Songs"; break;
case 368: sName = "Bard Songs"; break;
case 369: sName = "Bard Songs"; break;
                }
            }
        else if (nFeat < 380)
            {
            switch (nFeat)
                {
case 370: sName = "Bard Songs"; break;
case 371: sName = "Bard Songs"; break;
case 372: sName = "Bard Songs"; break;
case 373: sName = "Bard Songs"; break;
case 374: sName = "Ambidexterity"; break;
case 375: sName = "Ambidexterity"; break;
case 377: sName = "Improved Initiative"; break;
case 378: sName = "Artist"; break;
case 379: sName = "Blooded"; break;
                }
            }
        else if (nFeat < 390)
            {
            switch (nFeat)
                {
case 380: sName = "Bullheaded"; break;
case 381: sName = "Courteous Magocracy"; break;
case 382: sName = "Luck Of Heroes"; break;
case 383: sName = "Resist Poison"; break;
case 384: sName = "Silver Palm"; break;
case 385: sName = "Smooth Talk"; break;
case 386: sName = "Snake Blood"; break;
case 387: sName = "Stealthy"; break;
case 388: sName = "Strong Soul"; break;
case 389: sName = "Expertise"; break;
                }
            }
        else //<400
            {
            switch (nFeat)
                {
case 390: sName = "Improved Expertise"; break;
case 391: sName = "Great Cleave"; break;
case 392: sName = "Spring Attack"; break;
case 393: sName = "Greater Spell Focus Abjuration"; break;
case 394: sName = "Greater Spell Focus Conjuration"; break;
case 395: sName = "Greater Spell Focus Divination"; break;
case 396: sName = "Greater Spell Focus Enchantment"; break;
case 397: sName = "Greater Spell Focus Evocation"; break;
case 398: sName = "Greater Spell Focus Illusion"; break;
case 399: sName = "Greater Spell Focus Necromancy"; break;
                }
            }
        }
    else if (nFeat < 450)
        {
        if (nFeat < 410)
            {
            switch (nFeat)
                {
case 400: sName = "Greater Spell Focus Transmutation"; break;
case 401: sName = "Greater Spell Penetration"; break;
case 402: sName = "Thug"; break;
case 403: sName = "Mercantile Background"; break;
case 404: sName = "Skill Focus Appraise"; break;
case 406: sName = "Skill Focus Tumble"; break;
case 407: sName = "Skill Focus Craft Trap"; break;
case 408: sName = "Blind Fight"; break;
case 409: sName = "Circle Kick"; break;
                }
            }
        else if (nFeat < 420)
            {
            switch (nFeat)
                {
case 410: sName = "Extra Stunning Attack"; break;
case 411: sName = "Rapid Reload"; break;
case 412: sName = "Zen Archery"; break;
case 413: sName = "Divine Might"; break;
case 414: sName = "Divine Shield"; break;
case 415: sName = "Arcane Defense Abjuration"; break;
case 416: sName = "Arcane Defense Conjuration"; break;
case 417: sName = "Arcane Defense Divination"; break;
case 418: sName = "Arcane Defense Enchatment"; break;
case 419: sName = "Arcane Defense Evocation"; break;
                }
            }
        else if (nFeat < 430)
            {
            switch (nFeat)
                {
case 420: sName = "Arcane Defense Illusion"; break;
case 421: sName = "Arcane Defense Necromancy"; break;
case 422: sName = "Arcane Defense Transmutation"; break;
case 423: sName = "Extra Music"; break;
case 424: sName = "Lingering Song"; break;
case 425: sName = "Dirty Fighting"; break;
case 426: sName = "Resist Disease"; break;
case 427: sName = "Resist Energy Cold"; break;
case 428: sName = "Resist Energy Acid"; break;
case 429: sName = "Resist Energy Fire"; break;
                }
            }
        else if (nFeat < 440)
            {
            switch (nFeat)
                {
case 430: sName = "Resist Energy Electrical"; break;
case 431: sName = "Resist Energy Sonic"; break;
case 433: sName = "Hide In Plain Sight"; break;
case 434: sName = "Shadow Daze"; break;
case 435: sName = "Summon Shadow"; break;
case 436: sName = "Shadow Evade"; break;
case 437: sName = "Deneirs Eye"; break;
case 438: sName = "Tymoras Smile"; break;
case 439: sName = "Lliiras Heart"; break;
                }
            }
        else //<450
            {
            switch (nFeat)
                {
case 440: sName = "Craft Harper Item"; break;
case 441: sName = "Harper Sleep"; break;
case 442: sName = "Harper Cats Grace"; break;
case 443: sName = "Harper Eagles Splendor"; break;
case 444: sName = "Harper Invisibility"; break;
case 445: sName = "Prestige Enchant Arrow 1"; break;
case 446: sName = "Prestige Enchant Arrow 2"; break;
case 447: sName = "Prestige Enchant Arrow 3"; break;
case 448: sName = "Prestige Enchant Arrow 4"; break;
case 449: sName = "Prestige Enchant Arrow 5"; break;
                }
            }
        }
    else //<500
        {
        if (nFeat < 460)
            {
            switch (nFeat)
                {
case 450: sName = "Prestige Embue Arrow"; break;
case 451: sName = "Prestige Seeker Arrow 1"; break;
case 452: sName = "Prestige Seeker Arrow 2"; break;
case 453: sName = "Prestige Hail Of Arrows"; break;
case 454: sName = "Prestige Arrow Of Death"; break;
case 455: sName = "Prestige Death Attack 1"; break;
case 456: sName = "Prestige Death Attack 2"; break;
case 457: sName = "Prestige Death Attack 3"; break;
case 458: sName = "Prestige Death Attack 4"; break;
case 459: sName = "Prestige Death Attack 5"; break;
                }
            }
        else if (nFeat < 470)
            {
            switch (nFeat)
                {
case 460: sName = "Blackguard Sneak Attack 1d6"; break;
case 461: sName = "Blackguard Sneak Attack 2d6"; break;
case 462: sName = "Blackguard Sneak Attack 3d6"; break;
case 463: sName = "Prestige Poison Save 1"; break;
case 464: sName = "Prestige Poison Save 2"; break;
case 465: sName = "Prestige Poison Save 3"; break;
case 466: sName = "Prestige Poison Save 4"; break;
case 467: sName = "Prestige Poison Save 5"; break;
case 468: sName = "Prestige Spell Ghostly Visage"; break;
case 469: sName = "Prestige Darkness"; break;
                }
            }
        else if (nFeat < 480)
            {
            switch (nFeat)
                {
case 470: sName = "Prestige Invisibility 1"; break;
case 471: sName = "Prestige Invisibility 2"; break;
case 472: sName = "Smite Good"; break;
case 473: sName = "Prestige Dark Blessing"; break;
case 474: sName = "Inflict Light Wounds"; break;
case 475: sName = "Inflict Moderate Wounds"; break;
case 476: sName = "Inflict Serious Wounds"; break;
case 477: sName = "Inflict Critical Wounds"; break;
case 478: sName = "Bulls Strength"; break;
case 479: sName = "Contagion"; break;
                }
            }
        else //<500
            {
            switch (nFeat)
                {
case 490: sName = "Epic Armor Skin"; break;
case 491: sName = "Epic Blinding Speed"; break;
case 492: sName = "Epic Damage Reduction 3"; break;
case 493: sName = "Epic Damage Reduction 6"; break;
case 494: sName = "Epic Damage Reduction 9"; break;
case 495: sName = "Epic Devastating Critical Club"; break;
case 496: sName = "Epic Devastating Critical Dagger"; break;
case 497: sName = "Epic Devastating Critical Dart"; break;
case 498: sName = "Epic Devastating Critical Heavycrossbow"; break;
case 499: sName = "Epic Devastating Critical Lightcrossbow"; break;
                }
            }
        }
    }
else if (nFeat < 750)
    {
    if (nFeat < 550)
        {
        if (nFeat < 510)
            {
            switch (nFeat)
                {
case 500: sName = "Epic Devastating Critical Lightmace"; break;
case 501: sName = "Epic Devastating Critical Morningstar"; break;
case 502: sName = "Epic Devastating Critical Quarterstaff"; break;
case 503: sName = "Epic Devastating Critical Shortspear"; break;
case 504: sName = "Epic Devastating Critical Sickle"; break;
case 505: sName = "Epic Devastating Critical Sling"; break;
case 506: sName = "Epic Devastating Critical Unarmed"; break;
case 507: sName = "Epic Devastating Critical Longbow"; break;
case 508: sName = "Epic Devastating Critical Shortbow"; break;
case 509: sName = "Epic Devastating Critical Shortsword"; break;
                }
            }
        else if (nFeat < 520)
            {
            switch (nFeat)
                {
case 510: sName = "Epic Devastating Critical Rapier"; break;
case 511: sName = "Epic Devastating Critical Scimitar"; break;
case 512: sName = "Epic Devastating Critical Longsword"; break;
case 513: sName = "Epic Devastating Critical Greatsword"; break;
case 514: sName = "Epic Devastating Critical Handaxe"; break;
case 515: sName = "Epic Devastating Critical Throwingaxe"; break;
case 516: sName = "Epic Devastating Critical Battleaxe"; break;
case 517: sName = "Epic Devastating Critical Greataxe"; break;
case 518: sName = "Epic Devastating Critical Halberd"; break;
case 519: sName = "Epic Devastating Critical Lighthammer"; break;
                }
            }
        else if (nFeat < 530)
            {
            switch (nFeat)
                {
case 520: sName = "Epic Devastating Critical Lightflail"; break;
case 521: sName = "Epic Devastating Critical Warhammer"; break;
case 522: sName = "Epic Devastating Critical Heavyflail"; break;
case 523: sName = "Epic Devastating Critical Kama"; break;
case 524: sName = "Epic Devastating Critical Kukri"; break;
case 525: sName = "Epic Devastating Critical Shuriken"; break;
case 526: sName = "Epic Devastating Critical Scythe"; break;
case 527: sName = "Epic Devastating Critical Katana"; break;
case 528: sName = "Epic Devastating Critical Bastardsword"; break;
case 529: sName = "Epic Devastating Critical Diremace"; break;
                }
            }
        else if (nFeat < 540)
            {
            switch (nFeat)
                {
case 530: sName = "Epic Devastating Critical Doubleaxe"; break;
case 531: sName = "Epic Devastating Critical Twobladedsword"; break;
case 532: sName = "Epic Devastating Critical Creature"; break;
case 533: sName = "Epic Energy Resistance Cold 1"; break;
case 534: sName = "Epic Energy Resistance Cold 2"; break;
case 535: sName = "Epic Energy Resistance Cold 3"; break;
case 536: sName = "Epic Energy Resistance Cold 4"; break;
case 537: sName = "Epic Energy Resistance Cold 5"; break;
case 538: sName = "Epic Energy Resistance Cold 6"; break;
case 539: sName = "Epic Energy Resistance Cold 7"; break;
                }
            }
        else //<550
            {
            switch (nFeat)
                {
case 540: sName = "Epic Energy Resistance Cold 8"; break;
case 541: sName = "Epic Energy Resistance Cold 9"; break;
case 542: sName = "Epic Energy Resistance Cold 10"; break;
case 543: sName = "Epic Energy Resistance Acid 1"; break;
case 544: sName = "Epic Energy Resistance Acid 2"; break;
case 545: sName = "Epic Energy Resistance Acid 3"; break;
case 546: sName = "Epic Energy Resistance Acid 4"; break;
case 547: sName = "Epic Energy Resistance Acid 5"; break;
case 548: sName = "Epic Energy Resistance Acid 6"; break;
case 549: sName = "Epic Energy Resistance Acid 7"; break;
                }
            }
        }
    else if (nFeat < 600)
        {
        if (nFeat < 560)
            {
            switch (nFeat)
                {
case 550: sName = "Epic Energy Resistance Acid 8"; break;
case 551: sName = "Epic Energy Resistance Acid 9"; break;
case 552: sName = "Epic Energy Resistance Acid 10"; break;
case 553: sName = "Epic Energy Resistance Fire 1"; break;
case 554: sName = "Epic Energy Resistance Fire 2"; break;
case 555: sName = "Epic Energy Resistance Fire 3"; break;
case 556: sName = "Epic Energy Resistance Fire 4"; break;
case 557: sName = "Epic Energy Resistance Fire 5"; break;
case 558: sName = "Epic Energy Resistance Fire 6"; break;
case 559: sName = "Epic Energy Resistance Fire 7"; break;
                }
            }
        else if (nFeat < 570)
            {
            switch (nFeat)
                {
case 560: sName = "Epic Energy Resistance Fire 8"; break;
case 561: sName = "Epic Energy Resistance Fire 9"; break;
case 562: sName = "Epic Energy Resistance Fire 10"; break;
case 563: sName = "Epic Energy Resistance Electrical 1"; break;
case 564: sName = "Epic Energy Resistance Electrical 2"; break;
case 565: sName = "Epic Energy Resistance Electrical 3"; break;
case 566: sName = "Epic Energy Resistance Electrical 4"; break;
case 567: sName = "Epic Energy Resistance Electrical 5"; break;
case 568: sName = "Epic Energy Resistance Electrical 6"; break;
case 569: sName = "Epic Energy Resistance Electrical 7"; break;
                }
            }
        else if (nFeat < 580)
            {
            switch (nFeat)
                {
case 570: sName = "Epic Energy Resistance Electrical 8"; break;
case 571: sName = "Epic Energy Resistance Electrical 9"; break;
case 572: sName = "Epic Energy Resistance Electrical 10"; break;
case 573: sName = "Epic Energy Resistance Sonic 1"; break;
case 574: sName = "Epic Energy Resistance Sonic 2"; break;
case 575: sName = "Epic Energy Resistance Sonic 3"; break;
case 576: sName = "Epic Energy Resistance Sonic 4"; break;
case 577: sName = "Epic Energy Resistance Sonic 5"; break;
case 578: sName = "Epic Energy Resistance Sonic 6"; break;
case 579: sName = "Epic Energy Resistance Sonic 7"; break;
                }
            }
        else if (nFeat < 590)
            {
            switch (nFeat)
                {
case 580: sName = "Epic Energy Resistance Sonic 8"; break;
case 581: sName = "Epic Energy Resistance Sonic 9"; break;
case 582: sName = "Epic Energy Resistance Sonic 10"; break;
case 583: sName = "Epic Fortitude"; break;
case 584: sName = "Epic Prowess"; break;
case 585: sName = "Epic Reflexes"; break;
case 586: sName = "Epic Reputation"; break;
case 587: sName = "Epic Skill Focus Animal Empathy"; break;
case 588: sName = "Epic Skill Focus Appraise"; break;
case 589: sName = "Epic Skill Focus Concentration"; break;
                }
            }
        else //<600
            {
            switch (nFeat)
                {
case 590: sName = "Epic Skill Focus Craft Trap"; break;
case 591: sName = "Epic Skill Focus Disabletrap"; break;
case 592: sName = "Epic Skill Focus Discipline"; break;
case 593: sName = "Epic Skill Focus Heal"; break;
case 594: sName = "Epic Skill Focus Hide"; break;
case 595: sName = "Epic Skill Focus Listen"; break;
case 596: sName = "Epic Skill Focus Lore"; break;
case 597: sName = "Epic Skill Focus Movesilently"; break;
case 598: sName = "Epic Skill Focus Openlock"; break;
case 599: sName = "Epic Skill Focus Parry"; break;
                }
            }
        }
    else if (nFeat < 650)
        {
        if (nFeat < 610)
            {
            switch (nFeat)
                {
case 600: sName = "Epic Skill Focus Perform"; break;
case 601: sName = "Epic Skill Focus Persuade"; break;
case 602: sName = "Epic Skill Focus Pickpocket"; break;
case 603: sName = "Epic Skill Focus Search"; break;
case 604: sName = "Epic Skill Focus Settrap"; break;
case 605: sName = "Epic Skill Focus Spellcraft"; break;
case 606: sName = "Epic Skill Focus Spot"; break;
case 607: sName = "Epic Skill Focus Taunt"; break;
case 608: sName = "Epic Skill Focus Tumble"; break;
case 609: sName = "Epic Skill Focus Usemagicdevice"; break;
                }
            }
        else if (nFeat < 620)
            {
            switch (nFeat)
                {
case 610: sName = "Epic Spell Focus Abjuration"; break;
case 611: sName = "Epic Spell Focus Conjuration"; break;
case 612: sName = "Epic Spell Focus Divination"; break;
case 613: sName = "Epic Spell Focus Enchantment"; break;
case 614: sName = "Epic Spell Focus Evocation"; break;
case 615: sName = "Epic Spell Focus Illusion"; break;
case 616: sName = "Epic Spell Focus Necromancy"; break;
case 617: sName = "Epic Spell Focus Transmutation"; break;
case 618: sName = "Epic Spell Penetration"; break;
case 619: sName = "Epic Weapon Focus Club"; break;
                }
            }
        else if (nFeat < 630)
            {
            switch (nFeat)
                {
case 620: sName = "Epic Weapon Focus Dagger"; break;
case 621: sName = "Epic Weapon Focus Dart"; break;
case 622: sName = "Epic Weapon Focus Heavycrossbow"; break;
case 623: sName = "Epic Weapon Focus Lightcrossbow"; break;
case 624: sName = "Epic Weapon Focus Lightmace"; break;
case 625: sName = "Epic Weapon Focus Morningstar"; break;
case 626: sName = "Epic Weapon Focus Quarterstaff"; break;
case 627: sName = "Epic Weapon Focus Shortspear"; break;
case 628: sName = "Epic Weapon Focus Sickle"; break;
case 629: sName = "Epic Weapon Focus Sling"; break;
                }
            }
        else if (nFeat < 640)
            {
            switch (nFeat)
                {
case 630: sName = "Epic Weapon Focus Unarmed"; break;
case 631: sName = "Epic Weapon Focus Longbow"; break;
case 632: sName = "Epic Weapon Focus Shortbow"; break;
case 633: sName = "Epic Weapon Focus Shortsword"; break;
case 634: sName = "Epic Weapon Focus Rapier"; break;
case 635: sName = "Epic Weapon Focus Scimitar"; break;
case 636: sName = "Epic Weapon Focus Longsword"; break;
case 637: sName = "Epic Weapon Focus Greatsword"; break;
case 638: sName = "Epic Weapon Focus Handaxe"; break;
case 639: sName = "Epic Weapon Focus Throwingaxe"; break;
                }
            }
        else //<650
            {
            switch (nFeat)
                {
case 640: sName = "Epic Weapon Focus Battleaxe"; break;
case 641: sName = "Epic Weapon Focus Greataxe"; break;
case 642: sName = "Epic Weapon Focus Halberd"; break;
case 643: sName = "Epic Weapon Focus Lighthammer"; break;
case 644: sName = "Epic Weapon Focus Lightflail"; break;
case 645: sName = "Epic Weapon Focus Warhammer"; break;
case 646: sName = "Epic Weapon Focus Heavyflail"; break;
case 647: sName = "Epic Weapon Focus Kama"; break;
case 648: sName = "Epic Weapon Focus Kukri"; break;
case 649: sName = "Epic Weapon Focus Shuriken"; break;
                }
            }
        }
    else if (nFeat < 700)
        {
        if (nFeat < 660)
            {
            switch (nFeat)
                {
case 650: sName = "Epic Weapon Focus Scythe"; break;
case 651: sName = "Epic Weapon Focus Katana"; break;
case 652: sName = "Epic Weapon Focus Bastardsword"; break;
case 653: sName = "Epic Weapon Focus Diremace"; break;
case 654: sName = "Epic Weapon Focus Doubleaxe"; break;
case 655: sName = "Epic Weapon Focus Twobladedsword"; break;
case 656: sName = "Epic Weapon Focus Creature"; break;
case 657: sName = "Epic Weapon Specialization Club"; break;
case 658: sName = "Epic Weapon Specialization Dagger"; break;
case 659: sName = "Epic Weapon Specialization Dart"; break;
                }
            }
        else if (nFeat < 670)
            {
            switch (nFeat)
                {
case 660: sName = "Epic Weapon Specialization Heavycrossbow"; break;
case 661: sName = "Epic Weapon Specialization Lightcrossbow"; break;
case 662: sName = "Epic Weapon Specialization Lightmace"; break;
case 663: sName = "Epic Weapon Specialization Morningstar"; break;
case 664: sName = "Epic Weapon Specialization Quarterstaff"; break;
case 665: sName = "Epic Weapon Specialization Shortspear"; break;
case 666: sName = "Epic Weapon Specialization Sickle"; break;
case 667: sName = "Epic Weapon Specialization Sling"; break;
case 668: sName = "Epic Weapon Specialization Unarmed"; break;
case 669: sName = "Epic Weapon Specialization Longbow"; break;
                }
            }
        else if (nFeat < 680)
            {
            switch (nFeat)
                {
case 670: sName = "Epic Weapon Specialization Shortbow"; break;
case 671: sName = "Epic Weapon Specialization Shortsword"; break;
case 672: sName = "Epic Weapon Specialization Rapier"; break;
case 673: sName = "Epic Weapon Specialization Scimitar"; break;
case 674: sName = "Epic Weapon Specialization Longsword"; break;
case 675: sName = "Epic Weapon Specialization Greatsword"; break;
case 676: sName = "Epic Weapon Specialization Handaxe"; break;
case 677: sName = "Epic Weapon Specialization Throwingaxe"; break;
case 678: sName = "Epic Weapon Specialization Battleaxe"; break;
case 679: sName = "Epic Weapon Specialization Greataxe"; break;
                }
            }
        else if (nFeat < 690)
            {
            switch (nFeat)
                {
case 680: sName = "Epic Weapon Specialization Halberd"; break;
case 681: sName = "Epic Weapon Specialization Lighthammer"; break;
case 682: sName = "Epic Weapon Specialization Lightflail"; break;
case 683: sName = "Epic Weapon Specialization Warhammer"; break;
case 684: sName = "Epic Weapon Specialization Heavyflail"; break;
case 685: sName = "Epic Weapon Specialization Kama"; break;
case 686: sName = "Epic Weapon Specialization Kukri"; break;
case 687: sName = "Epic Weapon Specialization Shuriken"; break;
case 688: sName = "Epic Weapon Specialization Scythe"; break;
case 689: sName = "Epic Weapon Specialization Katana"; break;
                }
            }
        else //<700
            {
            switch (nFeat)
                {
case 690: sName = "Epic Weapon Specialization Bastardsword"; break;
case 691: sName = "Epic Weapon Specialization Diremace"; break;
case 692: sName = "Epic Weapon Specialization Doubleaxe"; break;
case 693: sName = "Epic Weapon Specialization Twobladedsword"; break;
case 694: sName = "Epic Weapon Specialization Creature"; break;
case 695: sName = "Epic Will"; break;
case 696: sName = "Epic Improved Combat Casting"; break;
case 697: sName = "Epic Improved Ki Strike 4"; break;
case 698: sName = "Epic Improved Ki Strike 5"; break;
case 699: sName = "Epic Improved Spell Resistance 1"; break;
                }
            }
        }
    else //<750
        {
        if (nFeat < 710)
            {
            switch (nFeat)
                {
case 700: sName = "Epic Improved Spell Resistance 2"; break;
case 701: sName = "Epic Improved Spell Resistance 3"; break;
case 702: sName = "Epic Improved Spell Resistance 4"; break;
case 703: sName = "Epic Improved Spell Resistance 5"; break;
case 704: sName = "Epic Improved Spell Resistance 6"; break;
case 705: sName = "Epic Improved Spell Resistance 7"; break;
case 706: sName = "Epic Improved Spell Resistance 8"; break;
case 707: sName = "Epic Improved Spell Resistance 9"; break;
case 708: sName = "Epic Improved Spell Resistance 10"; break;
case 709: sName = "Epic Overwhelming Critical Club"; break;
                }
            }
        else if (nFeat < 720)
            {
            switch (nFeat)
                {
case 710: sName = "Epic Overwhelming Critical Dagger"; break;
case 711: sName = "Epic Overwhelming Critical Dart"; break;
case 712: sName = "Epic Overwhelming Critical Heavycrossbow"; break;
case 713: sName = "Epic Overwhelming Critical Lightcrossbow"; break;
case 714: sName = "Epic Overwhelming Critical Lightmace"; break;
case 715: sName = "Epic Overwhelming Critical Morningstar"; break;
case 716: sName = "Epic Overwhelming Critical Quarterstaff"; break;
case 717: sName = "Epic Overwhelming Critical Shortspear"; break;
case 718: sName = "Epic Overwhelming Critical Sickle"; break;
case 719: sName = "Epic Overwhelming Critical Sling"; break;
                }
            }
        else if (nFeat < 730)
            {
            switch (nFeat)
                {
case 720: sName = "Epic Overwhelming Critical Unarmed"; break;
case 721: sName = "Epic Overwhelming Critical Longbow"; break;
case 722: sName = "Epic Overwhelming Critical Shortbow"; break;
case 723: sName = "Epic Overwhelming Critical Shortsword"; break;
case 724: sName = "Epic Overwhelming Critical Rapier"; break;
case 725: sName = "Epic Overwhelming Critical Scimitar"; break;
case 726: sName = "Epic Overwhelming Critical Longsword"; break;
case 727: sName = "Epic Overwhelming Critical Greatsword"; break;
case 728: sName = "Epic Overwhelming Critical Handaxe"; break;
case 729: sName = "Epic Overwhelming Critical Throwingaxe"; break;
                }
            }
        else if (nFeat < 740)
            {
            switch (nFeat)
                {
case 730: sName = "Epic Overwhelming Critical Battleaxe"; break;
case 731: sName = "Epic Overwhelming Critical Greataxe"; break;
case 732: sName = "Epic Overwhelming Critical Halberd"; break;
case 733: sName = "Epic Overwhelming Critical Lighthammer"; break;
case 734: sName = "Epic Overwhelming Critical Lightflail"; break;
case 735: sName = "Epic Overwhelming Critical Warhammer"; break;
case 736: sName = "Epic Overwhelming Critical Heavyflail"; break;
case 737: sName = "Epic Overwhelming Critical Kama"; break;
case 738: sName = "Epic Overwhelming Critical Kukri"; break;
case 739: sName = "Epic Overwhelming Critical Shuriken"; break;
                }
            }
        else //750
            {
            switch (nFeat)
                {
case 740: sName = "Epic Overwhelming Critical Scythe"; break;
case 741: sName = "Epic Overwhelming Critical Katana"; break;
case 742: sName = "Epic Overwhelming Critical Bastardsword"; break;
case 743: sName = "Epic Overwhelming Critical Diremace"; break;
case 744: sName = "Epic Overwhelming Critical Doubleaxe"; break;
case 745: sName = "Epic Overwhelming Critical Twobladedsword"; break;
case 746: sName = "Epic Overwhelming Critical Creature"; break;
case 747: sName = "Epic Perfect Health"; break;
case 748: sName = "Epic Self Concealment 1"; break;
case 749: sName = "Epic Self Concealment 2"; break;
                }
            }
        }
    }
else
    {
    if (nFeat < 800)
        {
        if (nFeat < 760)
            {
            switch (nFeat)
                {
case 750: sName = "Epic Self Concealment 3"; break;
case 751: sName = "Epic Self Concealment 4"; break;
case 752: sName = "Epic Self Concealment 5"; break;
case 753: sName = "Epic Superior Initiative"; break;
case 754: sName = "Epic Toughness 1"; break;
case 755: sName = "Epic Toughness 2"; break;
case 756: sName = "Epic Toughness 3"; break;
case 757: sName = "Epic Toughness 4"; break;
case 758: sName = "Epic Toughness 5"; break;
case 759: sName = "Epic Toughness 6"; break;
                }
            }
        else if (nFeat < 770)
            {
            switch (nFeat)
                {
case 760: sName = "Epic Toughness 7"; break;
case 761: sName = "Epic Toughness 8"; break;
case 762: sName = "Epic Toughness 9"; break;
case 763: sName = "Epic Toughness 10"; break;
case 764: sName = "Epic Great Charisma 1"; break;
case 765: sName = "Epic Great Charisma 2"; break;
case 766: sName = "Epic Great Charisma 3"; break;
case 767: sName = "Epic Great Charisma 4"; break;
case 768: sName = "Epic Great Charisma 5"; break;
case 769: sName = "Epic Great Charisma 6"; break;
                }
            }
        else if (nFeat < 780)
            {
            switch (nFeat)
                {
case 770: sName = "Epic Great Charisma 7"; break;
case 771: sName = "Epic Great Charisma 8"; break;
case 772: sName = "Epic Great Charisma 9"; break;
case 773: sName = "Epic Great Charisma 10"; break;
case 774: sName = "Epic Great Constitution 1"; break;
case 775: sName = "Epic Great Constitution 2"; break;
case 776: sName = "Epic Great Constitution 3"; break;
case 777: sName = "Epic Great Constitution 4"; break;
case 778: sName = "Epic Great Constitution 5"; break;
case 779: sName = "Epic Great Constitution 6"; break;
                }
            }
        else if (nFeat < 790)
            {
            switch (nFeat)
                {
case 780: sName = "Epic Great Constitution 7"; break;
case 781: sName = "Epic Great Constitution 8"; break;
case 782: sName = "Epic Great Constitution 9"; break;
case 783: sName = "Epic Great Constitution 10"; break;
case 784: sName = "Epic Great Dexterity 1"; break;
case 785: sName = "Epic Great Dexterity 2"; break;
case 786: sName = "Epic Great Dexterity 3"; break;
case 787: sName = "Epic Great Dexterity 4"; break;
case 788: sName = "Epic Great Dexterity 5"; break;
case 789: sName = "Epic Great Dexterity 6"; break;
                }
            }
        else //<800
            {
            switch (nFeat)
                {
case 790: sName = "Epic Great Dexterity 7"; break;
case 791: sName = "Epic Great Dexterity 8"; break;
case 792: sName = "Epic Great Dexterity 9"; break;
case 793: sName = "Epic Great Dexterity 10"; break;
case 794: sName = "Epic Great Intelligence 1"; break;
case 795: sName = "Epic Great Intelligence 2"; break;
case 796: sName = "Epic Great Intelligence 3"; break;
case 797: sName = "Epic Great Intelligence 4"; break;
case 798: sName = "Epic Great Intelligence 5"; break;
case 799: sName = "Epic Great Intelligence 6"; break;
                }
            }
        }
    else if (nFeat < 850)
        {
        if (nFeat < 810)
            {
            switch (nFeat)
                {
case 800: sName = "Epic Great Intelligence 7"; break;
case 801: sName = "Epic Great Intelligence 8"; break;
case 802: sName = "Epic Great Intelligence 9"; break;
case 803: sName = "Epic Great Intelligence 10"; break;
case 804: sName = "Epic Great Wisdom 1"; break;
case 805: sName = "Epic Great Wisdom 2"; break;
case 806: sName = "Epic Great Wisdom 3"; break;
case 807: sName = "Epic Great Wisdom 4"; break;
case 808: sName = "Epic Great Wisdom 5"; break;
case 809: sName = "Epic Great Wisdom 6"; break;
                }
            }
        else if (nFeat < 820)
            {
            switch (nFeat)
                {
case 810: sName = "Epic Great Wisdom 7"; break;
case 811: sName = "Epic Great Wisdom 8"; break;
case 812: sName = "Epic Great Wisdom 9"; break;
case 813: sName = "Epic Great Wisdom 10"; break;
case 814: sName = "Epic Great Strength 1"; break;
case 815: sName = "Epic Great Strength 2"; break;
case 816: sName = "Epic Great Strength 3"; break;
case 817: sName = "Epic Great Strength 4"; break;
case 818: sName = "Epic Great Strength 5"; break;
case 819: sName = "Epic Great Strength 6"; break;
                }
            }
        else if (nFeat < 830)
            {
            switch (nFeat)
                {
case 820: sName = "Epic Great Strength 7"; break;
case 821: sName = "Epic Great Strength 8"; break;
case 822: sName = "Epic Great Strength 9"; break;
case 823: sName = "Epic Great Strength 10"; break;
case 824: sName = "Epic Great Smiting 1"; break;
case 825: sName = "Epic Great Smiting 2"; break;
case 826: sName = "Epic Great Smiting 3"; break;
case 827: sName = "Epic Great Smiting 4"; break;
case 828: sName = "Epic Great Smiting 5"; break;
case 829: sName = "Epic Great Smiting 6"; break;
                }
            }
        else if (nFeat < 840)
            {
            switch (nFeat)
                {
case 830: sName = "Epic Great Smiting 7"; break;
case 831: sName = "Epic Great Smiting 8"; break;
case 832: sName = "Epic Great Smiting 9"; break;
case 833: sName = "Epic Great Smiting 10"; break;
case 834: sName = "Epic Improved Sneak Attack 1"; break;
case 835: sName = "Epic Improved Sneak Attack 2"; break;
case 836: sName = "Epic Improved Sneak Attack 3"; break;
case 837: sName = "Epic Improved Sneak Attack 4"; break;
case 838: sName = "Epic Improved Sneak Attack 5"; break;
case 839: sName = "Epic Improved Sneak Attack 6"; break;
                }
            }
        else //<850
            {
            switch (nFeat)
                {
case 840: sName = "Epic Improved Sneak Attack 7"; break;
case 841: sName = "Epic Improved Sneak Attack 8"; break;
case 842: sName = "Epic Improved Sneak Attack 9"; break;
case 843: sName = "Epic Improved Sneak Attack 10"; break;
case 844: sName = "Epic Improved Stunning Fist 1"; break;
case 845: sName = "Epic Improved Stunning Fist 2"; break;
case 846: sName = "Epic Improved Stunning Fist 3"; break;
case 847: sName = "Epic Improved Stunning Fist 4"; break;
case 848: sName = "Epic Improved Stunning Fist 5"; break;
case 849: sName = "Epic Improved Stunning Fist 6"; break;
                }
            }
        }
    else if (nFeat < 900)
        {
        if (nFeat < 860)
            {
            switch (nFeat)
                {
case 850: sName = "Epic Improved Stunning Fist 7"; break;
case 851: sName = "Epic Improved Stunning Fist 8"; break;
case 852: sName = "Epic Improved Stunning Fist 9"; break;
case 853: sName = "Epic Improved Stunning Fist 10"; break;
case 854: sName = "Epic Planar Turning"; break;
case 855: sName = "Epic Bane Of Enemies"; break;
case 856: sName = "Epic Dodge"; break;
case 857: sName = "Epic Automatic Quicken 1"; break;
case 858: sName = "Epic Automatic Quicken 2"; break;
case 859: sName = "Epic Automatic Quicken 3"; break;
                }
            }
        else if (nFeat < 870)
            {
            switch (nFeat)
                {
case 860: sName = "Epic Automatic Silent Spell 1"; break;
case 861: sName = "Epic Automatic Silent Spell 2"; break;
case 862: sName = "Epic Automatic Silent Spell 3"; break;
case 863: sName = "Epic Automatic Still Spell 1"; break;
case 864: sName = "Epic Automatic Still Spell 2"; break;
case 865: sName = "Epic Automatic Still Spell 3"; break;
case 867: sName = "Whirlwind Attack"; break;
case 868: sName = "Improved Whirlwind"; break;
case 869: sName = "Mighty Rage"; break;
                }
            }
        else if (nFeat < 880)
            {
            switch (nFeat)
                {
case 870: sName = "Epic Lasting Inspiration"; break;
case 871: sName = "Curse Song"; break;
case 872: sName = "Wild Shape Undead"; break;
case 873: sName = "Wild Shape Dragon"; break;
case 874: sName = "Epic Spell Mummy Dust"; break;
case 875: sName = "Epic Spell Dragon Knight"; break;
case 876: sName = "Epic Spell Hellball"; break;
case 877: sName = "Epic Spell Mage Armour"; break;
case 878: sName = "Epic Spell Ruin"; break;
case 879: sName = "Weapon Of Choice Sickle"; break;
                }
            }
        else if (nFeat < 890)
            {
            switch (nFeat)
                {
case 880: sName = "Weapon Of Choice Kama"; break;
case 881: sName = "Weapon Of Choice Kukri"; break;
case 882: sName = "Ki Damage"; break;
case 883: sName = "Increase Multiplier"; break;
case 884: sName = "Superior Weapon Focus"; break;
case 885: sName = "Ki Critical"; break;
case 886: sName = "Bone Skin 2"; break;
case 889: sName = "Animate Dead"; break;
                }
            }
        else //<900
            {
            switch (nFeat)
                {
case 890: sName = "Summon Undead"; break;
case 891: sName = "Deathless Vigor"; break;
case 892: sName = "Undead Graft 1"; break;
case 893: sName = "Undead Graft 2"; break;
case 894: sName = "Tough As Bone"; break;
case 895: sName = "Summon Greater Undead"; break;
case 896: sName = "Deathless Mastery"; break;
case 897: sName = "Deathless Master Touch"; break;
case 898: sName = "Greater Wildshape 1"; break;
                }
            }
        }
    else if (nFeat < 950)
        {
        if (nFeat < 910)
            {
            switch (nFeat)
                {
case 900: sName = "Greater Wildshape 2"; break;
case 901: sName = "Greater Wildshape 3"; break;
case 902: sName = "Humanoid Shape"; break;
case 903: sName = "Greater Wildshape 4"; break;
case 904: sName = "Sacred Defense 1"; break;
case 905: sName = "Sacred Defense 2"; break;
case 906: sName = "Sacred Defense 3"; break;
case 907: sName = "Sacred Defense 4"; break;
case 908: sName = "Sacred Defense 5"; break;
case 909: sName = "Divine Wrath"; break;
                }
            }
        else if (nFeat < 920)
            {
            switch (nFeat)
                {
case 910: sName = "Extra Smiting"; break;
case 911: sName = "Skill Focus Craft Armor"; break;
case 912: sName = "Skill Focus Craft Weapon"; break;
case 913: sName = "Epic Skill Focus Craft Armor"; break;
case 914: sName = "Epic Skill Focus Craft Weapon"; break;
case 915: sName = "Skill Focus Bluff"; break;
case 916: sName = "Skill Focus Intimidate"; break;
case 917: sName = "Epic Skill Focus Bluff"; break;
case 918: sName = "Epic Skill Focus Intimidate"; break;
case 919: sName = "Weapon Of Choice Club"; break;
                }
            }
        else if (nFeat < 930)
            {
            switch (nFeat)
                {
case 920: sName = "Weapon Of Choice Dagger"; break;
case 921: sName = "Weapon Of Choice Lightmace"; break;
case 922: sName = "Weapon Of Choice Morningstar"; break;
case 923: sName = "Weapon Of Choice Quarterstaff"; break;
case 924: sName = "Weapon Of Choice Shortspear"; break;
case 925: sName = "Weapon Of Choice Shortsword"; break;
case 926: sName = "Weapon Of Choice Rapier"; break;
case 927: sName = "Weapon Of Choice Scimitar"; break;
case 928: sName = "Weapon Of Choice Longsword"; break;
case 929: sName = "Weapon Of Choice Greatsword"; break;
                }
            }
        else if (nFeat < 940)
            {
            switch (nFeat)
                {
case 930: sName = "Weapon Of Choice Handaxe"; break;
case 931: sName = "Weapon Of Choice Battleaxe"; break;
case 932: sName = "Weapon Of Choice Greataxe"; break;
case 933: sName = "Weapon Of Choice Halberd"; break;
case 934: sName = "Weapon Of Choice Lighthammer"; break;
case 935: sName = "Weapon Of Choice Lightflail"; break;
case 936: sName = "Weapon Of Choice Warhammer"; break;
case 937: sName = "Weapon Of Choice Heavyflail"; break;
case 938: sName = "Weapon Of Choice Scythe"; break;
case 939: sName = "Weapon Of Choice Katana"; break;
                }
            }
        else //<950
            {
            switch (nFeat)
                {
case 940: sName = "Weapon Of Choice Bastardsword"; break;
case 941: sName = "Weapon Of Choice Diremace"; break;
case 942: sName = "Weapon Of Choice Doubleaxe"; break;
case 943: sName = "Weapon Of Choice Twobladedsword"; break;
case 944: sName = "Brew Potion"; break;
case 945: sName = "Scribe Scroll"; break;
case 946: sName = "Craft Wand"; break;
case 947: sName = "Dwarven Defender Defensive Stance"; break;
case 948: sName = "Damage Reduction 6"; break;
case 949: sName = "Prestige Defensive Awareness 1"; break;
                }
            }
        }
    else if (nFeat < 1000)
        {
        if (nFeat < 960)
            {
            switch (nFeat)
                {
case 950: sName = "Prestige Defensive Awareness 2"; break;
case 951: sName = "Prestige Defensive Awareness 3"; break;
case 952: sName = "Weapon Focus Dwaxe"; break;
case 953: sName = "Weapon Specialization Dwaxe"; break;
case 954: sName = "Improved Critical Dwaxe"; break;
case 955: sName = "Epic Devastating Critical Dwaxe"; break;
case 956: sName = "Epic Weapon Focus Dwaxe"; break;
case 957: sName = "Epic Weapon Specialization Dwaxe"; break;
case 958: sName = "Epic Overwhelming Critical Dwaxe"; break;
case 959: sName = "Weapon Of Choice Dwaxe"; break;
                }
            }
        else if (nFeat < 970)
            {
            switch (nFeat)
                {
case 960: sName = "Use Poison"; break;
case 961: sName = "Dragon Armor"; break;
case 962: sName = "Dragon Abilities"; break;
case 963: sName = "Dragon Immune Paralysis"; break;
case 964: sName = "Dragon Immune Fire"; break;
case 965: sName = "Dragon Dis Breath"; break;
case 966: sName = "Epic Fighter"; break;
case 967: sName = "Epic Barbarian"; break;
case 968: sName = "Epic Bard"; break;
case 969: sName = "Epic Cleric"; break;
                }
            }
        else if (nFeat < 980)
            {
            switch (nFeat)
                {
case 970: sName = "Epic Druid"; break;
case 971: sName = "Epic Monk"; break;
case 972: sName = "Epic Paladin"; break;
case 973: sName = "Epic Ranger"; break;
case 974: sName = "Epic Rogue"; break;
case 975: sName = "Epic Sorcerer"; break;
case 976: sName = "Epic Wizard"; break;
case 977: sName = "Epic Arcane Archer"; break;
case 978: sName = "Epic Assassin"; break;
case 979: sName = "Epic Blackguard"; break;
                }
            }
        else if (nFeat < 990)
            {
            switch (nFeat)
                {
case 980: sName = "Epic Shadowdancer"; break;
case 981: sName = "Epic Harper Scout"; break;
case 982: sName = "Epic Divine Champion"; break;
case 983: sName = "Epic Weapon Master"; break;
case 984: sName = "Epic Pale Master"; break;
case 985: sName = "Epic Dwarven Defender"; break;
case 986: sName = "Epic Shifter"; break;
case 987: sName = "Epic Red Dragon Disc"; break;
case 988: sName = "Epic Thundering Rage"; break;
case 989: sName = "Epic Terrifying Rage"; break;
                }
            }
        else //<1000
            {
            switch (nFeat)
                {
case 990: sName = "Epic Spell Epic Warding"; break;
case 991: sName = "Prestige Master Crafter"; break;
case 992: sName = "Prestige Scrounger"; break;
case 993: sName = "Weapon Focus Whip"; break;
case 994: sName = "Weapon Specialization Whip"; break;
case 995: sName = "Improved Critical Whip"; break;
case 996: sName = "Epic Devastating Critical Whip"; break;
case 997: sName = "Epic Weapon Focus Whip"; break;
case 998: sName = "Epic Weapon Specialization Whip"; break;
case 999: sName = "Epic Overwhelming Critical Whip"; break;
                }
            }
        }
    else  //through 1071
        {
        if (nFeat < 1010)
            {
            switch (nFeat)
                {
case 1000: sName = "Weapon Of Choice Whip"; break;
case 1001: sName = "Epic Character"; break;
case 1002: sName = "Epic Epic Shadowlord"; break;
case 1003: sName = "Epic Epic Fiend"; break;
case 1004: sName = "Prestige Death Attack 6"; break;
case 1005: sName = "Prestige Death Attack 7"; break;
case 1006: sName = "Prestige Death Attack 8"; break;
case 1007: sName = "Blackguard Sneak Attack 4d6"; break;
case 1008: sName = "Blackguard Sneak Attack 5d6"; break;
case 1009: sName = "Blackguard Sneak Attack 6d6"; break;
                }
            }
        else if (nFeat < 1020)
            {
            switch (nFeat)
                {
case 1010: sName = "Blackguard Sneak Attack 7d6"; break;
case 1011: sName = "Blackguard Sneak Attack 8d6"; break;
case 1012: sName = "Blackguard Sneak Attack 9d6"; break;
case 1013: sName = "Blackguard Sneak Attack 10d6"; break;
case 1014: sName = "Blackguard Sneak Attack 11d6"; break;
case 1015: sName = "Blackguard Sneak Attack 12d6"; break;
case 1016: sName = "Blackguard Sneak Attack 13d6"; break;
case 1017: sName = "Blackguard Sneak Attack 14d6"; break;
case 1018: sName = "Blackguard Sneak Attack 15d6"; break;
case 1019: sName = "Prestige Death Attack 9"; break;
                }
            }
        else if (nFeat < 1030)
            {
            switch (nFeat)
                {
case 1020: sName = "Prestige Death Attack 10"; break;
case 1021: sName = "Prestige Death Attack 11"; break;
case 1022: sName = "Prestige Death Attack 12"; break;
case 1023: sName = "Prestige Death Attack 13"; break;
case 1024: sName = "Prestige Death Attack 14"; break;
case 1025: sName = "Prestige Death Attack 15"; break;
case 1026: sName = "Prestige Death Attack 16"; break;
case 1027: sName = "Prestige Death Attack 17"; break;
case 1028: sName = "Prestige Death Attack 18"; break;
case 1029: sName = "Prestige Death Attack 19"; break;
                }
            }
        else if (nFeat < 1040)
            {
            switch (nFeat)
                {
case 1030: sName = "Prestige Death Attack 20"; break;
case 1032: sName = "Sneak Attack 11"; break;
case 1033: sName = "Sneak Attack 12"; break;
case 1034: sName = "Sneak Attack 13"; break;
case 1035: sName = "Sneak Attack 14"; break;
case 1036: sName = "Sneak Attack 15"; break;
case 1037: sName = "Sneak Attack 16"; break;
case 1038: sName = "Sneak Attack 17"; break;
case 1039: sName = "Sneak Attack 18"; break;
                }
            }
        else if (nFeat < 1050)
            {
            switch (nFeat)
                {
case 1040: sName = "Sneak Attack 19"; break;
case 1041: sName = "Sneak Attack 20"; break;
case 1042: sName = "Dragon Hdincrease D6"; break;
case 1043: sName = "Dragon Hdincrease D8"; break;
case 1044: sName = "Dragon Hdincrease D10"; break;
case 1045: sName = "Prestige Enchant Arrow 6"; break;
case 1046: sName = "Prestige Enchant Arrow 7"; break;
case 1047: sName = "Prestige Enchant Arrow 8"; break;
case 1048: sName = "Prestige Enchant Arrow 9"; break;
case 1049: sName = "Prestige Enchant Arrow 10"; break;
                }
            }
        else if (nFeat < 1060)
            {
            switch (nFeat)
                {
case 1050: sName = "Prestige Enchant Arrow 11"; break;
case 1051: sName = "Prestige Enchant Arrow 12"; break;
case 1052: sName = "Prestige Enchant Arrow 13"; break;
case 1053: sName = "Prestige Enchant Arrow 14"; break;
case 1054: sName = "Prestige Enchant Arrow 15"; break;
case 1055: sName = "Prestige Enchant Arrow 16"; break;
case 1056: sName = "Prestige Enchant Arrow 17"; break;
case 1057: sName = "Prestige Enchant Arrow 18"; break;
case 1058: sName = "Prestige Enchant Arrow 19"; break;
case 1059: sName = "Prestige Enchant Arrow 20"; break;
                }
            }
        else //through 1071
            {
            switch (nFeat)
                {
case 1060: sName = "Epic Outsider Shape"; break;
case 1061: sName = "Epic Construct Shape"; break;
case 1062: sName = "Epic Shifter Infinite Wildshape 1"; break;
case 1063: sName = "Epic Shifter Infinite Wildshape 2"; break;
case 1064: sName = "Epic Shifter Infinite Wildshape 3"; break;
case 1065: sName = "Epic Shifter Infinite Wildshape 4"; break;
case 1066: sName = "Epic Shifter Infinite Humanoid Shape"; break;
case 1067: sName = "Epic Barbarian Damage Reduction"; break;
case 1068: sName = "Epic Druid Infinite Wildshape"; break;
case 1069: sName = "Epic Druid Infinite Elemental Shape"; break;
case 1070: sName = "Prestige Poison Save Epic"; break;
case 1071: sName = "Epic Superior Weapon Focus"; break;

case 1072: sName = "Weapon Focus Trident"; break;
case 1073: sName = "Weapoon Specialization Trident"; break;
case 1074: sName = "Improved Critical Trident"; break;
case 1075: sName = "Devastating Critical Trident"; break;
case 1076: sName = "Epic Weapon Focus Trident"; break;
case 1077: sName = "Epic Weapon Specialization Trident"; break;
case 1078: sName = "Epic Overwhelming Critical Trident"; break;
case 1079: sName = "Weapon of Choice Trident"; break;
                }
            }
        }
    }
return sName;
}

int GetIsFeatLimitedUses(int nFeat)
{
int nReturn = FALSE;
if (nFeat < 330)
    {
    if (nFeat < 300)
        {
        switch(nFeat)
            {
case 39: nReturn = TRUE; break;
case 199: nReturn = TRUE; break;
case 211: nReturn = TRUE; break;
case 223: nReturn = TRUE; break;
case 257: nReturn = TRUE; break;
case 293: nReturn = TRUE; break;
case 294: nReturn = TRUE; break;
case 296: nReturn = TRUE; break;
case 297: nReturn = TRUE; break;
case 299: nReturn = TRUE; break;
            }
        }
    else
        {
        switch(nFeat)
            {
case 301: nReturn = TRUE; break;
case 302: nReturn = TRUE; break;
case 303: nReturn = TRUE; break;
case 304: nReturn = TRUE; break;
case 305: nReturn = TRUE; break;
case 306: nReturn = TRUE; break;
case 307: nReturn = TRUE; break;
case 308: nReturn = TRUE; break;
case 310: nReturn = TRUE; break;
case 324: nReturn = TRUE; break;
case 326: nReturn = TRUE; break;
case 327: nReturn = TRUE; break;
case 328: nReturn = TRUE; break;
case 329: nReturn = TRUE; break;
            }
        }
    }
else if (nFeat < 400)
    {
    if (nFeat < 360)
        {
        switch(nFeat)
            {
case 330: nReturn = TRUE; break;
case 331: nReturn = TRUE; break;
case 335: nReturn = TRUE; break;
case 336: nReturn = TRUE; break;
case 337: nReturn = TRUE; break;
case 338: nReturn = TRUE; break;
case 339: nReturn = TRUE; break;
case 340: nReturn = TRUE; break;
case 341: nReturn = TRUE; break;
case 342: nReturn = TRUE; break;
case 355: nReturn = TRUE; break;
case 356: nReturn = TRUE; break;
case 357: nReturn = TRUE; break;
case 358: nReturn = TRUE; break;
case 359: nReturn = TRUE; break;
            }
        }
    else
        {
        switch(nFeat)
            {
case 360: nReturn = TRUE; break;
case 361: nReturn = TRUE; break;
case 362: nReturn = TRUE; break;
case 363: nReturn = TRUE; break;
case 364: nReturn = TRUE; break;
case 365: nReturn = TRUE; break;
case 366: nReturn = TRUE; break;
case 367: nReturn = TRUE; break;
case 368: nReturn = TRUE; break;
case 369: nReturn = TRUE; break;
case 370: nReturn = TRUE; break;
case 371: nReturn = TRUE; break;
case 372: nReturn = TRUE; break;
case 373: nReturn = TRUE; break;
            }
        }
    }
else if (nFeat < 500)
    {
    if (nFeat < 460)
        {
        switch(nFeat)
            {
case 434: nReturn = TRUE; break;
case 435: nReturn = TRUE; break;
case 436: nReturn = TRUE; break;
case 438: nReturn = TRUE; break;
case 440: nReturn = TRUE; break;
case 441: nReturn = TRUE; break;
case 442: nReturn = TRUE; break;
case 443: nReturn = TRUE; break;
case 444: nReturn = TRUE; break;
case 450: nReturn = TRUE; break;
case 451: nReturn = TRUE; break;
case 452: nReturn = TRUE; break;
case 453: nReturn = TRUE; break;
case 454: nReturn = TRUE; break;
            }
        }
    else
        {
        switch(nFeat)
            {
case 468: nReturn = TRUE; break;
case 469: nReturn = TRUE; break;
case 470: nReturn = TRUE; break;
case 471: nReturn = TRUE; break;
case 472: nReturn = TRUE; break;
case 474: nReturn = TRUE; break;
case 475: nReturn = TRUE; break;
case 476: nReturn = TRUE; break;
case 477: nReturn = TRUE; break;
case 478: nReturn = TRUE; break;
case 479: nReturn = TRUE; break;
case 491: nReturn = TRUE; break;
            }
        }
    }
else
    {
     if (nFeat < 900)
        {
        switch(nFeat)
            {
case 869: nReturn = TRUE; break;
case 872: nReturn = TRUE; break;
case 873: nReturn = TRUE; break;
case 874: nReturn = TRUE; break;
case 875: nReturn = TRUE; break;
case 876: nReturn = TRUE; break;
case 877: nReturn = TRUE; break;
case 878: nReturn = TRUE; break;
case 882: nReturn = TRUE; break;
case 889: nReturn = TRUE; break;
case 890: nReturn = TRUE; break;
case 892: nReturn = TRUE; break;
case 893: nReturn = TRUE; break;
case 895: nReturn = TRUE; break;
case 897: nReturn = TRUE; break;
case 898: nReturn = TRUE; break;
            }
        }
    else
        {
        switch(nFeat)
            {
case 900: nReturn = TRUE; break;
case 901: nReturn = TRUE; break;
case 902: nReturn = TRUE; break;
case 903: nReturn = TRUE; break;
case 909: nReturn = TRUE; break;
case 947: nReturn = TRUE; break;
case 965: nReturn = TRUE; break;
case 990: nReturn = TRUE; break;
case 1060: nReturn = TRUE; break;
case 1061: nReturn = TRUE; break;
            }
        }
    }
return nReturn;
}



//below used to compile
/*
void main()
{

}
*/
