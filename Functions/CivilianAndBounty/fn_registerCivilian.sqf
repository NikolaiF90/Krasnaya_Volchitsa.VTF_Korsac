params ["_unit"];

_unit setVariable ["CAB_IDChecked", false, true];
_unit setVariable ["CAB_IsArrested", false, true];

CAB_AskActionID = _unit getVariable ["CAB_AskActionID", -1];
if (CAB_AskActionID != -1) then 
{
    [_unit, CAB_AskActionID] remoteExec ["removeAction", 0, true];
};
[_unit] remoteExec ["F90_fnc_addAskIDAction", 0, true];

CAB_ArrestActionID = _unit getVariable ["CAB_ArrestActionID", -1];
if (CAB_ArrestActionID != -1) then 
{
    [_unit, CAB_ArrestActionID] remoteExec ["removeAction", 0, true];
};
[_unit] remoteExec ["F90_fnc_addArrestAction", 0, true];