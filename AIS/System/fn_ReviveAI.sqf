﻿/*
	Author: Psycho, PrinceF90 (Revisited)

	Description:
		Revives and heals an injured unit with the help of a healer unit.

	Parameter(s):
		_healer - Healer unit to assist in reviving the injured unit. [OBJECT]
		_injured - Injured unit to be revived. [OBJECT]

	Returns: 
		None
*/

params ["_healer", "_injured"];

if (isNull _healer) then {_healer = player};

_injured setVariable ["ais_helperUnit", _healer, true];

private _oldBehaviour = behaviour _healer;

// Move the wounded out of the vehicle if in vehicle
if (!isNull objectParent _injured) exitWith 
{
	[[_injured, vehicle _injured, 0], {_this call AIS_System_fnc_moveCargoRemote}] remoteExec ["call"];
	private _accTime = diag_tickTime + 1.382;
	
	[
		{diag_tickTime > (_this select 2)}, 
		{[_this select 0, _this select 1] spawn AIS_System_fnc_ReviveAI},
		[_healer, _injured, _accTime]
	] call AIS_Core_fnc_waitUntilAndExecute;
};

[_injured, "AinjPpneMstpSnonWrflDnon_rolltoback"] remoteExec ['playMove', 0];

// switch to primary weapon if possible. Small delay for handling is needed.
if (primaryWeapon _healer != "") then 
{
	_healer selectWeapon primaryWeapon _healer;
	sleep 0.5;
};

// avoid to move the injured a few metres away
_healer setPos (getPos _injured);	
[_healer, "medicStart"] remoteExec ['playAction', 0];

_healer stop true;
{
	_healer disableAI _x;
} forEach ["MOVE","TARGET","AUTOTARGET","ANIM","AUTOCOMBAT"];

// Fix units position
private _offset = [0,0,0]; 
private _dir = 0;
private _relpos = _healer worldToModel position _injured;

if ((_relpos select 0) < 0) then 
{
	_offset = [-0.2,0.7,0];
	_dir = 90;
} else 
{
	_offset = [0.2,0.7,0];
	_dir = 270;
};

_injured attachTo [_healer, _offset];
[_injured, _dir] remoteExec ["setDir", 0, false];

private _duration = [_healer, _injured] call AIS_System_fnc_calculateReviveTime;

private _startTime = diag_tickTime + _duration;

waitUntil {
	diag_tickTime > _startTime ||
	!alive _healer ||
	!alive _injured ||
	_healer getVariable ["AIS_IsUnconscious", false]
};

_injured setVariable ["ais_helperUnit", ObjNull, true];

detach _healer;
detach _injured;

if (!alive _healer || _healer getVariable ["AIS_IsUnconscious", false]) exitWith {};
_healer playActionNow "medicStop";

_healer stop false;
{
	_healer enableAI _x;
} forEach ["MOVE","TARGET","AUTOTARGET","ANIM","AUTOCOMBAT"];

_healer setBehaviour _oldBehaviour;

if (alive _injured) then 
{
	_injured setVariable ["AIS_IsUnconscious", false, true];
	
	// healing if enabled
	if (AIS_REVIVE_HEAL) then 
	{
		_injured setDamage 0;
		_injured setVariable ["ais_fireDamage", 0];
	} else 
	{
		// make sure the unit can walk after revive
		if ((_injured getHitIndex 10) > 0.49) then 
		{
			[{(_this select 0) setHitIndex [10, 0.49]}, [_injured]] call AIS_Core_fnc_onNextFrame;
		};
	};

	[_injured] remoteExecCall ["AIS_System_fnc_restoreFaks", _injured, false];
	
	if (isPlayer _injured) then {
		[true] remoteExec ['showHud', _injured];
		if (AIS_TOGGLE_RADIO) then {
			[true] remoteExecCall ["AIS_Effects_fnc_toggleRadio", _injured, false];
		};
	} else {
		_injured stop false;
		{_injured enableAI _x; nil} count ["MOVE","TARGET","AUTOTARGET","ANIM","AUTOCOMBAT"];
	};
	
	[_injured, false] remoteExecCall ["AIS_System_fnc_unconcsiousRemote", 0]; 
	[_injured, false] remoteExec ["setCaptive", 0, false];
	
	["GetOutMan"] remoteExec ["removeAllEventHandlers", _injured, false];
};

true