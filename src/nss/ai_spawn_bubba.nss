//::///////////////////////////////////////////////
//:: Name ai_spawn_bubba
//:: Copyright (c) 2018  ACN
//:://////////////////////////////////////////////
/*
    Bubba (Jail) Spawn script
*/
//:://///////////////////////////////
/////////////
//:: Created By: Milliorn
//:: Created On: May 13, 2018
//:://////////////////////////////////////////////

void main()
{
    int iRoll = Random(38) +1;
    int iSpeak = Random(94) +1;
    float fSpeed = IntToFloat(d4());

    ExecuteScript("x2_def_spawn", OBJECT_SELF);

    switch (iSpeak)
    {
        case 1: SpeakString("I will beat the feathers off of your cock!");break;
        case 2: SpeakString("I'm a felcher!");break;
        case 3: SpeakString("I'm going to butter your bread!");break;
        case 4: SpeakString("I'm scared, its my first time...");break;
        case 5: SpeakString("Show me your moose knuckle");break;
        case 6: SpeakString("It's gaping time!");break;
        case 7: SpeakString("Let me touch your cornhole!");break;
        case 8: SpeakString("I toss salad.");break;
        case 9: SpeakString("Gonna tease your bean-flicker!");break;
        case 10: SpeakString("I'm gonna lick your carpet clean!");break;
        case 11: SpeakString("Bumhole diving time!");break;
        case 12: SpeakString("Are you a kitty or a donut puncher?");break;
        case 13: SpeakString("You need a golden shower");break;
        case 14: SpeakString("Your my new Prison bitch mate!");break;
        case 15: SpeakString("What class are you, Anal Assassin?");break;
        case 16: SpeakString("Be my arse-bandit!");break;
        case 17: SpeakString("Syphilis ate my brain.");break;
        case 18: SpeakString("I'm your back-door bandit!");break;
        case 19: SpeakString("Let's go bum-drilling together!");break;
        case 20: SpeakString("Oh! It BURNS when I urinate!");break;
        case 21: SpeakString("I have a Masters in Bumhole Engineering!");break;
        case 22: SpeakString("You look like a butt-rustler.");break;
        case 23: SpeakString("Change my diaper");break;
        case 24: SpeakString("It's your lucky day, I'm a gay pornstar!");break;
        case 25: SpeakString("Are you a Cockstruction worker?");break;
        case 26: SpeakString("Show me your moon you cockpipe cosmonaut!");break;
        case 27: SpeakString("I heard you are a cock-jockey?");break;
        case 28: SpeakString("I'm an internet predator.");break;
        case 29: SpeakString("Do you want a Dirty Sanchez!");break;
        case 30: SpeakString("I'm gonna glaze your donut hole");break;
        case 31: SpeakString("You look like a fruity fairy!");break;
        case 32: SpeakString("Eat my fudge and like it!");break;
        case 33: SpeakString("Wanna play some Knob Hockey?");break;
        case 34: SpeakString("Are you from Oklahomo?");break;
        case 35: SpeakString("Come here you pillow-biter!");break;
        case 36: SpeakString("Are you hungry for this sausage jockey?");break;
        case 37: SpeakString("I'll be your hershey-stabber!");break;
        case 38: SpeakString("Come here twinky!");break;
        case 39: SpeakString("Eat my Meat-Curtains!");break;
        case 40: SpeakString("Your gonna like this Cleveland Steamer");break;
        case 41: SpeakString("Come here sheep-shagger!");break;
        case 42: SpeakString("Weapon-Master means Sword-Swallowers");break;
        case 43: SpeakString("Come give me a legendary salad tossing!");break;
        case 44: SpeakString("My Dingleberries are good for you!");break;
        case 45: SpeakString("Swab my poop-deck matey!");break;
        case 46: PlayVoiceChat(VOICE_CHAT_NO);break;
        case 47: PlayVoiceChat(VOICE_CHAT_NEARDEATH);break;
        case 48: PlayVoiceChat(VOICE_CHAT_MOVEOVER);break;
        case 49: PlayVoiceChat(VOICE_CHAT_LOOKHERE);break;
        case 50: PlayVoiceChat(VOICE_CHAT_LAUGH);break;
        case 51: PlayVoiceChat(VOICE_CHAT_HOLD);break;
        case 52: PlayVoiceChat(VOICE_CHAT_HIDE);break;
        case 53: PlayVoiceChat(VOICE_CHAT_HELP);break;
        case 54: PlayVoiceChat(VOICE_CHAT_HELLO);break;
        case 55: PlayVoiceChat(VOICE_CHAT_HEALME);break;
        case 56: PlayVoiceChat(VOICE_CHAT_GUARDME);break;
        case 57: PlayVoiceChat(VOICE_CHAT_GROUP);break;
        case 58: PlayVoiceChat(VOICE_CHAT_GOODIDEA);break;
        case 59: PlayVoiceChat(VOICE_CHAT_GOODBYE);break;
        case 60: PlayVoiceChat(VOICE_CHAT_GATTACK3);break;
        case 61: PlayVoiceChat(VOICE_CHAT_GATTACK2);break;
        case 62: PlayVoiceChat(VOICE_CHAT_GATTACK1);break;
        case 63: PlayVoiceChat(VOICE_CHAT_FOLLOWME);break;
        case 64: PlayVoiceChat(VOICE_CHAT_FLEE);break;
        case 65: PlayVoiceChat(VOICE_CHAT_ENEMIES);break;
        case 66: PlayVoiceChat(VOICE_CHAT_ENCUMBERED);break;
        case 67: PlayVoiceChat(VOICE_CHAT_DEATH);break;
        case 68: PlayVoiceChat(VOICE_CHAT_CUSS);break;
        case 69: PlayVoiceChat(VOICE_CHAT_CHEER);break;
        case 70: PlayVoiceChat(VOICE_CHAT_CANTDO);break;
        case 71: PlayVoiceChat(VOICE_CHAT_CANDO);break;
        case 72: PlayVoiceChat(VOICE_CHAT_BORED);break;
        case 73: PlayVoiceChat(VOICE_CHAT_BATTLECRY3);break;
        case 74: PlayVoiceChat(VOICE_CHAT_BATTLECRY2);break;
        case 75: PlayVoiceChat(VOICE_CHAT_BATTLECRY1);break;
        case 76: PlayVoiceChat(VOICE_CHAT_BADIDEA);break;
        case 77: PlayVoiceChat(VOICE_CHAT_ATTACK);break;
        case 78: PlayVoiceChat(VOICE_CHAT_PAIN1);break;
        case 79: PlayVoiceChat(VOICE_CHAT_PAIN2);break;
        case 80: PlayVoiceChat(VOICE_CHAT_PAIN3);break;
        case 81: PlayVoiceChat(VOICE_CHAT_PICKLOCK);break;
        case 82: PlayVoiceChat(VOICE_CHAT_POISONED);break;
        case 83: PlayVoiceChat(VOICE_CHAT_REST);break;
        case 84: PlayVoiceChat(VOICE_CHAT_SEARCH);break;
        case 85: PlayVoiceChat(VOICE_CHAT_SELECTED);break;
        case 86: PlayVoiceChat(VOICE_CHAT_SPELLFAILED);break;
        case 87: PlayVoiceChat(VOICE_CHAT_STOP);break;
        case 88: PlayVoiceChat(VOICE_CHAT_TALKTOME);break;
        case 89: PlayVoiceChat(VOICE_CHAT_TASKCOMPLETE);break;
        case 90: PlayVoiceChat(VOICE_CHAT_TAUNT);break;
        case 91: PlayVoiceChat(VOICE_CHAT_THANKS);break;
        case 92: PlayVoiceChat(VOICE_CHAT_THREATEN);break;
        case 93: PlayVoiceChat(VOICE_CHAT_WEAPONSUCKS);break;
        case 94: PlayVoiceChat(VOICE_CHAT_YES);break;
    }


    switch (iRoll)
    {
        case 1: PlayAnimation(ANIMATION_FIREFORGET_BOW);break;
        case 2: PlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK);break;
        case 3: PlayAnimation(ANIMATION_FIREFORGET_DODGE_SIDE);break;
        case 4: PlayAnimation(ANIMATION_FIREFORGET_DRINK);break;
        case 5: PlayAnimation(ANIMATION_FIREFORGET_GREETING);break;
        case 6: PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);break;
        case 7: PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);break;
        case 8: PlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED);break;
        case 9: PlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);break;
        case 10: PlayAnimation(ANIMATION_FIREFORGET_READ);break;
        case 11: PlayAnimation(ANIMATION_FIREFORGET_SALUTE);break;
        case 12: PlayAnimation(ANIMATION_FIREFORGET_SPASM);break;
        case 13: PlayAnimation(ANIMATION_FIREFORGET_STEAL);break;
        case 14: PlayAnimation(ANIMATION_FIREFORGET_TAUNT);break;
        case 15: PlayAnimation(ANIMATION_FIREFORGET_VICTORY1);break;
        case 16: PlayAnimation(ANIMATION_FIREFORGET_VICTORY2);break;
        case 17: PlayAnimation(ANIMATION_FIREFORGET_VICTORY3);break;
        case 18: PlayAnimation(ANIMATION_LOOPING_CONJURE1, fSpeed, fSpeed);break;
        case 19: PlayAnimation(ANIMATION_LOOPING_CONJURE2, fSpeed, fSpeed);break;
        case 20: PlayAnimation(ANIMATION_LOOPING_DEAD_BACK, fSpeed, fSpeed);break;
        case 21: PlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, fSpeed, fSpeed);break;
        case 22: PlayAnimation(ANIMATION_LOOPING_GET_LOW, fSpeed, fSpeed);break;
        case 23: PlayAnimation(ANIMATION_LOOPING_GET_MID, fSpeed, fSpeed);break;
        case 24: PlayAnimation(ANIMATION_LOOPING_LISTEN, fSpeed, fSpeed);break;
        case 25: PlayAnimation(ANIMATION_LOOPING_LOOK_FAR, fSpeed, fSpeed);break;
        case 26: PlayAnimation(ANIMATION_LOOPING_MEDITATE, fSpeed, fSpeed);break;
        case 27: PlayAnimation(ANIMATION_LOOPING_PAUSE, fSpeed, fSpeed);break;
        case 28: PlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, fSpeed, fSpeed);break;
        case 29: PlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, fSpeed, fSpeed);break;
        case 30: PlayAnimation(ANIMATION_LOOPING_PAUSE2, fSpeed, fSpeed);break;
        case 31: PlayAnimation(ANIMATION_LOOPING_SIT_CHAIR, fSpeed, fSpeed);break;
        case 32: PlayAnimation(ANIMATION_LOOPING_SIT_CROSS, fSpeed, fSpeed);break;
        case 33: PlayAnimation(ANIMATION_LOOPING_SPASM, fSpeed, fSpeed);break;
        case 34: PlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, fSpeed, fSpeed);break;
        case 35: PlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, fSpeed, fSpeed);break;
        case 36: PlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, fSpeed, fSpeed);break;
        case 37: PlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, fSpeed, fSpeed);break;
        case 38: PlayAnimation(ANIMATION_LOOPING_WORSHIP, fSpeed, fSpeed);break;
    }
}
