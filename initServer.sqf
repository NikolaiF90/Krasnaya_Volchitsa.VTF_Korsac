Mission_DoneInitGlobalVariables = false;
[] remoteExec ["F90_fnc_initGlobalVariables", 0, true];
["Server"] call F90_fnc_initStartGame;
["Client"] remoteExec ["F90_fnc_initStartGame", 0, true];
waitUntil {Server_Started};
[] call F90_fnc_initServerVariables;

[] remoteExec ["F90_fnc_configurePersistent", 0, true];
[] remoteExec ["F90_fnc_configureEconomy", 0, true];
[] remoteExec ["F90_fnc_configureREC", 0, true];
[] remoteExec ["F90_fnc_configureIdentity", 0, true];
[] remoteExec ["F90_fnc_configureCAB", 0, true];
[] remoteExec ["F90_fnc_configureTask", 0, true];
[] remoteExec ["F90_fnc_configureSHARS", 0, true];
[] remoteExec ["F90_fnc_configureDSC", 0, true];

[] call F90_fnc_resetMap;
REC_WantedList = [CAB_WantedCounts] call F90_fnc_addWantedPerson;
publicVariable "REC_WantedList";

enableTeamSwitch true;

civilian setFriend [Mission_AlliedSide, 1];

setGroupIconsVisible [false, false]; 
setGroupIconsSelectable true;

// Set Time 
["TIME", Mission_Time] remoteExec ["F90_fnc_setMissionDate", 0, true];

addMissionEventHandler ["TeamSwitch", 
{
	params ["_previousUnit", "_newUnit"];

    setGroupIconsVisible [false, false]; 
    setGroupIconsSelectable true;
}];

addMissionEventHandler ["PlayerDisconnected", 
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

}];

Mission_InitDone = true;
publicVariable "Mission_InitDone";