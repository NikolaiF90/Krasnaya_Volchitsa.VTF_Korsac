[] call F90_fnc_initServerVariables;
[] remoteExec ["F90_fnc_initGlobalVariables", 0, true];

[] remoteExec ["F90_fnc_configurePersistent", 0, true];
[] remoteExec ["F90_fnc_configureEconomy", 0, true];
[] remoteExec ["F90_fnc_configureREC", 0, true];
[] remoteExec ["F90_fnc_configureIdentity", 0, true];
[] remoteExec ["F90_fnc_configureCAB", 0, true];
[] remoteExec ["F90_fnc_configureTask", 0, true];

[] call F90_fnc_resetMap;
REC_WantedList = [CAB_WantedCounts] call F90_fnc_addWantedPerson;
publicVariable "REC_WantedList";

enableTeamSwitch true;

civilian setFriend [east, 1];

addMissionEventHandler ["TeamSwitch", 
{
    params ["_previousUnit", "_newUnit"];

    //[_previousUnit, _newUnit] call F90_fnc_switchUnitAddAction;
}];