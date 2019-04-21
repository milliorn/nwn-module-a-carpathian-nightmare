/**
 *  $Id: pg_lists_i.nss,v 1.2 2005/08/07 04:38:30 pspeed Exp $
 *
 *  Some list APIs that work with local object variables.
 *
 *  Copyright (c) 2004 Paul Speed - BSD licensed.
 *  NWN Tools - http://nwntools.sf.net/
 */

const string LIST_PREFIX = "pgList:";

///// Core prototypes

// Returns the number of items in the specified list.
int GetElementCount( string list, object holder = OBJECT_SELF );

// Removes the list element at the specified index.  Returns
// the new item count.
int RemoveElement( int index, string list, object holder = OBJECT_SELF );

// Removes the list elements from start to end-1 inclusive at the
// specified index.  Returns the new item count.
int RemoveElements( int start, int end, string list, object holder = OBJECT_SELF );

// Inserts a blank entry into the specified index.  Returns
// the new item count.
int InsertElement( int index, string list, object holder = OBJECT_SELF );

// Deletes the list and all contents.  Returns the number
// of elements deleted in the process.
int DeleteList( string list, object holder = OBJECT_SELF );

///// STRING Prototypes

// Adds a string item to the list and return the new item count.
int AddStringElement( string item, string list, object holder = OBJECT_SELF );

// Returns the string item at the specified index.
string GetStringElement( int index, string list, object holder = OBJECT_SELF );

// Removes the string item from the end of the list and returns
// it.  Note: this will orphan any other types the might be stored
// at the same list location.
string PopStringElement( string list, object holder = OBJECT_SELF );

// Replaces the string at the specified index.  Returns the old
// string.
string ReplaceStringElement( int index, string value, string list, object holder = OBJECT_SELF );

// Begins a list iteration for string values
string GetFirstStringElement( string list, object holder = OBJECT_SELF );

// Returns the next item in a list iteration
string GetNextStringElement();

//// OBJECT Prototypes

// Adds an object item to the list and return the new item count.
int AddObjectElement( object item, string list, object holder = OBJECT_SELF );

// Returns the object item at the specified index.
object GetObjectElement( int index, string list, object holder = OBJECT_SELF );

// Removes the object item from the end of the list and returns
// it.  Note: this will orphan any other types the might be stored
// at the same list location.
object PopObjectElement( string list, object holder = OBJECT_SELF );

// Replaces the object at the specified index.  Returns the old
// string.
object ReplaceObjectElement( int index, object value, string list, object holder = OBJECT_SELF );

// Begins a list iteration for object values
object GetFirstObjectElement( string list, object holder = OBJECT_SELF );

// Returns the next item in an object list iteration
object GetNextObjectElement();

//// INT Prototypes

// Adds an int item to the list and return the new item count.
int AddIntElement( int item, string list, object holder = OBJECT_SELF );

// Returns the int item at the specified index.
int GetIntElement( int index, string list, object holder = OBJECT_SELF );

// Removes the int item from the end of the list and returns
// it.  Note: this will orphan any other types the might be stored
// at the same list location.
int PopIntElement( string list, object holder = OBJECT_SELF );

// Replaces the int at the specified index.  Returns the old
// int.
int ReplaceIntElement( int index, int value, string list, object holder = OBJECT_SELF );

// Begins a list iteration for int values
int GetFirstIntElement( string list, object holder = OBJECT_SELF );

// Returns the next item in a list iteration
int GetNextIntElement();


string currentList = "";
object currentHolder = OBJECT_INVALID;
int currentCount = 0;
int currentIndex = -1;

// Internal function to get the string for a given
// index
string IndexToString( int index, string list )
{
    return( LIST_PREFIX + list + "." + IntToString(index) );
}

// Returns the number of items in the specified list.
int GetElementCount( string list, object holder = OBJECT_SELF )
{
    return( GetLocalInt( holder, LIST_PREFIX + list ) );
}

// Removes the list element at the specified index.  Returns
// the new item count.
int RemoveElement( int index, string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    if( count == 0 )
        return( count );

    // Shift all of the other elements forward
    int i;
    string next;
    for( i = index; i < count - 1; i++ )
        {
        // We don't know what type the list elements are
        // (and they could be any), so we shift them all.
        // This function is already expensive enough anyway.
        string current = IndexToString( i, list );
        next = IndexToString( i + 1, list );

        SetLocalFloat( holder, current, GetLocalFloat( holder, next ) );
        SetLocalInt( holder, current, GetLocalInt( holder, next ) );
        SetLocalLocation( holder, current, GetLocalLocation( holder, next ) );
        SetLocalObject( holder, current, GetLocalObject( holder, next ) );
        SetLocalString( holder, current, GetLocalString( holder, next ) );
        }

    // Delete the top item
    DeleteLocalFloat( holder, next );
    DeleteLocalInt( holder, next );
    DeleteLocalLocation( holder, next );
    DeleteLocalObject( holder, next );
    DeleteLocalString( holder, next );

    count--;
    SetLocalInt( holder, LIST_PREFIX + list, count );

    return( count );
}

