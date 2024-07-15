private _caller = player;

private _unlocked = [_caller, "PERK_TrainUnit"] call F90_fnc_getPerkKeyState;

if (_unlocked) then
{
    private _balance = ["GETMONEY", _caller] call F90_fnc_economyHandler;
    private _cost = _caller getVariable ["SHARS_TrainUnitCost", 0];

    if (_cost > 0) then 
    {
        if (_balance >= _cost) then 
        {
            // Close the dialog
            if (dialog) then 
            {
                closeDialog 2;
            }; 
            private _selectedIndex = _caller getVariable "SHARS_UnitIndex";
            private _trainArray = _caller getVariable "SHARS_TrainArray";

            private _reservePools = _caller getVariable "SHARS_ReservePool";
            private _unit = _reservePools select _selectedIndex;
            // Remove unused variable
            _caller setVariable ["SHARS_UnitIndex", nil, true];
            
            private _skillArray = _unit select 2;

            private _newSkills = [];
            private _count = count _skillArray;
            for "_i" from 0 to _count - 1 do 
            {
                private _trainValue = _trainArray select _i;
                private _skillValue = _skillArray select _i;
                _newSkills set [_i, _trainValue + _skillValue];
            };

            _unit set [2, _newSkills];

            // Deduct player balance
            ["DEDUCTMONEY", [_caller, _cost]] call F90_fnc_economyHandler;

            private _unitName = _unit select 1;
            [format ["%1 has been trained", _unitName], "DEFAULT"] call F90_fnc_textNotification;
        } else
        {
            ["You do not have enough Milcash", "ERROR"] call F90_fnc_textNotification;
        };
    } else 
    {
        ["Please select an attribute to train first", "WARNING"] call F90_fnc_textNotification;
    };
} else
{
    ["Only higher ranks can train other units", "ERROR"] call F90_fnc_textNotification;
};