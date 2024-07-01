/*
 * Author: psycho
 
 * Check Unit if dragging/carrying is possible/allowed. If yes, drag-action is shown up.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	Bool
 */

private _target = _this;

_isUnc = _target getVariable ["ais_unconscious",false];
_isUncHealer = player getVariable ["ais_unconscious",false];
_noHealer = isNull (_target getVariable ['ais_helperUnit', objNull]);
_noDrag = isNull (_target getVariable ['ais_DraggerUnit', objNull]);
_noDraging = isNull (player getVariable ['ais_DragDrop_Torso', objNull]);



_return = if (

	_isUnc &&
	!_isUncHealer &&
	{alive _target} &&
	{_noHealer} &&
	{_noDrag} &&
	{_noDraging}
	
) then {true} else {false};




_return