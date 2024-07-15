/*
	Author: Psycho, PrinceF90 (Revisited)

	Description:
		Assigns a suitable AI helper to an injured unit based on specific criteria.

	Parameter(s):
		_injured - The injured unit [OBJECT]
		_helper - The AI helper unit [OBJECT]

	Returns:
		None
*/
params ["_injured", "_helper"];

if (isNil {_helper}) then {_helper = objNull};

// start searching for a match
if (isNull _helper) then 
{
	// looking for a valid AI group member.
	private _teammates = (units group _injured) - [_injured];
	if (count _teammates > 0) then 
	{
		private _aliveTeammates = [];
		{
			if (!(_x getVariable ["ais_unconscious", false]) && {!isPlayer _x}) then 
			{
				_aliveTeammates pushBack _x;
			};
		} forEach _teammates;
	
		if (count _aliveTeammates > 0) then 
		{
			// Prioritize units with Medic traits
			{
				if (_x call AIS_System_fnc_isMedic) exitWith {_helper = _x};
			} forEach _aliveTeammates;
			if (isNull _helper) then {_helper = selectRandom _aliveTeammates};
		};
	};
	
	// if no valid AI group member was found looking for close AI units of the same side
	if (isNull _helper) then 
	{
		private _nearbyUnits = [];
		if (AIS_AI_HELP_RADIUS > 200) then {AIS_AI_HELP_RADIUS = 200};	// max 200 metres
		_nearbyUnits = (position _injured) nearEntities ["CAManBase", AIS_AI_HELP_RADIUS];
		_nearbyUnits = _nearbyUnits - [_injured];
		
		if (count _nearbyUnits > 0) then 
		{
			private _allyUnits = [];
			private _side = _injured getVariable "Mission_UnitSide";
			{
				if ((_side isEqualTo (side _x)) && !(_x getVariable ["ais_unconscious", false]) && (!isPlayer _x)) then 
				{
					_allyUnits pushBack _x;
				};
			} forEach _nearbyUnits;
			if (count _allyUnits > 0) then 
			{
				{
					if (_x call AIS_System_fnc_isMedic) exitWith {_helper = _x};
				} forEach _allyUnits;
				// Pick any closest ally instead of randoms
				if (isNull _helper) then {_helper = _allyUnits select 0};	
			};
		};
	};
};

if (isNull _helper) exitWith {};


private _acc_time = diag_tickTime + 1;
if (local _helper) then 
{
	[{diag_tickTime > (_this select 2)}, 
	{
		_this call AIS_System_fnc_moveAIHelper;
	},
	[_injured, _helper, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;
} else 
{
	[{diag_tickTime > (_this select 2)}, 
	{
		[_this select 0, _this select 1] remoteExecCall ["AIS_System_fnc_moveAIHelper", 2];	
	}, 
	[_injured, _helper, _acc_time]] call AIS_Core_fnc_waitUntilAndExecute;
};