/*
	Author: Psycho, PrinceF90 (Revisited)

	Description:
		This function checks for nearby unconscious units, draws a 3D icon for each unit, and displays the distance from the player to the unit. It adjusts the recognition distance based on whether the player is a medic.

	Parameter(s):
		None

	Returns: 
		None
*/

if (isNull (findDisplay 46)) exitWith {}; // Ensure game menu is available
if (!isNull (findDisplay 49)) exitWith {}; // Exit if the Esc Menu is present

// Remove mission event handler if the client has left the mission
if (getClientStateNumber in [11, 12]) exitWith 
{
	removeMissionEventHandler ["draw3D", AIS_Core_3DEHId];
};

private _recognitionDistance = 20;
if (player getUnitTrait "Medic") then 
{
	_recognitionDistance = 35;
};

private _targets = [];
_targets = player nearEntities ["CAManBase", _recognitionDistance];
if (count _targets < 1) exitWith {};

private _playerPos = positionCameraToWorld [0, 0, 0];

if (!surfaceIsWater _playerPos) then {
    _playerPos = ATLtoASL _playerPos;
};

{
    private _target = effectiveCommander _x;

	if (
		_target getVariable ["AIS_IsUnconscious", false] &&
		{_target != player} &&
		//{isPlayer _target} &&
		{!(_x in allUnitsUAV)} &&
		{alive player} &&
		{AIS_Core_realSide isEqualTo (getNumber (configfile >> "CfgVehicles" >> (typeOf _target) >> "side"))}
	) then {
        _targetPos = getPosASLVisual _target;
        _distance = _targetPos distance2D _playerPos;
		_headPosition = _target modelToWorldVisual (_target selectionPosition "spine");
		_alpha = 0.8;
		//_color = [0.94,1,0,_alpha];//Yellow
		//_color = [0.65,0.15,0,_alpha];//Dark Red
		_color = [0.87,0.03,0,_alpha];//shiny Red
        _targetPos set [2, ((_target modelToWorld [0,0,0]) select 2) + _height + _distance * 0.026];
        _text = format ["%1 (%2m)", name _target, ceil (player distance _target)];
		
		_icon =	if (_target getVariable ["ais_stabilized", false]) then {
			"\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca.paa"
		} else {
			"\a3\ui_f\data\IGUI\Cfg\Actions\bandage_ca.paa"
		};

		drawIcon3D [_icon, _color, _headPosition vectorAdd [0, 0, 0.4], 0.8, 0.8, 0, _text, 1, 0.04, "PuristaMedium", "center", true];
    };
	
	true
} count _targets;