private _caller = player;
private _selectedIndex = lbCurSel SquadMenu_PlayerSquadListBoxIDC;

if (_selectedIndex == -1 || _selectedIndex >= lbSize SquadMenu_PlayerSquadListBoxIDC) then 
{
    _selectedIndex = 0;
    lbSetCurSel [SquadMenu_PlayerSquadListBoxIDC, 0];
};

if (_selectedIndex != 0) then
{
    private _groupArray = units group _caller;
    private _selectedSquadUnit = _groupArray select _selectedIndex; 

    // Generate unit data
    private _reserveData = [_selectedSquadUnit] call F90_fnc_generateReserveData;
    private _reservePools = _caller getVariable "SHARS_ReservePool";
    _reservePools pushBack _reserveData;
    _caller setVariable ["SHARS_ReservePool", _reservePools, true];
    // Delete the physical unit
    [_selectedSquadUnit] call F90_fnc_deleteUnit;

    ["RESERVE"] call F90_fnc_refreshSquadMenu;
    ["SQUAD"] call F90_fnc_refreshSquadMenu;
};