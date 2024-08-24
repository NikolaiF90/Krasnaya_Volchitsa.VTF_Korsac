// These variables must be defined here as player might not exist yet
Server_Started = false;
publicVariable "Server_Started";
Mission_InitDone = false;
publicVariable "Mission_InitDone";

Mission_DoneInitGlobalVariables = false;
[] remoteExec ["F90_fnc_initDialogIDC", 0, true];
[] remoteExec ["F90_fnc_initGlobalVariables", 0, true];
[] remoteExec ["F90_fnc_initStartGame", 0, true];
waitUntil {Server_Started};
[] call F90_fnc_initServerVariables;

Server_ModsInitialized = false;
[] call F90_fnc_initMods;

waitUntil {Server_ModsInitialized};

[] call F90_fnc_resetMap;
REC_WantedList = [CAB_WantedCounts] call F90_fnc_addWantedPerson;
publicVariable "REC_WantedList";

// Create base markers
[] spawn F90_fnc_createBaseLocationMarkers;

enableTeamSwitch false;

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