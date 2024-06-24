if (lbSize SquadMenu_ReservePoolListBoxIDC > 0) then 
{
    private _selectedUnitIndex = lbCurSel SquadMenu_ReservePoolListBoxIDC;
    if (_selectedUnitIndex == -1 || _selectedUnitIndex >= lbSize SquadMenu_ReservePoolListBoxIDC) then 
    {
        lbSetCurSel [SquadMenu_ReservePoolListBoxIDC, 0];
        _selectedUnitIndex = 0;
    };

    if (lbSize SquadMenu_HighCommandListBoxIDC > 0) then 
    {
        private _selectedSquadIndex = lbCurSel SquadMenu_HighCommandListBoxIDC;
        if (_selectedSquadIndex == -1 || _selectedSquadIndex >= lbSize SquadMenu_HighCommandListBoxIDC) then 
        {
            lbSetCurSel [SquadMenu_HighCommandListBoxIDC, 0];
            _selectedSquadIndex = 0;
        };

        private _caller = player;
        private _reservePools = _caller getVariable "SHARS_ReservePool";
        private _selectedGroup = hcAllGroups _caller select _selectedSquadIndex;
        private _selectedUnit = _reservePools select _selectedUnitIndex;

        // Create the unit
        private _className = _selectedUnit select 0;
        private _unitName = _selectedUnit select 1;
        private _unitSkills = _selectedUnit select 2;
        private _spawnPos = [position _caller, 0, 10] call BIS_fnc_findSafePos;

        [_selectedGroup, _className, _spawnPos, _unitSkills, _unitName] call F90_fnc_createUnit;

        // Remove from pool 
        _reservePools deleteAt _selectedUnitIndex;
        _caller setVariable ["SHARS_ReservePool", _reservePools, true];
        ["ALL"] call F90_fnc_refreshSquadMenu;
    } else 
    {
        ["Can't move the unit to an empty squad", "ERROR"] call F90_fnc_textNotification;
    };
};
