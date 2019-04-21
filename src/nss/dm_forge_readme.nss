/*
ReadMe - OMEGA FORGE  v2.3


******************************
* Installation Instructions *
******************************

1. Import the erf

2. Ignore the missing files "dm_inc_forge.ncs" and "dm_forge_config"
    and "dm_forge_readme"- These files are includes

3. In previous versions, we've had a function called SetupForgeTokens()
    in our onload event. As of v2.3, this is no longer needed. You  should
    remove this function from your onload event after importing.

4. Set up a door transition for players to enter the forge area

5. Open the file - "dm_forge_config"

    This is the configuration file where you can tweek the system
    to your liking.

    cep) The first thing you need to do is tell the system whether your
        using the CEP or not. If you ARE using the CEP do the following:
        - uncomment the include line for zep_inc_main.
        - set the USE_CEP constant to TRUE.
      If your are NOT using the CEP, do nothing as the defaults are
      NO cep

    - the first constant is FORGE_MAX_ENHANCEMENTS. This is the
        max number of item properties an item can have before
        you can no longer forge it. Default is 8, but you can set
        this as high or low as you want. Be warned, once an item
        has this many, regardless of if they all were forged or
        prebuilt, it can no longer be forged with any more.

    - next is PAYMENT_METHOD. this one has been changed to an integer,
        meaning it can only be set to any whole number. If set to 1,
        then players will only need gold as payment for forging. If set
        to 2, then players will need tokens (included with download)
        You will need to dispurse these tokens for players if not using
        gold. If you set this constant to 3, then PCs will need both gold
        and tokens for payment of forging.
        Please keep in mind that this must be set to either 1,2,or 3.

    - next is FORGE_TOKEN_VALUE. This is only used if PAYMENT_METHOD
        is 2 or 3. This tells the system how much each token will be
        worth in gp for forging. Default is 15,000. Setting this lower
        will make each mod cost MORE tokens, raising it will lower the
        amount of tokens needed per mod.

    - the next one is CASH_COST_MULTIPLIER, which is a float rather
        than an int. This one is only used if PAYMENT_METHOD_GOLD is
        TRUE. This constant is multiplied against the gold cost of the
        mod to make it more expensive to forge items. Default is 10, so
        if forging a mundane longsword (worth 30gp)and adding the +1
        enhancement property (making it worth 1,648) then the cost in
        gold by default would be 16,480gp.
        This can be set as high as you want to make forging more
        expensive, or as low as 0.1; which would make the above example
        cost 1/10, or 165gp.

    - this one is used only if using gold as payment. EPIC_COST_VAR.
        It is a float that is multiplied against the ending balance
        "IF" the item's level after forging will be epic. So if you
        would like an increase of double costs for epic items, you'd
        make this float 2.00

    - next is the PROPERTY_REMOVAL_VAR, which is also a float. This is
        used in conjunction with removing IPs from items. Setting this
        below 1.00 will cause a very low cost to the remove each property,
        setting it higher than 1.00, it acts as a multiplier just like
        the CASH_COST_MULTIPLIER.
        default is 1.00  equal costs (disabled)

    - next is a set for visual effects costs. In previous version, the costs
        of visuals was preset by me, now, you choose how much you want them
        to cost the player. There are two settings, one for gold, one for
        tokens. You need to set the one of the method your using :)
        (the reasoning for this is that visuals have no real price increase
        to measure costs, so we have to pick one ourselves)

    - next is new with v2.3: the PLOT_UNFORGEABLE switch. This is a boolean
        integer so you can set it to TRUE (on) or FALSE (off). If set to TRUE
        (on), the any item with the plot flag checked, will be unforgeable.
        This is good for those of you who have storyline weapons equivalent
        to say excalibur, or ragnarok, and don't want PCs changing it.
        It is controlled by an ondisturb script connected to the forges.

    - next is another new addition in v2.3 that came with the new Cast-Spell
        IPs system. LIMIT_SPELL_LEVEL is another boolean integer switch to be
        turned on or off. If set to TRUE, then a PC will only be able to enchant
        an item with a spell equal in level as if a wiz or cle of the PCs level
        could cast. With me so far...? Ok, some examples :)

        magic missles = 1st level spell castable by a 1st level wizard > so
            a 1st level PC could enchant an item with it.
        fireball = 3rd level spell castable by a 5th level wizard > so a 5th
            level PC would be needed to enchant it onto an item.
        implosion = 9th level spell castable by a 17th level cleric > so a 17th
            level PC would be needed to enchant this spell onto an item.

        Should you turn this off (FALSE), anyone with enough payment could
        enchant an item with ANY spell.

    - next is another new switch UNLIMITED_USES_ALLOWED. Simply put, making this
        TRUE will allow PCs to add spells with unlimited uses/day. FALSE disables
        this option from appearing. default is FALSE (disabled)

    - a final addition in v2.3 is the ALLOW_TIME_STOP switch. Not every PW
        (including my own) likes allowing this spell, therefore I've added this
        switch to disable its availability as well. TRUE makes it available, FALSE
        disables the option. default is FALSE.

    - the next is a set of constants called -Item Level by gold value
        constants-  These are the values in gold for which an item's
        level is measured. Choose a value in gold pieces for each level
        from 1st thru 60th. There are three rules for these;
            1- the values must be ascending starting from L_01
            2- no value can be larger than the L_ANY constant
            3- DO NOT, under any circumstance raise or change the L_ANY
                constant (this is the highest signed integer that can be used
                 in nwscript)
        These are defaulted to bioware's values, so if you use the default
        ILR rules, then just leave these be.

    - the last one is the -item's max level- constant. This one works off
        the previous levels constants. To further limit the power of
        items by level, simply use one of the constants from the -Item's
        level by gold value constants-
        Default is L_ANY which is 2,147,483,647. DO NOT raise this number,
        it is the highest signed integer in nwscript.

    last) Save and close the script. Do not compile it, it is an include
        and will not compile.

6. Build your module! This is very important, most first time users
    forget this part and then write me asking why their changes do not
    work.    You must do a module build to recompile all the systems
    scripts correctly!

7. Save your module and enjoy.


******************************
*      Implementation        *
******************************

The system is conversation driven, and uses int to identify the item
property being added. It also uses the IPSafeAddItemProperty() function
with the ...REPLACE_EXISTING_PROPERTY... constant. Meaning, if a player
adds bonus fire damage 1d6, then later decides he wants more fire damage,
and adds bonus fire damage 1d10, this function will replace the existing
fire damage with the new value. This will NOT replace one damage with
another if the damage subtype is different, so you could have a weapon
that has fire 1d6, cold 1d10, acid 2d6 on it at one time, same with
skills, and all the others.

Lastly, the tokens themselves are stackable bullet items, and only
usable by outsiders, so unless you allow you PCs to change their race
to outsider, they won't be firing their precious forge tokens at enemies
...  hehe :p


******************************
*    Contents Location       *
******************************

The erf will import the following custom files to the mod.

 » Creatures «

• Larry · TAG "omegasmith01"    » Creatures(custom) > NPCs > Others
• Moe   · TAG "omegasmith02"    » Creatures(custom) > NPCs > Others
• Curly · TAG "omegasmith03"    » Creatures(custom) > NPCs > Others
• Joe   · TAG "omegasmith4"     » Creatures(custom) > NPCs > Others
• Shemp · TAG "omegasmith5"     » Creatures(custom) > NPCs > Others

 » Items «

• Forge Token   · TAG "dm_ftoken" » Items(custom) > Plot Item

 » Placeables «

• Omega Forge (left)    · TAG "omegaforge1"
• Omega Forge (center)  · TAG "omegaforge2"
• Omega Forge (right)   · TAG "omegaforge3"
• Anvil (1st)           · TAG "omegaanvil1"
• Anvil (2nd)           · TAG "omegaanvil2"
• Anvil (3rd)           · TAG "omegaanvil3"
• Omega Chest           · TAG "omegaforge4"
• Anvil (4th)           · TAG "omegaanvil4"
• Omega Pool            · TAG "omegaforge5"
• Anvil (5th)           · TAG "omegaanvil5"

All placeables are found here:
» Placeables(custom) > Special > Custom 1

 » Area «

• Omega Forge   · TAG "omegaforge"
» Dungeon tileset: has one doorway for transitions


******************************
*          Support           *
******************************

Please send any questions, comments/suggestions, or bug reports to:

eckerj@sbcglobal.net

NOTE: If you change ANY scripts other than the config file, please
don't send me "bug reports". This will be considered unsupported.


*****************
* RELEASE NOTES *
*****************

    BETA v0.1

•First wrote

    BETA v0.5

•Fixed bug where it wasn't replacing existing same type properties.
    Thanks to Thales Darkshine and SunJammer for their assistance on this.
•Public Release

    BETA v0.7

•Fixed bug where a PC was still charged for adding an item property
    that would decrease an existing property.
•Fixed bug where visual effects were being added for free


    BETA v0.9

•Changed conversation flow near end to allow faster upgrading
•Fixed calculation bug that was charging PCs for decreasing an
    itemproperty's bonus (again)
•Adjusted calculations of mod cost to use floats rather than int's
    for more accurate math; system compares the floats before
    converting it to int for final cost
•Rewrote most custom functions to use base 10 division and modulos
    remainders; Though not very noticeable, this should be more
    performance friendly for online play (plus it shortened the include
    by about 450 lines of code or so, hehe)


    v1.0

•Added constant int toggle to choose whether gold or tokens are used
    as payment
•Full release

    v1.1

•Added CASH_COST_MULTIPLIER constant float for better price control
    when using gold.
•Fixed exploit of free modifying; exact details will be held until
    confirmation of fix.
•Fix issue with gloves and enhancement bonuses; they don't except them.
•Added Attack Bonus modification for gloves in particular; and other
    weapons if PC so wishes.
  -Thanks to scarface for his catch of free modifying; and his addition
    of the gold cost multiplier constant float.

    v1.2

•Fixed bug with custom tokens being overwritten if two players where
    forging at exact same time.
•Added three conditional scripts for above bug.
•Added new function for Cost custom tokens in convo. Make sure to add
    this to the onload event of your module
•Added compatability for CEP melee weapons

    v2.0
• Added new config script
• Added new switch to choose whether or not to use the CEP
• Added custom token in convo telling what the items new level will be
• Added customizable ILR chart to measure items levels

    v2.1
• Added fix to PAYMENT_METHOD_GOLD not charging for mods.
    thanks to scarface for this fix
• Added new ability - Regenerate to forge options. This can be added
    to most items, not weapons though
• general maintenence of some functions

    v2.2
- Added removal feature to ILR Chest
- Added EPIC_COST_VAR to increase costs of epic forged items
- Added PROPERTY_REMOVAL_VAR for use in removing IPs costs

    v2.3
- Fixed major bug/exploit that appeared in multiplayer
- Added 3rd payment option. Now you can charge a player both gold and tokens.
- Added switch to disallow forging of plot marked items
- Removed the setupforgetokens() function from system as its no longer needed
- Added 5th smith,(Shemp) Cast-spell IPs are now apart of the Omega Forge.
   FINALLY!
    Now forge your own wands, staves, or even add spells onto armor or rings.
- Added Mighty to forge options. Can be added to ranged weapons.
- Added Feat, Skill, and Cast-Spell removal features.
- Added switch to disallow Time Stop availability




*****************
*    CREDITS    *
*****************

A special thanks to the following for their help and additions to this
system:

    Scarface - for the additions of the gold vs token toggle allowing a
builder to decide whether payment should be tokens, or gold; and for reporting
many major exploits of the OmegaForge project.
    Darkshine and SunJammer - for their assistance in debugging the
replace existing properties feature, and timing of costs thereof.
    Realms of Netheria PW creator (Phunic) and staff - for being the first to
use/test (try to break) the forge during beta testing of the system.


*** I hope you enjoy it! ***
OmegaDM (Zdm)
