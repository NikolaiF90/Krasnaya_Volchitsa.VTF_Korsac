params [["_unit", player]];

CAB_NearbyHouses = [];
CAB_SpawnedCivilians = [];

if (CAB_CivilianSpawningEnabled) then 
{
    [_unit] spawn F90_fnc_scanHouses;
    [_unit] spawn F90_fnc_civilianHandler;
};