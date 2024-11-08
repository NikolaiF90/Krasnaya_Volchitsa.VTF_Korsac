﻿/*
	Author: Psycho, PrinceF90 (Revisited)
 	
	Desctiption:
		Block the engine heal action during the unit is unconscious. Function is triggered trough the Heal-EH. Note: EH is brocken: did not react like the BI description tell it. Work around: remove all faks and give them back after the process is done. (without fak, no healing). Engine healing is also blocked by fn_overrideHealAction. Keep this function cause the other function isnt stackable! 
 
	Parameter(s):
		_injured - The injured unit that needs to get revived. [OBJECT]
		_healer - The healer unit that will revive injured unit. [OBJECT]
 
	Return:
		_return - true to block the engine handling, false to do the engine action
*/

params ["_injured", "_healer"];
private _return = false;

if (_injured getVariable ["AIS_IsUnconscious", false]) then 
{
	// remove FAKS to avoid the damage processing
	if (local _healer) then
	{
		[_healer] call AIS_System_fnc_removeFaks;
	} else {
		[_healer] remoteExec ["AIS_System_fnc_removeFaks", _healer, false];
	};
	
	if (isPlayer _healer) then 
	{
		private _txt = if (_injured getVariable ["ais_stabilized", false]) then 
		{
			"First you have to Revive the injured."
		} else {
			"First you have to Stabilize the injured."
		};
		[_txt] remoteExecCall ["AIS_Core_fnc_dynamicText", _healer, false];
	} else 
	{
		// we can use the AI handling at this point to start our own revive process...
		if (([_healer] call F90_fnc_getUnitSide) == ([_injured] call F90_fnc_getUnitSide)) then 
		{
			if (isNull (_injured getVariable ["ais_helperUnit", objNull])) then 
			{
				[_healer, _injured] spawn AIS_System_fnc_ReviveAI;
			};
		};
	};

	// give Faks back after healing process
	private _startTime = diag_tickTime + 8;
	if (local _healer) then {
		[{diag_tickTime > (_this select 1)},{[(_this select 0)] call AIS_System_fnc_restoreFaks;},[_healer, _startTime]] call AIS_Core_fnc_waitUntilAndExecute;
	} else {
		[_healer, _startTime] remoteExec ["[{diag_tickTime > (_this select 1)},{[(_this select 0)] call AIS_System_fnc_restoreFaks;},[_this selct 0, _this selct 1]] call AIS_Core_fnc_waitUntilAndExecute", _healer, false];
	};
	
	_return = true;
};


_return