/*
    Description:
    This function is responsible for saving data to a specific slot in a persistent list. It generates a save date, creates a save name, and either creates a new save slot or updates an existing one based on user selection. 

    Parameters:
    None

    Returns:
    0

    Example Usage:
    [] call F90_fnc_saveToSlot;
*/

PersistentMenu_SelectedList = [PersistentMenu_ListBox] call F90_fnc_getSelectedList;

private _saveDate = [] call F90_fnc_generateSaveDate;
private _saveName = format["%1 saved on, %2", Scenario_Name, _saveDate];
private _saveSlot = 0;

if (PersistentMenu_SelectedList == 0) then 
{
    Persistent_Slots pushBack _saveName;
    _saveSlot = (count Persistent_Slots) -1;
} else
{
    Persistent_Slots set [PersistentMenu_SelectedList, _saveName];
    _saveSlot = PersistentMenu_SelectedList;
};

[_saveSlot] call F90_fnc_saveGame;
profileNamespace setVariable [Persistent_PersistentListKey, Persistent_Slots];

["Progress saved."] call F90_fnc_textNotification;
[PersistentMenu_ListBox] call F90_fnc_updatePersistentList;