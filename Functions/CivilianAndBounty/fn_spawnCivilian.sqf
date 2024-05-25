// Find house as spawn point 
private _houseIndex = floor random (count CAB_NearbyHouses);
private _spawnHouse = CAB_NearbyHouses # _houseIndex;
private _spawnPos = [_spawnHouse, 0, 20] call BIS_fnc_findSafePos;

// Spawn the civilian 
private _group = createGroup [civilian, true];
private _className = selectRandom CAB_AllCivilianClassnames;
private _spawnedCiv = _group createUnit [_className, _spawnPos, [], 0, "FORM"];
[_spawnedCiv] call F90_fnc_registerCivilian;
_spawnedCiv switchMove "";
_spawnedCiv setcaptive true;
_spawnedCiv enablesimulation false;
_spawnedCiv setskill 0;
_spawnedCiv disableAI "TARGET";
_spawnedCiv disableAI "FSM";
_spawnedCiv disableAI "AUTOTARGET";
_spawnedCiv disableAI "AIMINGERROR";
_spawnedCiv disableAI "SUPPRESSION"; 
_spawnedCiv disableAI "CHECKVISIBLE"; 
_spawnedCiv disableAI "AUTOCOMBAT";
removeAllWeapons _spawnedCiv;
_spawnedCiv setAnimSpeedCoef 0.7 + random 0.2;
_spawnedCiv setvariable ["CIV_Lifetime", diag_ticktime + CAB_CivilianLifetime];
_spawnedCiv setVariable ["CIV_SpawnerUnits", [player], true];

group _spawnedCiv setspeedmode "LIMITED";
group _spawnedCiv setBehaviour "SAFE";

_spawnedCiv enablesimulation true;

CAB_SpawnedCivilians pushBack _spawnedCiv;

[CABDebug, "spawnCivilian", "Civilian spawned", false] call F90_fnc_debug;
_spawnedCiv;