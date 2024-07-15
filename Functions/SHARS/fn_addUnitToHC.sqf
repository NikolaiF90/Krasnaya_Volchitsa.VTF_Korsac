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

        private _unlocked = false;
        if (count units _selectedGroup < PERK_HCTeamSize) then 
        {
            _unlocked = [_caller, "PERK_CommandTeams"] call F90_fnc_getPerkKeyState;
        } else 
        {
            _unlocked = [_caller, "PERK_CommandSquad"] call F90_fnc_getPerkKeyState;
        };

        // If selected squad reached max high command squad limits
        if (count units _selectedGroup >= PERK_MaxHCSquadSize) then 
        {
            // Check if platoon commander perks is unlocked
            _unlocked = [_caller, "PERK_PlatoonCommander"] call F90_fnc_getPerkKeyState;
        };
        
        if (_unlocked) then 
        {   
            // Create the unit
            private _className = _selectedUnit select 0;
            private _unitName = _selectedUnit select 1;
            private _unitSkills = _selectedUnit select 2;
            private _unitWage = _selectedUnit select 3;
            private _spawnPos = [position _caller, 0, 10] call BIS_fnc_findSafePos;

            [_selectedGroup, _className, _spawnPos, _unitSkills, _unitName, [false, _unitWage]] call F90_fnc_createUnit;

            // Remove from pool 
            _reservePools deleteAt _selectedUnitIndex;
            _caller setVariable ["SHARS_ReservePool", _reservePools, true];
            ["ALL"] call F90_fnc_refreshSquadMenu;
        } else 
        {
            ["Only higher ranks can command teams while more higher ranks can command squads", "ERROR"] call F90_fnc_textNotification;
        };
    } else 
    {
        ["Can't move the unit to an empty squad", "ERROR"] call F90_fnc_textNotification;
    };
};
