params ["_detainee", "_arrestor"];

private _bountyIndex = _detainee getVariable ["CAB_WantedID", -1];
private _isWanted = _detainee getVariable ["Record_IsHVT", -1];
private _arrested = false;

_detainee disableAI "MOVE";
_detainee setCaptive true;

[_detainee, "AmovPercMstpSnonWnonDnon_Ease"] remoteExec ["playMove"]; 
[_detainee, "ANIM"] remoteExec ["disableAI"];

if (_bountyIndex != -1) then 
{
    if (_isWanted) then 
    {
        ["ARREST", [_detainee, _arrestor, _bountyIndex]] call F90_fnc_updateWantedList;
    };
};

_detainee setVariable ["CAB_IsArrested", true];
_arrested = true;

_arrested;