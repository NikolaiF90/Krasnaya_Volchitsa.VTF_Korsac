params ["_unit"];

while {true} do 
{
    if (count CAB_SpawnedCivilians > 0) then 
    {
        private _civsArray = [];
        {
            private _civilian = _x;

            if ((!isNull _civilian) && alive _civilian) then 
            {
                // Get distance from player
                private _distance = _civilian distance _unit;

                // Handle stuck civ                
                if (speed _civilian == 0) then
                {
                    private _newPos = [];
                    if (count CAB_NearbyHouses > 0) then 
                    {
                        _newPos = position (selectRandom CAB_NearbyHouses);
                    } else 
                    {
                        _newPos = [position _civilian, 5, 100] call BIS_fnc_findSafePos;
                    };
                    
                    _civilian doMove _newPos;
                    _civilian forcespeed 10;
                    sleep 0.1;
                    _civilian forcespeed -1;
                } else
                {
                    _civilian setvariable ["CIV_Lifetime", diag_ticktime + 15];
                };

                // Handles civs running away
                if (rain > 0.2 || (_distance < 25 && !(weaponlowered _unit))) then 
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
                    _spawner = _spawner - [_unit];
                    _civilian setvariable ["CIV_SpawnerUnits", _spawner, true];            
                };

                if (_civilian getVariable "CIV_SpawnerUnits" isEqualTo []) then
                {
                    // Despawn civilian
                    private _group = group _civilian;	
                    {
                        deleteWaypoint _x;
                    } forEach waypoints _group;
                    deleteVehicle _civilian;
                    deleteGroup _group;
                }
                else
                {
                    _civsArray pushBack _civilian;
                };
            };
        } forEach CAB_SpawnedCivilians;

        CAB_SpawnedCivilians = _civsArray;
        _unit setVariable ["CIV_SpawnedUnits", CAB_SpawnedCivilians, true];
    };

    sleep CAB_CivilianCheckInterval;
};