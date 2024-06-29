if (lbSize SquadMenu_ReservePoolListBoxIDC > 0) then 
{
    private _selectedIndex = lbCurSel SquadMenu_ReservePoolListBoxIDC;
    if (_selectedIndex == -1 || _selectedIndex >= lbSize SquadMenu_ReservePoolListBoxIDC) then 
    {
        lbSetCurSel [SquadMenu_ReservePoolListBoxIDC, 0];
        _selectedIndex = 0;
    };

    private _caller = player;
    private _reservePools = _caller getVariable "SHARS_ReservePool";
    private _selectedUnit = _reservePools select _selectedIndex;

    // Create the unit
    private _className = _selectedUnit select 0;
    private _unitName = _selectedUnit select 1;
    private _unitSkills = _selectedUnit select 2;
    private _unitWage = _selectedUnit select 3;
    private _spawnPos = [position _caller, 0, 10] call BIS_fnc_findSafePos;

    [group _caller, _className, _spawnPos, _unitSkills, _unitName, [false, _unitWage]] call F90_fnc_createUnit;

    // Remove from pool 
    _reservePools deleteAt _selectedIndex;
    _caller setVariable ["SHARS_ReservePool", _reservePools, true];
    ["ALL"] call F90_fnc_refreshSquadMenu;
};