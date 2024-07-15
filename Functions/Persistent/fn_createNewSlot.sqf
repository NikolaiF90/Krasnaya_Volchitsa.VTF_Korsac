private _saveSlot = [] call F90_fnc_saveGame;

private _dateString = [] call F90_fnc_getSystemDate;

private _customName = ctrlText PersistentMenu_SaveNameEditBox;
if (isNil {_customName} || _customName isEqualTo "" || _customName isEqualTo " ") then 
{
    _customName = format ["%1 slot %2", Scenario_Name, _saveSlot];
};
private _saveName = format ["%1 (%2)", _customName, _dateString];

private _persistentSaves = profileNamespace getVariable Persistent_PersistentListKey;
_persistentSaves set [_saveSlot, _saveName];
profileNamespace setVariable [Persistent_PersistentListKey, _persistentSaves];

[PersistentMenu_SavesListBox, _persistentSaves, _saveSlot] call F90_fnc_populateListBox;

["Progress Saved", "DEFAULT"] call F90_fnc_textNotification;
