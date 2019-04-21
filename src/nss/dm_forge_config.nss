//:: Omega Forge Configuration file
//:: dm_forge_config

/*
    This is the configuration file for the Omega
    Forge. I added this for easy access of the
    system as many builders were having trouble.
    This file holds all the configurable constants
    for the system.
    Please read all instructions for each config
    constant.

    OmegaDM
*/

// !!! If you DO use CEP, uncomment this include     <---- LOOK HERE FIRST !!!
// #include "zep_inc_main"

//:://////////////////////////////////////////////
/*  -CEP switch-

    This switch is for all those builders who
    prefer not to use the CEP in their modules.
    If you use the CEP, set this switch to TRUE...
    If you DO NOT use the CEP, set it to FALSE.
    Default is FALSE
*/////////////////////////////////////////////////
    const int USE_CEP = FALSE;
//:://////////////////////////////////////////////


//::///////////////////////////////////////////////
/*  -Maximum mods per item constant-

    No item can be forged with more than this num
    of item properties.
    Set the value below to your desired maximum
    enhancements on any given item, default is 8
*//////////////////////////////////////////////////
    const int FORGE_MAX_ENHANCEMENTS = 8;
//::///////////////////////////////////////////////


//::///////////////////////////////////////////////
/*  -Payment Method constant -

    This is used to determine whether you want PCs
    to pay for their forging with gold, tokens, or
    both.
    If set to 1, PCs will only need gold to pay;
    if 2, then tokens will be needed for payment;
    and if set to 3, then a PC will need both gold
    and forge tokens to pay.

    NOTE: All pricing constants below will function
    with either setting!

    A big thanks to Scarface for the original addition.

    Acceptable settings:  Gold only = 1  <-- default
                        Tokens only = 2
                 Both gold & tokens = 3
*//////////////////////////////////////////////////
    const int PAYMENT_METHOD = 1;
//::///////////////////////////////////////////////


//::///////////////////////////////////////////////
/*  -Token value constant-

    If using tokens for payment (payment constant
    is set to 2 or 3), then this sets the value in
    gp per token for the forge. Default is 15000gp
    per token. The lower you set this, the more tokens
    it will take to add each modification.

    NOTE: this is only used if PAYMENT_METHOD is set to
        2 or 3; otherwise the below constant CASH_COST_
        MULTIPLIER is used instead.
*//////////////////////////////////////////////////
    const int FORGE_TOKEN_VALUE = 15000;
//::///////////////////////////////////////////////


//:://////////////////////////////////////////////
/*  -Gold cost multiplier-

    This constant controls how expensive forging
    will be if using the the Gold payment method.
    The multiplier is the amount the final cost
    is raised by.
    For example; a mundane longsword forged to a
    +1 longsword is a difference of 1,618 gp. So
    if this constant is set to 1.0, then that is
    the cost to the player. If set to 5, then this
    same mod would cost the player 8,090, or 5x the
    difference.
    Default is 5.0

     Addition by Scarface (To make life easier)
*/////////////////////////////////////////////////
    const float CASH_COST_MULTIPLIER = 4.0;
//:://////////////////////////////////////////////


//::///////////////////////////////////////////////
/*  -Epic Cost Variant-

    For those of you whom think epic should have
    godly costs...

    This is used to up the costs of any Epic level
    item, making epic items much more expensive to
    forge.

    Epic items are defined by gold values below;
    for example- any item worth more than L_20 below
    after forging, is considered an epic item.

    This is a float representing a percentage increase
    of total price as such:

    3.00 = 300% or x3 cost
    2.00 = 200% or x2 cost
    1.50 = 150% or +50% more
    1.10 = 110% or +10% more
    1.00 = 100% costs :: choose this to disable feature

    NOTE: this does have effect on costs even if
    using tokens as payment!

    default is 1.00 (no epic increase)
*//////////////////////////////////////////////////
    const float EPIC_COST_VAR = 1.00;
//::///////////////////////////////////////////////


//:://////////////////////////////////////////////
/*  -IP Removal Variant-

    This constant is the float multiplied to the
    costs of removing IPs from items. It basically
    works like the GOLD_COST_MULTIPLIER constant
    above, but can be set less than one for a decrease
    in price, as follows:

    5.00 = 5x the costs
    1.00 = even costs : equal to the difference of
                        the original item, and its
                        modified version
    0.50 = 1/2 the costs
    0.10 = 1/10th or 10% the costs

    NOTE: this does have effect on costs even if
    using tokens as payment!

    default is 0.10 (10%)
*/////////////////////////////////////////////////
    const float PROPERTY_REMOVAL_VAR = 0.10;
//:://////////////////////////////////////////////


//:://////////////////////////////////////////////
/*  -Visual Cost constants-

    These are the costs of the visual effects IPs.
    Very simply put, you only need set one, which-
    ever payment method your using. Since adding
    visual effects like flaming to weapons have no
    change in price, we have to set it ourselves.
    Make them whatever you want, just remember,
    visual effects are harmless, and don't give the
    player any more power.... they're just pretty :)

    defaults are 5 and 500.
*//////////////////////////////////////////////////
    const int VISUAL_TOKEN_VALUE = 5;
    const int VISUAL_GOLD_VALUE = 2000;
