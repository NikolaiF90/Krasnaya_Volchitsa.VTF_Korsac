/*
    Author: PrinceF90

    Description:
        This function manages the spawning of civilians based on player position and environmental conditions.

    Parameter(s):
        None

    Returns:
        None
*/
params ["_unit"];
private _outOfSpawnArea = false;

while {true} do 
{
    if (CAB_PlayerOldPos distance (position _unit) > CAB_CivilianSpawnRadius && speed _unit < 130) then 
    {
        _outOfSpawnArea = true;
        CAB_PlayerOldPos = position _unit;
    };

    if (_outOfSpawnArea) then 
    {
        // Find another nearby houses
        CAB_HousesNearPlayer = CAB_AllHousesOnMap select {_x distance _unit <= CAB_CivilianSpawnRadius};

        // Filter only habitable houses
        CAB_NearbyHouses = [CAB_CivilianSpawnRadius] call F90_fnc_filterGoodHouses;
        CAB_NearbyHouses = CAB_NearbyHouses select {damage _x < 0.75};

        // Generate civilian count
        CAB_CivilianCount = floor ((count CAB_NearbyHouses)/ CAB_CivilianDensity);
        // Make sure civilian count doesn't reach over the limit
        CAB_CivilianCount = CAB_CivilianCount min CAB_MaxCivilianCounts;
        // Disable spawning if raining or nightime
        if ((rain > 0.2) || (daytime > 20 && daytime < 6)) then 
        {
            CAB_CivilianCount = 0;
        };

        // Remove dead player from spawner list of each civilian
        [_unit] call F90_fnc_updateSpawnerList;
        
        _outOfSpawnArea = false;
    };

    if ((CAB_TotalSpawnedCivilians < CAB_CivilianCount) && (count CAB_NearbyHouses > 0)) then 
    {
        private _sharedCivExist = false;

        if (isMultiplayer) then 
        {
            {
                private _civ = _x;

                if ((_civ distance vehicle _unit < CAB_CivilianSpawnRadius) && (alive _civ)) then 
                {
                    private _spawnerList = _civ getVariable "CIV_SpawnerUnits";

                    if (count _spawnerList > 0 && !(_unit in _spawnerList)) then 
                    {
                        _sharedCivExist = true;
                        _spawnerList pushBack _unit;
                        _civ setVariable ["CIV_SpawnerUnits", _spawnerList, true];
                    };
                };
            } forEach CAB_SpawnedCivilians;
        };

        if ((!_sharedCivExist) && (count CAB_NearbyHouses >= CAB_CivilianDensity) && (CAB_CivilianCount > 0)) then 
        {
            // Spawn civilian
            for "_i" from (count CAB_SpawnedCivilians) to CAB_CivilianCount-1 do 
            {
                [] call F90_fnc_spawnCivilian;
            };
            CAB_TotalSpawnedCivilians = CAB_TotalSpawnedCivilians + (count CAB_SpawnedCivilians);
            publicVariable "CAB_TotalSpawnedCivilians";
        };
    };

    sleep CAB_SpawnCheckInterval;
};