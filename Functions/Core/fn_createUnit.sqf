/*
    Author: PrinceF90

    Description:
        This function creates a new unit for a given group at a specified position, loads injury system for the unit, sets starting money for the unit, and adds the unit to a list of created units.

    Parameter(s):
        0: OBJECT - _group: The group to which the unit belongs
        1: STRING - _type: The type/classname of unit to create
        2: ARRAY - _position: The position (format AGL) where the unit should be created
        3: ARRAY - _skill: Optional, default Mission_DefaultAISkill. The skills to be applied to the unit. Can be NUMBER or ARRAY.
        4: STRING - _name: Optional, default "". The name to apply to the unit. Can be ARRAY [STRING: fullname, STRING: firstName, STRING: surname].
        5: ARRAY - _wageArray: Optional, default [false, 0]. The wage to generate based on unit's value. Should be ARRAY [BOOLEAN: generate wage, NUMBER: Unit's initial hire price];

    Returns:
        OBJECT - The created unit
*/

params ["_group", "_type", "_position", "_skill", "_unitName", "_wageArray"];

private _unit = _group createUnit [_type, _position, [], 0, "FORM"];

if (isNil {_skill}) then 
{
    _skill = Mission_DefaultAISkill;
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
    [true, "createUnit", "fn_createUnit params #5 only accepts ARRAY [boolean, number].", true];
};

[_unit] call AIS_System_fnc_loadAIS;
_unit setVariable ["Mission_UnitClass", _type, true];

[_unit] joinSilent _group;

Mission_CreatedUnits pushBack _unit;
publicVariable "Mission_CreatedUnits";

_unit