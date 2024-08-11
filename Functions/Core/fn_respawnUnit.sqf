/*
    Author: PrinceF90

    Description:
        This function handles the respawn process for the specified unit.

    Parameter(s):
        _unit - The unit to be respawned. [OBJECT]
        _spawnerObject - The object to as reference for the respawn position. [OBJECT]

    Returns:
        None
*/
params ["_unit", "_spawnerObject"];

if (isNull _unit) then {_unit = player};
if (_unit getVariable ["RSW_IsRespawning", false]) exitWith {_unit setDamage 0};

_unit setVariable ["RSW_IsRespawning", true, true];

private _unitOldPos = position _unit;
_unit setPos [0,0,0];

// If unit is being dragged, the dragger has to call the release function.
private _dragger = _unit getVariable ["ais_DraggerUnit", objNull];
if !(isNull _dragger) then 
{
    [_unit] remoteExecCall ["AIS_System_fnc_release", _dragger, false];
};

// Start respawn countdown
private _deadTime = diag_tickTime;
[_unit, _deadTime] spawn F90_fnc_startRespawnTimer;

// Create a clone
private _className = typeOf _unit;
private _loadOut = getUnitLoadout _unit;
private _face = face _unit;

private _group = createGroup [civilian, true];
private _clone = _group createUnit [_className, _unitOldPos, [], 0, "FORM"];

_clone setVariable ["BIS_enableRandomization", false];
_clone setFace _face;
_clone setUnitLoadout _loadOut;
_clone setVariable ["AIS_UnitIsDead", true, true];

// Create deadcam
private _deadCam = "crowe" camCreate [(position _clone select 0) + 5, position _clone select 1, position _clone select 2];
_deadCam cameraEffect ["Internal", "BACK"];
_deadCam camSetTarget _clone;
_deadCam camCommand "manual on";

// Start camera timer
private _deadTime = RESPAWN_Timer;
[_deadCam, _deadTime, diag_tickTime] spawn F90_fnc_startDeadCamTimer;

// Kills clone 
_clone setDamage 1;

// Teleport original unit
[_unit, _spawnerObject] call F90_fnc_teleportObject;

// Heals original unit after 3 seconds
private _healTimer = diag_tickTime + 3.00;
[
    {diag_tickTime > (_this select 0)},
    {[_this select 1] call F90_fnc_resetRespawnedUnit},
    [_healTimer, _unit]
] call AIS_Core_fnc_waitUntilAndExecute;

// Handles respawning state
private _accTime = diag_tickTime + RESPAWN_Timer;
[
    {diag_tickTime > (_this select 1)}, 
    {
        (_this select 0) setDamage 0;
        (_this select 0) setVariable ["RSW_IsRespawning", false, true];
    },
    [_unit, _accTime]
] call AIS_Core_fnc_waitUntilAndExecute;