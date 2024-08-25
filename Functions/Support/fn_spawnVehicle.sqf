private _unit = player;
// Get lb index
private _selectedItem = Support_AlliedFactionVehicles select (lbCurSel PurchaseVehMenu_VehiclesListBoxIDC);

private _className = _selectedItem select 0;
private _position = [repairX, 5, 30, 20] call BIS_fnc_findSafePos;
// create vehicle 
private _vehicle = createVehicle [_className, _position, [], 0, "NONE"];

_vehicle setVariable ["RSW_Owner", player, true];

private _weaponCount = count (_vehicle weaponsTurret [0]);

if (_weaponCount > 0) then 
{
    private _spawnedVehs = _unit getVariable "Support_SpawnedArmedVehicles";
    _spawnedVehs pushBack _vehicle;
    _unit setVariable ["Support_SpawnedArmedVehicles", _spawnedVehs, true];
} else 
{
    private _spawnedVehs = _unit getVariable "Support_SpawnedUnarmedVehicles";
    _spawnedVehs pushBack _vehicle;
    _unit setVariable ["Support_SpawnedUnarmedVehicles", _spawnedVehs, true];
};

if (dialog) then {closeDialog 2};

["Vehicle Spawned", "DEFAULT"] call F90_fnc_textNotification;
