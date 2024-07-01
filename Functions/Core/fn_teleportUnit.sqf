params ["_unit", "_object"];

private _objectPosition = getPosASL _object;
private _terrainHeight = getTerrainHeightASL _objectPosition;

if (_objectPosition select 2 > _terrainHeight) then
{
    // Adjust for buildings
    private _adjustedPos = _objectPosition;
    _unit setPosASL _adjustedPos;
} else 
{
    // Teleport to exact position(if it's not inside a building)
    _unit setPos (position _object);
};