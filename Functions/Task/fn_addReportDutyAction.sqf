params ["_unit"];

private _reportDutyActionID = _unit addAction 
[
    "<t color='#23d1cd'>Report Duty</t>", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        
        [] remoteExec ["F90_fnc_requestMission", 2];
    },
    nil, 
    1.5, 
    true, 
    true, 
    "", 
    "Task_MainTaskStatus == -1", 
    5
];

_unit setVariable ["Mission_ReportDutyActionID", _reportDutyActionID, true];

sleep 0.01;