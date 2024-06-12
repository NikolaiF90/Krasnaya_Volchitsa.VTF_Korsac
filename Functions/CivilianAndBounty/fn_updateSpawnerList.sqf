/*
    Author: PrinceF90

    Description:
        Update spawner list by removing dead player from each civilian's spawner list.

    Parameter(s):
        0: OBJECT - _unit: The spawner unit to check and update the spawner list for.

    Returns:
        None
*/

params ["_unit"];

if !(alive _unit) then 
{
    private _spawnedCivs = _unit getVariable ["CIV_SpawnedUnits", []];

    if (count _spawnedCivs != 0) then 
    {
        {
            private _spawnerList = _x getVariable ["CIV_SpawnerUnits", objNull];
            if (_spawnerList != objNull) then 
            {
                _spawnerList = _spawnerList - [_deadPlayer];
                _x setVariable ["CIV_SpawnerUnits", _spawnerList, true];
            };
        } forEach _spawnedCivs;
    };
};