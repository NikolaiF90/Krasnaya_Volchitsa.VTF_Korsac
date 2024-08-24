/*
    Author: PrinceF90

    Description:
        Deletes persistent data from a list based on the selected slot.

    Parameter(s):
        None

    Returns:
        None
*/
private _selectedSlot = -1;

private _persistentSaves = [] call F90_fnc_getPersistentSaves;
if !(isNil {_persistentSaves}) then 
{
    _selectedSlot = lbCurSel PersistentMenu_SavesListBox;
};

// Delete only if data exist
if (_selectedSlot != -1) then 
{
    if (count _persistentSaves > 0) then 
    {
        // Delete selected slot
        _persistentSaves deleteAt _selectedSlot;
        // Keeps profileNamespace updated    
        [_persistentSaves] call F90_fnc_setPersistentSaves;
        // Notify player 
        ["Persistent data deleted", "WARNING"] call F90_fnc_textNotification;
    } else 
    {
        ["Unable to delete empty slot", "ERROR"] call F90_fnc_textNotification;
    };
    
    _persistentSaves = [] call F90_fnc_getPersistentSaves;
    // Update listbox and select the last element
    [PersistentMenu_SavesListBox, _persistentSaves, _selectedSlot] call F90_fnc_populateListBox;
};