// This lists all of the constant ints that are to be used for LL

const int DEBUG = TRUE;//set this to TRUE to enable debugging

const int DEV_CRIT_DISABLED = FALSE;//set this to TRUE to disable devastating critical feat selection on levelup

//This is the tag of the item where the players legendary level is stored it needs to be placed on an item that
//will always be on the player
const string plotItemTag = "hgll_check_level";

//this will be used to determine the max level players can reach it is not used
//const int maxLevel = 60;

// Experience Requirements for Legendary Levels
// Adjust as desired. These were set by increasing the additional amount required for the
// previous level by 25%. Level 40 required 39000 experience points, so Level 41 was set
// to require 39000 x 1.25 = 48800 experience points. This will be ALOT on some worlds,
// and not enough on others, so adjust to suit your needs.
const int BASE_XP_LVL_40 = 780000; //780000
const int XP_REQ_LVL41 = 828800;    //48800
const int XP_REQ_LVL42 = 889700;    //60900
const int XP_REQ_LVL43 = 965900;    //76200
const int XP_REQ_LVL44 = 1061100;    //95200
const int XP_REQ_LVL45 = 1180100;   //119000
const int XP_REQ_LVL46 = 1328900;   //148800
const int XP_REQ_LVL47 = 1514900;   //186000
const int XP_REQ_LVL48 = 1747400;   //232500
const int XP_REQ_LVL49 = 2038000;   //290600
const int XP_REQ_LVL50 = 2401200;   //363200
const int XP_REQ_LVL51 = 2855200;   //454000
const int XP_REQ_LVL52 = 3422700;   //567500
const int XP_REQ_LVL53 = 4132100;   //709400
const int XP_REQ_LVL54 = 5018900;   //886800
const int XP_REQ_LVL55 = 6127300;  //1108400
const int XP_REQ_LVL56 = 7512900;  //1385600
const int XP_REQ_LVL57 = 9244800;  //1731900
const int XP_REQ_LVL58 = 11409700;  //2164900
const int XP_REQ_LVL59 = 14115900;  //2706200
const int XP_REQ_LVL60 = 17498600;  //3382700
