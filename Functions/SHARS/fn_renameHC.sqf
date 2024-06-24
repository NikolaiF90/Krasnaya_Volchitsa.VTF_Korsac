// close rename dialog
if (dialog) then 
{
    closeDialog 1;
};

private _caller = player;

private _newName = ctrlText RenameHCMenu_RenameEditBoxIDC;
private _selectedIndex = _caller getVariable "SquadMenu_SelectedIndex";

private _selectedSquad = hcAllGroups _caller select _selectedIndex;
_selectedSquad setGroupIdGlobal [_newName];

_caller setVariable ["SquadMenu_SelectedIndex", nil, true];

[] call F90_fnc_showSquadManagementMenu;