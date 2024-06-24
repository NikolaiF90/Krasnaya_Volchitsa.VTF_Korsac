[] call F90_fnc_initServerVariables;
[] remoteExec ["F90_fnc_initGlobalVariables", 0, true];

[] remoteExec ["F90_fnc_configurePersistent", 0, true];
[] remoteExec ["F90_fnc_configureEconomy", 0, true];
[] remoteExec ["F90_fnc_configureREC", 0, true];
[] remoteExec ["F90_fnc_configureIdentity", 0, true];
[] remoteExec ["F90_fnc_configureCAB", 0, true];
[] remoteExec ["F90_fnc_configureTask", 0, true];
[] remoteExec ["F90_fnc_configureSHARS", 0, true];

[] call F90_fnc_resetMap;
REC_WantedList = [CAB_WantedCounts] call F90_fnc_addWantedPerson;
publicVariable "REC_WantedList";

enableTeamSwitch true;

civilian setFriend [east, 1];

setGroupIconsVisible [true, false]; 
setGroupIconsSelectable true;

addMissionEventHandler ["TeamSwitch", 
{
	params ["_previousUnit", "_newUnit"];

    setGroupIconsVisible [true, false]; 
    setGroupIconsSelectable true;

    // Delete action if already exist. To prevent duplicate action on mission host
    if (!isNil {_RECActionID}) then { _newUnit removeAction _RECActionID};

    _RECActionID = _newUnit addAction 
    [
        "<t color='#23d1cd'>Open Tactical Tab</t>", 
        {
            params ["_target", "_caller", "_actionId", "_arguments"]; 
            [_caller] call F90_fnc_openTacticalTab;
        }, 
        nil, 
        4, 
        false, 
        false, 
        "", 
        "_target == _this"
    ];

    _newUnit setVariable ["REC_ActionID", _RECActionID];

    // Remove persistent action if already exist (to avoid duplicate action on server host)
    private _persistentActionID = _newUnit getVariable ["Persistent_ActionID", nil];
    if (!isNil {_persistentActionID}) then {_newUnit removeAction _persistentActionID};

    // Create a new persistent action
    _persistentActionID = _newUnit addAction 
    [
        "<t color='#0089f2'>Persistent</t>", 
        {
            [] call F90_fnc_openPersistentTab;
        },
        nil,
        4,
        false,
        true,
        "",
        "_this == _target"
    ];

    _newUnit setVariable ["Persistent_ActionID", _persistentActionID];
}];

addMissionEventHandler ["PlayerDisconnected", 
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

}];

Mission_InitDone = true;