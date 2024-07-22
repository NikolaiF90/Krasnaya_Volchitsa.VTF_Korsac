params ["_unit"];

if (isNil {_unit}) then {_unit = player};

private _rank = [_unit] call F90_fnc_getUnitRank;

// Sets to default if undefined
if (isNil {_rank}) then 
{
    // Get the rank name of the first element in PRS_AllRanks
    _rank = (PRS_AllRanks select 0) select 0;    
};
// Must be set again even if data exist. To make sure unlocked perks is properly generated
[_unit, _rank] call F90_fnc_setUnitRank;
[_unit] call F90_fnc_initOP;

// Promotion
[] remoteExec ["F90_fnc_createPersonnelOfficer", 2]; // Tells the server to create the officer

// Perks initialization
private _perks = _unit getVariable ["PRS_Perks", []];
if (count _perks < 1) then 
{
    // Create Perks 
    _perks = 
    [
        // format [STRING:perkKey,BOOL:unlocked,STRING:perkInfo
        ["PERK_SeizeAsset", false, "seize assets"],
        ["PERK_PurchaseUnit", false, "purchase unit"],
        ["PERK_TeamLeader1", false, "led up to 3 subordinates"],
        ["PERK_TeamLeader2", false, "led up to 6 subordinates"], 
        ["PERK_TeamLeader3", false, "led up to 12 subordinates"],
        ["PERK_CommandTeams", false, "commands a team of 4"],
        ["PERK_SquadLeader1", false, "led up to 3 teams"],
        ["PERK_TrainUnit", false, "train unit"],
        ["PERK_CommandSquad", false, "commands a squad"],
        ["PERK_PlatoonCommander", false, "commands a larger squad"]
    ];
};
_unit setVariable ["PRS_Perks", _perks, true];

// Max unit counts a leader can lead for each perks
PERK_TL1MaxUnits = 3;
PERK_TL2MaxUnits = 6;
PERK_TL3MaxUnits = 12;
// Max squad counts a leader can command for each perks 
PERK_SL1MaxUnits = 3;
// High command small team size. Anything more than provided value counted as squads
PERK_HCTeamSize = 5;
// Max number of units a squad can hold
PERK_MaxHCSquadSize = 8;