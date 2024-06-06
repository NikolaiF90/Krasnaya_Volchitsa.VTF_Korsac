/*
	Author: Psycho, PrinceF90(Revisited) 
	
	Description: 
		This function handles the process of healing an injured unit by a designated healer(PLAYER), including animations, attachment, healing effects, and other actions. 
	
	Parameter(s): 
		0: OBJECT - _healer: The healer unit performing the medical aid. 
		1: OBJECT - _injured: The injured unit receiving medical aid. 
	
	Returns: 
		None
*/

params [
	["_healer", player, [player]],
	"_injured"
];

// Set variable to indicate that _healer is helping _injured
_injured setVariable ["ais_hasHelper", _healer, true];

// Play a specific move on _injured remotely
[_injured, "AinjPpneMstpSnonWrflDnon_rolltoback"] remoteExec ["playMove", 0];

// Switch to primary weapon if possible with a small delay
if (primaryWeapon _healer != "") then {
	_healer switchmove "amovpercmstpsraswrfldnon";
	_healer selectWeapon (primaryWeapon _healer);
};

// Play medicStart action on _healer
_healer playAction "medicStart";

// Add event handler to check for animation changes
ais_animChangeEVH = _healer addEventhandler ["AnimChanged", {
	params ["_healer","_anim"];
	if (primaryWeapon _healer isEqualTo "") then {
		if (_anim in ["amovpknlmstpsnonwnondnon","amovpknlmstpsraswlnrdnon"]) then {
			_healer playActionNow "medicStart";
		};
	};
}];

// Calculate offset, direction, and relative position for attachment
_offset = [0,0,0];
_dir = 0;
_relpos = _healer worldToModel position _injured;

// Determine offset and direction based on angles between units
if (((_healer getDir _injured) - (_injured getDir _healer)) < 0) then 
{
	_offset = [-0.2,0.7,0];
	_dir = 90
} else
{
	_offset = [0.2,0.7,0];
	_dir = 270
};

// Attach _injured to _healer with calculated offset
_injured attachTo [_healer, _offset];
[_injured, _dir] remoteExec ["setDir", 0, false];

// Call functions to equip medic gear and calculate revive time
[_healer, _injured] call AIS_Effects_fnc_medEquip;
private _duration = [_healer, _injured] call AIS_System_fnc_calculateReviveTime;

// Show progress bar for applying first aid
[
    "Applying First Aid", 
    _duration,
    {
		params ["_injured", "_healer"];

		_injured setVariable ["ais_unconscious", false, true];
		
		_healer removeEventHandler ["AnimChanged", ais_animChangeEVH];
		detach _healer;
		detach _injured;

		_healer playAction "medicStop";

		_injured setVariable ["ais_hasHelper", ObjNull, true];
		call AIS_Effects_fnc_garbage;
		
		// healing if enabled
		if (AIS_REVIVE_HEAL) then {
			_injured setDamage 0;
			_injured setVariable ["ais_fireDamage", 0];
		} else {
			// make sure the unit can walk after revive
			if ((_injured getHitIndex 10) > 0.49) then {
				[{(_this select 0) setHitIndex [10, 0.49]}, [_injured]] call AIS_Core_fnc_onNextFrame;
			};
		};
		
		[_injured] remoteExecCall ["AIS_System_fnc_restoreFaks", _injured, false];

		{_injured enableAI _x; nil} count ["TARGET","AUTOTARGET","ANIM","AUTOCOMBAT"];
		[_injured, false] remoteExecCall ["AIS_System_fnc_unconcsiousRemote", 0, false]; 
		
		["GetOutMan"] remoteExec ["removeAllEventHandlers", _injured, false];
		
		private _injuredSide = _injured getVariable "Mission_UnitSide";
		if (_injuredSide == Mission_EnemySide && _injuredSide != side _healer) then
		{
			[_injured] remoteExec ["removeAllWeapons", 0, false];
			[_injured, "MOVE"] remoteExec ["disableAI"];
			[_injured, true] remoteExec ["setCaptive", 0, false];

			[_injured, "Acts_UnconsciousStandUp_Actions"] remoteExec ["playMove", 0, false];
			sleep 4;
			[_injured, "AmovPercMstpSsurWnonDnon"] remoteExec ["playMove", 0, false];
			_injured setBehaviour "CARELESS";
			_injured setCombatMode "BLUE";

			// Add arrest action
			_injured addAction 
			[
				"<t color='#00ff00'>Arrest</t>",
				{
					params ["_target", "_caller", "_actionId", "_arguments"];
					private _arrested = [_target, _caller] call F90_fnc_arrest;
					if (_arrested) then {_target removeAction _actionId};
				},
				nil,
				5,
				true,
				true,
				"",
				"alive _target",
				5
			];

		} else 
		{
			_injured enableAI "MOVE";
			[_injured, false] remoteExec ["setCaptive", 0, false];
			_injured stop false;
		};
    },
    [_injured, _healer],
	{
		params ["_injured", "_healer"];
		
		_injured setVariable ["ais_hasHelper", ObjNull, true];
		
		_healer removeEventHandler ["AnimChanged", ais_animChangeEVH];
		detach _healer;
		detach _injured;
		
		call AIS_Effects_fnc_garbage;
		
		if (alive _healer) then {
			_healer playActionNow "medicStop";
		};
		if (!alive _injured) then {["He is not with us anymore."] call AIS_Core_fnc_dynamicText};
	},
	(!alive _injured || _healer getVariable ["ais_unconscious",false])
] call AIS_Core_fnc_Progress_ShowBar;