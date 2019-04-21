void main()
{
    object oStore = GetNearestObjectByTag("ClothDyeMerchant");
    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
    {
        OpenStore(oStore, GetPCSpeaker());
    }
}
