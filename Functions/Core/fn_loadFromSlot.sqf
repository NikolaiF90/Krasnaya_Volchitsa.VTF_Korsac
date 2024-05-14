PersistentMenu_SelectedList = [PersistentMenu_ListBox] call F90_fnc_getSelectedList;

[PersistentDebug, "loadFromSlot", "Loading progress...", false] call F90_fnc_debug;

if (PersistentMenu_SelectedList != 0) then 
{
    [PersistentMenu_SelectedList] call F90_fnc_loadGame;

    if (dialog) then 
    {
        closeDialog 1;
    };
} else 
{
    [PersistentDebug, "loadFromSlot", "Empty slot selected. Nothing to load from here.", false] call F90_fnc_debug;
};