params ["_unit"];

["Please select the unit(s) to dismiss.<br /> The selected unit(s) will be dismissed in 5 seconds", "DEFAULT", 3, 2] call F90_fnc_textNotification;

private _timer = diag_tickTime + 5;
waitUntil {diag_tickTime >= _timer};

private _selectedUnits = [];
_selectedUnits = groupSelectedUnits _unit;

if (count _selectedUnits < 1) then 
{
    ["Please select a unit first!", "ERROR", 3] call F90_fnc_textNotification;
} else 
{
    {
        private _index = Mission_CreatedUnits find _x;
        Mission_CreatedUnits deleteAt _index;
        deleteVehicle _x;
    } forEach _selectedUnits;
};