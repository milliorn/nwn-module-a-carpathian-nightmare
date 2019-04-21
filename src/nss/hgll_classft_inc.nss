//--------------------------------DECLARATIONS--------------------------------//

// This function returns the level at which the specified class gets the specified feat.
// If the feat is epic only, it will return -1 in most cases, though it will also return
// 21 on occasion, as with Epic Spells, which actually require 21 levels of the class rather
// than just epic character status. It replicates EXACTLY the cls_feat 2da for each of the
// respective classes, though the order of feats has been shuffled to accomodate the switch
// statements, and a few duplicate cases in the 2das were removed. If the feat input is not
// a class feat (and therefore not found in the 2da), this function will return -2. If the
// class input is not a valid class int, the function returns -3. Although Harper Scout could
// not possibly be a character's control class for legendary levels, it is included at the end
// of the switch so that the function can be of broader use to the community. Several feats were
// added as class feats for Palemasters, including Spell Focuses and Greater Spell Focuses
// (since they get Epic Focuses). They are marked in the function. The class switches are
// in aphabetical order by 2da file (which is slightly different than class name).
int GetClassLevelReqForFeat(int nFeat, int nClass);
// This function returns TRUE if the feat specified is a general feat, avalable to all classes.
int GetIsGeneralFeat(int nFeat);

//----------------------------------FUNCTIONS---------------------------------//

