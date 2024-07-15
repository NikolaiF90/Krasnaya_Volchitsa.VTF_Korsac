/*
    Author: PrinceF90

    Description:
        This function saves the game progress with a custom name and date, updates the persistent saves list, populates the saves listbox, and displays a text notification.

    Parameter(s):
        None

    Returns:
        None
*/
private _selectedSlot = lbCurSel PersistentMenu_SavesListBox;
[_selectedSlot] call F90_fnc_saveGame;

private _dateString = [] call F90_fnc_getSystemDate;

private _customName = ctrlText PersistentMenu_SaveNameEditBox;
if (isNil {_customName} || _customName isEqualTo "" || _customName isEqualTo " ") then 
{
    _customName = format ["%1 slot %2", Scenario_Name, _selectedSlot];
};
private _saveName = format ["%1 (%2)", _customName, _dateString];

private _persistentSaves = profileNamespace getVariable Persistent_PersistentListKey;
_persistentSaves set [_selectedSlot, _saveName];
profileNamespace setVariable [Persistent_PersistentListKey, _persistentSaves];

[PersistentMenu_SavesListBox, _persistentSaves, _selectedSlot] call F90_fnc_populateListBox;

["Progress Saved", "DEFAULT"] call F90_fnc_textNotification;