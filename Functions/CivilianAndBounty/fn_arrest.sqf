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
    private _originalSide = [_detainee] call F90_fnc_getUnitSide;
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

// Add interrogate action
_detainee setVariable ["RSW_Interrogated", false, true];
[
    _detainee, 
    "Interrogate",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        // Set interrogated to prevent future execution
        _target setVariable ["RSW_Interrogated", true, true];

        // Intels 
        private _chance = random 101;

        if (CAB_IntelDropChance >= _chance) then 
        {
            private _addedPOI = [1] call F90_fnc_addWantedPerson;
            {
                REC_WantedList pushBack _x;
            } forEach _addedPOI;
            publicVariable "REC_WantedList";
            
            [["An intel was gained from the interrogation. ", format ["%1 has been added to your wanted list", (_addedPOI select 0) select 0]], "DEFAULT"] call F90_fnc_textNotification;
        } else 
        {
            ["You gained nothing from the interrogation", "WARNING"] call F90_fnc_textNotification;
        };
    },
    "((_target getVariable 'RSW_Interrogated') == false) && alive _this",
    "RSW_InterrogateActionID"
] remoteExec ["F90_fnc_addAction", 0, true];
_arrested = true;

_arrested;