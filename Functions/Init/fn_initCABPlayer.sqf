params [["_unit", player]];

CAB_PlayerOldPos = [0,0,0];
CAB_NearbyHouses = [];
CAB_HousesNearPlayer = [];
CAB_CivilianCount = 0;
CAB_SpawnedCivilians = [];

if (CAB_CivilianSpawningEnabled) then 
{
    [_unit] spawn F90_fnc_scanHouses;
    [_unit] spawn F90_fnc_civilianHandler;
};