
CAB_PlayerOldPos = [0,0,0];
CAB_SpawnedCivilians = [];
CAB_NearbyHouses = [];
CAB_HousesNearPlayer = [];
CAB_CivilianCount = 0;
CAB_MinCivilianWaitingTime = 6;
CAB_MaxCivilianWaitingTime = 10;
CAB_HabitableHouses = [];
CAB_AllHousesOnMap = [];
CAB_AllCivilianClassnames = [];

CAB_WantedList = [];
CAB_PotentialHVT = 
[
    ["James Smith", "James", "Smith"], 
    ["Michael Johnson", "Michael", "Johnson"], 
    ["Christopher Brown", "Christopher", "Brown"], 
    ["Daniel Williams", "Daniel", "Williams"], 
    ["David Jones", "David", "Jones"], 
    ["Matthew Davis", "Matthew", "Davis"], 
    ["Andrew Wilson", "Andrew", "Wilson"], 
    ["Joseph Taylor", "Joseph", "Taylor"], 
    ["William Anderson", "William", "Anderson"], 
    ["John Martinez", "John", "Martinez"], 
    ["Robert Thomas", "Robert", "Thomas"], 
    ["Steven Garcia", "Steven", "Garcia"], 
    ["Brian Hernandez", "Brian", "Hernandez"], 
    ["Kevin Young", "Kevin", "Young"], 
    ["Jason Scott", "Jason", "Scott"], 
    ["Mark King", "Mark", "King"], 
    ["Thomas Lee", "Thomas", "Lee"], 
    ["Richard White", "Richard", "White"], 
    ["Paul Harris", "Paul", "Harris"], 
    ["Ryan Nelson", "Ryan", "Nelson"], 
    ["Eric Carter", "Eric", "Carter"], 
    ["Charles Mitchell", "Charles", "Mitchell"], 
    ["Anthony Perez", "Anthony", "Perez"], 
    ["Jeffrey Baker", "Jeffrey", "Baker"], 
    ["Scott Thompson", "Scott", "Thompson"], 
    ["Benjamin Ramirez", "Benjamin", "Ramirez"], 
    ["Samuel Evans", "Samuel", "Evans"], 
    ["Nicholas Collins", "Nicholas", "Collins"], 
    ["Jonathan Murphy", "Jonathan", "Murphy"], 
    ["Adam Rivera", "Adam", "Rivera"] 
];

[CAB_WantedCounts] call F90_fnc_addWantedPerson;

// Civilians
private _cfg = (configFile >> "CfgVehicles");
private _str = "c_man";
for "_i" from 0 to (count _cfg)-1 do 
{
    if (isClass ((_cfg select _i))) then 
    {
        private _cfgName = configName (_cfg select _i);

        if (_cfgName isKindOf "camanbase" AND (getNumber ((_cfg select _i) >> "scope") == 2) AND ([_str,str _cfgName] call BIS_fnc_inString)) then 
        {
            CAB_AllCivilianClassnames pushBack _cfgName;
        };
    };
};

// Get all houses on the map
CAB_AllHousesOnMap = nearestObjects [position vehicle player, CAB_HouseClassnames, 50000];

if (CAB_MaxSpawnedCivilians > 100) then {CAB_MaxSpawnedCivilians = 100};
sleep CAB_CivilianSpawnDelay;

[] spawn F90_fnc_scanHouses;
[] spawn F90_fnc_civilianHandler;