/*
	Author: Psycho, PrinceF90(Revisited)
 
	Description: 
		This function handles actions to be taken when a unit is killed, including adding actions for confirming identity or kills. 
	
	Parameter(s): 
		_killed - The unit that has been killed [OBJECT]
		_killer - The killer of the unit [OBJECT]
	
	Returns: 
		None
 */

params ["_killed", "_killer"];

if (!alive _killed) exitWith {};
if (_killed getVariable ["AIS_UnitIsDead", false]) exitWith {};

if (isNull _killer) then {_killer = objNull};

if (isPlayer _killed) then 
{
	_killed setDamage 0;
	if !(_killed getVariable ["RSW_IsRespawning", false]) then
	{
		private _accTime = diag_tickTime + 0.01;
		[
			{diag_tickTime > (_this select 2)}, 
			{[_this select 0, _this select 1] call F90_fnc_respawnUnit},
			[_killed, infirmaryX, _accTime]
		] call AIS_Core_fnc_waitUntilAndExecute;
	};
} else 
{
	_killed setVariable ["AIS_UnitIsDead", true, true];

	// unit is dragged. So the dragger have to call the release function.
	private _dragger = _killed getVariable ["ais_DraggerUnit", objNull];
	if !(isNull _dragger) then 
	{
		[_killed] remoteExecCall ["AIS_System_fnc_release", _dragger, false];
	};

	_killed call AIS_System_fnc_restoreFaks;

	if !(isNull _killer) then 
	{
		_killed setVariable ["Record_UnitKiller", _killer, true];

		private _unitIsHVT = _killed getVariable ["Record_IsHVT", false];

		if (_unitIsHVT) then 
		{
			[_killed, "Confirm Identity"] remoteExec ["F90_fnc_addConfirmKillAction", 0, true];
		} else 
		{
			if (isPlayer _killer) then 
			{
				[_killed, "Confirm Kill"] remoteExec ["F90_fnc_addConfirmKillAction", 0, true];
			};
		};

		if (isPlayer _killer) then 
		{
			// Marks the body. Use spawn to reduce memory load, since unit dies almost all the time
			0 = [_killed, _killer] spawn
			{
				params ["_killed", "_killer"];
			
				private _opacity = _killer getVariable ["Skill_SharpEye", 0];
				if (_opacity != 0) then 
				{
					[_killer, _killed] remoteExec ["F90_fnc_markUnit", _killer];
				};
			};
		};
	} else 
	{
		private _unitIsHVT = _killed getVariable ["Record_IsHVT", false];

		if (_unitIsHVT) then 
		{
			[_killed, "Confirm Identity"] remoteExec ["F90_fnc_addConfirmKillAction", 0, true];
		};
	};
	// dead... if some issues with the deadcam (shown killer) give the dead a deleay of 1 frame --> need testing
	_killed setDamage 1;
};

true