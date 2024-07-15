/*
    Author: PrinceF90

    Description:
        This function teleports a unit to a specified object position and adjusting for buildings if necessary.

    Parameter(s):
        _unit - The unit to be teleported. [OBJECT]
        _object - The object to teleport the unit to. [OBJECT]

    Returns:
        _teleportPos - The position the unit teleported to.
*/
params ["_unit", "_object"];

private _objectPosition = getPosASL _object;
private _terrainHeight = getTerrainHeightASL _objectPosition;
private _teleportPos = [];

if (_objectPosition select 2 > _terrainHeight) then
{
    // Adjust for buildings
    private _adjustedPos = _objectPosition;
    _teleportPos = _adjustedPos getPos [1.25, getDir _object];
    _unit setPosASL (AGLToASL _teleportPos);
} else 
{
    // Teleport to exact position(if it's not inside a building)
    _teleportPos = _object getPos [2, getDir _object];
    _unit setPos _teleportPos;
};

_teleportPos