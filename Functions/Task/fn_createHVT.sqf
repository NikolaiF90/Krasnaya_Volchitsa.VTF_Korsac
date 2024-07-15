/*
    Author: PrinceF90

    Description:
        This function randomly spawns a high-value target (HVT) unit at a specified position with certain attributes. 

    Parameter(s):
        0: INT - _spawnChance: Spawn chance percentage
        1: ARRAY - _position: The position (format AGL) where the unit should be spawned

    Returns:
        _hvt - spawned HVT
*/

params ["_spawnChance", "_position"];

if (_spawnChance >= (floor random 101)) then 
{
    private _wantedID = floor random (count REC_WantedList);
    private _wantedData = REC_WantedList # _wantedID;
    private _nameData = [_wantedData select 0, _wantedData select 1, _wantedData select 2];

    private _group = createGroup [Mission_EnemySide, true];
    private _type = [DSC_EnemyUnitList, ["officer", "sl", "tl", "commander", "squadleader"]] call F90_fnc_getSuitableClass;
    private _unit = [_group, _type, _position, Mission_DefaultEnemySkill, _nameData] call F90_fnc_createUnit;

    _unit setVariable ["Record_IsHVT", true, true];
    _unit setVariable ["CAB_WantedID", _wantedID, true];
    Task_SpawnedHVT pushBack _unit;
    
    _unit
};