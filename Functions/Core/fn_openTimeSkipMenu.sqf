// Only accessible by server/host
if (!isServer && hasInterface) exitWith
{
    ["This Option Is Only Available For Server Host<br />Please Contact Server Host To Time Skip", "ERROR"] call F90_fnc_textNotification;
};

if (dialog) then 
{
    closeDialog 0;
};

createDialog "timeskipMenu";

TimeSkip_CurrentTime = daytime;
private _currentTimeString = [TimeSkip_CurrentTime] call F90_fnc_convertToTime;

ctrlSetText [TimeMenu_SkipTotalIDC, ""];
ctrlSetText [TimeMenu_NextHourIDC, _currentTimeString];

sliderSetRange [TimeMenu_TimeSliderIDC, 0, 72];
sliderSetSpeed [TimeMenu_TimeSliderIDC, 1, 0.5, 0.5];

(findDisplay TimeMenu_TimeSkipMenuIDC) displayCtrl TimeMenu_TimeSliderIDC ctrlAddEventHandler
[
    "SliderPosChanged",
    {
        params ["_control", "_newValue"];
        
        TimeSkip_TotalTimeSkip = _newValue;
        
        // Total hours to skip
        private _totalText = "";

        if (TimeSkip_TotalTimeSkip != 0) then 
        {
            _totalText = format ["+ %1 hours", TimeSkip_TotalTimeSkip];
        };
        
        ctrlSetText [TimeMenu_SkipTotalIDC, _totalText];

        // The time after time skip
        private _nextTime = TimeSkip_CurrentTime + TimeSkip_TotalTimeSkip;
        _nextTime = _nextTime % 24;
        private _timeString = [_nextTime] call F90_fnc_convertToTime;
        ctrlSetText [TimeMenu_NextHourIDC, _timeString];
    }
];