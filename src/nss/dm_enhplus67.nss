void main()
{
    int iCode = GetLocalInt(OBJECT_SELF,"MODCODE");
    int nNew = iCode + 67;
    SetLocalInt(OBJECT_SELF,"MODCODE",nNew);
}
