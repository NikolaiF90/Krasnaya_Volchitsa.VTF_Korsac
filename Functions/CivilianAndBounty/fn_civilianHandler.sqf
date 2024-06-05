while {CAB_CivilianSpawningEnabled} do 
{
    if (count CAB_SpawnedCivilians > 0) then 
    {
        {
            private _civilian = CAB_SpawnedCivilians # _forEachIndex;

            if (alive _civilian) then 
            {
                // Get distance from player
                private _distance = _civilian distance player;

                // Handle stuck civ                
                if (speed _civilian == 0) then
                {
                    private _newPos = position (selectRandom CAB_NearbyHouses);
                    
                    _civilian doMove _newPos;
                    _civilian forcespeed 10;
                    sleep 0.1;
                    _civilian forcespeed -1;
                } else
                {
                    _civilian setvariable ["CIV_Lifetime", diag_ticktime + 15];
                };

                // Handles civs running away
                if (rain > 0.2 || (_distance < 25 && !(weaponlowered player))) then 
                {
                    _civilian forcespeed 4;
                    _civilian setspeedmode "FULL";
                } else
                {
                    _civilian forcespeed -1;
                    _civilian setspeedmode "LIMITED";
                };

                // Avoid cars 
                private _nearbyVehicle = (_civilian nearentities [["car","tank"],8]) select {simulationenabled _x};
                if (rain > 0.2 || count _nearbyVehicle > 0) then
                {
                    _civilian domove (position nearestbuilding _civilian);
                };
                
                // Handles civilian despawning
                if (_distance > CAB_CivilianSpawnRadius || (daytime > 20.000 && daytime < 5.000) || diag_ticktime > _civilian getvariable "CIV_Lifetime") then
                {
                    private _spawner = _civilian getvariable "CIV_SpawnerUnits";
                    _spawner = _spawner - [player];
                    _civilian setvariable ["CIV_SpawnerUnits", _spawner, true];            
                };

                if (_civilian getvariable "CIV_SpawnerUnits" isequalto []) then
                {
                    // Despawn civilian
                    private _group = group _civilian;	
                    for "_i" from count (waypoints _group) to 1 step -1 do
                    {
                        deleteWaypoint ((waypoints _group) # _i);
                    };
                    deletevehicle _civilian;
                    deletegroup _group;
                    CAB_SpawnedCivilians deleteAt _forEachIndex; 
                    [CABDebug, "civilianHandler", format ["Civilian #%1 despawned.", _forEachIndex], false] call F90_fnc_debug;

                    sleep 0.1;	
                };
            }else
            {
                // Remove from array, but not dead body
                CAB_SpawnedCivilians deleteAt _forEachIndex;
            };
        } forEach CAB_SpawnedCivilians;
        player setVariable ["CIV_SpawnedUnits",CAB_SpawnedCivilians,true];   
    };

    sleep CAB_CivilianCheckInterval;
};