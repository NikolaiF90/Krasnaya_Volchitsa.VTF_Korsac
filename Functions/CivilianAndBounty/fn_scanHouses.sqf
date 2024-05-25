private _outOfSpawnArea = false;

while {CAB_CivilianSpawningEnabled} do 
{
    [CABDebug, "scanHouses", "Scanning surrounding...", true] call F90_fnc_debug;

    if (CAB_PlayerOldPos distance (position player) > CAB_CivilianSpawnRadius && speed player < 130) then 
    {
        _outOfSpawnArea = true;
        CAB_PlayerOldPos = position player;
    };

    if (_outOfSpawnArea) then 
    {
        CAB_HousesNearPlayer = CAB_AllHousesOnMap select {_x distance player <= CAB_CivilianSpawnRadius};
        [CABDebug, "scanHouses", format ["Nearby houses: %1", count CAB_HousesNearPlayer], true] call F90_fnc_debug;

        CAB_NearbyHouses = [CAB_CivilianSpawnRadius] call F90_fnc_filterGoodHouses;
        CAB_NearbyHouses = CAB_NearbyHouses select {damage _x < 0.75};

        [CABDebug, "scanHouses", format ["Habitable houses: %1", count CAB_NearbyHouses], true] call F90_fnc_debug;

        // Civilian count
        CAB_CivilianCount = floor ((count CAB_NearbyHouses)/ CAB_CivilianDensity);
        if (CAB_CivilianCount > CAB_MaxSpawnedCivilians) then 
        {
            CAB_CivilianCount = CAB_MaxSpawnedCivilians;
        };

        // Disable spawning if raining or nightime
        if ((rain > 0.2) || (daytime > 20 && daytime < 6)) then 
        {
            CAB_CivilianCount = 0;
        };
        [CABDebug, "scanHouses", format ["Civilian Count: %1", CAB_CivilianCount], true] call F90_fnc_debug;

        // Remove dead player from spawner list of each civilian
        if (isMultiplayer) then 
        {
            {
                if (isPlayer _x && !(alive _x)) then 
                {
                    private _deadPlayer = _x;
                    private _spawnedCivs = _x getVariable ["CIV_SpawnedUnits", []];
                    if (count _spawnedCivs != 0) then 
                    {
                        {
                            private _spawnerList = _x getVariable ["CIV_SpawnerUnits", objNull];
                            if (_spawnerList != objNull) then 
                            {
                                _spawnerList = _spawnerList - [_deadPlayer];
                                _x setVariable ["CIV_SpawnerUnits", _spawnerList, true];
                            };
                        } forEach _spawnedCivs;
                    };
                };
            } forEach allUnits;
        };
        
        _outOfSpawnArea = false;
    };

    if ((count CAB_SpawnedCivilians < CAB_CivilianCount) && (count CAB_NearbyHouses > 0)) then 
    {
        private _sharedCivExist = false;

        if (isMultiplayer) then 
        {
            {
                private _unit = _x;

                if ((_unit distance vehicle player < CAB_CivilianSpawnRadius) && (alive _unit)) then 
                {
                    private _spawnerList = _unit getVariable "CIV_SpawnerUnits";

                    if (count _spawnerList > 0 && !(player in _spawnerList)) then 
                    {
                        _sharedCivExist = true;
                        _spawnerList pushBack player;
                        _unit setVariable ["CIV_SpawnerUnits", _spawnerList, true];
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
        };
    };

    sleep CAB_SpawnCheckInterval;
};