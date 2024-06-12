params ["_unit"];

private _reportMissionActionID = _unit addAction 
[
    "<t color='#23d1cd'>Report to officer</t>", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; 
        
        [_target, _actionId, "Mission_ReportMissionActionID"] remoteExec ["F90_fnc_removeActionGlobal", 0, true];
        [] remoteExec ["F90_fnc_showReport", 0];
        [] remoteExec ["F90_fnc_resetTask", 2];
    }, 
    nil, 
    1.5, 
    true, 
    true, 
    "", 
    "true", 
    5
];

_unit setVariable ["Mission_ReportMissionActionID", _reportMissionActionID, true];