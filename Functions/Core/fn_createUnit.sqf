/*
    Author: PrinceF90

    Description:
        This script creates a unit with specified parameters such as skill levels, name, and wage details.

    Parameter(s):
        _group - Group object to which the unit belongs [OBJECT]
        _type - Type of unit to create [STRING]
        _position - Position where the unit will be created [ARRAY]
        _skill - (Optional, default Mission_DefaultAISkill) Skill levels of the unit [ARRAY or SCALAR]
        _unitName - (Optional, default "") Name of the unit [STRING or ARRAY]
        _wageArray - (Optional, default Array = Element1:false,Element2:0) Array containing wage generation details where Element1 BOOL:_shouldGenerate, Element2 SCALAR:_initialCost [ARRAY]

    Returns: 
        None
*/

params ["_group", "_type", "_position", "_skill", "_unitName", "_wageArray"];

private _unit = _group createUnit [_type, _position, [], 0, "FORM"];

if (isNil {_skill}) then 
{
    switch (side _group) do 
    {
        case Mission_EnemySide: {_skill = Mission_DefaultEnemySkill};
        case Mission_AlliedSide: {_skill = Mission_DefaultAlliedSkill};
        default {_skill = Mission_DefaultAISkill};
    };
};

if (_skill isEqualType []) then 
{
    if (count _skill > 0 && count _skill == 8) then 
    {
        _unit setSkill ["aimingAccuracy", _skill select 0];
        _unit setSkill ["aimingShake", _skill select 1];
        _unit setSkill ["aimingSpeed", _skill select 2];
        _unit setSkill ["spotDistance", _skill select 3];
        _unit setSkill ["spotTime", _skill select 4];
        _unit setSkill ["courage", _skill select 5];
        _unit setSkill ["reloadSpeed", _skill select 6];
        _unit setSkill ["commanding", _skill select 7];
    } else 
    {
        _unit setSkill _skill;
    };
} else 
{
    _unit setSkill _skill;
};

if (isNil {_unitName}) then
{
    _unitName = "";
};

if (_unitName isEqualType []) then 
{
    _unit setName _unitName;
} else
{
    if (_unitName != "") then 
    {
        private _nameArray = _unitName splitString " ";
        _unit setName [_unitName, _nameArray select 0, _nameArray select 1];
    };
};

if (isNil {_wageArray}) then 
{
    _wageArray = [false, 0];
};

if (count _wageArray == 2) then 
{
    private _shouldGenerate = _wageArray select 0;
    private _initialCost = _wageArray select 1;

    if (_shouldGenerate) then
    {
        private _wage = [_unit] call F90_fnc_generateWage;
        _unit setVariable ["SHARS_Wage", _wage, true];
    } else 
    {
        _unit setVariable ["SHARS_Wage", _initialCost, true];
    };
} else 
{
    [MissionDebug, "createUnit", "fn_createUnit params #5 only accepts ARRAY [boolean, number].", false, false] call F90_fnc_debug;
};

[_unit] call AIS_System_fnc_loadAIS;
_unit setVariable ["Mission_UnitClass", _type, true];
_unit setVariable ["Mission_UnitSide", side _group, true];

[_unit] joinSilent _group;

Mission_CreatedUnits pushBack _unit;
publicVariable "Mission_CreatedUnits";

_unit