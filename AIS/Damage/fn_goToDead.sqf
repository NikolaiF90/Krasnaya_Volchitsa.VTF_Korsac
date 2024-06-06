/*
	Author: Psycho, PrinceF90(Revisited)
 
	Description: 
		This function handles actions to be taken when a unit is killed, including adding actions for confirming identity or kills. 
	
	Parameter(s): 
		0: OBJECT - _unit: The unit that has been killed 
		1: OBJECT - _killer: The killer of the unit (defaulted to objNull if not specified) 
	
	Returns: 
		None
 */

params ["_unit", ["_killer",objNull,[]]];

if (!alive _unit) exitWith {};
if (_unit getVariable ["AIS_UnitIsDead", false]) exitWith {};

_unit setVariable ["AIS_UnitIsDead", true];

// unit is dragged. So the dragger have to call the release function.
if (!(isNull (_unit getVariable ["ais_DragDrop_Player", objNull]))) then 
{
	_dragger = _unit getVariable ["ais_DragDrop_Player", objNull];
	[_unit] remoteExecCall ["AIS_System_fnc_release", _dragger, false];
};

_unit call AIS_System_fnc_restoreFaks;

if (!isNull _killer) then 
{
	_unit setVariable ["Record_UnitKiller", _killer];

	private _unitIsHVT = _unit getVariable ["Record_IsHVT", false];

	if (_unitIsHVT) then 
	{
		_unit addAction 
		[
			"Confirm Identity", 
			{
				params ["_target", "_caller", "_actionId", "_arguments"]; 
				[_target, _caller] call F90_fnc_confirmKill; 
				_target removeAction _actionId;
			},
			nil,
			6,
			true,
			true,
			"",
			"true",
			5
		];
	} else 
	{
		if (isPlayer _killer) then 
		{
			
			_unit addAction 
			[
				"Confirm Kill", 
				{
					params ["_target", "_caller", "_actionId", "_arguments"]; 
					[_target, _caller] call F90_fnc_confirmKill; 
					_target removeAction _actionId;
				},
				nil,
				6,
				true,
				true,
				"",
				"true",
				5
			];
		};
	};
} else 
{
	private _unitIsHVT = _unit getVariable ["Record_IsHVT", false];

	if (_unitIsHVT) then 
	{
		_unit addAction 
		[
			"Confirm Identity", 
			{
				params ["_target", "_caller", "_actionId", "_arguments"]; 
				[_target, _caller] call F90_fnc_confirmKill; 
				_target removeAction _actionId;
			},
			nil,
			6,
			true,
			true,
			"",
			"true",
			5
		];
	}
};

// dead... if some issues with the deadcam (shown killer) give the dead a deleay of 1 frame --> need testing
_unit setDamage 1;

true