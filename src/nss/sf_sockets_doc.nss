//::///////////////////////////////////////////////
//:: Scarface's Socketed Items Documentation
//:: V2.5
//:: sf_sockets_doc
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////

/*

    To create a socketed item, simply create an item and give it
    the tag "sf_sockets" (without the quotes of course), go into the
    properties tab and give the item the property:

    "Cast Spell: Unique Power(self)"

    give it unlimited uses/day and then go to the "Descriptions" tab and
    select "Variables" and create a new one like this:

    Name: SOCKET_SLOTS
    Type: int
    Value: 3

    I have just given my socketed item 3 socket slots which will enable
    3 gems to be socketed into it (dependant on how you have the config
    constants set in the inc script.

    To create gems you simply create a new item, use the "Misc Small" or
    soemthing similar but not real gem base item types, because unfortunately,
    real gem type items can not hold item properties i.e. unique power. Give
    the item the property:

    "Cast Spell: Unique Power"

    and give it unlimited uses/day. Now you can set the variables which
    tell the scripts which type of gem is being used, if I wanted for
    example a gem to have the 'feat' called 'Dodge', I would set 2
    variables like this:

    Name: IP_TYPE       Name: IP_SUBTYPE
    Type: int           Type: int
    Value: 12           Value: 4

    As you can see the IP_TYPE for 'feats' is the number '12' in
    the list below, and the IP_SUBTYPE is the feat type which is
    'Dodge' in this example and also the number 4 in the IP_SUBTYPE list.
    No need to add a value for this type of item property, we will go
    through that in the next example :)

    Now lets show an example of when we would need a 'Value'...
    For this example lets take 'Saving Throws', if I wanted for example
    to have a gem that has +5 'Fortitude Saving Throws' on it I would
    set these 3 variables:

    Name: IP_TYPE       Name: IP_SUBTYPE    Name: IP_value
    Type: int           Type: int           Type: int
    Value: 40           Value: 1            Value: 5

    As you can see the IP_TYPE for 'Saving Thows' is the number '40' in
    the list below, and the IP_SUBTYPE is the 'Saving Throw' type which
    is 'Fortitude' in this example and also the number 1 in the IP_SUBTYPE list.
    The value is just the amount of the bonus we want the gem to have,
    in this case it's 5 meaning +5.

    To socket a gem into a socket item, use the gem's unique power and target
    the socket item :) If you use the socket item's unique power, it will
    display the amount of sockets available on that item.

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    IMPORTANT NOTE -  PLEASE READ!!

    The following list of porperties stack but do not need a value:

    Damage Bonus
    Damage Resistance
    Massive Criticals
    Spell Resistance

    These properies will stack each time one is used (If you want to allow
    stacking),  for example, if I used a Acid Damage Bonus gem on my weapon,
    it would add 1d4 Acid, if I added another of the same type it would stack to
    1d6 Acid, for spell resistance stacking it goes 10, 12, 14 up to 32,
    damage resistance will go up 5/-, 10/-, 15/- and so on.

    For 'Keen', 'Hast' and other types of item properties like that, we
    obviously need not bother with IP_SUBTYPE or IP_VALUE as it has neither.

    IMPORTANT NOTE END!!!

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    Item Property Type integers - IP_TYPE

    0  - Ability Bonus
    1  - AC Bonus
    6  - Enhancement Bonus
    12 - Bonus Feat
    13 - Bonus Spell Slot
    15 - Cast Spell
    16 - Damage Bonus
    23 - Damage Resistance
    34 - Extra Ranged Damage
    35 - Haste
    36 - Holy Avenger
    38 - Improved Evasion
    39 - Spell Resistance
    40 - Saving Throws
    43 - Keen
    45 - Mighty
    51 - Regeneration
    52 - Skill Bonus
    56 - Attack Bonus
    61 - Unlimited Ammo
    67 - Vampiric Regeneration
    71 - True Seeing
    74 - Massive Criticals
    75 - Freedom
    82 - On-Hit Cast Spell

    ************************************************************

    Item Property Sub Type integers - IP_SUBTYPE

    Ability Type:

    0 - Strength
    1 - Dexterity
    2 - Constitution
    3 - Intelligence
    4 - Wisdom
    5 - Charisma

    Damage Type:

    0 - Bludgeoning
    1 - Piercing
    2 - Slashing
    5 - Magical
    6 - Acid
    7 - Cold
    8 - Divine
    9 - Electrical
    10 - Fire
    11 - Negative
    12 - Positive
    13 - Sonic

    Feats:

    0  - Alertness
    1  - Ambidextrous
    2  - Cleave
    3  - Combat Casting
    4  - Dodge
    5  - Extra Turning
    6  - Knockdown
    7  - Point Blank
    8  - Spell Focus Abjuration
    9  - Spell Focus Conjuration
    10 - Spell Focus Divination
    11 - Spell Focus Enchantment
    12 - Spell Focus Evocation
    13 - Spell Focus Illusion
    14 - Spell Focus Necromancy
    15 - Spell Penetration
    16 - Power Attack
    17 - Two Weapon Fighting
    18 - Weapon Specialization Un-Armed
    19 - Weapon Finesse
    20 - Impproved Criticals Un-Armed
    21 - Weapon proficiency Exotic
    22 - Weapon proficiency Martial
    23 - Weapon proficiency Simple
    24 - Armour proficiency Heavy
    25 - Armour proficiency Light
    26 - Armour proficiency Medium
    27 - Mobility
    28 - Disarm
    29 - Whirlwind Attack
    30 - Rapid Shot
    31 - Hide In Plain Sight
    32 - Sneak Attack 1d6
    33 - Sneak Attack 2d6
    34 - Sneak Attack 3d6
    35 - Shield proficiency
    36 - Use Poison
    37 - Disarm
    38 - Weapon proficiency Creature
    39 - SneakAttack 5d6

    Saving Throws:

    1 - Fortitude
    2 - Will
    3 - Reflex

    Skill Bonus:

    0  - Animal Empathy
    1  - Concentration
    2  - Disable Trap
    3  - Discipline
    4  - Heal
    5  - Hide
    6  - Listen
    7  - Lore
    8  - Move Silently
    9  - Open Lock
    10 - Parry
    11 - Perform
    12 - Persuade
    13 - Pick Pocket
    14 - Search
    15 - Set Trap
    16 - Spellcraft
    17 - Spot
    18 - Taunt
    19 - Use Magic Device
    20 - Appraise
    21 - Tumble
    22 - Craft Trap
    23 - Bluff
    24 - Intimidate
    25 - Craft Armor
    26 - Craft Weapon

    Bonus Spell Slots:

    1  - Bard
    2  - Cleric
    3  - Druid
    6  - Paladin
    7  - Ranger
    9  - Sorcerer
    10 - Wizard

    Unlimited Ammo:

    1  - Basic
    2  - 1d6 Fire
    3  - 1d6 Cold
    4  - 1d6 Lightning
    11 - Basic +1
    12 - Basic +2
    13 - Basic +3
    14 - Basic +4
    15 - Basic +5

    Cast Spell:

    Too many spells to list, check out the 'iprp_spells.2da'
    files located in with this package for an extensive list.
    The row number is what represents the item property sub
    type (Which is the spell type in this case.)

    On-Hit Cast Spell:

    Too many spells to list, check out the 'iprp_onhitspell.2da'
    files located in with this package for an extensive list.
    The row number is what represents the item property sub type
    (Which is the On-Hit spell type in this case.)


    ************************************************************

    Item Property Value integers - IP_VALUE

    Bonus Spell Slots:

    0 - 9 = Spell Level

    Cast Spell:

    1 - 1 Use Per Day
    2 - 2 Uses Per Day
    3 - 3 Uses Per Day
    4 - 4 Uses Per Day
    5 - 5 Uses Per Day
    6 - Unlimited Uses

    Everything else is 1:1 for example spell level for On-Hit cast spells
    value 1 would mean spell level 1, 5 would mean spell level 5 and so on, the
    same goes for any properties that aren't listed here, Attack Bonus value 3
    would mean +3 and so on.
*/
void main(){}
