private _caller = player;
private _selectedIndex = lbCurSel SquadMenu_HighCommandListBoxIDC;

if (lbSize SquadMenu_HighCommandListBoxIDC > 0) then 
{
    if (_selectedIndex == -1) then 
    {
        _selectedIndex = 0;
        lbSetCurSel [SquadMenu_HighCommandListBoxIDC, 0];
    } else 
    {
        // toDo
        if (_selectedIndex >= lbSize SquadMenu_HighCommandListBoxIDC) then 
        {
            _selectedIndex = 0;
            lbSetCurSel [SquadMenu_HighCommandListBoxIDC, 0];
        };
    };

    private _selectedGroup = hcAllGroups _caller select _selectedIndex;
    private _groupMembers = units _selectedGroup;

    {
        private _member = _x;

        // Generate unit data
        private _reserveData = [_member] call F90_fnc_generateReserveData;
        private _reservePools = _caller getVariable "SHARS_ReservePool";
        _reservePools pushBack _reserveData;
        _caller setVariable ["SHARS_ReservePool", _reservePools, true];
        // Delete the physical unit
        [_member] call F90_fnc_deleteUnit;
    } forEach _groupMembers;

    _caller hcRemoveGroup _selectedGroup;

    ["RESERVE"] call F90_fnc_refreshSquadMenu;
    ["HIGHCOMMAND"] call F90_fnc_refreshSquadMenu;
};