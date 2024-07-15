// BASE TURRETS
DSC_BaseTurrets = [];

private _serverVehicles = vehicles;

{
    private _vehicle = _x;
    private _isBaseTurret = _vehicle getVariable ["DSC_IsBaseTurret", nil];
    
    if !(isNil {_isBaseTurret}) then 
    {
        if (_isBaseTurret) then 
        {
            DSC_BaseTurrets pushBack _vehicle;
        };
    };
} forEach _serverVehicles;

{
    private _turret = _x;
    private _turretGroup = createGroup [Mission_AlliedSide, true];
    private _type = selectRandom DSC_AlliedUnitList;
    private _turretPos = getPosATL _turret;
    private _spawnPos = [_turret, 2, 10, 2] call BIS_fnc_findSafePos;

    // Spawn gunner
    private _gunner = [_turretGroup, _type, _spawnPos, Mission_DefaultAlliedSkill] call F90_fnc_createUnit;

    _gunner moveInAny _turret;
} forEach DSC_BaseTurrets;

// BASE PATROLS
private _patrolCenterPos = getMarkerPos "base_0";
0 = [_patrolCenterPos] spawn 
{
    params ["_patrolCenterPos"];
    Mission_AlliedBasePatrols = [_patrolCenterPos, Mission_AlliedSide, DSC_AlliedUnitList, Mission_DefaultAlliedSkill, 5, 5, 200] call F90_fnc_createPatrol;
};