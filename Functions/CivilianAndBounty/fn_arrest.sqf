params ["_detainee", "_arrestor"];

private _bountyIndex = _detainee getVariable ["CAB_WantedID", -1];
private _isWanted = _detainee getVariable ["Record_IsHVT", -1];
private _arrested = false;

[_detainee, "MOVE"] remoteExec ["disableAI", 0, true];
_detainee setCaptive true;

[_detainee, "AmovPercMstpSnonWnonDnon"] remoteExec ["switchMove"]; 
[_detainee, "AmovPercMstpSnonWnonDnon_Ease"] remoteExec ["playMoveNow"]; 
[_detainee, "ANIM"] remoteExec ["disableAI"];

if (_bountyIndex != -1) then 
{
    if (_isWanted) then 
    {
        ["ARREST", [_detainee, _arrestor]] call F90_fnc_updateWantedList;
    };
} else 
{
    // Get the original side of the unit. 
    private _originalSide = _detainee getVariable ["RSW_UnitSide", civilian];
    // Get arrest history 
    private _hasBeenArrested = _detainee getVariable ["CAB_HasBeenArrested", false];

    // Update temporary captured prisoners
    if (Task_MainTaskStatus == 0 && _originalSide != civilian) then
    {
        private _tempPrisoners = _arrestor getVariable "REC_TempCapturedPrisoners";
        
        if !(_hasBeenArrested) then 
        {
            _tempPrisoners = _tempPrisoners + 1;
            _arrestor setVariable ["REC_TempCapturedPrisoners", _tempPrisoners];
            _detainee setVariable ["CAB_HasBeenArrested", true, true];
        };
    };
};

_detainee setVariable ["CAB_IsArrested", true, true];
_arrested = true;

_arrested;