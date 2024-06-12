/*
    Author: PrinceF90

    Description:
        This function randomly spawns a high-value target (HVT) unit at a specified position with certain attributes. 

    Parameter(s):
        0: INT - _spawnChance: Spawn chance percentage
        1: ARRAY - _position: The position (format AGL) where the unit should be spawned

    Returns:
        None
*/

params ["_spawnChance", "_position"];

if (_spawnChance >= (floor random 101)) then 
{
    private _group = createGroup [west, true];
    private _type = selectRandom Mission_HVTUnits;
    private _unit = _group createUnit [_type, _position, [], 0, "FORM"];
    [_unit] call AIS_System_fnc_loadAIS;

    [_unit] joinSilent _group;

    private _wantedID = floor random (count REC_WantedList);
    private _unitData = REC_WantedList # _wantedID;
    
    private _fullName = _unitData # 0;
    private _firstName = _unitData # 1;
    private _surname = _unitData # 2;
    
    _unit setName [_fullName, _firstName, _surname];

    _unit setVariable ["Record_IsHVT", true, true];
    _unit setVariable ["CAB_WantedID", _wantedID, true];

    Mission_CreatedUnits pushBack _unit;
};