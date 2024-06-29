if (lbSize SquadMenu_ReservePoolListBoxIDC > 0) then 
{
    private _selectedIndex = lbCurSel SquadMenu_ReservePoolListBoxIDC;
    if (_selectedIndex == -1 || _selectedIndex >= lbSize SquadMenu_ReservePoolListBoxIDC) then 
    {
        ["Please select a unit from Reserve Pool first", "ERROR"] call F90_fnc_textNotification;
    };

    private _caller = player;
    private _reservePools = _caller getVariable "SHARS_ReservePool";
    private _selectedUnit = _reservePools select _selectedIndex;

    // Remove from pool 
    _reservePools deleteAt _selectedIndex;
    _caller setVariable ["SHARS_ReservePool", _reservePools, true];
    ["RESERVE"] call F90_fnc_refreshSquadMenu;
};