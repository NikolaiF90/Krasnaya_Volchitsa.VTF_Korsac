/*
    Author: PrinceF90

    Description:
        This function creates multiple(random from _min to _max) groups of units at a specified position for the given side and assigns a patrol task for each of the created groups.

    Parameter(s):
        _position - The position where the groups will be spawned [ARRAY]
        _side - The side of the groups to be created [SIDE]
        _unitList - The list from which units are selected [ARRAY]
        _skill - (Optional, default Mission_DefaultAISkill) The skill level of the units [SCALAR]
        _minGroup - (Optional, default 1) The minimum number of groups to create [INT]
        _maxGroup - (Optional, default 1) The maximum number of groups to create [INT]
        _patrolRadius - (Optional, default 100) The radius in meters for each group's patrol distance.

    Returns: 
        _createdUnits - Array of all created units. 
*/
params ["_position", "_side", "_unitList", "_skill", "_minGroup", "_maxGroup", "_patrolRadius"];

if (isNil {_skill}) then {_skill = Mission_DefaultAISkill};
if (isNil {_minGroup}) then {_minGroup = 1};
if (isNil {_maxGroup}) then {_maxGroup = 1};
if (isNil {_patrolRadius}) then {_patrolRadius = 100};

private _groupCount = [floor _minGroup,floor _maxGroup] call BIS_fnc_randomInt;
private _createdUnits = [];

for "_i" from 1 to _groupCount do 
{
    private _groupSize = [2, 6] call BIS_fnc_randomInt;
    private _group = [_groupSize, _unitList, _position, _side, _skill] call F90_fnc_createSquad;
    [_group, _position, 100] call BIS_fnc_taskPatrol;
};

_createdUnits