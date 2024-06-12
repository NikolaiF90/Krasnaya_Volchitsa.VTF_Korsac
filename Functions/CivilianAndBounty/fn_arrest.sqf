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
        ["ARREST", [_detainee, _arrestor, _bountyIndex]] call F90_fnc_updateWantedList;
    };

    // Update temporary captured hvts
    if (Task_MainTaskStatus == 0) then 
    {
        private _tempCapturedHVT = _arrestor getVariable "REC_TempHVTCaptured";
        
        _tempCapturedHVT = _tempCapturedHVT + 1;
        _arrestor setVariable ["REC_TempHVTCaptured", _tempCapturedHVT];
    } else 
    {
        private _totalArrestedHVT = _arrestor getVariable "Record_TotalArrestedHVT";
        
        _totalArrestedHVT = _totalArrestedHVT + 1;
        _arrestor setVariable ["Record_TotalArrestedHVT", _totalArrestedHVT];
    };
} else 
{
    // Get the original side of the unit. 
    private _originalSide = _detainee getVariable ["Mission_UnitSide", civilian];

    // Update temporary captured prisoners
    if (Task_MainTaskStatus == 0 && _originalSide != civilian) then
    {
        private _tempPrisoners = _arrestor getVariable "REC_TempCapturedPrisoners";

        _tempPrisoners = _tempPrisoners + 1;
        _arrestor setVariable ["REC_TempCapturedPrisoners", _tempPrisoners];
    };
};

_detainee setVariable ["CAB_IsArrested", true, true];
_arrested = true;

_arrested;