﻿/*
 * Author: psycho
 
 * Check Unit if carrying is possible/allowed. If yes, drag-action is shown up.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	Bool
 */

private _target = _this;

_isUnc = _target getVariable ["AIS_IsUnconscious",false];
_isUncHealer = player getVariable ["AIS_IsUnconscious",false];
_Drag = !(isNull (_target getVariable ['ais_DraggerUnit', objNull]));
_Draging = !(isNull (player getVariable ['ais_DragDrop_Torso', objNull]));



_return = if (

	_isUnc &&
	!_isUncHealer &&
	{alive _target} &&
	{_Drag} &&
	{_Draging}
	
) then {true} else {false};




_return