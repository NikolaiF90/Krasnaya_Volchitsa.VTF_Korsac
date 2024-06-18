params ["_unit"];

["Please select the squad(s) to dismiss.<br /> The selected squad(s) will be dismissed in 5 seconds", "DEFAULT", 3, 2] call F90_fnc_textNotification;

private _timer = diag_tickTime + 5; 
waitUntil {diag_tickTime >= _timer};

private _selectedSquads = [];
_selectedSquads = hcSelected _unit;

if (count _selectedSquads < 1) then 
{
    ["Please select a squad from High Command first!", "ERROR"] call F90_fnc_textNotification;
} else 
{
    for "_i" from (count _selectedSquads) -1 to 0 do 
    {
        private _squad = _selectedSquads select _i;
        _unit hcRemoveGroup _squad;

        {
            private _index = Mission_CreatedUnits find _x;
            Mission_CreatedUnits deleteAt _index;
            deleteVehicle _x;
        } forEach (units _squad);
    };
};