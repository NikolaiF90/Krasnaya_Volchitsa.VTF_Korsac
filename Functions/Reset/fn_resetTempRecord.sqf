/*
    Author: PrinceF90

    Description:
        Initializes/Reset task record variables for a unit.

    Parameter(s):
        _unit - The unit for which the task record variables are initialized. [OBJECT]

    Returns:
        None
*/
params ["_unit"];

// Task Record Variables
private _RECData = 
[
    "REC_TempKillCount",
    "REC_TempCapturedPrisoners",
    "REC_TempHVTKilled",
    "REC_TempHVTCaptured",
    "REC_TempSeized",

    "REC_TempAirSupportUsed",
    "REC_TempArtilleryUsed",
    "REC_TempHeliUsed",
    "REC_TempLightArmedHeliLoss",
    "REC_TempLightUnarmedHeliLoss",
    "REC_TempAttackHeliLoss",
    "REC_TempVehiclesUsed",

    "REC_HeliUsedDeduction",
    "REC_ArmedCarsDeduction",
    "REC_UnarmedCarsDeduction",
    "REC_TempTeamDeduction",

    "REC_TotalPoints",
    "REC_TempRewards",
    "REC_TempOP",
    "REC_TempWages",
    "REC_TotalRewards"
];

{
    _unit setVariable [_x, 0, true];
} forEach _RECData;

_unit setVariable ["REC_TempTeamRequested", false, true];
_unit setVariable ["TASK_IsSuccessfulMission", false, true];