// Removes the list elements from start to end-1 inclusive at the
// specified index.  Returns the new item count.
int RemoveElements( int start, int end, string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    if( count == 0 )
        return( count );

    // Shift all of the other elements forward
    int i;
    string next;
    int removeCount = end - start;
    for( i = start; i < count - removeCount; i++ )
        {
        // We don't know what type the list elements are
        // (and they could be any), so we shift them all.
        // This function is already expensive enough anyway.
        string current = IndexToString( i, list );
        next = IndexToString( i + removeCount, list );

        SetLocalFloat( holder, current, GetLocalFloat( holder, next ) );
        SetLocalInt( holder, current, GetLocalInt( holder, next ) );
        SetLocalLocation( holder, current, GetLocalLocation( holder, next ) );
        SetLocalObject( holder, current, GetLocalObject( holder, next ) );
        SetLocalString( holder, current, GetLocalString( holder, next ) );
        }

    // Delete the top items
    for( i = count - removeCount; i < count; i++ )
        {
        next = IndexToString( i, list );
        DeleteLocalFloat( holder, next );
        DeleteLocalInt( holder, next );
        DeleteLocalLocation( holder, next );
        DeleteLocalObject( holder, next );
        DeleteLocalString( holder, next );
        }

    count -= removeCount;
    SetLocalInt( holder, LIST_PREFIX + list, count );

    return( count );
}


// Inserts a blank entry into the specified index.  Returns
// the new item count.
int InsertElement( int index, string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );

    // Shift all of the other elements backwards
    int i;
    string next;
    for( i = count - 1; i >= index; i-- )
        {
        // We don't know what type the list elements are
        // (and they could be any), so we shift them all.
        // This function is already expensive enough anyway.
        string current = IndexToString( i, list );
        next = IndexToString( i + 1, list );

        SetLocalFloat( holder, next, GetLocalFloat( holder, current ) );
        SetLocalInt( holder, next, GetLocalInt( holder, current ) );
        SetLocalLocation( holder, next, GetLocalLocation( holder, current ) );
        SetLocalObject( holder, next, GetLocalObject( holder, current ) );
        SetLocalString( holder, next, GetLocalString( holder, current ) );
        }

    // Delete the old values from the index since
    // it should be empty now
    string current = IndexToString( index, list );
    DeleteLocalFloat( holder, current );
    DeleteLocalInt( holder, current );
    DeleteLocalLocation( holder, current );
    DeleteLocalObject( holder, current );
    DeleteLocalString( holder, current );

    count++;
    SetLocalInt( holder, LIST_PREFIX + list, count );

    return( count );
}

// Deletes the list and all contents.  Returns the number
// of elements deleted in the process.
int DeleteList( string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    if( count == 0 )
        return( count );

    // Delete all elements
    int i;
    for( i = 0; i < count; i++ )
        {
        string current = IndexToString( i, list );
        DeleteLocalFloat( holder, current );
        DeleteLocalInt( holder, current );
        DeleteLocalLocation( holder, current );
        DeleteLocalObject( holder, current );
        DeleteLocalString( holder, current );
        }

    // Delete the main list info
    DeleteLocalInt( holder, LIST_PREFIX + list );

    return( count );
}

///// STRING FUNCTIONS

// Adds a string item to the list and return the new item count.
int AddStringElement( string item, string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    SetLocalString( holder, IndexToString( count, list ), item );
    count++;
    SetLocalInt( holder, LIST_PREFIX + list, count );

    return( count );
}

// Returns the string item at the specified index.
string GetStringElement( int index, string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    if( index >= count )
        {
        PrintString( "Error: (GetStringItem) index out of bounds["
                     + IntToString(index) + "] in list:" + list );
        return( "" );
        }
    return( GetLocalString( holder, IndexToString( index, list ) ) );
}

// Removes the string item from the end of the list and returns
// it.  Note: this will orphan any other types the might be stored
// at the same list location.
string PopStringElement( string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    string index = IndexToString( count - 1, list );
    string value = GetLocalString( holder, index );

    // Delete the values
    DeleteLocalString( holder, index );

    SetLocalInt( holder, LIST_PREFIX + list, count - 1 );

    return( value );
}

// Replaces the string at the specified index.  Returns the old
// string.
string ReplaceStringElement( int index, string value, string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    if( index >= count )
        {
        PrintString( "Error: (ReplaceStringItem) index out of bounds[" + IntToString(index)
                     + "] in list:" + list );
        return( "" );
        }

    string original = GetLocalString( holder, IndexToString( index, list ) );
    SetLocalString( holder, IndexToString( index, list ), value );

    return( original );
}

