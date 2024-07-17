params ["_unit"];

if (isNil {_unit}) then {_unit = player};

// Request the server to create a range officer
[] remoteExec ["F90_fnc_createRangeOfficer", 2];

// The multiplier for each skill upgrade
Skill_UpgradeMultiplier = 2;
// Price (in Milcash) of a unit of SP 
Skill_SPPrice = 100;

Skill_DefaultSkills = 
[
    // Format [skillName, skillDescription, level(-1 is locked), _maxLevel, upgradePrice];
    ["MarkDeadUnit", "Mark units you've killed", -1, 5, 5],
    ["RoutineBonus", "Gets extra bonus upon completing routine", -1, 10, 5]
];

_unit setVariable ["Skill_Points", 0, true];
