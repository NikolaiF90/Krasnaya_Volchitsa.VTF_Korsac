/*
    Author: PrinceF90

    Description:
        Teleports a unit to a specified object with optional rotation adjustment.

    Parameter(s):
        _unit - The unit to be teleported. [OBJECT]
        _object - The object to teleport the unit to. [OBJECT]
        _rotDegree - (Optional, default 0) The rotation degree for adjustment. [NUMBER]
        

    Returns:
        _teleportPos - The final position to which the unit is teleported.
*/
params ["_unit", "_object", "_rotDegree"];

private _objectPosition = getPosASL _object;
private _terrainHeight = getTerrainHeightASL _objectPosition;
private _teleportPos = [];

if (isNil {_rotDegree}) then {_rotDegree = 0};

if (_objectPosition select 2 > _terrainHeight) then
{
    // Adjust for buildings
    private _adjustedPos = _objectPosition;
    _teleportPos = _adjustedPos getPos [1.25, getDir _object + _rotDegree];
    _unit setPosASL (AGLToASL _teleportPos);
} else 
{
    // Teleport to exact position(if it's not inside a building)
    _teleportPos = _object getPos [2, getDir _object + _rotDegree];
    _unit setPos _teleportPos;
};

_teleportPos