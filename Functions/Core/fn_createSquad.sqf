/*
    Author: PrinceF90

    Description:
        This function creates a group of units based on the provided parameters, filtering out officers from the unit class list before spawning the units.

    Parameter(s):
        _groupSize - Number of units in the group [SCALAR]
        _classList - Array of unit classes to choose from [ARRAY]
        _spawnPos - Position where the units will be spawned [ARRAY]
        _side - Side of the group (e.g., west, east) [SIDE]
        _skill - Skill level of the spawned units [SCALAR or ARRAY]

    Returns:
        _group - The created group
*/
params ["_groupSize", "_classList", "_spawnPos", "_side", "_skill"];

private _group = createGroup [_side, true];

for "_i" from 1 to _groupSize do 
{
    private _listNoOfficers = +_classList;
    private _keywords = ["officer", "veteran"];

    // Filter out officers
    {
        private _key = toLower _x;
        {
            private _class = toLower _x;
            private _splittedClass = _class splitString "-_";
            private _classIndex = _forEachIndex;

            if (_key in _splittedClass) then 
            {
                _listNoOfficers deleteAt _classIndex;
            };
        } forEach _listNoOfficers;
    } forEach _keywords;
    
    private _unitClass = selectRandom _listNoOfficers;
    private _unit = [_group, _unitClass, _spawnPos, _skill] call F90_fnc_createUnit;
};

_group