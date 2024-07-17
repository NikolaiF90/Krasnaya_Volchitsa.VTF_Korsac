/*
    Author: PrinceF90

    Description:
        Prepares a unit for a standing idle animations.

    Parameter(s):
        _unit - The unit to be prepared for animation. [OBJECT]

    Returns:
        None
*/
params ["_unit"];

_unit setCombatBehaviour "SAFE";
_unit setUnitPos "Up";
[_unit, "MOVE"] remoteExec ["disableAI", 0, true];

[_unit, "AmovPercMstpSnonWnonDnon"] remoteExec ["switchMove", 0, true]; 
[_unit, "HubBriefing_loop"] remoteExec ["playMoveNow", 0, true];