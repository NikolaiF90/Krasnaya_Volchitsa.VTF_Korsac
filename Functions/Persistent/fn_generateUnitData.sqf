/*
	Author: PrinceF90 
 
    Description: 
        Function to generate data for a given unit and returns an array containing various information about the unit, such as its class, damage, position, loadout, skills, variables, orders, assigned team, and more. If the unit is on a vehicle, it also includes information about the vehicle and its crew. 
    
    Parameters: 
        0: OBJECT - _unit: The unit for which data is generated. 
        1: BOOL - _isLeader: A flag indicating whether the unit is a leader or not. 
    
    Returns: 
        ARRAY - An array containing detailed information about the unit, its vehicle (if applicable), and its group (if the unit is a leader). 
    
    Examples: 
        // Generate unit data for a player unit 
        _unitData = [_playerUnit, true] call F90_fnc_generateUnitData; 

        // Generate unit data for an AI unit 
        _unitData = [_aiUnit, false] call F90_fnc_generateUnitData;
*/
params ["_unit"];

private _GenerateVariablesArray =
{
    params ["_unit"];

    private _variablesArray = [];

    {
        private _splittedKey = _x splitString '_';

        if (_splittedKey # 0 != 'cba') then
        {
            _variablesArray pushBack [_x, _unit getVariable _x];
        };
    } forEach (allVariables _unit);

    _variablesArray;
};

private _GenerateSkillsArray =
{
    params ["_unit"];

    private _skillsArray = [];

    {
        _skillsArray pushBack [_x, _unit skill _x];
    } forEach [
        "aimingAccuracy",
        "aimingShake",
        "aimingSpeed",
        "commanding",
        "courage",
        "general",
        "reloadSpeed",
        "spotDistance",
        "spotTime"
    ];

    _skillsArray;
};

private _unitData = [];

_unitData pushBack ["class", typeOf _unit];
_unitData pushBack ["loadout", getUnitLoadout _unit];
_unitData pushBack ["side", side _unit];
_unitData pushBack ["skills", [_unit] call _GenerateSkillsArray];
_unitData pushBack ["name", (name _unit) splitString " "];
_unitData pushBack ["face", face _unit];
_unitData pushBack ["speaker", speaker _unit];
_unitData pushBack ["pitch", pitch _unit];
_unitData pushBack ["variables", [_unit] call _GenerateVariablesArray];

_unitData;