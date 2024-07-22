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

// Initialize variables
private _playerOldPos = [0,0,0];
private _civilianCount = 0;
private _nearbyHouseCount = 0;

// Continuous loop
while {true} do 
{
    // Check if player is out of spawn area and not moving too fast
    if (_playerOldPos distance (position _unit) > CAB_CivilianSpawnRadius && speed _unit < 130) then 
    {
        // Update player position
        _playerOldPos = position _unit;

        // Find nearby houses within spawn radius
        CAB_NearbyHouses = CAB_AllHousesOnMap select {_x distance _unit <= CAB_CivilianSpawnRadius};
        _nearbyHouseCount = count CAB_NearbyHouses;

        // Calculate civilian count based on house density
        _civilianCount = floor((_nearbyHouseCount) / CAB_CivilianDensity);

        // Limit civilian count to maximum allowed
        _civilianCount = _civilianCount min CAB_MaxCivilianCounts;

        // Disable spawning if raining or nighttime
        if ((rain > 0.2) || (daytime > 20 && daytime < 6)) then 
        {
            _civilianCount = 0;
        };

        // Update spawner list for each civilian to remove dead player
        [_unit] call F90_fnc_updateSpawnerList;
    };

    // Check if total spawned civilians is less than required count
    if (CAB_TotalSpawnedCivilians < _civilianCount) then
    {
        {
            private _civ = _x;
            if ((_civ distance (objectParent _unit) < CAB_CivilianSpawnRadius) && (alive _civ)) then 
            {
                private _spawnerList = _civ getVariable "CIV_SpawnerUnits";
                if !(_unit in _spawnerList) then 
                {
                    _spawnerList pushBack _unit;
                    _civ setVariable ["CIV_SpawnerUnits", _spawnerList, true];
                };
            };
        } forEach CAB_SpawnedCivilians;

        // Check if nearby house count is sufficient for spawning
        if (_nearbyHouseCount >= CAB_CivilianDensity) then
        {
            // Spawn civilians up to required count
            for "_i" from (count CAB_SpawnedCivilians) to _civilianCount - 1 do 
            {
                [CAB_NearbyHouses] call F90_fnc_spawnCivilian;
            };

            // Update total spawned civilians count
            CAB_TotalSpawnedCivilians = CAB_TotalSpawnedCivilians + (count CAB_SpawnedCivilians);
            publicVariable "CAB_TotalSpawnedCivilians";
        };
    };

    // Pause before next spawn check
    sleep CAB_SpawnCheckInterval;
};