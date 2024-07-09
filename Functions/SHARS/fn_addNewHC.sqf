if (lbSize SquadMenu_ReservePoolListBoxIDC > 0) then 
{
    private _selectedUnitIndex = lbCurSel SquadMenu_ReservePoolListBoxIDC;
    if (_selectedUnitIndex == -1 || _selectedUnitIndex >= lbSize SquadMenu_ReservePoolListBoxIDC) then 
    {
        lbSetCurSel [SquadMenu_ReservePoolListBoxIDC, 0];
        _selectedUnitIndex = 0;
    };

    private _caller = player;
    private _reservePools = _caller getVariable "SHARS_ReservePool";
    private _selectedUnit = _reservePools select _selectedUnitIndex;

    // Create the unit
    private _group = createGroup [Mission_AlliedSide, true];
    private _className = _selectedUnit select 0;
    private _unitName = _selectedUnit select 1;
    private _unitSkills = _selectedUnit select 2;
    private _unitWage = _selectedUnit select 3;
    private _spawnPos = [position _caller, 0, 10] call BIS_fnc_findSafePos;

    [_group, _className, _spawnPos, _unitSkills, _unitName, [false, _unitWage]] call F90_fnc_createUnit;
    
    // Create HC group
    [player, _group] call F90_fnc_addToHighCommand;

    // Remove from pool 
    _reservePools deleteAt _selectedUnitIndex;
    _caller setVariable ["SHARS_ReservePool", _reservePools, true];
    ["ALL"] call F90_fnc_refreshSquadMenu;
};