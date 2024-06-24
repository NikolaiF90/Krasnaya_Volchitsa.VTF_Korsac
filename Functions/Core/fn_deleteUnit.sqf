params ["_unit", "_public"];

private _index = Mission_CreatedUnits find _unit;
Mission_CreatedUnits deleteAt _index;
if (isNil {_public}) then {_public = true};
if(_public) then {publicVariable "Mission_CreatedUnits"};
deleteVehicle _unit;