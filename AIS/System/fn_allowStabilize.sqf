/*
 * Author: Psycho
 
 * Check Unit if Revive is possible. If yes, Revive-Action is shown up.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	Bool
 */

private _target = _this;

_isUnc = _target getVariable ["AIS_IsUnconscious",false];
_isStabil = _target getVariable ["ais_stabilized",false];
_isUncHealer = player getVariable ["AIS_IsUnconscious",false];
_noHealer = isNull (_target getVariable ['ais_helperUnit', objNull]);
_noDrag = isNull (_target getVariable ['ais_DraggerUnit', objNull]);
_noDraging = isNull (player getVariable ['ais_DragDrop_Torso', objNull]);


_return = if (

	_isUnc &&
	{!_isStabil} &&
	{!_isUncHealer} &&
	{alive _target} &&
	{_noHealer} &&
	{_noDrag} &&
	{_noDraging}
	
) then {true} else {false};




_return