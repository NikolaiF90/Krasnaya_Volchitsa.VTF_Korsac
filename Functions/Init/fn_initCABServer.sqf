// Get all houses on the map
private _axis = worldSize / 2;
private _centerPos = [_axis, _axis, 0];
private _radius = sqrt 2 * _axis;

waitUntil {!isNil "CAB_HouseClassnames"};
CAB_AllHousesOnMap = nearestObjects [_centerPos, CAB_HouseClassnames, _radius];
publicVariable "CAB_AllHousesOnMap";

if (CAB_MaxCivilianCounts > 100) then {CAB_MaxCivilianCounts = 100};

CAB_TotalSpawnedCivilians = 0;
publicVariable "CAB_TotalSpawnedCivilians";
sleep CAB_CivilianSpawnDelay;