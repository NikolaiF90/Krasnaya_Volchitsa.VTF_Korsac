PersistentMenu_SelectedList = [PersistentMenu_ListBox] call F90_fnc_getSelectedList;

if (PersistentMenu_SelectedList != 0) then 
{
    [PersistentMenu_SelectedList] call F90_fnc_loadGame;

    if (dialog) then 
    {
        closeDialog 1;
    };
} else 
{
    hint "Empty slot selected. Nothing to load from here.";
};