// Begins a list iteration for string values
string GetFirstStringElement( string list, object holder = OBJECT_SELF )
{
    currentCount = GetElementCount( list, holder );
    currentIndex = 0;
    return( GetLocalString( holder, IndexToString( currentIndex++, list ) ) );
}

// Returns the next item in a list iteration
string GetNextStringElement()
{
    if( currentIndex >= currentCount )
        return( "" );
    return( GetLocalString( currentHolder, IndexToString( currentIndex++, currentList ) ) );
}

//// OBJECT FUNCTIONS

// Adds an object item to the list and return the new item count.
int AddObjectElement( object item, string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    SetLocalObject( holder, IndexToString( count, list ), item );
    count++;
    SetLocalInt( holder, LIST_PREFIX + list, count );

    return( count );
}

// Returns the object item at the specified index.
object GetObjectElement( int index, string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    if( index >= count )
        {
        PrintString( "Error: (GetObjectItem) index out of bounds[" + IntToString(index)
                     + "] in list:" + list );
        return( OBJECT_INVALID );
        }
    return( GetLocalObject( holder, IndexToString( index, list ) ) );
}

// Removes the object item from the end of the list and returns
// it.  Note: this will orphan any other types the might be stored
// at the same list location.
object PopObjectElement( string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    string index = IndexToString( count - 1, list );
    object value = GetLocalObject( holder, index );

    // Delete the values
    DeleteLocalObject( holder, index );

    SetLocalInt( holder, LIST_PREFIX + list, count - 1 );

    return( value );
}

// Replaces the object at the specified index.  Returns the old
// string.
object ReplaceObjectElement( int index, object value, string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    if( index >= count )
        {
        PrintString( "Error: (ReplaceObjectItem) index out of bounds[" + IntToString(index)
                     + "] in list:" + list );
        return( OBJECT_INVALID );
        }

    object original = GetLocalObject( holder, IndexToString( index, list ) );
    SetLocalObject( holder, IndexToString( index, list ), value );

    return( original );
}

// Begins a list iteration for object values
object GetFirstObjectElement( string list, object holder = OBJECT_SELF )
{
    currentList = list;
    currentHolder = holder;
    currentCount = GetElementCount( list, holder );
    currentIndex = 0;
    return( GetLocalObject( holder, IndexToString( currentIndex++, list ) ) );
}

// Returns the next item in an object list iteration
object GetNextObjectElement()
{
    if( currentIndex >= currentCount )
        return( OBJECT_INVALID );
    return( GetLocalObject( currentHolder, IndexToString( currentIndex++, currentList ) ) );
}

//// INT FUNCTIONS

// Adds an int item to the list and return the new item count.
int AddIntElement( int item, string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    SetLocalInt( holder, IndexToString( count, list ), item );
    count++;
    SetLocalInt( holder, LIST_PREFIX + list, count );

    return( count );
}

// Returns the int item at the specified index.
int GetIntElement( int index, string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    if( index >= count )
        {
        PrintString( "Error: (GetIntItem) index out of bounds[" + IntToString(index)
                     + "] in list:" + list );
        return( -1 );
        }
    return( GetLocalInt( holder, IndexToString( index, list ) ) );
}

// Removes the int item from the end of the list and returns
// it.  Note: this will orphan any other types the might be stored
// at the same list location.
int PopIntElement( string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    string index = IndexToString( count - 1, list );
    int value = GetLocalInt( holder, index );

    // Delete the values
    DeleteLocalInt( holder, index );

    SetLocalInt( holder, LIST_PREFIX + list, count - 1 );

    return( value );
}

// Replaces the int at the specified index.  Returns the old
// int.
int ReplaceIntElement( int index, int value, string list, object holder = OBJECT_SELF )
{
    int count = GetElementCount( list, holder );
    if( index >= count )
        {
        PrintString( "Error: (ReplaceIntItem) index out of bounds[" + IntToString(index)
                     + "] in list:" + list );
        return( -1 );
        }

    int original = GetLocalInt( holder, IndexToString( index, list ) );
    SetLocalInt( holder, IndexToString( index, list ), value );

    return( original );
}

// Begins a list iteration for int values
int GetFirstIntElement( string list, object holder = OBJECT_SELF )
{
    currentCount = GetElementCount( list, holder );
    currentIndex = 0;
    return( GetLocalInt( holder, IndexToString( currentIndex++, list ) ) );
}

// Returns the next item in a list iteration
int GetNextIntElement()
{
    if( currentIndex >= currentCount )
        return( -1 );
    return( GetLocalInt( currentHolder, IndexToString( currentIndex++, currentList ) ) );
}


/*void main()
{
}*/
