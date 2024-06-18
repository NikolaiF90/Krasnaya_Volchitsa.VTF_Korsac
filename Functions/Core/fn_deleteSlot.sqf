/*
    Author: PrinceF90 
 
    Description: 
        Deletes a selected item from a persistent list and updates the profile namespace. 
    
    Parameter(s): 
        None
    
    Returns: 
        None 
    
    Examples: 
        // [] call F90_fnc_deleteSlot; 
        // Result: Deletes the item at selected index from the persistent list and updates the profile namespace.
*/

PersistentMenu_SelectedList = [PersistentMenu_ListBox] call F90_fnc_getSelectedList;

if (PersistentMenu_SelectedList != 0) then 
{
    private _deletedItem = Persistent_Slots deleteAt PersistentMenu_SelectedList;

    profileNamespace setVariable [Persistent_PersistentListKey, Persistent_Slots];
    [PersistentMenu_ListBox] call F90_fnc_updatePersistentList;
} else
{
    ["Can't delete empty slot!", "ERROR"] call F90_fnc_textNotification;
};