int GetClassLevelReqForFeat(int nFeat, int nClass)
{
int nInt;
switch(nClass)
{
    case  CLASS_TYPE_ARCANE_ARCHER:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  3 : nInt =  1 ; break;
case  4 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  32 : nInt =  1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
case  445 : nInt =  1 ; break;
case  446 : nInt =  3 ; break;
case  447 : nInt =  5 ; break;
case  448 : nInt =  7 ; break;
case  449 : nInt =  9 ; break;
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
case  450 : nInt =  2 ; break;
case  451 : nInt =  4 ; break;
case  452 : nInt =  6 ; break;
case  453 : nInt =  8 ; break;
case  454 : nInt =  10 ; break;
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  491 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
case  507 : nInt =  -1 ; break;
case  508 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  584 : nInt =  -1 ; break;
case  585 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
case  631 : nInt =  -1 ; break;
case  632 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
case  721 : nInt =  -1 ; break;
case  722 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  754 : nInt =  -1 ; break;
case  755 : nInt =  -1 ; break;
case  756 : nInt =  -1 ; break;
case  757 : nInt =  -1 ; break;
case  758 : nInt =  -1 ; break;
case  759 : nInt =  -1 ; break;
case  760 : nInt =  -1 ; break;
case  761 : nInt =  -1 ; break;
case  762 : nInt =  -1 ; break;
case  763 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
case  784 : nInt =  -1 ; break;
case  785 : nInt =  -1 ; break;
case  786 : nInt =  -1 ; break;
case  787 : nInt =  -1 ; break;
case  788 : nInt =  -1 ; break;
case  789 : nInt =  -1 ; break;
case  790 : nInt =  -1 ; break;
case  791 : nInt =  -1 ; break;
case  792 : nInt =  -1 ; break;
case  793 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  977 : nInt =  11 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
case  1045 : nInt =  11 ; break;
case  1046 : nInt =  13 ; break;
case  1047 : nInt =  15 ; break;
case  1048 : nInt =  17 ; break;
case  1049 : nInt =  19 ; break;
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
case  1050 : nInt =  21 ; break;
case  1051 : nInt =  23 ; break;
case  1052 : nInt =  25 ; break;
case  1053 : nInt =  27 ; break;
case  1054 : nInt =  29 ; break;
case  1055 : nInt =  31 ; break;
case  1056 : nInt =  33 ; break;
case  1057 : nInt =  35 ; break;
case  1058 : nInt =  37 ; break;
case  1059 : nInt =  39 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_ASSASSIN:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  3 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  -1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
case  195 : nInt =  2 ; break;
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
case  251 : nInt =  5 ; break;
case  252 : nInt =  10 ; break;
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
case  455 : nInt =  1 ; break;
case  456 : nInt =  3 ; break;
case  457 : nInt =  5 ; break;
case  458 : nInt =  7 ; break;
case  459 : nInt =  9 ; break;
case  463 : nInt =  2 ; break;
case  464 : nInt =  4 ; break;
case  465 : nInt =  6 ; break;
case  466 : nInt =  8 ; break;
case  467 : nInt =  10 ; break;
case  468 : nInt =  2 ; break;
case  469 : nInt =  5 ; break;
case  470 : nInt =  7 ; break;
case  471 : nInt =  9 ; break;
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  491 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  585 : nInt =  -1 ; break;
case  594 : nInt =  -1 ; break;
case  597 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
case  748 : nInt =  -1 ; break;
case  749 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  750 : nInt =  -1 ; break;
case  751 : nInt =  -1 ; break;
case  752 : nInt =  -1 ; break;
case  753 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
case  784 : nInt =  -1 ; break;
case  785 : nInt =  -1 ; break;
case  786 : nInt =  -1 ; break;
case  787 : nInt =  -1 ; break;
case  788 : nInt =  -1 ; break;
case  789 : nInt =  -1 ; break;
case  790 : nInt =  -1 ; break;
case  791 : nInt =  -1 ; break;
case  792 : nInt =  -1 ; break;
case  793 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
case  834 : nInt =  -1 ; break;
case  835 : nInt =  -1 ; break;
case  836 : nInt =  -1 ; break;
case  837 : nInt =  -1 ; break;
case  838 : nInt =  -1 ; break;
case  839 : nInt =  -1 ; break;
case  840 : nInt =  -1 ; break;
case  841 : nInt =  -1 ; break;
case  842 : nInt =  -1 ; break;
case  843 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  960 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  978 : nInt =  11 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
case  1004 : nInt =  11 ; break;
case  1005 : nInt =  13 ; break;
case  1006 : nInt =  15 ; break;
case  1019 : nInt =  17 ; break;
case  1020 : nInt =  19 ; break;
case  1021 : nInt =  21 ; break;
case  1022 : nInt =  23 ; break;
case  1023 : nInt =  25 ; break;
case  1024 : nInt =  27 ; break;
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
case  1025 : nInt =  29 ; break;
case  1026 : nInt =  31 ; break;
case  1027 : nInt =  33 ; break;
case  1028 : nInt =  35 ; break;
case  1029 : nInt =  37 ; break;
case  1030 : nInt =  39 ; break;
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
case  1070 : nInt =  12 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_BARBARIAN:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  3 : nInt =  1 ; break;
case  4 : nInt =  1 ; break;
case  8 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  32 : nInt =  1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
case  194 : nInt =  1 ; break;
case  195 : nInt =  2 ; break;
case  196 : nInt =  11 ; break;
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
case  251 : nInt =  5 ; break;
case  252 : nInt =  10 ; break;
case  253 : nInt =  13 ; break;
case  254 : nInt =  16 ; break;
case  255 : nInt =  19 ; break;
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
case  293 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
case  326 : nInt =  4 ; break;
case  327 : nInt =  8 ; break;
case  328 : nInt =  12 ; break;
case  329 : nInt =  15 ; break;
case  330 : nInt =  16 ; break;
case  331 : nInt =  20 ; break;
case  332 : nInt =  14 ; break;
case  333 : nInt =  17 ; break;
case  334 : nInt =  20 ; break;
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  490 : nInt =  -1 ; break;
case  491 : nInt =  -1 ; break;
case  492 : nInt =  -1 ; break;
case  493 : nInt =  -1 ; break;
case  494 : nInt =  -1 ; break;
case  495 : nInt =  -1 ; break;
case  496 : nInt =  -1 ; break;
case  497 : nInt =  -1 ; break;
case  498 : nInt =  -1 ; break;
case  499 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
case  500 : nInt =  -1 ; break;
case  501 : nInt =  -1 ; break;
case  502 : nInt =  -1 ; break;
case  503 : nInt =  -1 ; break;
case  504 : nInt =  -1 ; break;
case  505 : nInt =  -1 ; break;
case  506 : nInt =  -1 ; break;
case  507 : nInt =  -1 ; break;
case  508 : nInt =  -1 ; break;
case  509 : nInt =  -1 ; break;
case  510 : nInt =  -1 ; break;
case  511 : nInt =  -1 ; break;
case  512 : nInt =  -1 ; break;
case  513 : nInt =  -1 ; break;
case  514 : nInt =  -1 ; break;
case  515 : nInt =  -1 ; break;
case  516 : nInt =  -1 ; break;
case  517 : nInt =  -1 ; break;
case  518 : nInt =  -1 ; break;
case  519 : nInt =  -1 ; break;
case  520 : nInt =  -1 ; break;
case  521 : nInt =  -1 ; break;
case  522 : nInt =  -1 ; break;
case  523 : nInt =  -1 ; break;
case  524 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
case  525 : nInt =  -1 ; break;
case  526 : nInt =  -1 ; break;
case  527 : nInt =  -1 ; break;
case  528 : nInt =  -1 ; break;
case  529 : nInt =  -1 ; break;
case  530 : nInt =  -1 ; break;
case  531 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  584 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  619 : nInt =  -1 ; break;
case  620 : nInt =  -1 ; break;
case  621 : nInt =  -1 ; break;
case  622 : nInt =  -1 ; break;
case  623 : nInt =  -1 ; break;
case  624 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
case  625 : nInt =  -1 ; break;
case  626 : nInt =  -1 ; break;
case  627 : nInt =  -1 ; break;
case  628 : nInt =  -1 ; break;
case  629 : nInt =  -1 ; break;
case  630 : nInt =  -1 ; break;
case  631 : nInt =  -1 ; break;
case  632 : nInt =  -1 ; break;
case  633 : nInt =  -1 ; break;
case  634 : nInt =  -1 ; break;
case  635 : nInt =  -1 ; break;
case  636 : nInt =  -1 ; break;
case  637 : nInt =  -1 ; break;
case  638 : nInt =  -1 ; break;
case  639 : nInt =  -1 ; break;
case  640 : nInt =  -1 ; break;
case  641 : nInt =  -1 ; break;
case  642 : nInt =  -1 ; break;
case  643 : nInt =  -1 ; break;
case  644 : nInt =  -1 ; break;
case  645 : nInt =  -1 ; break;
case  646 : nInt =  -1 ; break;
case  647 : nInt =  -1 ; break;
case  648 : nInt =  -1 ; break;
case  649 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
case  650 : nInt =  -1 ; break;
case  651 : nInt =  -1 ; break;
case  652 : nInt =  -1 ; break;
case  653 : nInt =  -1 ; break;
case  654 : nInt =  -1 ; break;
case  655 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
case  709 : nInt =  -1 ; break;
case  710 : nInt =  -1 ; break;
case  711 : nInt =  -1 ; break;
case  712 : nInt =  -1 ; break;
case  713 : nInt =  -1 ; break;
case  714 : nInt =  -1 ; break;
case  715 : nInt =  -1 ; break;
case  716 : nInt =  -1 ; break;
case  717 : nInt =  -1 ; break;
case  718 : nInt =  -1 ; break;
case  719 : nInt =  -1 ; break;
case  720 : nInt =  -1 ; break;
case  721 : nInt =  -1 ; break;
case  722 : nInt =  -1 ; break;
case  723 : nInt =  -1 ; break;
case  724 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
case  725 : nInt =  -1 ; break;
case  726 : nInt =  -1 ; break;
case  727 : nInt =  -1 ; break;
case  728 : nInt =  -1 ; break;
case  729 : nInt =  -1 ; break;
case  730 : nInt =  -1 ; break;
case  731 : nInt =  -1 ; break;
case  732 : nInt =  -1 ; break;
case  733 : nInt =  -1 ; break;
case  734 : nInt =  -1 ; break;
case  735 : nInt =  -1 ; break;
case  736 : nInt =  -1 ; break;
case  737 : nInt =  -1 ; break;
case  738 : nInt =  -1 ; break;
case  739 : nInt =  -1 ; break;
case  740 : nInt =  -1 ; break;
case  741 : nInt =  -1 ; break;
case  742 : nInt =  -1 ; break;
case  743 : nInt =  -1 ; break;
case  744 : nInt =  -1 ; break;
case  745 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  753 : nInt =  -1 ; break;
case  754 : nInt =  -1 ; break;
case  755 : nInt =  -1 ; break;
case  756 : nInt =  -1 ; break;
case  757 : nInt =  -1 ; break;
case  758 : nInt =  -1 ; break;
case  759 : nInt =  -1 ; break;
case  760 : nInt =  -1 ; break;
case  761 : nInt =  -1 ; break;
case  762 : nInt =  -1 ; break;
case  763 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  869 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  955 : nInt =  -1 ; break;
case  956 : nInt =  -1 ; break;
case  958 : nInt =  -1 ; break;
case  967 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  988 : nInt =  -1 ; break;
case  989 : nInt =  -1 ; break;
case  996 : nInt =  -1 ; break;
case  997 : nInt =  -1 ; break;
case  999 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
case  1067 : nInt =  23 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_BARD:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  3 : nInt =  1 ; break;
case  4 : nInt =  1 ; break;
case  8 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  29 : nInt =  -1 ; break;
case  32 : nInt =  1 ; break;
case  35 : nInt =  -1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  -1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
case  166 : nInt =  -1 ; break;
case  167 : nInt =  -1 ; break;
case  168 : nInt =  -1 ; break;
case  169 : nInt =  -1 ; break;
case  170 : nInt =  -1 ; break;
case  171 : nInt =  -1 ; break;
case  172 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
case  193 : nInt =  -1 ; break;
case  197 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
case  257 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
case  355 : nInt =  2 ; break;
case  356 : nInt =  3 ; break;
case  357 : nInt =  4 ; break;
case  358 : nInt =  5 ; break;
case  359 : nInt =  6 ; break;
case  360 : nInt =  7 ; break;
case  361 : nInt =  8 ; break;
case  362 : nInt =  9 ; break;
case  363 : nInt =  10 ; break;
case  364 : nInt =  11 ; break;
case  365 : nInt =  12 ; break;
case  366 : nInt =  13 ; break;
case  367 : nInt =  14 ; break;
case  368 : nInt =  15 ; break;
case  369 : nInt =  16 ; break;
case  370 : nInt =  17 ; break;
case  371 : nInt =  18 ; break;
case  372 : nInt =  19 ; break;
case  373 : nInt =  20 ; break;
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
case  393 : nInt =  -1 ; break;
case  394 : nInt =  -1 ; break;
case  395 : nInt =  -1 ; break;
case  396 : nInt =  -1 ; break;
case  397 : nInt =  -1 ; break;
case  398 : nInt =  -1 ; break;
case  399 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
case  400 : nInt =  -1 ; break;
case  401 : nInt =  -1 ; break;
case  415 : nInt =  -1 ; break;
case  416 : nInt =  -1 ; break;
case  417 : nInt =  -1 ; break;
case  418 : nInt =  -1 ; break;
case  419 : nInt =  -1 ; break;
case  420 : nInt =  -1 ; break;
case  421 : nInt =  -1 ; break;
case  422 : nInt =  -1 ; break;
case  423 : nInt =  -1 ; break;
case  424 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  491 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  588 : nInt =  -1 ; break;
case  589 : nInt =  -1 ; break;
case  590 : nInt =  -1 ; break;
case  591 : nInt =  -1 ; break;
case  592 : nInt =  -1 ; break;
case  593 : nInt =  -1 ; break;
case  594 : nInt =  -1 ; break;
case  595 : nInt =  -1 ; break;
case  596 : nInt =  -1 ; break;
case  597 : nInt =  -1 ; break;
case  598 : nInt =  -1 ; break;
case  599 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  601 : nInt =  -1 ; break;
case  602 : nInt =  -1 ; break;
case  603 : nInt =  -1 ; break;
case  604 : nInt =  -1 ; break;
case  605 : nInt =  -1 ; break;
case  606 : nInt =  -1 ; break;
case  607 : nInt =  -1 ; break;
case  608 : nInt =  -1 ; break;
case  600 : nInt =  -1 ; break;
case  609 : nInt =  -1 ; break;
case  610 : nInt =  -1 ; break;
case  611 : nInt =  -1 ; break;
case  612 : nInt =  -1 ; break;
case  613 : nInt =  -1 ; break;
case  614 : nInt =  -1 ; break;
case  615 : nInt =  -1 ; break;
case  616 : nInt =  -1 ; break;
case  617 : nInt =  -1 ; break;
case  618 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  695 : nInt =  -1 ; break;
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  764 : nInt =  -1 ; break;
case  765 : nInt =  -1 ; break;
case  766 : nInt =  -1 ; break;
case  767 : nInt =  -1 ; break;
case  768 : nInt =  -1 ; break;
case  769 : nInt =  -1 ; break;
case  770 : nInt =  -1 ; break;
case  771 : nInt =  -1 ; break;
case  772 : nInt =  -1 ; break;
case  773 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
case  784 : nInt =  -1 ; break;
case  785 : nInt =  -1 ; break;
case  786 : nInt =  -1 ; break;
case  787 : nInt =  -1 ; break;
case  788 : nInt =  -1 ; break;
case  789 : nInt =  -1 ; break;
case  790 : nInt =  -1 ; break;
case  791 : nInt =  -1 ; break;
case  792 : nInt =  -1 ; break;
case  793 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  857 : nInt =  -1 ; break;
case  858 : nInt =  -1 ; break;
case  859 : nInt =  -1 ; break;
case  860 : nInt =  -1 ; break;
case  861 : nInt =  -1 ; break;
case  862 : nInt =  -1 ; break;
case  863 : nInt =  -1 ; break;
case  864 : nInt =  -1 ; break;
case  865 : nInt =  -1 ; break;
case  870 : nInt =  -1 ; break;
case  871 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
case  913 : nInt =  -1 ; break;
case  914 : nInt =  -1 ; break;
case  917 : nInt =  -1 ; break;
case  918 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
case  944 : nInt =  3 ; break;
case  945 : nInt =  1 ; break;
case  946 : nInt =  5 ; break;
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  968 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_BLACKGUARD:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  2 : nInt =  1 ; break;
case  3 : nInt =  1 ; break;
case  4 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  32 : nInt =  1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
case  294 : nInt =  3 ; break;
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
case  413 : nInt =  -1 ; break;
case  414 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
case  460 : nInt =  4 ; break;
case  461 : nInt =  7 ; break;
case  462 : nInt =  10 ; break;
case  472 : nInt =  2 ; break;
case  473 : nInt =  2 ; break;
case  474 : nInt =  3 ; break;
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  475 : nInt =  5 ; break;
case  476 : nInt =  6 ; break;
case  477 : nInt =  8 ; break;
case  478 : nInt =  2 ; break;
case  479 : nInt =  7 ; break;
case  490 : nInt =  -1 ; break;
case  491 : nInt =  -1 ; break;
case  495 : nInt =  -1 ; break;
case  496 : nInt =  -1 ; break;
case  497 : nInt =  -1 ; break;
case  498 : nInt =  -1 ; break;
case  499 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
case  500 : nInt =  -1 ; break;
case  501 : nInt =  -1 ; break;
case  502 : nInt =  -1 ; break;
case  503 : nInt =  -1 ; break;
case  504 : nInt =  -1 ; break;
case  505 : nInt =  -1 ; break;
case  506 : nInt =  -1 ; break;
case  507 : nInt =  -1 ; break;
case  508 : nInt =  -1 ; break;
case  509 : nInt =  -1 ; break;
case  510 : nInt =  -1 ; break;
case  511 : nInt =  -1 ; break;
case  512 : nInt =  -1 ; break;
case  513 : nInt =  -1 ; break;
case  514 : nInt =  -1 ; break;
case  515 : nInt =  -1 ; break;
case  516 : nInt =  -1 ; break;
case  517 : nInt =  -1 ; break;
case  518 : nInt =  -1 ; break;
case  519 : nInt =  -1 ; break;
case  520 : nInt =  -1 ; break;
case  521 : nInt =  -1 ; break;
case  522 : nInt =  -1 ; break;
case  523 : nInt =  -1 ; break;
case  524 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
case  525 : nInt =  -1 ; break;
case  526 : nInt =  -1 ; break;
case  527 : nInt =  -1 ; break;
case  528 : nInt =  -1 ; break;
case  529 : nInt =  -1 ; break;
case  530 : nInt =  -1 ; break;
case  531 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  584 : nInt =  -1 ; break;
case  586 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  619 : nInt =  -1 ; break;
case  620 : nInt =  -1 ; break;
case  621 : nInt =  -1 ; break;
case  622 : nInt =  -1 ; break;
case  623 : nInt =  -1 ; break;
case  624 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
case  625 : nInt =  -1 ; break;
case  626 : nInt =  -1 ; break;
case  627 : nInt =  -1 ; break;
case  628 : nInt =  -1 ; break;
case  629 : nInt =  -1 ; break;
case  630 : nInt =  -1 ; break;
case  631 : nInt =  -1 ; break;
case  632 : nInt =  -1 ; break;
case  633 : nInt =  -1 ; break;
case  634 : nInt =  -1 ; break;
case  635 : nInt =  -1 ; break;
case  636 : nInt =  -1 ; break;
case  637 : nInt =  -1 ; break;
case  638 : nInt =  -1 ; break;
case  639 : nInt =  -1 ; break;
case  640 : nInt =  -1 ; break;
case  641 : nInt =  -1 ; break;
case  642 : nInt =  -1 ; break;
case  643 : nInt =  -1 ; break;
case  644 : nInt =  -1 ; break;
case  645 : nInt =  -1 ; break;
case  646 : nInt =  -1 ; break;
case  647 : nInt =  -1 ; break;
case  648 : nInt =  -1 ; break;
case  649 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
case  650 : nInt =  -1 ; break;
case  651 : nInt =  -1 ; break;
case  652 : nInt =  -1 ; break;
case  653 : nInt =  -1 ; break;
case  654 : nInt =  -1 ; break;
case  655 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
case  709 : nInt =  -1 ; break;
case  710 : nInt =  -1 ; break;
case  711 : nInt =  -1 ; break;
case  712 : nInt =  -1 ; break;
case  713 : nInt =  -1 ; break;
case  714 : nInt =  -1 ; break;
case  715 : nInt =  -1 ; break;
case  716 : nInt =  -1 ; break;
case  717 : nInt =  -1 ; break;
case  718 : nInt =  -1 ; break;
case  719 : nInt =  -1 ; break;
case  720 : nInt =  -1 ; break;
case  721 : nInt =  -1 ; break;
case  722 : nInt =  -1 ; break;
case  723 : nInt =  -1 ; break;
case  724 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
case  725 : nInt =  -1 ; break;
case  726 : nInt =  -1 ; break;
case  727 : nInt =  -1 ; break;
case  728 : nInt =  -1 ; break;
case  729 : nInt =  -1 ; break;
case  730 : nInt =  -1 ; break;
case  731 : nInt =  -1 ; break;
case  732 : nInt =  -1 ; break;
case  733 : nInt =  -1 ; break;
case  734 : nInt =  -1 ; break;
case  735 : nInt =  -1 ; break;
case  736 : nInt =  -1 ; break;
case  737 : nInt =  -1 ; break;
case  738 : nInt =  -1 ; break;
case  739 : nInt =  -1 ; break;
case  740 : nInt =  -1 ; break;
case  741 : nInt =  -1 ; break;
case  742 : nInt =  -1 ; break;
case  743 : nInt =  -1 ; break;
case  744 : nInt =  -1 ; break;
case  745 : nInt =  -1 ; break;
case  747 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  754 : nInt =  -1 ; break;
case  755 : nInt =  -1 ; break;
case  756 : nInt =  -1 ; break;
case  757 : nInt =  -1 ; break;
case  758 : nInt =  -1 ; break;
case  759 : nInt =  -1 ; break;
case  760 : nInt =  -1 ; break;
case  761 : nInt =  -1 ; break;
case  762 : nInt =  -1 ; break;
case  763 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
case  824 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
case  825 : nInt =  -1 ; break;
case  826 : nInt =  -1 ; break;
case  827 : nInt =  -1 ; break;
case  828 : nInt =  -1 ; break;
case  829 : nInt =  -1 ; break;
case  830 : nInt =  -1 ; break;
case  831 : nInt =  -1 ; break;
case  832 : nInt =  -1 ; break;
case  833 : nInt =  -1 ; break;
case  834 : nInt =  -1 ; break;
case  835 : nInt =  -1 ; break;
case  836 : nInt =  -1 ; break;
case  837 : nInt =  -1 ; break;
case  838 : nInt =  -1 ; break;
case  839 : nInt =  -1 ; break;
case  840 : nInt =  -1 ; break;
case  841 : nInt =  -1 ; break;
case  842 : nInt =  -1 ; break;
case  843 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  854 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  955 : nInt =  -1 ; break;
case  956 : nInt =  -1 ; break;
case  958 : nInt =  -1 ; break;
case  960 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  979 : nInt =  11 ; break;
case  996 : nInt =  -1 ; break;
case  997 : nInt =  -1 ; break;
case  999 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
case  1003 : nInt =  15 ; break;
case  1007 : nInt =  13 ; break;
case  1008 : nInt =  16 ; break;
case  1009 : nInt =  19 ; break;
case  1010 : nInt =  22 ; break;
case  1011 : nInt =  25 ; break;
case  1012 : nInt =  28 ; break;
case  1013 : nInt =  31 ; break;
case  1014 : nInt =  34 ; break;
case  1015 : nInt =  37 ; break;
case  1016 : nInt =  40 ; break;
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_CLERIC:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  2 : nInt =  1 ; break;
case  3 : nInt =  1 ; break;
case  4 : nInt =  1 ; break;
case  8 : nInt =  -1 ; break;
case  13 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  29 : nInt =  -1 ; break;
case  32 : nInt =  1 ; break;
case  35 : nInt =  -1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  -1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
case  166 : nInt =  -1 ; break;
case  167 : nInt =  -1 ; break;
case  168 : nInt =  -1 ; break;
case  169 : nInt =  -1 ; break;
case  170 : nInt =  -1 ; break;
case  171 : nInt =  -1 ; break;
case  172 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
case  294 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
case  393 : nInt =  -1 ; break;
case  394 : nInt =  -1 ; break;
case  395 : nInt =  -1 ; break;
case  396 : nInt =  -1 ; break;
case  397 : nInt =  -1 ; break;
case  398 : nInt =  -1 ; break;
case  399 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
case  400 : nInt =  -1 ; break;
case  413 : nInt =  -1 ; break;
case  414 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  490 : nInt =  -1 ; break;
case  491 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  610 : nInt =  -1 ; break;
case  611 : nInt =  -1 ; break;
case  612 : nInt =  -1 ; break;
case  613 : nInt =  -1 ; break;
case  614 : nInt =  -1 ; break;
case  615 : nInt =  -1 ; break;
case  616 : nInt =  -1 ; break;
case  617 : nInt =  -1 ; break;
case  618 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
case  804 : nInt =  -1 ; break;
case  805 : nInt =  -1 ; break;
case  806 : nInt =  -1 ; break;
case  807 : nInt =  -1 ; break;
case  808 : nInt =  -1 ; break;
case  809 : nInt =  -1 ; break;
case  810 : nInt =  -1 ; break;
case  811 : nInt =  -1 ; break;
case  812 : nInt =  -1 ; break;
case  813 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  854 : nInt =  -1 ; break;
case  857 : nInt =  -1 ; break;
case  858 : nInt =  -1 ; break;
case  859 : nInt =  -1 ; break;
case  860 : nInt =  -1 ; break;
case  861 : nInt =  -1 ; break;
case  862 : nInt =  -1 ; break;
case  863 : nInt =  -1 ; break;
case  864 : nInt =  -1 ; break;
case  865 : nInt =  -1 ; break;
case  874 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
case  875 : nInt =  21 ; break;
case  876 : nInt =  21 ; break;
case  878 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
case  944 : nInt =  3 ; break;
case  945 : nInt =  1 ; break;
case  946 : nInt =  5 ; break;
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  969 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_DIVINECHAMPION:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  2 : nInt =  -1 ; break;
case  3 : nInt =  1 ; break;
case  4 : nInt =  1 ; break;
case  5 : nInt =  -1 ; break;
case  6 : nInt =  -1 ; break;
case  8 : nInt =  -1 ; break;
case  9 : nInt =  -1 ; break;
case  10 : nInt =  -1 ; break;
case  15 : nInt =  -1 ; break;
case  16 : nInt =  -1 ; break;
case  17 : nInt =  -1 ; break;
case  18 : nInt =  -1 ; break;
case  19 : nInt =  -1 ; break;
case  20 : nInt =  -1 ; break;
case  21 : nInt =  -1 ; break;
case  23 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  26 : nInt =  -1 ; break;
case  27 : nInt =  -1 ; break;
case  28 : nInt =  -1 ; break;
case  30 : nInt =  -1 ; break;
case  31 : nInt =  -1 ; break;
case  32 : nInt =  1 ; break;
case  39 : nInt =  -1 ; break;
case  41 : nInt =  -1 ; break;
case  42 : nInt =  -1 ; break;
case  43 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
case  52 : nInt =  -1 ; break;
case  53 : nInt =  -1 ; break;
case  54 : nInt =  -1 ; break;
case  55 : nInt =  -1 ; break;
case  56 : nInt =  -1 ; break;
case  57 : nInt =  -1 ; break;
case  58 : nInt =  -1 ; break;
case  59 : nInt =  -1 ; break;
case  60 : nInt =  -1 ; break;
case  61 : nInt =  -1 ; break;
case  62 : nInt =  -1 ; break;
case  63 : nInt =  -1 ; break;
case  64 : nInt =  -1 ; break;
case  65 : nInt =  -1 ; break;
case  66 : nInt =  -1 ; break;
case  67 : nInt =  -1 ; break;
case  68 : nInt =  -1 ; break;
case  69 : nInt =  -1 ; break;
case  70 : nInt =  -1 ; break;
case  71 : nInt =  -1 ; break;
case  72 : nInt =  -1 ; break;
case  73 : nInt =  -1 ; break;
case  74 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
case  75 : nInt =  -1 ; break;
case  76 : nInt =  -1 ; break;
case  77 : nInt =  -1 ; break;
case  78 : nInt =  -1 ; break;
case  79 : nInt =  -1 ; break;
case  80 : nInt =  -1 ; break;
case  82 : nInt =  -1 ; break;
case  83 : nInt =  -1 ; break;
case  84 : nInt =  -1 ; break;
case  85 : nInt =  -1 ; break;
case  87 : nInt =  -1 ; break;
case  88 : nInt =  -1 ; break;
case  89 : nInt =  -1 ; break;
case  90 : nInt =  -1 ; break;
case  91 : nInt =  -1 ; break;
case  92 : nInt =  -1 ; break;
case  93 : nInt =  -1 ; break;
case  94 : nInt =  -1 ; break;
case  95 : nInt =  -1 ; break;
case  96 : nInt =  -1 ; break;
case  97 : nInt =  -1 ; break;
case  98 : nInt =  -1 ; break;
case  99 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
case  100 : nInt =  -1 ; break;
case  101 : nInt =  -1 ; break;
case  102 : nInt =  -1 ; break;
case  103 : nInt =  -1 ; break;
case  104 : nInt =  -1 ; break;
case  105 : nInt =  -1 ; break;
case  106 : nInt =  -1 ; break;
case  107 : nInt =  -1 ; break;
case  108 : nInt =  -1 ; break;
case  109 : nInt =  -1 ; break;
case  110 : nInt =  -1 ; break;
case  111 : nInt =  -1 ; break;
case  112 : nInt =  -1 ; break;
case  113 : nInt =  -1 ; break;
case  114 : nInt =  -1 ; break;
case  115 : nInt =  -1 ; break;
case  116 : nInt =  -1 ; break;
case  117 : nInt =  -1 ; break;
case  118 : nInt =  -1 ; break;
case  120 : nInt =  -1 ; break;
case  121 : nInt =  -1 ; break;
case  122 : nInt =  -1 ; break;
case  123 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
case  125 : nInt =  -1 ; break;
case  126 : nInt =  -1 ; break;
case  127 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
case  299 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
case  301 : nInt =  3 ; break;
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
case  389 : nInt =  -1 ; break;
case  390 : nInt =  -1 ; break;
case  391 : nInt =  -1 ; break;
case  392 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
case  408 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  490 : nInt =  -1 ; break;
case  491 : nInt =  -1 ; break;
case  492 : nInt =  -1 ; break;
case  493 : nInt =  -1 ; break;
case  494 : nInt =  -1 ; break;
case  495 : nInt =  -1 ; break;
case  496 : nInt =  -1 ; break;
case  497 : nInt =  -1 ; break;
case  498 : nInt =  -1 ; break;
case  499 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
case  500 : nInt =  -1 ; break;
case  501 : nInt =  -1 ; break;
case  502 : nInt =  -1 ; break;
case  503 : nInt =  -1 ; break;
case  504 : nInt =  -1 ; break;
case  505 : nInt =  -1 ; break;
case  506 : nInt =  -1 ; break;
case  507 : nInt =  -1 ; break;
case  508 : nInt =  -1 ; break;
case  509 : nInt =  -1 ; break;
case  510 : nInt =  -1 ; break;
case  511 : nInt =  -1 ; break;
case  512 : nInt =  -1 ; break;
case  513 : nInt =  -1 ; break;
case  514 : nInt =  -1 ; break;
case  515 : nInt =  -1 ; break;
case  516 : nInt =  -1 ; break;
case  517 : nInt =  -1 ; break;
case  518 : nInt =  -1 ; break;
case  519 : nInt =  -1 ; break;
case  520 : nInt =  -1 ; break;
case  521 : nInt =  -1 ; break;
case  522 : nInt =  -1 ; break;
case  523 : nInt =  -1 ; break;
case  524 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
case  525 : nInt =  -1 ; break;
case  526 : nInt =  -1 ; break;
case  527 : nInt =  -1 ; break;
case  528 : nInt =  -1 ; break;
case  529 : nInt =  -1 ; break;
case  530 : nInt =  -1 ; break;
case  531 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  584 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  610 : nInt =  -1 ; break;
case  611 : nInt =  -1 ; break;
case  612 : nInt =  -1 ; break;
case  613 : nInt =  -1 ; break;
case  614 : nInt =  -1 ; break;
case  615 : nInt =  -1 ; break;
case  616 : nInt =  -1 ; break;
case  617 : nInt =  -1 ; break;
case  618 : nInt =  -1 ; break;
case  619 : nInt =  -1 ; break;
case  620 : nInt =  -1 ; break;
case  621 : nInt =  -1 ; break;
case  622 : nInt =  -1 ; break;
case  623 : nInt =  -1 ; break;
case  624 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
case  625 : nInt =  -1 ; break;
case  626 : nInt =  -1 ; break;
case  627 : nInt =  -1 ; break;
case  628 : nInt =  -1 ; break;
case  629 : nInt =  -1 ; break;
case  630 : nInt =  -1 ; break;
case  631 : nInt =  -1 ; break;
case  632 : nInt =  -1 ; break;
case  633 : nInt =  -1 ; break;
case  634 : nInt =  -1 ; break;
case  635 : nInt =  -1 ; break;
case  636 : nInt =  -1 ; break;
case  637 : nInt =  -1 ; break;
case  638 : nInt =  -1 ; break;
case  639 : nInt =  -1 ; break;
case  640 : nInt =  -1 ; break;
case  641 : nInt =  -1 ; break;
case  642 : nInt =  -1 ; break;
case  643 : nInt =  -1 ; break;
case  644 : nInt =  -1 ; break;
case  645 : nInt =  -1 ; break;
case  646 : nInt =  -1 ; break;
case  647 : nInt =  -1 ; break;
case  648 : nInt =  -1 ; break;
case  649 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
case  650 : nInt =  -1 ; break;
case  651 : nInt =  -1 ; break;
case  652 : nInt =  -1 ; break;
case  653 : nInt =  -1 ; break;
case  654 : nInt =  -1 ; break;
case  655 : nInt =  -1 ; break;
case  657 : nInt =  -1 ; break;
case  658 : nInt =  -1 ; break;
case  659 : nInt =  -1 ; break;
case  660 : nInt =  -1 ; break;
case  661 : nInt =  -1 ; break;
case  662 : nInt =  -1 ; break;
case  663 : nInt =  -1 ; break;
case  664 : nInt =  -1 ; break;
case  665 : nInt =  -1 ; break;
case  666 : nInt =  -1 ; break;
case  667 : nInt =  -1 ; break;
case  668 : nInt =  -1 ; break;
case  669 : nInt =  -1 ; break;
case  670 : nInt =  -1 ; break;
case  671 : nInt =  -1 ; break;
case  672 : nInt =  -1 ; break;
case  673 : nInt =  -1 ; break;
case  674 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  675 : nInt =  -1 ; break;
case  676 : nInt =  -1 ; break;
case  677 : nInt =  -1 ; break;
case  678 : nInt =  -1 ; break;
case  679 : nInt =  -1 ; break;
case  680 : nInt =  -1 ; break;
case  681 : nInt =  -1 ; break;
case  682 : nInt =  -1 ; break;
case  683 : nInt =  -1 ; break;
case  684 : nInt =  -1 ; break;
case  685 : nInt =  -1 ; break;
case  686 : nInt =  -1 ; break;
case  687 : nInt =  -1 ; break;
case  688 : nInt =  -1 ; break;
case  689 : nInt =  -1 ; break;
case  690 : nInt =  -1 ; break;
case  691 : nInt =  -1 ; break;
case  692 : nInt =  -1 ; break;
case  693 : nInt =  -1 ; break;
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
case  709 : nInt =  -1 ; break;
case  710 : nInt =  -1 ; break;
case  711 : nInt =  -1 ; break;
case  712 : nInt =  -1 ; break;
case  713 : nInt =  -1 ; break;
case  714 : nInt =  -1 ; break;
case  715 : nInt =  -1 ; break;
case  716 : nInt =  -1 ; break;
case  717 : nInt =  -1 ; break;
case  718 : nInt =  -1 ; break;
case  719 : nInt =  -1 ; break;
case  720 : nInt =  -1 ; break;
case  721 : nInt =  -1 ; break;
case  722 : nInt =  -1 ; break;
case  723 : nInt =  -1 ; break;
case  724 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
case  725 : nInt =  -1 ; break;
case  726 : nInt =  -1 ; break;
case  727 : nInt =  -1 ; break;
case  728 : nInt =  -1 ; break;
case  729 : nInt =  -1 ; break;
case  730 : nInt =  -1 ; break;
case  731 : nInt =  -1 ; break;
case  732 : nInt =  -1 ; break;
case  733 : nInt =  -1 ; break;
case  734 : nInt =  -1 ; break;
case  735 : nInt =  -1 ; break;
case  736 : nInt =  -1 ; break;
case  737 : nInt =  -1 ; break;
case  738 : nInt =  -1 ; break;
case  739 : nInt =  -1 ; break;
case  740 : nInt =  -1 ; break;
case  741 : nInt =  -1 ; break;
case  742 : nInt =  -1 ; break;
case  743 : nInt =  -1 ; break;
case  744 : nInt =  -1 ; break;
case  745 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  753 : nInt =  -1 ; break;
case  754 : nInt =  -1 ; break;
case  755 : nInt =  -1 ; break;
case  756 : nInt =  -1 ; break;
case  757 : nInt =  -1 ; break;
case  758 : nInt =  -1 ; break;
case  759 : nInt =  -1 ; break;
case  760 : nInt =  -1 ; break;
case  761 : nInt =  -1 ; break;
case  762 : nInt =  -1 ; break;
case  763 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
case  804 : nInt =  -1 ; break;
case  805 : nInt =  -1 ; break;
case  806 : nInt =  -1 ; break;
case  807 : nInt =  -1 ; break;
case  808 : nInt =  -1 ; break;
case  809 : nInt =  -1 ; break;
case  810 : nInt =  -1 ; break;
case  811 : nInt =  -1 ; break;
case  812 : nInt =  -1 ; break;
case  813 : nInt =  -1 ; break;
case  824 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
case  825 : nInt =  -1 ; break;
case  826 : nInt =  -1 ; break;
case  827 : nInt =  -1 ; break;
case  828 : nInt =  -1 ; break;
case  829 : nInt =  -1 ; break;
case  830 : nInt =  -1 ; break;
case  831 : nInt =  -1 ; break;
case  832 : nInt =  -1 ; break;
case  833 : nInt =  -1 ; break;
case  844 : nInt =  -1 ; break;
case  845 : nInt =  -1 ; break;
case  846 : nInt =  -1 ; break;
case  847 : nInt =  -1 ; break;
case  848 : nInt =  -1 ; break;
case  849 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  850 : nInt =  -1 ; break;
case  851 : nInt =  -1 ; break;
case  852 : nInt =  -1 ; break;
case  853 : nInt =  -1 ; break;
case  854 : nInt =  -1 ; break;
case  857 : nInt =  -1 ; break;
case  858 : nInt =  -1 ; break;
case  859 : nInt =  -1 ; break;
case  860 : nInt =  -1 ; break;
case  861 : nInt =  -1 ; break;
case  862 : nInt =  -1 ; break;
case  863 : nInt =  -1 ; break;
case  864 : nInt =  -1 ; break;
case  865 : nInt =  -1 ; break;
case  867 : nInt =  -1 ; break;
case  868 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
case  904 : nInt =  2 ; break;
case  909 : nInt =  5 ; break;
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  952 : nInt =  -1 ; break;
case  954 : nInt =  -1 ; break;
case  955 : nInt =  -1 ; break;
case  956 : nInt =  -1 ; break;
case  958 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  982 : nInt =  11 ; break;
case  993 : nInt =  -1 ; break;
case  995 : nInt =  -1 ; break;
case  996 : nInt =  -1 ; break;
case  997 : nInt =  -1 ; break;
case  998 : nInt =  -1 ; break;
case  999 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_DRAGONDISCIPLE:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  8 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  29 : nInt =  -1 ; break;
case  35 : nInt =  -1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  -1 ; break;
case  46 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
case  166 : nInt =  -1 ; break;
case  167 : nInt =  -1 ; break;
case  168 : nInt =  -1 ; break;
case  169 : nInt =  -1 ; break;
case  170 : nInt =  -1 ; break;
case  171 : nInt =  -1 ; break;
case  172 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
case  228 : nInt =  10 ; break;
case  235 : nInt =  10 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
case  393 : nInt =  -1 ; break;
case  394 : nInt =  -1 ; break;
case  395 : nInt =  -1 ; break;
case  396 : nInt =  -1 ; break;
case  397 : nInt =  -1 ; break;
case  398 : nInt =  -1 ; break;
case  399 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
case  400 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  490 : nInt =  -1 ; break;
case  491 : nInt =  -1 ; break;
case  492 : nInt =  -1 ; break;
case  493 : nInt =  -1 ; break;
case  494 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  584 : nInt =  -1 ; break;
case  586 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  610 : nInt =  -1 ; break;
case  611 : nInt =  -1 ; break;
case  612 : nInt =  -1 ; break;
case  613 : nInt =  -1 ; break;
case  614 : nInt =  -1 ; break;
case  615 : nInt =  -1 ; break;
case  616 : nInt =  -1 ; break;
case  617 : nInt =  -1 ; break;
case  618 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  754 : nInt =  -1 ; break;
case  755 : nInt =  -1 ; break;
case  756 : nInt =  -1 ; break;
case  757 : nInt =  -1 ; break;
case  758 : nInt =  -1 ; break;
case  759 : nInt =  -1 ; break;
case  760 : nInt =  -1 ; break;
case  761 : nInt =  -1 ; break;
case  762 : nInt =  -1 ; break;
case  763 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  857 : nInt =  -1 ; break;
case  858 : nInt =  -1 ; break;
case  859 : nInt =  -1 ; break;
case  860 : nInt =  -1 ; break;
case  861 : nInt =  -1 ; break;
case  862 : nInt =  -1 ; break;
case  863 : nInt =  -1 ; break;
case  864 : nInt =  -1 ; break;
case  865 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  961 : nInt =  1 ; break;
case  962 : nInt =  2 ; break;
case  963 : nInt =  10 ; break;
case  964 : nInt =  10 ; break;
case  965 : nInt =  3 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  987 : nInt =  11 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
case  1042 : nInt =  1 ; break;
case  1043 : nInt =  4 ; break;
case  1044 : nInt =  6 ; break;
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_DRUID:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  3 : nInt =  1 ; break;
case  4 : nInt =  1 ; break;
case  8 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  29 : nInt =  -1 ; break;
case  32 : nInt =  1 ; break;
case  34 : nInt =  -1 ; break;
case  35 : nInt =  -1 ; break;
case  41 : nInt =  -1 ; break;
case  48 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
case  166 : nInt =  -1 ; break;
case  167 : nInt =  -1 ; break;
case  168 : nInt =  -1 ; break;
case  169 : nInt =  -1 ; break;
case  170 : nInt =  -1 ; break;
case  171 : nInt =  -1 ; break;
case  172 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
case  198 : nInt =  1 ; break;
case  199 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
case  200 : nInt =  2 ; break;
case  201 : nInt =  3 ; break;
case  202 : nInt =  4 ; break;
case  203 : nInt =  9 ; break;
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
case  304 : nInt =  16 ; break;
case  305 : nInt =  5 ; break;
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
case  335 : nInt =  6 ; break;
case  336 : nInt =  7 ; break;
case  337 : nInt =  10 ; break;
case  338 : nInt =  14 ; break;
case  339 : nInt =  18 ; break;
case  340 : nInt =  17 ; break;
case  341 : nInt =  19 ; break;
case  342 : nInt =  20 ; break;
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
case  393 : nInt =  -1 ; break;
case  394 : nInt =  -1 ; break;
case  395 : nInt =  -1 ; break;
case  396 : nInt =  -1 ; break;
case  397 : nInt =  -1 ; break;
case  398 : nInt =  -1 ; break;
case  399 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
case  400 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  491 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
case  533 : nInt =  -1 ; break;
case  534 : nInt =  -1 ; break;
case  535 : nInt =  -1 ; break;
case  536 : nInt =  -1 ; break;
case  537 : nInt =  -1 ; break;
case  538 : nInt =  -1 ; break;
case  539 : nInt =  -1 ; break;
case  540 : nInt =  -1 ; break;
case  541 : nInt =  -1 ; break;
case  542 : nInt =  -1 ; break;
case  543 : nInt =  -1 ; break;
case  544 : nInt =  -1 ; break;
case  545 : nInt =  -1 ; break;
case  546 : nInt =  -1 ; break;
case  547 : nInt =  -1 ; break;
case  548 : nInt =  -1 ; break;
case  549 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
case  550 : nInt =  -1 ; break;
case  551 : nInt =  -1 ; break;
case  552 : nInt =  -1 ; break;
case  553 : nInt =  -1 ; break;
case  554 : nInt =  -1 ; break;
case  555 : nInt =  -1 ; break;
case  556 : nInt =  -1 ; break;
case  557 : nInt =  -1 ; break;
case  558 : nInt =  -1 ; break;
case  559 : nInt =  -1 ; break;
case  560 : nInt =  -1 ; break;
case  561 : nInt =  -1 ; break;
case  562 : nInt =  -1 ; break;
case  563 : nInt =  -1 ; break;
case  564 : nInt =  -1 ; break;
case  565 : nInt =  -1 ; break;
case  566 : nInt =  -1 ; break;
case  567 : nInt =  -1 ; break;
case  568 : nInt =  -1 ; break;
case  569 : nInt =  -1 ; break;
case  570 : nInt =  -1 ; break;
case  571 : nInt =  -1 ; break;
case  572 : nInt =  -1 ; break;
case  573 : nInt =  -1 ; break;
case  574 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  575 : nInt =  -1 ; break;
case  576 : nInt =  -1 ; break;
case  577 : nInt =  -1 ; break;
case  578 : nInt =  -1 ; break;
case  579 : nInt =  -1 ; break;
case  580 : nInt =  -1 ; break;
case  581 : nInt =  -1 ; break;
case  582 : nInt =  -1 ; break;
case  587 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  610 : nInt =  -1 ; break;
case  611 : nInt =  -1 ; break;
case  612 : nInt =  -1 ; break;
case  613 : nInt =  -1 ; break;
case  614 : nInt =  -1 ; break;
case  615 : nInt =  -1 ; break;
case  616 : nInt =  -1 ; break;
case  617 : nInt =  -1 ; break;
case  618 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
case  804 : nInt =  -1 ; break;
case  805 : nInt =  -1 ; break;
case  806 : nInt =  -1 ; break;
case  807 : nInt =  -1 ; break;
case  808 : nInt =  -1 ; break;
case  809 : nInt =  -1 ; break;
case  810 : nInt =  -1 ; break;
case  811 : nInt =  -1 ; break;
case  812 : nInt =  -1 ; break;
case  813 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  857 : nInt =  -1 ; break;
case  858 : nInt =  -1 ; break;
case  859 : nInt =  -1 ; break;
case  860 : nInt =  -1 ; break;
case  861 : nInt =  -1 ; break;
case  862 : nInt =  -1 ; break;
case  863 : nInt =  -1 ; break;
case  864 : nInt =  -1 ; break;
case  865 : nInt =  -1 ; break;
case  873 : nInt =  -1 ; break;
case  874 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
case  875 : nInt =  21 ; break;
case  876 : nInt =  21 ; break;
case  878 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
case  944 : nInt =  3 ; break;
case  945 : nInt =  1 ; break;
case  946 : nInt =  5 ; break;
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  970 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
case  1068 : nInt =  22 ; break;
case  1069 : nInt =  26 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_DWARVENDEFENDER:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  2 : nInt =  1 ; break;
case  3 : nInt =  1 ; break;
case  4 : nInt =  1 ; break;
case  8 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  32 : nInt =  1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  490 : nInt =  -1 ; break;
case  491 : nInt =  -1 ; break;
case  492 : nInt =  -1 ; break;
case  493 : nInt =  -1 ; break;
case  494 : nInt =  -1 ; break;
case  495 : nInt =  -1 ; break;
case  496 : nInt =  -1 ; break;
case  497 : nInt =  -1 ; break;
case  498 : nInt =  -1 ; break;
case  499 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
case  500 : nInt =  -1 ; break;
case  501 : nInt =  -1 ; break;
case  502 : nInt =  -1 ; break;
case  503 : nInt =  -1 ; break;
case  504 : nInt =  -1 ; break;
case  505 : nInt =  -1 ; break;
case  506 : nInt =  -1 ; break;
case  507 : nInt =  -1 ; break;
case  508 : nInt =  -1 ; break;
case  509 : nInt =  -1 ; break;
case  510 : nInt =  -1 ; break;
case  511 : nInt =  -1 ; break;
case  512 : nInt =  -1 ; break;
case  513 : nInt =  -1 ; break;
case  514 : nInt =  -1 ; break;
case  515 : nInt =  -1 ; break;
case  516 : nInt =  -1 ; break;
case  517 : nInt =  -1 ; break;
case  518 : nInt =  -1 ; break;
case  519 : nInt =  -1 ; break;
case  520 : nInt =  -1 ; break;
case  521 : nInt =  -1 ; break;
case  522 : nInt =  -1 ; break;
case  523 : nInt =  -1 ; break;
case  524 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
case  525 : nInt =  -1 ; break;
case  526 : nInt =  -1 ; break;
case  527 : nInt =  -1 ; break;
case  528 : nInt =  -1 ; break;
case  529 : nInt =  -1 ; break;
case  530 : nInt =  -1 ; break;
case  531 : nInt =  -1 ; break;
case  533 : nInt =  -1 ; break;
case  534 : nInt =  -1 ; break;
case  535 : nInt =  -1 ; break;
case  536 : nInt =  -1 ; break;
case  537 : nInt =  -1 ; break;
case  538 : nInt =  -1 ; break;
case  539 : nInt =  -1 ; break;
case  540 : nInt =  -1 ; break;
case  541 : nInt =  -1 ; break;
case  542 : nInt =  -1 ; break;
case  543 : nInt =  -1 ; break;
case  544 : nInt =  -1 ; break;
case  545 : nInt =  -1 ; break;
case  546 : nInt =  -1 ; break;
case  547 : nInt =  -1 ; break;
case  548 : nInt =  -1 ; break;
case  549 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
case  550 : nInt =  -1 ; break;
case  551 : nInt =  -1 ; break;
case  552 : nInt =  -1 ; break;
case  553 : nInt =  -1 ; break;
case  554 : nInt =  -1 ; break;
case  555 : nInt =  -1 ; break;
case  556 : nInt =  -1 ; break;
case  557 : nInt =  -1 ; break;
case  558 : nInt =  -1 ; break;
case  559 : nInt =  -1 ; break;
case  560 : nInt =  -1 ; break;
case  561 : nInt =  -1 ; break;
case  562 : nInt =  -1 ; break;
case  563 : nInt =  -1 ; break;
case  564 : nInt =  -1 ; break;
case  565 : nInt =  -1 ; break;
case  566 : nInt =  -1 ; break;
case  567 : nInt =  -1 ; break;
case  568 : nInt =  -1 ; break;
case  569 : nInt =  -1 ; break;
case  570 : nInt =  -1 ; break;
case  571 : nInt =  -1 ; break;
case  572 : nInt =  -1 ; break;
case  573 : nInt =  -1 ; break;
case  574 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  575 : nInt =  -1 ; break;
case  576 : nInt =  -1 ; break;
case  577 : nInt =  -1 ; break;
case  578 : nInt =  -1 ; break;
case  579 : nInt =  -1 ; break;
case  580 : nInt =  -1 ; break;
case  581 : nInt =  -1 ; break;
case  582 : nInt =  -1 ; break;
case  584 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  619 : nInt =  -1 ; break;
case  620 : nInt =  -1 ; break;
case  621 : nInt =  -1 ; break;
case  622 : nInt =  -1 ; break;
case  623 : nInt =  -1 ; break;
case  624 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
case  625 : nInt =  -1 ; break;
case  626 : nInt =  -1 ; break;
case  627 : nInt =  -1 ; break;
case  628 : nInt =  -1 ; break;
case  629 : nInt =  -1 ; break;
case  630 : nInt =  -1 ; break;
case  631 : nInt =  -1 ; break;
case  632 : nInt =  -1 ; break;
case  633 : nInt =  -1 ; break;
case  634 : nInt =  -1 ; break;
case  635 : nInt =  -1 ; break;
case  636 : nInt =  -1 ; break;
case  637 : nInt =  -1 ; break;
case  638 : nInt =  -1 ; break;
case  639 : nInt =  -1 ; break;
case  640 : nInt =  -1 ; break;
case  641 : nInt =  -1 ; break;
case  642 : nInt =  -1 ; break;
case  643 : nInt =  -1 ; break;
case  644 : nInt =  -1 ; break;
case  645 : nInt =  -1 ; break;
case  646 : nInt =  -1 ; break;
case  647 : nInt =  -1 ; break;
case  648 : nInt =  -1 ; break;
case  649 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
case  650 : nInt =  -1 ; break;
case  651 : nInt =  -1 ; break;
case  652 : nInt =  -1 ; break;
case  653 : nInt =  -1 ; break;
case  654 : nInt =  -1 ; break;
case  655 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
case  709 : nInt =  -1 ; break;
case  710 : nInt =  -1 ; break;
case  711 : nInt =  -1 ; break;
case  712 : nInt =  -1 ; break;
case  713 : nInt =  -1 ; break;
case  714 : nInt =  -1 ; break;
case  715 : nInt =  -1 ; break;
case  716 : nInt =  -1 ; break;
case  717 : nInt =  -1 ; break;
case  718 : nInt =  -1 ; break;
case  719 : nInt =  -1 ; break;
case  720 : nInt =  -1 ; break;
case  721 : nInt =  -1 ; break;
case  722 : nInt =  -1 ; break;
case  723 : nInt =  -1 ; break;
case  724 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
case  725 : nInt =  -1 ; break;
case  726 : nInt =  -1 ; break;
case  727 : nInt =  -1 ; break;
case  728 : nInt =  -1 ; break;
case  729 : nInt =  -1 ; break;
case  730 : nInt =  -1 ; break;
case  731 : nInt =  -1 ; break;
case  732 : nInt =  -1 ; break;
case  733 : nInt =  -1 ; break;
case  734 : nInt =  -1 ; break;
case  735 : nInt =  -1 ; break;
case  736 : nInt =  -1 ; break;
case  737 : nInt =  -1 ; break;
case  738 : nInt =  -1 ; break;
case  739 : nInt =  -1 ; break;
case  740 : nInt =  -1 ; break;
case  741 : nInt =  -1 ; break;
case  742 : nInt =  -1 ; break;
case  743 : nInt =  -1 ; break;
case  744 : nInt =  -1 ; break;
case  745 : nInt =  -1 ; break;
case  747 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  754 : nInt =  -1 ; break;
case  755 : nInt =  -1 ; break;
case  756 : nInt =  -1 ; break;
case  757 : nInt =  -1 ; break;
case  758 : nInt =  -1 ; break;
case  760 : nInt =  -1 ; break;
case  761 : nInt =  -1 ; break;
case  762 : nInt =  -1 ; break;
case  763 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
case  947 : nInt =  1 ; break;
case  948 : nInt =  6 ; break;
case  949 : nInt =  2 ; break;
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  950 : nInt =  5 ; break;
case  951 : nInt =  10 ; break;
case  955 : nInt =  -1 ; break;
case  956 : nInt =  -1 ; break;
case  958 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  985 : nInt =  11 ; break;
case  996 : nInt =  -1 ; break;
case  997 : nInt =  -1 ; break;
case  999 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_FIGHTER:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  2 : nInt =  1 ; break;
case  3 : nInt =  1 ; break;
case  4 : nInt =  1 ; break;
case  5 : nInt =  -1 ; break;
case  6 : nInt =  -1 ; break;
case  8 : nInt =  -1 ; break;
case  9 : nInt =  -1 ; break;
case  10 : nInt =  -1 ; break;
case  15 : nInt =  -1 ; break;
case  16 : nInt =  -1 ; break;
case  17 : nInt =  -1 ; break;
case  18 : nInt =  -1 ; break;
case  19 : nInt =  -1 ; break;
case  20 : nInt =  -1 ; break;
case  21 : nInt =  -1 ; break;
case  23 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  26 : nInt =  -1 ; break;
case  27 : nInt =  -1 ; break;
case  28 : nInt =  -1 ; break;
case  30 : nInt =  -1 ; break;
case  31 : nInt =  -1 ; break;
case  32 : nInt =  1 ; break;
case  39 : nInt =  -1 ; break;
case  41 : nInt =  -1 ; break;
case  42 : nInt =  -1 ; break;
case  43 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  1 ; break;
case  46 : nInt =  1 ; break;
case  47 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
case  52 : nInt =  -1 ; break;
case  53 : nInt =  -1 ; break;
case  54 : nInt =  -1 ; break;
case  55 : nInt =  -1 ; break;
case  56 : nInt =  -1 ; break;
case  57 : nInt =  -1 ; break;
case  58 : nInt =  -1 ; break;
case  59 : nInt =  -1 ; break;
case  60 : nInt =  -1 ; break;
case  61 : nInt =  -1 ; break;
case  62 : nInt =  -1 ; break;
case  63 : nInt =  -1 ; break;
case  64 : nInt =  -1 ; break;
case  65 : nInt =  -1 ; break;
case  66 : nInt =  -1 ; break;
case  67 : nInt =  -1 ; break;
case  68 : nInt =  -1 ; break;
case  69 : nInt =  -1 ; break;
case  70 : nInt =  -1 ; break;
case  71 : nInt =  -1 ; break;
case  72 : nInt =  -1 ; break;
case  73 : nInt =  -1 ; break;
case  74 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
case  75 : nInt =  -1 ; break;
case  76 : nInt =  -1 ; break;
case  77 : nInt =  -1 ; break;
case  78 : nInt =  -1 ; break;
case  79 : nInt =  -1 ; break;
case  80 : nInt =  -1 ; break;
case  82 : nInt =  -1 ; break;
case  83 : nInt =  -1 ; break;
case  84 : nInt =  -1 ; break;
case  85 : nInt =  -1 ; break;
case  87 : nInt =  -1 ; break;
case  88 : nInt =  -1 ; break;
case  89 : nInt =  -1 ; break;
case  90 : nInt =  -1 ; break;
case  91 : nInt =  -1 ; break;
case  92 : nInt =  -1 ; break;
case  93 : nInt =  -1 ; break;
case  94 : nInt =  -1 ; break;
case  95 : nInt =  -1 ; break;
case  96 : nInt =  -1 ; break;
case  97 : nInt =  -1 ; break;
case  98 : nInt =  -1 ; break;
case  99 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
case  100 : nInt =  -1 ; break;
case  101 : nInt =  -1 ; break;
case  102 : nInt =  -1 ; break;
case  103 : nInt =  -1 ; break;
case  104 : nInt =  -1 ; break;
case  105 : nInt =  -1 ; break;
case  106 : nInt =  -1 ; break;
case  107 : nInt =  -1 ; break;
case  108 : nInt =  -1 ; break;
case  109 : nInt =  -1 ; break;
case  110 : nInt =  -1 ; break;
case  111 : nInt =  -1 ; break;
case  112 : nInt =  -1 ; break;
case  113 : nInt =  -1 ; break;
case  114 : nInt =  -1 ; break;
case  115 : nInt =  -1 ; break;
case  116 : nInt =  -1 ; break;
case  117 : nInt =  -1 ; break;
case  118 : nInt =  -1 ; break;
case  120 : nInt =  -1 ; break;
case  121 : nInt =  -1 ; break;
case  122 : nInt =  -1 ; break;
case  123 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
case  125 : nInt =  -1 ; break;
case  126 : nInt =  -1 ; break;
case  127 : nInt =  -1 ; break;
case  128 : nInt =  -1 ; break;
case  129 : nInt =  -1 ; break;
case  130 : nInt =  -1 ; break;
case  131 : nInt =  -1 ; break;
case  132 : nInt =  -1 ; break;
case  133 : nInt =  -1 ; break;
case  134 : nInt =  -1 ; break;
case  135 : nInt =  -1 ; break;
case  136 : nInt =  -1 ; break;
case  137 : nInt =  -1 ; break;
case  138 : nInt =  -1 ; break;
case  139 : nInt =  -1 ; break;
case  140 : nInt =  -1 ; break;
case  141 : nInt =  -1 ; break;
case  142 : nInt =  -1 ; break;
case  143 : nInt =  -1 ; break;
case  144 : nInt =  -1 ; break;
case  145 : nInt =  -1 ; break;
case  146 : nInt =  -1 ; break;
case  147 : nInt =  -1 ; break;
case  148 : nInt =  -1 ; break;
case  149 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
case  150 : nInt =  -1 ; break;
case  151 : nInt =  -1 ; break;
case  152 : nInt =  -1 ; break;
case  153 : nInt =  -1 ; break;
case  154 : nInt =  -1 ; break;
case  155 : nInt =  -1 ; break;
case  156 : nInt =  -1 ; break;
case  158 : nInt =  -1 ; break;
case  159 : nInt =  -1 ; break;
case  160 : nInt =  -1 ; break;
case  161 : nInt =  -1 ; break;
case  163 : nInt =  -1 ; break;
case  164 : nInt =  -1 ; break;
case  165 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
case  389 : nInt =  -1 ; break;
case  390 : nInt =  -1 ; break;
case  391 : nInt =  -1 ; break;
case  392 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
case  408 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  490 : nInt =  -1 ; break;
case  491 : nInt =  -1 ; break;
case  492 : nInt =  -1 ; break;
case  493 : nInt =  -1 ; break;
case  494 : nInt =  -1 ; break;
case  495 : nInt =  -1 ; break;
case  496 : nInt =  -1 ; break;
case  497 : nInt =  -1 ; break;
case  498 : nInt =  -1 ; break;
case  499 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
case  500 : nInt =  -1 ; break;
case  501 : nInt =  -1 ; break;
case  502 : nInt =  -1 ; break;
case  503 : nInt =  -1 ; break;
case  504 : nInt =  -1 ; break;
case  505 : nInt =  -1 ; break;
case  506 : nInt =  -1 ; break;
case  507 : nInt =  -1 ; break;
case  508 : nInt =  -1 ; break;
case  509 : nInt =  -1 ; break;
case  510 : nInt =  -1 ; break;
case  511 : nInt =  -1 ; break;
case  512 : nInt =  -1 ; break;
case  513 : nInt =  -1 ; break;
case  514 : nInt =  -1 ; break;
case  515 : nInt =  -1 ; break;
case  516 : nInt =  -1 ; break;
case  517 : nInt =  -1 ; break;
case  518 : nInt =  -1 ; break;
case  519 : nInt =  -1 ; break;
case  520 : nInt =  -1 ; break;
case  521 : nInt =  -1 ; break;
case  522 : nInt =  -1 ; break;
case  523 : nInt =  -1 ; break;
case  524 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
case  525 : nInt =  -1 ; break;
case  526 : nInt =  -1 ; break;
case  527 : nInt =  -1 ; break;
case  528 : nInt =  -1 ; break;
case  529 : nInt =  -1 ; break;
case  530 : nInt =  -1 ; break;
case  531 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  584 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  619 : nInt =  -1 ; break;
case  620 : nInt =  -1 ; break;
case  621 : nInt =  -1 ; break;
case  622 : nInt =  -1 ; break;
case  623 : nInt =  -1 ; break;
case  624 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
case  625 : nInt =  -1 ; break;
case  626 : nInt =  -1 ; break;
case  627 : nInt =  -1 ; break;
case  628 : nInt =  -1 ; break;
case  629 : nInt =  -1 ; break;
case  630 : nInt =  -1 ; break;
case  631 : nInt =  -1 ; break;
case  632 : nInt =  -1 ; break;
case  633 : nInt =  -1 ; break;
case  634 : nInt =  -1 ; break;
case  635 : nInt =  -1 ; break;
case  636 : nInt =  -1 ; break;
case  637 : nInt =  -1 ; break;
case  638 : nInt =  -1 ; break;
case  639 : nInt =  -1 ; break;
case  640 : nInt =  -1 ; break;
case  641 : nInt =  -1 ; break;
case  642 : nInt =  -1 ; break;
case  643 : nInt =  -1 ; break;
case  644 : nInt =  -1 ; break;
case  645 : nInt =  -1 ; break;
case  646 : nInt =  -1 ; break;
case  647 : nInt =  -1 ; break;
case  648 : nInt =  -1 ; break;
case  649 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
case  650 : nInt =  -1 ; break;
case  651 : nInt =  -1 ; break;
case  652 : nInt =  -1 ; break;
case  653 : nInt =  -1 ; break;
case  654 : nInt =  -1 ; break;
case  655 : nInt =  -1 ; break;
case  657 : nInt =  -1 ; break;
case  658 : nInt =  -1 ; break;
case  659 : nInt =  -1 ; break;
case  660 : nInt =  -1 ; break;
case  661 : nInt =  -1 ; break;
case  662 : nInt =  -1 ; break;
case  663 : nInt =  -1 ; break;
case  664 : nInt =  -1 ; break;
case  665 : nInt =  -1 ; break;
case  666 : nInt =  -1 ; break;
case  667 : nInt =  -1 ; break;
case  668 : nInt =  -1 ; break;
case  669 : nInt =  -1 ; break;
case  670 : nInt =  -1 ; break;
case  671 : nInt =  -1 ; break;
case  672 : nInt =  -1 ; break;
case  673 : nInt =  -1 ; break;
case  674 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  675 : nInt =  -1 ; break;
case  676 : nInt =  -1 ; break;
case  677 : nInt =  -1 ; break;
case  678 : nInt =  -1 ; break;
case  679 : nInt =  -1 ; break;
case  680 : nInt =  -1 ; break;
case  681 : nInt =  -1 ; break;
case  682 : nInt =  -1 ; break;
case  683 : nInt =  -1 ; break;
case  684 : nInt =  -1 ; break;
case  685 : nInt =  -1 ; break;
case  686 : nInt =  -1 ; break;
case  687 : nInt =  -1 ; break;
case  688 : nInt =  -1 ; break;
case  689 : nInt =  -1 ; break;
case  690 : nInt =  -1 ; break;
case  691 : nInt =  -1 ; break;
case  692 : nInt =  -1 ; break;
case  693 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
case  709 : nInt =  -1 ; break;
case  710 : nInt =  -1 ; break;
case  711 : nInt =  -1 ; break;
case  712 : nInt =  -1 ; break;
case  713 : nInt =  -1 ; break;
case  714 : nInt =  -1 ; break;
case  715 : nInt =  -1 ; break;
case  716 : nInt =  -1 ; break;
case  717 : nInt =  -1 ; break;
case  718 : nInt =  -1 ; break;
case  719 : nInt =  -1 ; break;
case  720 : nInt =  -1 ; break;
case  721 : nInt =  -1 ; break;
case  722 : nInt =  -1 ; break;
case  723 : nInt =  -1 ; break;
case  724 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
case  725 : nInt =  -1 ; break;
case  726 : nInt =  -1 ; break;
case  727 : nInt =  -1 ; break;
case  728 : nInt =  -1 ; break;
case  729 : nInt =  -1 ; break;
case  730 : nInt =  -1 ; break;
case  731 : nInt =  -1 ; break;
case  732 : nInt =  -1 ; break;
case  733 : nInt =  -1 ; break;
case  734 : nInt =  -1 ; break;
case  735 : nInt =  -1 ; break;
case  736 : nInt =  -1 ; break;
case  737 : nInt =  -1 ; break;
case  738 : nInt =  -1 ; break;
case  739 : nInt =  -1 ; break;
case  740 : nInt =  -1 ; break;
case  741 : nInt =  -1 ; break;
case  742 : nInt =  -1 ; break;
case  743 : nInt =  -1 ; break;
case  744 : nInt =  -1 ; break;
case  745 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  753 : nInt =  -1 ; break;
case  754 : nInt =  -1 ; break;
case  755 : nInt =  -1 ; break;
case  756 : nInt =  -1 ; break;
case  757 : nInt =  -1 ; break;
case  758 : nInt =  -1 ; break;
case  759 : nInt =  -1 ; break;
case  760 : nInt =  -1 ; break;
case  761 : nInt =  -1 ; break;
case  762 : nInt =  -1 ; break;
case  763 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
case  844 : nInt =  -1 ; break;
case  845 : nInt =  -1 ; break;
case  846 : nInt =  -1 ; break;
case  847 : nInt =  -1 ; break;
case  848 : nInt =  -1 ; break;
case  849 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  850 : nInt =  -1 ; break;
case  851 : nInt =  -1 ; break;
case  852 : nInt =  -1 ; break;
case  853 : nInt =  -1 ; break;
case  867 : nInt =  -1 ; break;
case  868 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  952 : nInt =  -1 ; break;
case  953 : nInt =  -1 ; break;
case  954 : nInt =  -1 ; break;
case  955 : nInt =  -1 ; break;
case  956 : nInt =  -1 ; break;
case  957 : nInt =  -1 ; break;
case  958 : nInt =  -1 ; break;
case  966 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  993 : nInt =  -1 ; break;
case  994 : nInt =  -1 ; break;
case  995 : nInt =  -1 ; break;
case  996 : nInt =  -1 ; break;
case  997 : nInt =  -1 ; break;
case  998 : nInt =  -1 ; break;
case  999 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_MONK:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  6 : nInt =  1 ; break;
case  8 : nInt =  2 ; break;
case  17 : nInt =  6 ; break;
case  21 : nInt =  1 ; break;
case  23 : nInt =  6 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  39 : nInt =  1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  -1 ; break;
case  46 : nInt =  -1 ; break;
case  49 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
case  204 : nInt =  1 ; break;
case  206 : nInt =  1 ; break;
case  207 : nInt =  3 ; break;
case  208 : nInt =  3 ; break;
case  209 : nInt =  5 ; break;
case  211 : nInt =  7 ; break;
case  212 : nInt =  9 ; break;
case  213 : nInt =  10 ; break;
case  214 : nInt =  11 ; break;
case  215 : nInt =  12 ; break;
case  216 : nInt =  20 ; break;
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
case  260 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
case  296 : nInt =  15 ; break;
case  297 : nInt =  18 ; break;
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
case  343 : nInt =  13 ; break;
case  344 : nInt =  16 ; break;
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  490 : nInt =  -1 ; break;
case  491 : nInt =  -1 ; break;
case  492 : nInt =  -1 ; break;
case  493 : nInt =  -1 ; break;
case  494 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
case  533 : nInt =  -1 ; break;
case  534 : nInt =  -1 ; break;
case  535 : nInt =  -1 ; break;
case  536 : nInt =  -1 ; break;
case  537 : nInt =  -1 ; break;
case  538 : nInt =  -1 ; break;
case  539 : nInt =  -1 ; break;
case  540 : nInt =  -1 ; break;
case  541 : nInt =  -1 ; break;
case  542 : nInt =  -1 ; break;
case  543 : nInt =  -1 ; break;
case  544 : nInt =  -1 ; break;
case  545 : nInt =  -1 ; break;
case  546 : nInt =  -1 ; break;
case  547 : nInt =  -1 ; break;
case  548 : nInt =  -1 ; break;
case  549 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
case  550 : nInt =  -1 ; break;
case  551 : nInt =  -1 ; break;
case  552 : nInt =  -1 ; break;
case  553 : nInt =  -1 ; break;
case  554 : nInt =  -1 ; break;
case  555 : nInt =  -1 ; break;
case  556 : nInt =  -1 ; break;
case  557 : nInt =  -1 ; break;
case  558 : nInt =  -1 ; break;
case  559 : nInt =  -1 ; break;
case  560 : nInt =  -1 ; break;
case  561 : nInt =  -1 ; break;
case  562 : nInt =  -1 ; break;
case  563 : nInt =  -1 ; break;
case  564 : nInt =  -1 ; break;
case  565 : nInt =  -1 ; break;
case  566 : nInt =  -1 ; break;
case  567 : nInt =  -1 ; break;
case  568 : nInt =  -1 ; break;
case  569 : nInt =  -1 ; break;
case  570 : nInt =  -1 ; break;
case  571 : nInt =  -1 ; break;
case  572 : nInt =  -1 ; break;
case  573 : nInt =  -1 ; break;
case  574 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  575 : nInt =  -1 ; break;
case  576 : nInt =  -1 ; break;
case  577 : nInt =  -1 ; break;
case  578 : nInt =  -1 ; break;
case  579 : nInt =  -1 ; break;
case  580 : nInt =  -1 ; break;
case  581 : nInt =  -1 ; break;
case  582 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  697 : nInt =  -1 ; break;
case  698 : nInt =  -1 ; break;
case  699 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
case  700 : nInt =  -1 ; break;
case  701 : nInt =  -1 ; break;
case  702 : nInt =  -1 ; break;
case  703 : nInt =  -1 ; break;
case  704 : nInt =  -1 ; break;
case  705 : nInt =  -1 ; break;
case  706 : nInt =  -1 ; break;
case  707 : nInt =  -1 ; break;
case  708 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
case  748 : nInt =  -1 ; break;
case  749 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  750 : nInt =  -1 ; break;
case  751 : nInt =  -1 ; break;
case  752 : nInt =  -1 ; break;
case  754 : nInt =  -1 ; break;
case  755 : nInt =  -1 ; break;
case  756 : nInt =  -1 ; break;
case  757 : nInt =  -1 ; break;
case  758 : nInt =  -1 ; break;
case  759 : nInt =  -1 ; break;
case  760 : nInt =  -1 ; break;
case  761 : nInt =  -1 ; break;
case  762 : nInt =  -1 ; break;
case  763 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
case  844 : nInt =  -1 ; break;
case  845 : nInt =  -1 ; break;
case  846 : nInt =  -1 ; break;
case  847 : nInt =  -1 ; break;
case  848 : nInt =  -1 ; break;
case  849 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  850 : nInt =  -1 ; break;
case  851 : nInt =  -1 ; break;
case  852 : nInt =  -1 ; break;
case  853 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  971 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_PALADIN:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  2 : nInt =  1 ; break;
case  3 : nInt =  1 ; break;
case  4 : nInt =  1 ; break;
case  8 : nInt =  -1 ; break;
case  13 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  32 : nInt =  1 ; break;
case  35 : nInt =  -1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
case  166 : nInt =  -1 ; break;
case  167 : nInt =  -1 ; break;
case  168 : nInt =  -1 ; break;
case  169 : nInt =  -1 ; break;
case  170 : nInt =  -1 ; break;
case  171 : nInt =  -1 ; break;
case  172 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
case  217 : nInt =  1 ; break;
case  219 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
case  294 : nInt =  3 ; break;
case  299 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
case  300 : nInt =  2 ; break;
case  301 : nInt =  2 ; break;
case  302 : nInt =  3 ; break;
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
case  393 : nInt =  -1 ; break;
case  394 : nInt =  -1 ; break;
case  395 : nInt =  -1 ; break;
case  396 : nInt =  -1 ; break;
case  397 : nInt =  -1 ; break;
case  398 : nInt =  -1 ; break;
case  399 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
case  400 : nInt =  -1 ; break;
case  413 : nInt =  -1 ; break;
case  414 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  490 : nInt =  -1 ; break;
case  491 : nInt =  -1 ; break;
case  495 : nInt =  -1 ; break;
case  496 : nInt =  -1 ; break;
case  497 : nInt =  -1 ; break;
case  498 : nInt =  -1 ; break;
case  499 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
case  500 : nInt =  -1 ; break;
case  501 : nInt =  -1 ; break;
case  502 : nInt =  -1 ; break;
case  503 : nInt =  -1 ; break;
case  504 : nInt =  -1 ; break;
case  505 : nInt =  -1 ; break;
case  506 : nInt =  -1 ; break;
case  507 : nInt =  -1 ; break;
case  508 : nInt =  -1 ; break;
case  509 : nInt =  -1 ; break;
case  510 : nInt =  -1 ; break;
case  511 : nInt =  -1 ; break;
case  512 : nInt =  -1 ; break;
case  513 : nInt =  -1 ; break;
case  514 : nInt =  -1 ; break;
case  515 : nInt =  -1 ; break;
case  516 : nInt =  -1 ; break;
case  517 : nInt =  -1 ; break;
case  518 : nInt =  -1 ; break;
case  519 : nInt =  -1 ; break;
case  520 : nInt =  -1 ; break;
case  521 : nInt =  -1 ; break;
case  522 : nInt =  -1 ; break;
case  523 : nInt =  -1 ; break;
case  524 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
case  525 : nInt =  -1 ; break;
case  526 : nInt =  -1 ; break;
case  527 : nInt =  -1 ; break;
case  528 : nInt =  -1 ; break;
case  529 : nInt =  -1 ; break;
case  530 : nInt =  -1 ; break;
case  531 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  584 : nInt =  -1 ; break;
case  586 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  610 : nInt =  -1 ; break;
case  611 : nInt =  -1 ; break;
case  612 : nInt =  -1 ; break;
case  613 : nInt =  -1 ; break;
case  614 : nInt =  -1 ; break;
case  615 : nInt =  -1 ; break;
case  616 : nInt =  -1 ; break;
case  617 : nInt =  -1 ; break;
case  619 : nInt =  -1 ; break;
case  620 : nInt =  -1 ; break;
case  621 : nInt =  -1 ; break;
case  622 : nInt =  -1 ; break;
case  623 : nInt =  -1 ; break;
case  624 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
case  625 : nInt =  -1 ; break;
case  626 : nInt =  -1 ; break;
case  627 : nInt =  -1 ; break;
case  628 : nInt =  -1 ; break;
case  629 : nInt =  -1 ; break;
case  630 : nInt =  -1 ; break;
case  631 : nInt =  -1 ; break;
case  632 : nInt =  -1 ; break;
case  633 : nInt =  -1 ; break;
case  634 : nInt =  -1 ; break;
case  635 : nInt =  -1 ; break;
case  636 : nInt =  -1 ; break;
case  637 : nInt =  -1 ; break;
case  638 : nInt =  -1 ; break;
case  639 : nInt =  -1 ; break;
case  640 : nInt =  -1 ; break;
case  641 : nInt =  -1 ; break;
case  642 : nInt =  -1 ; break;
case  643 : nInt =  -1 ; break;
case  644 : nInt =  -1 ; break;
case  645 : nInt =  -1 ; break;
case  646 : nInt =  -1 ; break;
case  647 : nInt =  -1 ; break;
case  648 : nInt =  -1 ; break;
case  649 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
case  650 : nInt =  -1 ; break;
case  651 : nInt =  -1 ; break;
case  652 : nInt =  -1 ; break;
case  653 : nInt =  -1 ; break;
case  654 : nInt =  -1 ; break;
case  655 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
case  710 : nInt =  -1 ; break;
case  711 : nInt =  -1 ; break;
case  712 : nInt =  -1 ; break;
case  713 : nInt =  -1 ; break;
case  714 : nInt =  -1 ; break;
case  715 : nInt =  -1 ; break;
case  716 : nInt =  -1 ; break;
case  717 : nInt =  -1 ; break;
case  718 : nInt =  -1 ; break;
case  719 : nInt =  -1 ; break;
case  720 : nInt =  -1 ; break;
case  721 : nInt =  -1 ; break;
case  722 : nInt =  -1 ; break;
case  723 : nInt =  -1 ; break;
case  724 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
case  725 : nInt =  -1 ; break;
case  726 : nInt =  -1 ; break;
case  727 : nInt =  -1 ; break;
case  728 : nInt =  -1 ; break;
case  729 : nInt =  -1 ; break;
case  730 : nInt =  -1 ; break;
case  731 : nInt =  -1 ; break;
case  732 : nInt =  -1 ; break;
case  733 : nInt =  -1 ; break;
case  734 : nInt =  -1 ; break;
case  735 : nInt =  -1 ; break;
case  736 : nInt =  -1 ; break;
case  737 : nInt =  -1 ; break;
case  738 : nInt =  -1 ; break;
case  739 : nInt =  -1 ; break;
case  740 : nInt =  -1 ; break;
case  741 : nInt =  -1 ; break;
case  742 : nInt =  -1 ; break;
case  743 : nInt =  -1 ; break;
case  744 : nInt =  -1 ; break;
case  745 : nInt =  -1 ; break;
case  746 : nInt =  -1 ; break;
case  747 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  754 : nInt =  -1 ; break;
case  755 : nInt =  -1 ; break;
case  756 : nInt =  -1 ; break;
case  757 : nInt =  -1 ; break;
case  758 : nInt =  -1 ; break;
case  759 : nInt =  -1 ; break;
case  760 : nInt =  -1 ; break;
case  761 : nInt =  -1 ; break;
case  762 : nInt =  -1 ; break;
case  763 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
case  824 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
case  825 : nInt =  -1 ; break;
case  826 : nInt =  -1 ; break;
case  827 : nInt =  -1 ; break;
case  828 : nInt =  -1 ; break;
case  829 : nInt =  -1 ; break;
case  830 : nInt =  -1 ; break;
case  831 : nInt =  -1 ; break;
case  832 : nInt =  -1 ; break;
case  833 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  854 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
case  944 : nInt =  3 ; break;
case  945 : nInt =  1 ; break;
case  946 : nInt =  5 ; break;
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  955 : nInt =  -1 ; break;
case  956 : nInt =  -1 ; break;
case  958 : nInt =  -1 ; break;
case  972 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  995 : nInt =  -1 ; break;
case  996 : nInt =  -1 ; break;
case  997 : nInt =  -1 ; break;
case  999 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_PALEMASTER:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  8 : nInt =  -1 ; break;
case 11 : nInt =  -1 ; break; //feat Empower Spell added to standard Bioware 2da data
case 12 : nInt =  -1 ; break; //feat Extend Spell added to standard Bioware 2da data
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case 25 : nInt =  -1 ; break; //feat Maximize Spell added to standard Bioware 2da data
case 29 : nInt =  -1 ; break; //feat Quicken Spell added to standard Bioware 2da data
case 35 : nInt =  -1 ; break; //feat Spell Focus Abjuration added to standard Bioware 2da data
case 36 : nInt =  -1 ; break; //feat Spell Penetration added to standard Bioware 2da data
case 37 : nInt =  -1 ; break; //feat Still Spell added to standard Bioware 2da data
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
case 166 : nInt =  -1 ; break; //feat Spell Focus Conjuration added to standard Bioware 2da data
case 167 : nInt =  -1 ; break; //feat Spell Focus Divination added to standard Bioware 2da data
case 168 : nInt =  -1 ; break; //feat Spell Focus Enchantment added to standard Bioware 2da data
case 169 : nInt =  -1 ; break; //feat Spell Focus Evocation added to standard Bioware 2da data
case 170 : nInt =  -1 ; break; //feat Spell Focus Illusion added to standard Bioware 2da data
case 171 : nInt =  -1 ; break; //feat Spell Focus Necromancy added to standard Bioware 2da data
case 172 : nInt =  -1 ; break; //feat Spell Focus Transmutation added to standard Bioware 2da data
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
case  228 : nInt =  3 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
case 393 : nInt =  -1 ; break; //feat Greater Spell Focus Abjuration added to standard Bioware 2da data
case 394 : nInt =  -1 ; break; //feat Greater Spell Focus Conjuration added to standard Bioware 2da data
case 395 : nInt =  -1 ; break; //feat Greater Spell Focus Divination added to standard Bioware 2da data
case 396 : nInt =  -1 ; break; //feat Greater Spell Focus Enchantment added to standard Bioware 2da data
case 397 : nInt =  -1 ; break; //feat Greater Spell Focus Evocation added to standard Bioware 2da data
case 398 : nInt =  -1 ; break; //feat Greater Spell Focus Illusion added to standard Bioware 2da data
case 399 : nInt =  -1 ; break; //feat Greater Spell Focus Necromancy added to standard Bioware 2da data
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
case 400 : nInt =  -1 ; break; //feat Greater Spell Focus Transmutation added to standard Bioware 2da data
case 401 : nInt =  -1 ; break; //feat Greater Spell Penetration added to standard Bioware 2da data
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  491 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
case  533 : nInt =  -1 ; break;
case  534 : nInt =  -1 ; break;
case  535 : nInt =  -1 ; break;
case  536 : nInt =  -1 ; break;
case  537 : nInt =  -1 ; break;
case  538 : nInt =  -1 ; break;
case  539 : nInt =  -1 ; break;
case  540 : nInt =  -1 ; break;
case  541 : nInt =  -1 ; break;
case  542 : nInt =  -1 ; break;
case  543 : nInt =  -1 ; break;
case  544 : nInt =  -1 ; break;
case  545 : nInt =  -1 ; break;
case  546 : nInt =  -1 ; break;
case  547 : nInt =  -1 ; break;
case  548 : nInt =  -1 ; break;
case  549 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
case  550 : nInt =  -1 ; break;
case  551 : nInt =  -1 ; break;
case  552 : nInt =  -1 ; break;
case  553 : nInt =  -1 ; break;
case  554 : nInt =  -1 ; break;
case  555 : nInt =  -1 ; break;
case  556 : nInt =  -1 ; break;
case  557 : nInt =  -1 ; break;
case  558 : nInt =  -1 ; break;
case  559 : nInt =  -1 ; break;
case  560 : nInt =  -1 ; break;
case  561 : nInt =  -1 ; break;
case  562 : nInt =  -1 ; break;
case  563 : nInt =  -1 ; break;
case  564 : nInt =  -1 ; break;
case  565 : nInt =  -1 ; break;
case  566 : nInt =  -1 ; break;
case  567 : nInt =  -1 ; break;
case  568 : nInt =  -1 ; break;
case  569 : nInt =  -1 ; break;
case  570 : nInt =  -1 ; break;
case  571 : nInt =  -1 ; break;
case  572 : nInt =  -1 ; break;
case  573 : nInt =  -1 ; break;
case  574 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  575 : nInt =  -1 ; break;
case  576 : nInt =  -1 ; break;
case  577 : nInt =  -1 ; break;
case  578 : nInt =  -1 ; break;
case  579 : nInt =  -1 ; break;
case  580 : nInt =  -1 ; break;
case  581 : nInt =  -1 ; break;
case  582 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  610 : nInt =  -1 ; break;
case  611 : nInt =  -1 ; break;
case  612 : nInt =  -1 ; break;
case  613 : nInt =  -1 ; break;
case  614 : nInt =  -1 ; break;
case  615 : nInt =  -1 ; break;
case  616 : nInt =  -1 ; break;
case  617 : nInt =  -1 ; break;
case  618 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  857 : nInt =  -1 ; break;
case  858 : nInt =  -1 ; break;
case  859 : nInt =  -1 ; break;
case  860 : nInt =  -1 ; break;
case  861 : nInt =  -1 ; break;
case  862 : nInt =  -1 ; break;
case  863 : nInt =  -1 ; break;
case  864 : nInt =  -1 ; break;
case  865 : nInt =  -1 ; break;
case  874 : nInt =  15 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
case  875 : nInt =  15 ; break;
case  876 : nInt =  15 ; break;
case  877 : nInt =  15 ; break;
case  878 : nInt =  15 ; break;
case  886 : nInt =  1 ; break;
case  889 : nInt =  2 ; break;
case  890 : nInt =  4 ; break;
case  891 : nInt =  5 ; break;
case  892 : nInt =  6 ; break;
case  893 : nInt =  8 ; break;
case  894 : nInt =  7 ; break;
case  895 : nInt =  9 ; break;
case  896 : nInt =  10 ; break;
case  897 : nInt =  10 ; break;
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  984 : nInt =  11 ; break;
case  990 : nInt =  15 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_RANGER:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  3 : nInt =  1 ; break;
case  4 : nInt =  1 ; break;
case  8 : nInt =  -1 ; break;
case  20 : nInt =  9 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  32 : nInt =  1 ; break;
case  34 : nInt =  -1 ; break;
case  35 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
case  166 : nInt =  -1 ; break;
case  167 : nInt =  -1 ; break;
case  168 : nInt =  -1 ; break;
case  169 : nInt =  -1 ; break;
case  170 : nInt =  -1 ; break;
case  171 : nInt =  -1 ; break;
case  172 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
case  199 : nInt =  6 ; break;
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
case  201 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
case  261 : nInt =  -1 ; break;
case  262 : nInt =  -1 ; break;
case  263 : nInt =  -1 ; break;
case  264 : nInt =  -1 ; break;
case  265 : nInt =  -1 ; break;
case  266 : nInt =  -1 ; break;
case  267 : nInt =  -1 ; break;
case  268 : nInt =  -1 ; break;
case  269 : nInt =  -1 ; break;
case  270 : nInt =  -1 ; break;
case  271 : nInt =  -1 ; break;
case  272 : nInt =  -1 ; break;
case  273 : nInt =  -1 ; break;
case  274 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
case  275 : nInt =  -1 ; break;
case  276 : nInt =  -1 ; break;
case  277 : nInt =  -1 ; break;
case  278 : nInt =  -1 ; break;
case  279 : nInt =  -1 ; break;
case  280 : nInt =  -1 ; break;
case  281 : nInt =  -1 ; break;
case  284 : nInt =  -1 ; break;
case  285 : nInt =  -1 ; break;
case  286 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
case  374 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
case  393 : nInt =  -1 ; break;
case  394 : nInt =  -1 ; break;
case  395 : nInt =  -1 ; break;
case  396 : nInt =  -1 ; break;
case  397 : nInt =  -1 ; break;
case  398 : nInt =  -1 ; break;
case  399 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
case  400 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  491 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  584 : nInt =  -1 ; break;
case  587 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  610 : nInt =  -1 ; break;
case  611 : nInt =  -1 ; break;
case  612 : nInt =  -1 ; break;
case  613 : nInt =  -1 ; break;
case  614 : nInt =  -1 ; break;
case  615 : nInt =  -1 ; break;
case  616 : nInt =  -1 ; break;
case  617 : nInt =  -1 ; break;
case  619 : nInt =  -1 ; break;
case  620 : nInt =  -1 ; break;
case  621 : nInt =  -1 ; break;
case  622 : nInt =  -1 ; break;
case  623 : nInt =  -1 ; break;
case  624 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
case  625 : nInt =  -1 ; break;
case  626 : nInt =  -1 ; break;
case  627 : nInt =  -1 ; break;
case  628 : nInt =  -1 ; break;
case  629 : nInt =  -1 ; break;
case  630 : nInt =  -1 ; break;
case  631 : nInt =  -1 ; break;
case  632 : nInt =  -1 ; break;
case  633 : nInt =  -1 ; break;
case  634 : nInt =  -1 ; break;
case  635 : nInt =  -1 ; break;
case  636 : nInt =  -1 ; break;
case  637 : nInt =  -1 ; break;
case  638 : nInt =  -1 ; break;
case  639 : nInt =  -1 ; break;
case  640 : nInt =  -1 ; break;
case  641 : nInt =  -1 ; break;
case  642 : nInt =  -1 ; break;
case  643 : nInt =  -1 ; break;
case  644 : nInt =  -1 ; break;
case  645 : nInt =  -1 ; break;
case  646 : nInt =  -1 ; break;
case  647 : nInt =  -1 ; break;
case  648 : nInt =  -1 ; break;
case  649 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
case  650 : nInt =  -1 ; break;
case  651 : nInt =  -1 ; break;
case  652 : nInt =  -1 ; break;
case  653 : nInt =  -1 ; break;
case  654 : nInt =  -1 ; break;
case  655 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
case  747 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  754 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
case  755 : nInt =  -1 ; break;
case  756 : nInt =  -1 ; break;
case  757 : nInt =  -1 ; break;
case  758 : nInt =  -1 ; break;
case  759 : nInt =  -1 ; break;
case  760 : nInt =  -1 ; break;
case  761 : nInt =  -1 ; break;
case  762 : nInt =  -1 ; break;
case  763 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  855 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
case  944 : nInt =  3 ; break;
case  945 : nInt =  1 ; break;
case  946 : nInt =  5 ; break;
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  956 : nInt =  -1 ; break;
case  973 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  997 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_ROGUE:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  3 : nInt =  1 ; break;
case  8 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  -1 ; break;
case  46 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
case  50 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
case  193 : nInt =  -1 ; break;
case  195 : nInt =  3 ; break;
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
case  206 : nInt =  2 ; break;
case  212 : nInt =  -1 ; break;
case  221 : nInt =  1 ; break;
case  222 : nInt =  -1 ; break;
case  223 : nInt =  -1 ; break;
case  224 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
case  225 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
case  251 : nInt =  6 ; break;
case  252 : nInt =  11 ; break;
case  253 : nInt =  14 ; break;
case  254 : nInt =  17 ; break;
case  255 : nInt =  20 ; break;
case  259 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
case  345 : nInt =  3 ; break;
case  346 : nInt =  5 ; break;
case  347 : nInt =  7 ; break;
case  348 : nInt =  9 ; break;
case  349 : nInt =  11 ; break;
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
case  350 : nInt =  13 ; break;
case  351 : nInt =  15 ; break;
case  352 : nInt =  17 ; break;
case  353 : nInt =  19 ; break;
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  491 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  586 : nInt =  -1 ; break;
case  588 : nInt =  -1 ; break;
case  589 : nInt =  -1 ; break;
case  590 : nInt =  -1 ; break;
case  591 : nInt =  -1 ; break;
case  592 : nInt =  -1 ; break;
case  593 : nInt =  -1 ; break;
case  594 : nInt =  -1 ; break;
case  595 : nInt =  -1 ; break;
case  596 : nInt =  -1 ; break;
case  597 : nInt =  -1 ; break;
case  598 : nInt =  -1 ; break;
case  599 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  601 : nInt =  -1 ; break;
case  602 : nInt =  -1 ; break;
case  603 : nInt =  -1 ; break;
case  604 : nInt =  -1 ; break;
case  605 : nInt =  -1 ; break;
case  606 : nInt =  -1 ; break;
case  607 : nInt =  -1 ; break;
case  608 : nInt =  -1 ; break;
case  609 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
case  748 : nInt =  -1 ; break;
case  749 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  750 : nInt =  -1 ; break;
case  751 : nInt =  -1 ; break;
case  752 : nInt =  -1 ; break;
case  753 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
case  834 : nInt =  -1 ; break;
case  835 : nInt =  -1 ; break;
case  836 : nInt =  -1 ; break;
case  837 : nInt =  -1 ; break;
case  838 : nInt =  -1 ; break;
case  839 : nInt =  -1 ; break;
case  840 : nInt =  -1 ; break;
case  841 : nInt =  -1 ; break;
case  842 : nInt =  -1 ; break;
case  843 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  856 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
case  913 : nInt =  -1 ; break;
case  914 : nInt =  -1 ; break;
case  917 : nInt =  -1 ; break;
case  918 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  974 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
case  1032 : nInt =  21 ; break;
case  1033 : nInt =  23 ; break;
case  1034 : nInt =  25 ; break;
case  1035 : nInt =  27 ; break;
case  1036 : nInt =  29 ; break;
case  1037 : nInt =  31 ; break;
case  1038 : nInt =  33 ; break;
case  1039 : nInt =  35 ; break;
case  1040 : nInt =  37 ; break;
case  1041 : nInt =  39 ; break;
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_SHADOWDANCER:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  3 : nInt =  1 ; break;
case  8 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  29 : nInt =  -1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  -1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
case  195 : nInt =  2 ; break;
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
case  206 : nInt =  2 ; break;
case  212 : nInt =  10 ; break;
case  223 : nInt =  5 ; break;
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
case  228 : nInt =  2 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
case  252 : nInt =  10 ; break;
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
case  433 : nInt =  1 ; break;
case  434 : nInt =  3 ; break;
case  435 : nInt =  3 ; break;
case  436 : nInt =  4 ; break;
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  491 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  585 : nInt =  -1 ; break;
case  588 : nInt =  -1 ; break;
case  589 : nInt =  -1 ; break;
case  590 : nInt =  -1 ; break;
case  591 : nInt =  -1 ; break;
case  592 : nInt =  -1 ; break;
case  593 : nInt =  -1 ; break;
case  594 : nInt =  -1 ; break;
case  595 : nInt =  -1 ; break;
case  596 : nInt =  -1 ; break;
case  597 : nInt =  -1 ; break;
case  598 : nInt =  -1 ; break;
case  599 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  601 : nInt =  -1 ; break;
case  602 : nInt =  -1 ; break;
case  603 : nInt =  -1 ; break;
case  604 : nInt =  -1 ; break;
case  605 : nInt =  -1 ; break;
case  606 : nInt =  -1 ; break;
case  607 : nInt =  -1 ; break;
case  608 : nInt =  -1 ; break;
case  609 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
case  748 : nInt =  -1 ; break;
case  749 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  750 : nInt =  -1 ; break;
case  751 : nInt =  -1 ; break;
case  752 : nInt =  -1 ; break;
case  753 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  856 : nInt =  -1 ; break;
case  868 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
case  913 : nInt =  -1 ; break;
case  914 : nInt =  -1 ; break;
case  917 : nInt =  -1 ; break;
case  918 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  980 : nInt =  11 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
case  1002 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_SHIFTER:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  8 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  491 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
case  533 : nInt =  -1 ; break;
case  534 : nInt =  -1 ; break;
case  535 : nInt =  -1 ; break;
case  536 : nInt =  -1 ; break;
case  537 : nInt =  -1 ; break;
case  538 : nInt =  -1 ; break;
case  539 : nInt =  -1 ; break;
case  540 : nInt =  -1 ; break;
case  541 : nInt =  -1 ; break;
case  542 : nInt =  -1 ; break;
case  543 : nInt =  -1 ; break;
case  544 : nInt =  -1 ; break;
case  545 : nInt =  -1 ; break;
case  546 : nInt =  -1 ; break;
case  547 : nInt =  -1 ; break;
case  548 : nInt =  -1 ; break;
case  549 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
case  550 : nInt =  -1 ; break;
case  551 : nInt =  -1 ; break;
case  552 : nInt =  -1 ; break;
case  553 : nInt =  -1 ; break;
case  554 : nInt =  -1 ; break;
case  555 : nInt =  -1 ; break;
case  556 : nInt =  -1 ; break;
case  557 : nInt =  -1 ; break;
case  558 : nInt =  -1 ; break;
case  559 : nInt =  -1 ; break;
case  560 : nInt =  -1 ; break;
case  561 : nInt =  -1 ; break;
case  562 : nInt =  -1 ; break;
case  563 : nInt =  -1 ; break;
case  564 : nInt =  -1 ; break;
case  565 : nInt =  -1 ; break;
case  566 : nInt =  -1 ; break;
case  567 : nInt =  -1 ; break;
case  568 : nInt =  -1 ; break;
case  569 : nInt =  -1 ; break;
case  570 : nInt =  -1 ; break;
case  571 : nInt =  -1 ; break;
case  572 : nInt =  -1 ; break;
case  573 : nInt =  -1 ; break;
case  574 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  575 : nInt =  -1 ; break;
case  576 : nInt =  -1 ; break;
case  577 : nInt =  -1 ; break;
case  578 : nInt =  -1 ; break;
case  579 : nInt =  -1 ; break;
case  580 : nInt =  -1 ; break;
case  581 : nInt =  -1 ; break;
case  582 : nInt =  -1 ; break;
case  587 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  610 : nInt =  -1 ; break;
case  611 : nInt =  -1 ; break;
case  612 : nInt =  -1 ; break;
case  613 : nInt =  -1 ; break;
case  614 : nInt =  -1 ; break;
case  615 : nInt =  -1 ; break;
case  616 : nInt =  -1 ; break;
case  617 : nInt =  -1 ; break;
case  618 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
case  804 : nInt =  -1 ; break;
case  805 : nInt =  -1 ; break;
case  806 : nInt =  -1 ; break;
case  807 : nInt =  -1 ; break;
case  808 : nInt =  -1 ; break;
case  809 : nInt =  -1 ; break;
case  810 : nInt =  -1 ; break;
case  811 : nInt =  -1 ; break;
case  812 : nInt =  -1 ; break;
case  813 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
case  857 : nInt =  -1 ; break;
case  858 : nInt =  -1 ; break;
case  859 : nInt =  -1 ; break;
case  860 : nInt =  -1 ; break;
case  861 : nInt =  -1 ; break;
case  862 : nInt =  -1 ; break;
case  863 : nInt =  -1 ; break;
case  864 : nInt =  -1 ; break;
case  865 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  872 : nInt =  -1 ; break;
case  873 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
case  898 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
case  900 : nInt =  3 ; break;
case  901 : nInt =  5 ; break;
case  902 : nInt =  7 ; break;
case  903 : nInt =  10 ; break;
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
case  944 : nInt =  3 ; break;
case  945 : nInt =  1 ; break;
case  946 : nInt =  5 ; break;
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  986 : nInt =  11 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
case  1060 : nInt =  -1 ; break;
case  1061 : nInt =  -1 ; break;
case  1062 : nInt =  4 ; break;
case  1063 : nInt =  7 ; break;
case  1064 : nInt =  10 ; break;
case  1065 : nInt =  16 ; break;
case  1066 : nInt =  13 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_SORCERER:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  8 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  29 : nInt =  -1 ; break;
case  35 : nInt =  -1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  -1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
case  166 : nInt =  -1 ; break;
case  167 : nInt =  -1 ; break;
case  168 : nInt =  -1 ; break;
case  169 : nInt =  -1 ; break;
case  170 : nInt =  -1 ; break;
case  171 : nInt =  -1 ; break;
case  172 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
case  303 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  491 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
case  533 : nInt =  -1 ; break;
case  534 : nInt =  -1 ; break;
case  535 : nInt =  -1 ; break;
case  536 : nInt =  -1 ; break;
case  537 : nInt =  -1 ; break;
case  538 : nInt =  -1 ; break;
case  539 : nInt =  -1 ; break;
case  540 : nInt =  -1 ; break;
case  541 : nInt =  -1 ; break;
case  542 : nInt =  -1 ; break;
case  543 : nInt =  -1 ; break;
case  544 : nInt =  -1 ; break;
case  545 : nInt =  -1 ; break;
case  546 : nInt =  -1 ; break;
case  547 : nInt =  -1 ; break;
case  548 : nInt =  -1 ; break;
case  549 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
case  550 : nInt =  -1 ; break;
case  551 : nInt =  -1 ; break;
case  552 : nInt =  -1 ; break;
case  553 : nInt =  -1 ; break;
case  554 : nInt =  -1 ; break;
case  555 : nInt =  -1 ; break;
case  556 : nInt =  -1 ; break;
case  557 : nInt =  -1 ; break;
case  558 : nInt =  -1 ; break;
case  559 : nInt =  -1 ; break;
case  560 : nInt =  -1 ; break;
case  561 : nInt =  -1 ; break;
case  562 : nInt =  -1 ; break;
case  563 : nInt =  -1 ; break;
case  564 : nInt =  -1 ; break;
case  565 : nInt =  -1 ; break;
case  566 : nInt =  -1 ; break;
case  567 : nInt =  -1 ; break;
case  568 : nInt =  -1 ; break;
case  569 : nInt =  -1 ; break;
case  570 : nInt =  -1 ; break;
case  571 : nInt =  -1 ; break;
case  572 : nInt =  -1 ; break;
case  573 : nInt =  -1 ; break;
case  574 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  575 : nInt =  -1 ; break;
case  576 : nInt =  -1 ; break;
case  577 : nInt =  -1 ; break;
case  578 : nInt =  -1 ; break;
case  579 : nInt =  -1 ; break;
case  580 : nInt =  -1 ; break;
case  581 : nInt =  -1 ; break;
case  582 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  610 : nInt =  -1 ; break;
case  611 : nInt =  -1 ; break;
case  612 : nInt =  -1 ; break;
case  613 : nInt =  -1 ; break;
case  614 : nInt =  -1 ; break;
case  615 : nInt =  -1 ; break;
case  616 : nInt =  -1 ; break;
case  617 : nInt =  -1 ; break;
case  618 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  764 : nInt =  -1 ; break;
case  765 : nInt =  -1 ; break;
case  766 : nInt =  -1 ; break;
case  767 : nInt =  -1 ; break;
case  768 : nInt =  -1 ; break;
case  769 : nInt =  -1 ; break;
case  770 : nInt =  -1 ; break;
case  771 : nInt =  -1 ; break;
case  772 : nInt =  -1 ; break;
case  773 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  857 : nInt =  -1 ; break;
case  858 : nInt =  -1 ; break;
case  859 : nInt =  -1 ; break;
case  860 : nInt =  -1 ; break;
case  861 : nInt =  -1 ; break;
case  862 : nInt =  -1 ; break;
case  863 : nInt =  -1 ; break;
case  864 : nInt =  -1 ; break;
case  865 : nInt =  -1 ; break;
case  874 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
case  875 : nInt =  21 ; break;
case  876 : nInt =  21 ; break;
case  877 : nInt =  21 ; break;
case  878 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
case  944 : nInt =  3 ; break;
case  945 : nInt =  1 ; break;
case  946 : nInt =  5 ; break;
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
 default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  975 : nInt =  21 ; break;
case  990 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_WIZARD:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  7 : nInt =  -1 ; break;
case  8 : nInt =  -1 ; break;
case  11 : nInt =  -1 ; break;
case  12 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  25 : nInt =  -1 ; break;
case  29 : nInt =  -1 ; break;
case  33 : nInt =  -1 ; break;
case  35 : nInt =  -1 ; break;
case  36 : nInt =  -1 ; break;
case  37 : nInt =  -1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  -1 ; break;
case  46 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
case  51 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
case  166 : nInt =  -1 ; break;
case  167 : nInt =  -1 ; break;
case  168 : nInt =  -1 ; break;
case  169 : nInt =  -1 ; break;
case  170 : nInt =  -1 ; break;
case  171 : nInt =  -1 ; break;
case  172 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
case  303 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
case  393 : nInt =  -1 ; break;
case  394 : nInt =  -1 ; break;
case  395 : nInt =  -1 ; break;
case  396 : nInt =  -1 ; break;
case  397 : nInt =  -1 ; break;
case  398 : nInt =  -1 ; break;
case  399 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
case  400 : nInt =  -1 ; break;
case  401 : nInt =  -1 ; break;
case  415 : nInt =  -1 ; break;
case  416 : nInt =  -1 ; break;
case  417 : nInt =  -1 ; break;
case  418 : nInt =  -1 ; break;
case  419 : nInt =  -1 ; break;
case  420 : nInt =  -1 ; break;
case  421 : nInt =  -1 ; break;
case  422 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  491 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  610 : nInt =  -1 ; break;
case  611 : nInt =  -1 ; break;
case  612 : nInt =  -1 ; break;
case  613 : nInt =  -1 ; break;
case  614 : nInt =  -1 ; break;
case  615 : nInt =  -1 ; break;
case  616 : nInt =  -1 ; break;
case  617 : nInt =  -1 ; break;
case  618 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
case  794 : nInt =  -1 ; break;
case  795 : nInt =  -1 ; break;
case  796 : nInt =  -1 ; break;
case  797 : nInt =  -1 ; break;
case  798 : nInt =  -1 ; break;
case  799 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
case  800 : nInt =  -1 ; break;
case  801 : nInt =  -1 ; break;
case  802 : nInt =  -1 ; break;
case  803 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  857 : nInt =  -1 ; break;
case  858 : nInt =  -1 ; break;
case  859 : nInt =  -1 ; break;
case  860 : nInt =  -1 ; break;
case  861 : nInt =  -1 ; break;
case  862 : nInt =  -1 ; break;
case  863 : nInt =  -1 ; break;
case  864 : nInt =  -1 ; break;
case  865 : nInt =  -1 ; break;
case  874 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
case  875 : nInt =  21 ; break;
case  876 : nInt =  21 ; break;
case  877 : nInt =  21 ; break;
case  878 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
case  944 : nInt =  3 ; break;
case  945 : nInt =  1 ; break;
case  946 : nInt =  5 ; break;
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  976 : nInt =  21 ; break;
case  990 : nInt =  21 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_WEAPON_MASTER:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  8 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  -1 ; break;
case  46 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){

default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
case  490 : nInt =  -1 ; break;
case  491 : nInt =  -1 ; break;
case  492 : nInt =  -1 ; break;
case  493 : nInt =  -1 ; break;
case  494 : nInt =  -1 ; break;
case  495 : nInt =  -1 ; break;
case  496 : nInt =  -1 ; break;
case  497 : nInt =  -1 ; break;
case  498 : nInt =  -1 ; break;
case  499 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
case  500 : nInt =  -1 ; break;
case  501 : nInt =  -1 ; break;
case  502 : nInt =  -1 ; break;
case  503 : nInt =  -1 ; break;
case  504 : nInt =  -1 ; break;
case  505 : nInt =  -1 ; break;
case  506 : nInt =  -1 ; break;
case  507 : nInt =  -1 ; break;
case  508 : nInt =  -1 ; break;
case  509 : nInt =  -1 ; break;
case  510 : nInt =  -1 ; break;
case  511 : nInt =  -1 ; break;
case  512 : nInt =  -1 ; break;
case  513 : nInt =  -1 ; break;
case  514 : nInt =  -1 ; break;
case  515 : nInt =  -1 ; break;
case  516 : nInt =  -1 ; break;
case  517 : nInt =  -1 ; break;
case  518 : nInt =  -1 ; break;
case  519 : nInt =  -1 ; break;
case  520 : nInt =  -1 ; break;
case  521 : nInt =  -1 ; break;
case  522 : nInt =  -1 ; break;
case  523 : nInt =  -1 ; break;
case  524 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
case  525 : nInt =  -1 ; break;
case  526 : nInt =  -1 ; break;
case  527 : nInt =  -1 ; break;
case  528 : nInt =  -1 ; break;
case  529 : nInt =  -1 ; break;
case  530 : nInt =  -1 ; break;
case  531 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  584 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  619 : nInt =  -1 ; break;
case  620 : nInt =  -1 ; break;
case  621 : nInt =  -1 ; break;
case  622 : nInt =  -1 ; break;
case  623 : nInt =  -1 ; break;
case  624 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
case  625 : nInt =  -1 ; break;
case  626 : nInt =  -1 ; break;
case  627 : nInt =  -1 ; break;
case  628 : nInt =  -1 ; break;
case  629 : nInt =  -1 ; break;
case  630 : nInt =  -1 ; break;
case  631 : nInt =  -1 ; break;
case  632 : nInt =  -1 ; break;
case  633 : nInt =  -1 ; break;
case  634 : nInt =  -1 ; break;
case  635 : nInt =  -1 ; break;
case  636 : nInt =  -1 ; break;
case  637 : nInt =  -1 ; break;
case  638 : nInt =  -1 ; break;
case  639 : nInt =  -1 ; break;
case  640 : nInt =  -1 ; break;
case  641 : nInt =  -1 ; break;
case  642 : nInt =  -1 ; break;
case  643 : nInt =  -1 ; break;
case  644 : nInt =  -1 ; break;
case  645 : nInt =  -1 ; break;
case  646 : nInt =  -1 ; break;
case  647 : nInt =  -1 ; break;
case  648 : nInt =  -1 ; break;
case  649 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
case  650 : nInt =  -1 ; break;
case  651 : nInt =  -1 ; break;
case  652 : nInt =  -1 ; break;
case  653 : nInt =  -1 ; break;
case  654 : nInt =  -1 ; break;
case  655 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
case  709 : nInt =  -1 ; break;
case  710 : nInt =  -1 ; break;
case  711 : nInt =  -1 ; break;
case  712 : nInt =  -1 ; break;
case  713 : nInt =  -1 ; break;
case  714 : nInt =  -1 ; break;
case  715 : nInt =  -1 ; break;
case  716 : nInt =  -1 ; break;
case  717 : nInt =  -1 ; break;
case  718 : nInt =  -1 ; break;
case  719 : nInt =  -1 ; break;
case  720 : nInt =  -1 ; break;
case  721 : nInt =  -1 ; break;
case  722 : nInt =  -1 ; break;
case  723 : nInt =  -1 ; break;
case  724 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
case  725 : nInt =  -1 ; break;
case  726 : nInt =  -1 ; break;
case  727 : nInt =  -1 ; break;
case  728 : nInt =  -1 ; break;
case  729 : nInt =  -1 ; break;
case  730 : nInt =  -1 ; break;
case  731 : nInt =  -1 ; break;
case  732 : nInt =  -1 ; break;
case  733 : nInt =  -1 ; break;
case  734 : nInt =  -1 ; break;
case  735 : nInt =  -1 ; break;
case  736 : nInt =  -1 ; break;
case  737 : nInt =  -1 ; break;
case  738 : nInt =  -1 ; break;
case  739 : nInt =  -1 ; break;
case  740 : nInt =  -1 ; break;
case  741 : nInt =  -1 ; break;
case  742 : nInt =  -1 ; break;
case  743 : nInt =  -1 ; break;
case  744 : nInt =  -1 ; break;
case  745 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  753 : nInt =  -1 ; break;
case  754 : nInt =  -1 ; break;
case  755 : nInt =  -1 ; break;
case  756 : nInt =  -1 ; break;
case  757 : nInt =  -1 ; break;
case  758 : nInt =  -1 ; break;
case  759 : nInt =  -1 ; break;
case  760 : nInt =  -1 ; break;
case  761 : nInt =  -1 ; break;
case  762 : nInt =  -1 ; break;
case  763 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  854 : nInt =  -1 ; break;
case  868 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
case  879 : nInt =  1 ; break;
case  880 : nInt =  1 ; break;
case  881 : nInt =  1 ; break;
case  882 : nInt =  1 ; break;
case  883 : nInt =  5 ; break;
case  884 : nInt =  5 ; break;
case  885 : nInt =  7 ; break;
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
case  919 : nInt =  1 ; break;
case  920 : nInt =  1 ; break;
case  921 : nInt =  1 ; break;
case  922 : nInt =  1 ; break;
case  923 : nInt =  1 ; break;
case  924 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
case  925 : nInt =  1 ; break;
case  926 : nInt =  1 ; break;
case  927 : nInt =  1 ; break;
case  928 : nInt =  1 ; break;
case  929 : nInt =  1 ; break;
case  930 : nInt =  1 ; break;
case  931 : nInt =  1 ; break;
case  932 : nInt =  1 ; break;
case  933 : nInt =  1 ; break;
case  934 : nInt =  1 ; break;
case  935 : nInt =  1 ; break;
case  936 : nInt =  1 ; break;
case  937 : nInt =  1 ; break;
case  938 : nInt =  1 ; break;
case  939 : nInt =  1 ; break;
case  940 : nInt =  1 ; break;
case  941 : nInt =  1 ; break;
case  942 : nInt =  1 ; break;
case  943 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
case  955 : nInt =  -1 ; break;
case  956 : nInt =  -1 ; break;
case  958 : nInt =  -1 ; break;
case  959 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
case  983 : nInt =  11 ; break;
case  996 : nInt =  -1 ; break;
case  997 : nInt =  -1 ; break;
case  999 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
case  1000 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
case  1071 : nInt =  13 ; break;
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    case  CLASS_TYPE_HARPER:
        switch(nFeat/250)
        {
            case 0:
                switch(nFeat/25)
                {
                case 0: //0-24
                    switch(nFeat){
case  1 : nInt =  -1 ; break;
case  3 : nInt =  1 ; break;
case  8 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 1: //25-49
                    switch(nFeat){
case  29 : nInt =  -1 ; break;
case  41 : nInt =  -1 ; break;
case  44 : nInt =  -1 ; break;
case  45 : nInt =  -1 ; break;
case  46 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 2: //50-74
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 3: //75-99
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 4: //100-124
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 5: //125-149
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 6: //150-174
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 7: //175-199
                    switch(nFeat){
case  197 : nInt =  1 ; break;
default : nInt =  -2 ; break;}; break;
                case 8: //200-224
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 9: //225-249
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//250 break
            case 1:
                switch(nFeat/25)
                {
                case 10: //250-274
                    switch(nFeat){
case  261 : nInt =  -1 ; break;
case  262 : nInt =  -1 ; break;
case  263 : nInt =  -1 ; break;
case  264 : nInt =  -1 ; break;
case  265 : nInt =  -1 ; break;
case  266 : nInt =  -1 ; break;
case  267 : nInt =  -1 ; break;
case  268 : nInt =  -1 ; break;
case  269 : nInt =  -1 ; break;
case  270 : nInt =  -1 ; break;
case  271 : nInt =  -1 ; break;
case  272 : nInt =  -1 ; break;
case  273 : nInt =  -1 ; break;
case  274 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 11: //275-299
                    switch(nFeat){
case  275 : nInt =  -1 ; break;
case  276 : nInt =  -1 ; break;
case  277 : nInt =  -1 ; break;
case  278 : nInt =  -1 ; break;
case  279 : nInt =  -1 ; break;
case  280 : nInt =  -1 ; break;
case  281 : nInt =  -1 ; break;
case  284 : nInt =  -1 ; break;
case  285 : nInt =  -1 ; break;
case  286 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 12: //300-324
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 13: //325-349
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 14: //350-374
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 15: //375-399
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 16: //400-424
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 17: //425-449
                    switch(nFeat){
case  437 : nInt =  2 ; break;
case  438 : nInt =  3 ; break;
case  439 : nInt =  4 ; break;
case  440 : nInt =  5 ; break;
case  441 : nInt =  2 ; break;
case  442 : nInt =  3 ; break;
case  443 : nInt =  4 ; break;
case  444 : nInt =  5 ; break;
default : nInt =  -2 ; break;}; break;
                case 18: //450-474
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 19: //475-499
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//500 break
            case 2:
                switch(nFeat/25)
                {
                case 20: //500-524
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 21: //525-549
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 22: //550-574
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 23: //575-599
                    switch(nFeat){
case  588 : nInt =  -1 ; break;
case  589 : nInt =  -1 ; break;
case  590 : nInt =  -1 ; break;
case  591 : nInt =  -1 ; break;
case  592 : nInt =  -1 ; break;
case  593 : nInt =  -1 ; break;
case  594 : nInt =  -1 ; break;
case  595 : nInt =  -1 ; break;
case  596 : nInt =  -1 ; break;
case  597 : nInt =  -1 ; break;
case  598 : nInt =  -1 ; break;
case  599 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 24: //600-624
                    switch(nFeat){
case  601 : nInt =  -1 ; break;
case  602 : nInt =  -1 ; break;
case  603 : nInt =  -1 ; break;
case  604 : nInt =  -1 ; break;
case  605 : nInt =  -1 ; break;
case  606 : nInt =  -1 ; break;
case  607 : nInt =  -1 ; break;
case  608 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 25: //625-649
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 26: //650-674
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 27: //675-699
                    switch(nFeat){
case  695 : nInt =  -1 ; break;
case  696 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 28: //700-724
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 29: //725-749
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//750 break
            case 3:
                switch(nFeat/25)
                {
                case 30: //750-774
                    switch(nFeat){
case  764 : nInt =  -1 ; break;
case  765 : nInt =  -1 ; break;
case  766 : nInt =  -1 ; break;
case  767 : nInt =  -1 ; break;
case  768 : nInt =  -1 ; break;
case  769 : nInt =  -1 ; break;
case  770 : nInt =  -1 ; break;
case  771 : nInt =  -1 ; break;
case  772 : nInt =  -1 ; break;
case  773 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 31: //775-799
                    switch(nFeat){
case  784 : nInt =  -1 ; break;
case  785 : nInt =  -1 ; break;
case  786 : nInt =  -1 ; break;
case  787 : nInt =  -1 ; break;
case  788 : nInt =  -1 ; break;
case  789 : nInt =  -1 ; break;
case  790 : nInt =  -1 ; break;
case  791 : nInt =  -1 ; break;
case  792 : nInt =  -1 ; break;
case  793 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 32: //800-824
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 33: //825-849
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 34: //850-874
                    switch(nFeat){
case  870 : nInt =  -1 ; break;
case  871 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 35: //875-899
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 36: //900-924
                    switch(nFeat){
case  913 : nInt =  -1 ; break;
case  914 : nInt =  -1 ; break;
case  917 : nInt =  -1 ; break;
case  918 : nInt =  -1 ; break;
default : nInt =  -2 ; break;}; break;
                case 37: //925-949
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 38: //950-974
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 39: //975-999
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1000 break
            case 4:
                switch(nFeat/25)
                {
                case 40: //1000-1024
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 41: //1025-1049
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                case 42: //1050-1071
                    switch(nFeat){
default : nInt =  -2 ; break;}; break;
                }
            break;//1071 end break
        }
        return nInt; break;//class switch break/////////////////////////////////
    default: return -3;//wrong class int was input
}
return -3;//wrong input type
}

int GetIsGeneralFeat(int nFeat)
{
int nReturn = FALSE;
if (nFeat < 250)
    {
    if (nFeat < 50)
        {
        if (nFeat < 10)
            {
            switch (nFeat)
                {
case 0: nReturn = TRUE; break;
case 2: nReturn = TRUE; break;
case 3: nReturn = TRUE; break;
case 4: nReturn = TRUE; break;
case 5: nReturn = TRUE; break;
case 6: nReturn = TRUE; break;
case 7: nReturn = TRUE; break;
case 9: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 20)
            {
            switch (nFeat)
                {
case 10: nReturn = TRUE; break;
case 11: nReturn = TRUE; break;
case 12: nReturn = TRUE; break;
case 14: nReturn = TRUE; break;
case 15: nReturn = TRUE; break;
case 16: nReturn = TRUE; break;
case 17: nReturn = TRUE; break;
case 18: nReturn = TRUE; break;
case 19: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 30)
            {
            switch (nFeat)
                {
case 20: nReturn = TRUE; break;
case 21: nReturn = TRUE; break;
case 22: nReturn = TRUE; break;
case 23: nReturn = TRUE; break;
case 24: nReturn = TRUE; break;
case 25: nReturn = TRUE; break;
case 26: nReturn = TRUE; break;
case 27: nReturn = TRUE; break;
case 28: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 40)
            {
            switch (nFeat)
                {
case 30: nReturn = TRUE; break;
case 31: nReturn = TRUE; break;
case 32: nReturn = TRUE; break;
case 33: nReturn = TRUE; break;
case 36: nReturn = TRUE; break;
case 37: nReturn = TRUE; break;
case 39: nReturn = TRUE; break;
                }
            }
        else //<50
            {
            switch (nFeat)
                {
case 40: nReturn = TRUE; break;
case 42: nReturn = TRUE; break;
case 43: nReturn = TRUE; break;
                }
            }
        }
    else if (nFeat < 100)
        {
        if (nFeat < 60)
            {
            switch (nFeat)
                {
case 52: nReturn = TRUE; break;
case 53: nReturn = TRUE; break;
case 54: nReturn = TRUE; break;
case 55: nReturn = TRUE; break;
case 56: nReturn = TRUE; break;
case 57: nReturn = TRUE; break;
case 58: nReturn = TRUE; break;
case 59: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 70)
            {
            switch (nFeat)
                {
case 60: nReturn = TRUE; break;
case 61: nReturn = TRUE; break;
case 62: nReturn = TRUE; break;
case 63: nReturn = TRUE; break;
case 64: nReturn = TRUE; break;
case 65: nReturn = TRUE; break;
case 66: nReturn = TRUE; break;
case 67: nReturn = TRUE; break;
case 68: nReturn = TRUE; break;
case 69: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 80)
            {
            switch (nFeat)
                {
case 70: nReturn = TRUE; break;
case 71: nReturn = TRUE; break;
case 72: nReturn = TRUE; break;
case 73: nReturn = TRUE; break;
case 74: nReturn = TRUE; break;
case 75: nReturn = TRUE; break;
case 76: nReturn = TRUE; break;
case 77: nReturn = TRUE; break;
case 78: nReturn = TRUE; break;
case 79: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 90)
            {
            switch (nFeat)
                {
case 80: nReturn = TRUE; break;
case 82: nReturn = TRUE; break;
case 83: nReturn = TRUE; break;
case 84: nReturn = TRUE; break;
case 85: nReturn = TRUE; break;
case 87: nReturn = TRUE; break;
case 88: nReturn = TRUE; break;
case 89: nReturn = TRUE; break;
                }
            }
        else //<100
            {
            switch (nFeat)
                {
case 90: nReturn = TRUE; break;
case 91: nReturn = TRUE; break;
case 92: nReturn = TRUE; break;
case 93: nReturn = TRUE; break;
case 94: nReturn = TRUE; break;
case 95: nReturn = TRUE; break;
case 96: nReturn = TRUE; break;
case 97: nReturn = TRUE; break;
case 98: nReturn = TRUE; break;
case 99: nReturn = TRUE; break;
                }
            }
        }
    else if (nFeat < 150)
        {
        if (nFeat < 110)
            {
            switch (nFeat)
                {
case 100: nReturn = TRUE; break;
case 101: nReturn = TRUE; break;
case 102: nReturn = TRUE; break;
case 103: nReturn = TRUE; break;
case 104: nReturn = TRUE; break;
case 105: nReturn = TRUE; break;
case 106: nReturn = TRUE; break;
case 107: nReturn = TRUE; break;
case 108: nReturn = TRUE; break;
case 109: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 120)
            {
            switch (nFeat)
                {
case 110: nReturn = TRUE; break;
case 111: nReturn = TRUE; break;
case 112: nReturn = TRUE; break;
case 113: nReturn = TRUE; break;
case 114: nReturn = TRUE; break;
case 115: nReturn = TRUE; break;
case 116: nReturn = TRUE; break;
case 117: nReturn = TRUE; break;
case 118: nReturn = TRUE; break;
                }
            }
        else
            {
            switch (nFeat)
                {
case 120: nReturn = TRUE; break;
case 121: nReturn = TRUE; break;
case 122: nReturn = TRUE; break;
case 123: nReturn = TRUE; break;
case 125: nReturn = TRUE; break;
case 126: nReturn = TRUE; break;
case 127: nReturn = TRUE; break;
                }
            }
        }
    else
        {
        if (nFeat < 180)
            {
            switch (nFeat)
                {
case 173: nReturn = TRUE; break;
case 174: nReturn = TRUE; break;
case 175: nReturn = TRUE; break;
case 177: nReturn = TRUE; break;
case 178: nReturn = TRUE; break;
case 179: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 190)
            {
            switch (nFeat)
                {
case 180: nReturn = TRUE; break;
case 181: nReturn = TRUE; break;
case 182: nReturn = TRUE; break;
case 183: nReturn = TRUE; break;
case 184: nReturn = TRUE; break;
case 185: nReturn = TRUE; break;
case 186: nReturn = TRUE; break;
case 187: nReturn = TRUE; break;
case 188: nReturn = TRUE; break;
case 189: nReturn = TRUE; break;
                }
            }
        else //<200
            {
            switch (nFeat)
                {
case 190: nReturn = TRUE; break;
case 192: nReturn = TRUE; break;

                }
            }
        }
    }
else if (nFeat < 500)
    {
    if (nFeat < 400)
        {
        if (nFeat < 380)
            {
            switch (nFeat)
                {
case 377: nReturn = TRUE; break;
case 378: nReturn = TRUE; break;
case 379: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 390)
            {
            switch (nFeat)
                {
case 380: nReturn = TRUE; break;
case 381: nReturn = TRUE; break;
case 382: nReturn = TRUE; break;
case 383: nReturn = TRUE; break;
case 384: nReturn = TRUE; break;
//case 385: nReturn = TRUE; break;//this is feat "Small Talk", deleted in NWN
case 386: nReturn = TRUE; break;
case 387: nReturn = TRUE; break;
case 388: nReturn = TRUE; break;
case 389: nReturn = TRUE; break;
                }
            }
        else //<400
            {
            switch (nFeat)
                {
case 390: nReturn = TRUE; break;
case 391: nReturn = TRUE; break;
case 392: nReturn = TRUE; break;
case 393: nReturn = TRUE; break;
case 394: nReturn = TRUE; break;
case 395: nReturn = TRUE; break;
case 396: nReturn = TRUE; break;
case 397: nReturn = TRUE; break;
case 398: nReturn = TRUE; break;
case 399: nReturn = TRUE; break;
                }
            }
        }
    else if (nFeat < 450)
        {
        if (nFeat < 410)
            {
            switch (nFeat)
                {
case 400: nReturn = TRUE; break;
case 401: nReturn = TRUE; break;
case 402: nReturn = TRUE; break;
//case 403: nReturn = TRUE; break;//this is feat "Mercantile Background", deleted in NWN
case 404: nReturn = TRUE; break;
case 406: nReturn = TRUE; break;
case 407: nReturn = TRUE; break;
case 408: nReturn = TRUE; break;
case 409: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 420)
            {
            switch (nFeat)
                {
case 410: nReturn = TRUE; break;
case 411: nReturn = TRUE; break;
case 412: nReturn = TRUE; break;
case 415: nReturn = TRUE; break;
case 416: nReturn = TRUE; break;
case 417: nReturn = TRUE; break;
case 418: nReturn = TRUE; break;
case 419: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 430)
            {
            switch (nFeat)
                {
case 420: nReturn = TRUE; break;
case 421: nReturn = TRUE; break;
case 422: nReturn = TRUE; break;
case 425: nReturn = TRUE; break;
case 426: nReturn = TRUE; break;
case 427: nReturn = TRUE; break;
case 428: nReturn = TRUE; break;
case 429: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 440)
            {
            switch (nFeat)
                {
case 430: nReturn = TRUE; break;
case 431: nReturn = TRUE; break;
                }
            }
        }
    else //<500
        {
        switch (nFeat)
            {
case 490: nReturn = TRUE; break;
case 492: nReturn = TRUE; break;
case 493: nReturn = TRUE; break;
case 494: nReturn = TRUE; break;
case 495: nReturn = TRUE; break;
case 496: nReturn = TRUE; break;
case 497: nReturn = TRUE; break;
case 498: nReturn = TRUE; break;
case 499: nReturn = TRUE; break;
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
case 500: nReturn = TRUE; break;
case 501: nReturn = TRUE; break;
case 502: nReturn = TRUE; break;
case 503: nReturn = TRUE; break;
case 504: nReturn = TRUE; break;
case 505: nReturn = TRUE; break;
case 506: nReturn = TRUE; break;
case 507: nReturn = TRUE; break;
case 508: nReturn = TRUE; break;
case 509: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 520)
            {
            switch (nFeat)
                {
case 510: nReturn = TRUE; break;
case 511: nReturn = TRUE; break;
case 512: nReturn = TRUE; break;
case 513: nReturn = TRUE; break;
case 514: nReturn = TRUE; break;
case 515: nReturn = TRUE; break;
case 516: nReturn = TRUE; break;
case 517: nReturn = TRUE; break;
case 518: nReturn = TRUE; break;
case 519: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 530)
            {
            switch (nFeat)
                {
case 520: nReturn = TRUE; break;
case 521: nReturn = TRUE; break;
case 522: nReturn = TRUE; break;
case 523: nReturn = TRUE; break;
case 524: nReturn = TRUE; break;
case 525: nReturn = TRUE; break;
case 526: nReturn = TRUE; break;
case 527: nReturn = TRUE; break;
case 528: nReturn = TRUE; break;
case 529: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 540)
            {
            switch (nFeat)
                {
case 530: nReturn = TRUE; break;
case 531: nReturn = TRUE; break;
case 533: nReturn = TRUE; break;
case 534: nReturn = TRUE; break;
case 535: nReturn = TRUE; break;
case 536: nReturn = TRUE; break;
case 537: nReturn = TRUE; break;
case 538: nReturn = TRUE; break;
case 539: nReturn = TRUE; break;
                }
            }
        else //<550
            {
            switch (nFeat)
                {
case 540: nReturn = TRUE; break;
case 541: nReturn = TRUE; break;
case 542: nReturn = TRUE; break;
case 543: nReturn = TRUE; break;
case 544: nReturn = TRUE; break;
case 545: nReturn = TRUE; break;
case 546: nReturn = TRUE; break;
case 547: nReturn = TRUE; break;
case 548: nReturn = TRUE; break;
case 549: nReturn = TRUE; break;
                }
            }
        }
    else if (nFeat < 600)
        {
        if (nFeat < 560)
            {
            switch (nFeat)
                {
case 550: nReturn = TRUE; break;
case 551: nReturn = TRUE; break;
case 552: nReturn = TRUE; break;
case 553: nReturn = TRUE; break;
case 554: nReturn = TRUE; break;
case 555: nReturn = TRUE; break;
case 556: nReturn = TRUE; break;
case 557: nReturn = TRUE; break;
case 558: nReturn = TRUE; break;
case 559: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 570)
            {
            switch (nFeat)
                {
case 560: nReturn = TRUE; break;
case 561: nReturn = TRUE; break;
case 562: nReturn = TRUE; break;
case 563: nReturn = TRUE; break;
case 564: nReturn = TRUE; break;
case 565: nReturn = TRUE; break;
case 566: nReturn = TRUE; break;
case 567: nReturn = TRUE; break;
case 568: nReturn = TRUE; break;
case 569: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 580)
            {
            switch (nFeat)
                {
case 570: nReturn = TRUE; break;
case 571: nReturn = TRUE; break;
case 572: nReturn = TRUE; break;
case 573: nReturn = TRUE; break;
case 574: nReturn = TRUE; break;
case 575: nReturn = TRUE; break;
case 576: nReturn = TRUE; break;
case 577: nReturn = TRUE; break;
case 578: nReturn = TRUE; break;
case 579: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 590)
            {
            switch (nFeat)
                {
case 580: nReturn = TRUE; break;
case 581: nReturn = TRUE; break;
case 582: nReturn = TRUE; break;
case 583: nReturn = TRUE; break;
case 584: nReturn = TRUE; break;
case 585: nReturn = TRUE; break;
case 586: nReturn = TRUE; break;
case 588: nReturn = TRUE; break;
case 589: nReturn = TRUE; break;
                }
            }
        else //<600
            {
            switch (nFeat)
                {
case 590: nReturn = TRUE; break;
case 591: nReturn = TRUE; break;
case 592: nReturn = TRUE; break;
case 593: nReturn = TRUE; break;
case 594: nReturn = TRUE; break;
case 595: nReturn = TRUE; break;
case 596: nReturn = TRUE; break;
case 597: nReturn = TRUE; break;
case 598: nReturn = TRUE; break;
case 599: nReturn = TRUE; break;
                }
            }
        }
    else if (nFeat < 650)
        {
        if (nFeat < 610)
            {
            switch (nFeat)
                {
case 601: nReturn = TRUE; break;
case 602: nReturn = TRUE; break;
case 603: nReturn = TRUE; break;
case 604: nReturn = TRUE; break;
case 605: nReturn = TRUE; break;
case 606: nReturn = TRUE; break;
case 607: nReturn = TRUE; break;
case 608: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 620)
            {
            switch (nFeat)
                {
case 610: nReturn = TRUE; break;
case 611: nReturn = TRUE; break;
case 612: nReturn = TRUE; break;
case 613: nReturn = TRUE; break;
case 614: nReturn = TRUE; break;
case 615: nReturn = TRUE; break;
case 616: nReturn = TRUE; break;
case 617: nReturn = TRUE; break;
case 619: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 630)
            {
            switch (nFeat)
                {
case 620: nReturn = TRUE; break;
case 621: nReturn = TRUE; break;
case 622: nReturn = TRUE; break;
case 623: nReturn = TRUE; break;
case 624: nReturn = TRUE; break;
case 625: nReturn = TRUE; break;
case 626: nReturn = TRUE; break;
case 627: nReturn = TRUE; break;
case 628: nReturn = TRUE; break;
case 629: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 640)
            {
            switch (nFeat)
                {
case 630: nReturn = TRUE; break;
case 631: nReturn = TRUE; break;
case 632: nReturn = TRUE; break;
case 633: nReturn = TRUE; break;
case 634: nReturn = TRUE; break;
case 635: nReturn = TRUE; break;
case 636: nReturn = TRUE; break;
case 637: nReturn = TRUE; break;
case 638: nReturn = TRUE; break;
case 639: nReturn = TRUE; break;
                }
            }
        else //<650
            {
            switch (nFeat)
                {
case 640: nReturn = TRUE; break;
case 641: nReturn = TRUE; break;
case 642: nReturn = TRUE; break;
case 643: nReturn = TRUE; break;
case 644: nReturn = TRUE; break;
case 645: nReturn = TRUE; break;
case 646: nReturn = TRUE; break;
case 647: nReturn = TRUE; break;
case 648: nReturn = TRUE; break;
case 649: nReturn = TRUE; break;
                }
            }
        }
    else if (nFeat < 700)
        {
        if (nFeat < 660)
            {
            switch (nFeat)
                {
case 650: nReturn = TRUE; break;
case 651: nReturn = TRUE; break;
case 652: nReturn = TRUE; break;
case 653: nReturn = TRUE; break;
case 654: nReturn = TRUE; break;
case 655: nReturn = TRUE; break;
                }
            }
        else //<700
            {
            switch (nFeat)
                {
case 695: nReturn = TRUE; break;
case 696: nReturn = TRUE; break;
                }
            }
        }
    else //<750
        {
        if (nFeat < 710)
            {
            switch (nFeat)
                {
case 709: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 720)
            {
            switch (nFeat)
                {
case 710: nReturn = TRUE; break;
case 711: nReturn = TRUE; break;
case 712: nReturn = TRUE; break;
case 713: nReturn = TRUE; break;
case 714: nReturn = TRUE; break;
case 715: nReturn = TRUE; break;
case 716: nReturn = TRUE; break;
case 717: nReturn = TRUE; break;
case 718: nReturn = TRUE; break;
case 719: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 730)
            {
            switch (nFeat)
                {
case 720: nReturn = TRUE; break;
case 721: nReturn = TRUE; break;
case 722: nReturn = TRUE; break;
case 723: nReturn = TRUE; break;
case 724: nReturn = TRUE; break;
case 725: nReturn = TRUE; break;
case 726: nReturn = TRUE; break;
case 727: nReturn = TRUE; break;
case 728: nReturn = TRUE; break;
case 729: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 740)
            {
            switch (nFeat)
                {
case 730: nReturn = TRUE; break;
case 731: nReturn = TRUE; break;
case 732: nReturn = TRUE; break;
case 733: nReturn = TRUE; break;
case 734: nReturn = TRUE; break;
case 735: nReturn = TRUE; break;
case 736: nReturn = TRUE; break;
case 737: nReturn = TRUE; break;
case 738: nReturn = TRUE; break;
case 739: nReturn = TRUE; break;
                }
            }
        else //750
            {
            switch (nFeat)
                {
case 740: nReturn = TRUE; break;
case 741: nReturn = TRUE; break;
case 742: nReturn = TRUE; break;
case 743: nReturn = TRUE; break;
case 744: nReturn = TRUE; break;
case 745: nReturn = TRUE; break;
case 747: nReturn = TRUE; break;
case 748: nReturn = TRUE; break;
case 749: nReturn = TRUE; break;
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
case 750: nReturn = TRUE; break;
case 751: nReturn = TRUE; break;
case 752: nReturn = TRUE; break;
case 753: nReturn = TRUE; break;
case 754: nReturn = TRUE; break;
case 755: nReturn = TRUE; break;
case 756: nReturn = TRUE; break;
case 757: nReturn = TRUE; break;
case 758: nReturn = TRUE; break;
case 759: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 770)
            {
            switch (nFeat)
                {
case 760: nReturn = TRUE; break;
case 761: nReturn = TRUE; break;
case 762: nReturn = TRUE; break;
case 763: nReturn = TRUE; break;
case 764: nReturn = TRUE; break;
case 765: nReturn = TRUE; break;
case 766: nReturn = TRUE; break;
case 767: nReturn = TRUE; break;
case 768: nReturn = TRUE; break;
case 769: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 780)
            {
            switch (nFeat)
                {
case 770: nReturn = TRUE; break;
case 771: nReturn = TRUE; break;
case 772: nReturn = TRUE; break;
case 773: nReturn = TRUE; break;
case 774: nReturn = TRUE; break;
case 775: nReturn = TRUE; break;
case 776: nReturn = TRUE; break;
case 777: nReturn = TRUE; break;
case 778: nReturn = TRUE; break;
case 779: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 790)
            {
            switch (nFeat)
                {
case 780: nReturn = TRUE; break;
case 781: nReturn = TRUE; break;
case 782: nReturn = TRUE; break;
case 783: nReturn = TRUE; break;
case 784: nReturn = TRUE; break;
case 785: nReturn = TRUE; break;
case 786: nReturn = TRUE; break;
case 787: nReturn = TRUE; break;
case 788: nReturn = TRUE; break;
case 789: nReturn = TRUE; break;
                }
            }
        else //<800
            {
            switch (nFeat)
                {
case 790: nReturn = TRUE; break;
case 791: nReturn = TRUE; break;
case 792: nReturn = TRUE; break;
case 793: nReturn = TRUE; break;
case 794: nReturn = TRUE; break;
case 795: nReturn = TRUE; break;
case 796: nReturn = TRUE; break;
case 797: nReturn = TRUE; break;
case 798: nReturn = TRUE; break;
case 799: nReturn = TRUE; break;
                }
            }
        }
    else if (nFeat < 850)
        {
        if (nFeat < 810)
            {
            switch (nFeat)
                {
case 800: nReturn = TRUE; break;
case 801: nReturn = TRUE; break;
case 802: nReturn = TRUE; break;
case 803: nReturn = TRUE; break;
case 804: nReturn = TRUE; break;
case 805: nReturn = TRUE; break;
case 806: nReturn = TRUE; break;
case 807: nReturn = TRUE; break;
case 808: nReturn = TRUE; break;
case 809: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 820)
            {
            switch (nFeat)
                {
case 810: nReturn = TRUE; break;
case 811: nReturn = TRUE; break;
case 812: nReturn = TRUE; break;
case 813: nReturn = TRUE; break;
case 814: nReturn = TRUE; break;
case 815: nReturn = TRUE; break;
case 816: nReturn = TRUE; break;
case 817: nReturn = TRUE; break;
case 818: nReturn = TRUE; break;
case 819: nReturn = TRUE; break;
                }
            }
        else if (nFeat < 830)
            {
            switch (nFeat)
                {
case 820: nReturn = TRUE; break;
case 821: nReturn = TRUE; break;
case 822: nReturn = TRUE; break;
case 823: nReturn = TRUE; break;
                }
            }
        else //<850
            {
            switch (nFeat)
                {
case 844: nReturn = TRUE; break;
                }
            }
        }
    else if (nFeat < 900)
        {
        if (nFeat < 860)
            {
            switch (nFeat)
                {
case 856: nReturn = TRUE; break;
                }
            }
        else
            {
            switch (nFeat)
                {
case 867: nReturn = TRUE; break;
case 868: nReturn = TRUE; break;
                }
            }
        }
    else if (nFeat < 950)
        {
        if (nFeat < 920)
            {
            switch (nFeat)
                {
case 910: nReturn = TRUE; break;
case 911: nReturn = TRUE; break;
case 912: nReturn = TRUE; break;
case 913: nReturn = TRUE; break;
case 914: nReturn = TRUE; break;
case 915: nReturn = TRUE; break;
case 916: nReturn = TRUE; break;
case 917: nReturn = TRUE; break;
case 918: nReturn = TRUE; break;
                }
            }
        }
    else
        {
        if (nFeat < 960)
            {
            switch (nFeat)
                {
case 952: nReturn = TRUE; break;
case 954: nReturn = TRUE; break;
case 955: nReturn = TRUE; break;
case 956: nReturn = TRUE; break;
case 958: nReturn = TRUE; break;
                }
            }
        else //<1000
            {
            switch (nFeat)
                {
case 993: nReturn = TRUE; break;
case 995: nReturn = TRUE; break;
case 996: nReturn = TRUE; break;
case 997: nReturn = TRUE; break;
case 999: nReturn = TRUE; break;
case 1072: nReturn = TRUE; break;
case 1073: nReturn = TRUE; break;
case 1074: nReturn = TRUE; break;
case 1075: nReturn = TRUE; break;
case 1076: nReturn = TRUE; break;
case 1078: nReturn = TRUE; break;
case 1079: nReturn = TRUE; break;
                }
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
