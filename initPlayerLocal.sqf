Mission_InitDone = false;
waitUntil {!isNil "Scenario_Name" && !isNull player && Mission_InitDone};

// Default Loadout 
private _leaderClass = [DSC_AlliedUnitList, ["sl", "tl", "squadleader", "leader"]] call F90_fnc_getSuitableClass;
private _defaultLoadout = getUnitLoadout _leaderClass;
player setUnitLoadout _defaultLoadout;

hcRemoveAllGroups player;

sleep 5;
[] spawn F90_fnc_splashScreen;
sleep 3;
[player, Mission_StartingPosition] remoteExec ["F90_fnc_resetUnit",2];

[MissionDebug, "init",format ["Starting %1...", Scenario_Name], false, true] call F90_fnc_debug;
[player] call F90_fnc_initPersistent;
[player] call F90_fnc_initEconomy;
[player] call F90_fnc_initREC;
[player] call F90_fnc_initCABPlayer;
[player] call F90_fnc_initSHARSPlayers;

waitUntil {!isNull (findDisplay Main_MissionDisplayIDD)};
(findDisplay Main_MissionDisplayIDD) displayAddEventHandler ["KeyDown", 
{
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    [_displayOrControl, _key, _shift, _ctrl, _alt] call F90_fnc_missionKeyHandler;
}];