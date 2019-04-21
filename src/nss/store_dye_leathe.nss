void main()
{
    object oStore = GetNearestObjectByTag("LeatherDyeMerchant");
    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
    {
        OpenStore(oStore, GetPCSpeaker());
    }
}
