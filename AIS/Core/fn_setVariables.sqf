﻿/*
 * Author: Psycho
 
 * Set all needed vars to the unit.
 
 * Arguments:
	0: Healer Unit (Object)

 * Return value:
	Nothing
*/

params ["_unit"];

// local
_unit setVariable ["ais_fireDamage", 0];
_unit setVariable ["ais_frameNo_damageCaching", diag_frameno];
_unit setVariable ["ais_protector_delay", diag_tickTime];
_unit setVariable ["AIS_UnitIsDead", false];
_unit setVariable ["ais_side", side _unit];
_unit setVariable ["ais_CarryDrop_Torso", false];
ais_reenable_teamswitch = false;

// global (players and AI's)
// set Vars only if it is Nil. Isnt't everytime Nil(f.e. JIP's use AI to join in - get the last state from this AI)
if (isNil {_unit getVariable "AIS_IsUnconscious"}) then {
	_unit setVariable ["AIS_IsUnconscious", false, true];
	_unit setVariable ["ais_stabilized", false, true];
	_unit setVariable ["ais_helperUnit", objNull, true];
	_unit setVariable ["ais_DraggerUnit", objNull, true];
	_unit setVariable ["ais_DragDrop_Torso", objNull];// local is enough?
	_unit setVariable ["AIS_MedicalStore", [0,0,0,0,0,0,0,0,0,0,0], true];
	_unit setVariable ["ais_man_pullOut", false, true];
};


true