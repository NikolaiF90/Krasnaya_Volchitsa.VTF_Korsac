/*
	Author: Psycho, PrinceF90 (Revisited)
 
	Description:
		Set the unit in unconcsious state. This is a public function.
 
	Parameter(s):
		_unit - Unit to set unconscious [OBJECT]
		_source - Source that makes the unit unconscious [OBJECT]
 
	Return:
		Nothing
 */


params ["_unit", "_source"];

if (time <= 0) exitWith {
	[
		{time > 0},
		{_this call AIS_System_fnc_setUnconscious},
		[_unit]
	] call AIS_Core_fnc_waitUntilAndExecute;
};

if (isNil {_source}) then {_source = objNull};

if (isPlayer _unit) then {
	[_unit, _source] call AIS_System_fnc_unconsciousPlayer;
} else {
	[_unit, _source] call AIS_System_fnc_unconsciousAI;
};