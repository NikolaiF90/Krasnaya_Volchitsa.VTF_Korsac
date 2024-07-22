waitUntil {!isNil "Scenario_Name" && !isNull player && !isNil "Mission_InitDone"};
waitUntil {Mission_InitDone};

if (isServer && hasInterface) then {missionCaptain = player};

// Player Side
private _playerGroup = createGroup [Mission_AlliedSide, true];
[player] joinSilent _playerGroup;

// Create a clone
private _cloneGroup = createGroup [Mission_AlliedSide, true];
private _cloneType = [DSC_AlliedUnitList, ["tl", "sl", "leader"]] call F90_fnc_getSuitableClass;
private _cloneUnit = [_cloneGroup, _cloneType, [0,0,0]] call F90_fnc_createUnit;
// cloning identity and loadouts
private _cloneFace = face _cloneUnit;
[player, _cloneFace] remoteExec ["setFace", 0, true];
private _cloneSpeaker = speaker _cloneUnit;
[player, _cloneSpeaker] remoteExec ["setSpeaker", 0, true];
private _clonePitch = pitch _cloneUnit;
[player, _clonePitch] remoteExec ["setPitch", 0, true];
private _cloneLoadout = getUnitLoadout _cloneUnit;
player setUnitLoadout _cloneLoadout;
player setVariable ["RSW_UnitSide", side _cloneGroup, true];
// Delete Clone
[_cloneUnit] call F90_fnc_deleteUnit;

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
[player] call F90_fnc_initPRS;
[player] call F90_fnc_initSkillTree;

waitUntil {!isNull (findDisplay Main_MissionDisplayIDD)};
(findDisplay Main_MissionDisplayIDD) displayAddEventHandler ["KeyDown", 
{
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    [_displayOrControl, _key, _shift, _ctrl, _alt] call F90_fnc_missionKeyHandler;
}];