//::///////////////////////////////////////////////


//::///////////////////////////////////////////////
/*  -PLOT UNFORGEABLE token-

    This is a simple switch that when set to TRUE,
    will make any item marked as plot, unforgeable.
    This is great if you want to make a specific
    story item unforgeable to keep to storylines.

    default is TRUE.
*/////////////////////////////////////////////////
    const int PLOT_UNFORGEABLE = TRUE;
//:://////////////////////////////////////////////


//:://////////////////////////////////////////////
/*  -Spell Level Limitations-

    This switch tells the engine whether to restrict
    spell levels according to the PCs level. It uses
    the equivalent caster level needed in a general
    case.
    example- a wizard needs to be 5th level to cast
    fireball, ergo, any if TRUE, any PC will need to
    be 5th level to forge the spell fireball onto the
    item.

    default is FALSE;
*/////////////////////////////////////////////////
    const int LIMIT_SPELL_LEVEL = TRUE;
//:://////////////////////////////////////////////

//:://////////////////////////////////////////////
/*  -Unlimited Spell Uses Allowed-

    Simply put, setting this one to TRUE will allow
    PCs to mod an item with unlimited uses per day.
    If FALSE, that option will not be available;
    a max of 5 uses/day will be all thats available.

    default is FALSE;
*/////////////////////////////////////////////////
    const int UNLIMITED_USES_ALLOWED = FALSE;
//:://////////////////////////////////////////////


//:://////////////////////////////////////////////
/*  -Allow Time Stop-

    This was added for those PWs that do not like
    having time stop. Many a server have disabled
    it, therefore I've added this switch for the
    forge.

    TRUE = allowed (will show up in forge options)
    FALSE = not allowed; default
*/////////////////////////////////////////////////
    const int ALLOW_TIME_STOP = FALSE;
//:://////////////////////////////////////////////


//:://////////////////////////////////////////////
/*  -Item Level by gold value constants-

    These constants are the values in gold pieces
    in which the system uses to determine level.
    Default values are biowares, so as is, these
    will work with biowares ILR engine.
    If your mod uses a custom ILR script, you will
    need to use those values here for each level;
    NOTE: if your mod (or PW) doesn't use any
    ILR (item level restrictions) then just leave
    these constants as is to determine level.
*/////////////////////////////////////////////////

    // non epic levels
    const int L_01  = 1000;
    const int L_02  = 1500;
    const int L_03  = 2500;
    const int L_04  = 3500;
    const int L_05  = 5000;
    const int L_06  = 6500;
    const int L_07  = 9000;
    const int L_08  = 12000;
    const int L_09  = 15000;
    const int L_10  = 19500;

    const int L_11  = 25000;
    const int L_12  = 30000;
    const int L_13  = 35000;
    const int L_14  = 40000;
    const int L_15  = 50000;
    const int L_16  = 65000;
    const int L_17  = 75000;
    const int L_18  = 90000;
    const int L_19  = 110000;
    const int L_20  = 130000;

    // epic levels
    const int L_21  = 250000;
    const int L_22  = 500000;
    const int L_23  = 750000;
    const int L_24  = 1000000;
    const int L_25  = 1200000;
    const int L_26  = 1400000;
    const int L_27  = 1600000;
    const int L_28  = 1800000;
    const int L_29  = 2000000;
    const int L_30  = 2200000;

    const int L_31  = 2400000;
    const int L_32  = 2600000;
    const int L_33  = 2800000;
    const int L_34  = 3000000;
    const int L_35  = 3200000;
    const int L_36  = 3400000;
    const int L_37  = 3600000;
    const int L_38  = 3800000;
    const int L_39  = 4000000;
    const int L_40  = 4200000;

    // Legendary Levels
    const int L_41  = 4400000;
    const int L_42  = 4600000;
    const int L_43  = 4800000;
    const int L_44  = 5000000;
    const int L_45  = 5200000;
    const int L_46  = 5400000;
    const int L_47  = 5600000;
    const int L_48  = 5800000;
    const int L_49  = 6000000;
    const int L_50  = 6200000;

    const int L_51  = 6400000;
    const int L_52  = 6600000;
    const int L_53  = 6800000;
    const int L_54  = 7000000;
    const int L_55  = 7200000;
    const int L_56  = 7400000;
    const int L_57  = 7600000;
    const int L_58  = 7800000;
    const int L_59  = 8000000;
    const int L_60  = 8200000;

//:://////////////////////////////////////////////
/*  -DO NOT change this constant for any reason.
    It is for internal use only.
*/////////////////////////////////////////////////
    const int L_ANY = 2147483647;
//:://////////////////////////////////////////////


//:://////////////////////////////////////////////
/*  -Item's max level-

    This constant is just that, the max level an
    item can be before the Smiths can no longer
    forge it. Simply use the "Item Level by Gold
    Constants" above to choose the highest level
    any forged item can be, or made to be.
    To disable this, use the L_ANY constant.

    Default = L_ANY (disabled)
*/////////////////////////////////////////////////
    const int ITEM_MAX_LVL = L_ANY;
//:://////////////////////////////////////////////
