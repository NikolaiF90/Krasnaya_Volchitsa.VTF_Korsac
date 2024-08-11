params ["_unit"];

if (isNil {_unit}) then {_unit = player};
 
// Request the server to create a range officer
[] remoteExec ["F90_fnc_createRangeOfficer", 2];

private _skillTree = _unit getVariable ["Skill_Tree", nil];
if (isNil {_skillTree}) then 
{
    _skillTree = Skill_DefaultSkills;
};
_unit setVariable ["Skill_Tree", _skillTree, true];

