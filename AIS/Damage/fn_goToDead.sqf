/*
	Author: Psycho, PrinceF90(Revisited)
 
	Description: 
		This function handles actions to be taken when a unit is killed, including adding actions for confirming identity or kills. 
	
	Parameter(s): 
		_unit - The unit that has been killed [OBJECT]
		_killer - The killer of the unit [OBJECT]
	
	Returns: 
		None
 */

params ["_unit", "_killer"];

if (!alive _unit) exitWith {};
if (_unit getVariable ["AIS_UnitIsDead", false]) exitWith {};

if (isNull _killer) then {_killer = objNull};

if (isPlayer _unit) then 
{
	_unit setDamage 0;
	if !(_unit getVariable ["Mission_IsRespawning", false]) then
	{
		private _accTime = diag_tickTime + 0.01;
		[
			{diag_tickTime > (_this select 2)}, 
			{[_this select 0, _this select 1] call F90_fnc_respawnUnit},
			[_unit, infirmaryX, _accTime]
		] call AIS_Core_fnc_waitUntilAndExecute;
	};
} else 
{
	_unit setVariable ["AIS_UnitIsDead", true, true];

	// unit is dragged. So the dragger have to call the release function.
	private _dragger = _unit getVariable ["ais_DraggerUnit", objNull];
	if !(isNull _dragger) then 
	{
		[_unit] remoteExecCall ["AIS_System_fnc_release", _dragger, false];
	};

	_unit call AIS_System_fnc_restoreFaks;

	if (!isNull _killer) then 
	{
		_unit setVariable ["Record_UnitKiller", _killer, true];

		private _unitIsHVT = _unit getVariable ["Record_IsHVT", false];

		if (_unitIsHVT) then 
		{
			[_unit, "Confirm Identity"] remoteExec ["F90_fnc_addConfirmKillAction", 0, true];
		} else 
		{
			if (isPlayer _killer) then 
			{
				[_unit, "Confirm Kill"] remoteExec ["F90_fnc_addConfirmKillAction", 0, true];
			};
		};
	} else 
	{
		private _unitIsHVT = _unit getVariable ["Record_IsHVT", false];

		if (_unitIsHVT) then 
		{
			[_unit, "Confirm Identity"] remoteExec ["F90_fnc_addConfirmKillAction", 0, true];
		};
	};
	// dead... if some issues with the deadcam (shown killer) give the dead a deleay of 1 frame --> need testing
	_unit setDamage 1;
};

true