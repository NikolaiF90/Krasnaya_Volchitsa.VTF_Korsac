private _persistentSaves = [] call F90_fnc_getPersistentSaves;
private _selectedSlot = -1;
if (count _persistentSaves > 0) then 
{
    _selectedSlot = lbCurSel PersistentMenu_SavesListBox;
};

if (_selectedSlot != -1) then 
{
    [_selectedSlot] call F90_fnc_loadGame;
    ["Data has been loaded", "DEFAULT"] call F90_fnc_textNotification;
    if (dialog) then {closeDialog 1};
};