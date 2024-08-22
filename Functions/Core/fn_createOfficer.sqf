/*
    Author: PrinceF90

    Description:
        This function creates an officer unit from a list of classes, teleports the officer to a designated location, sets the officer's animation, and initializes a revive system for the officer.

    Parameter(s):
        _position - The position where the group will be created.  [ARRAY]
        _side - The side for the officer.  [SIDE]
        _classesList - A list of unit classes to choose from for the officer.  [ARRAY]

    Returns: 
        _officer - The created officer unit
*/
params ["_position", "_side", "_classesList"];

private _group = createGroup [_side, true];
private _officerClass = [_classesList, ["officer", "sl", "tl", "commander", "squadleader"]] call F90_fnc_getSuitableClass;
private _officer = _group createUnit [_officerClass, [0,0,0], [], 0, "FORM"];
[_officer, _position] spawn F90_fnc_teleportObject;
[_officer] call F90_fnc_setStandingAnimation;

// Init revive system
[_officer] call AIS_System_fnc_loadAIS;

_officer