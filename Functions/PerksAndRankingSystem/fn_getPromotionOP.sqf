/*
    Author: PrinceF90

    Description:
        This function calculates the required OP for promotion based on the rank provided.

    Parameter(s):
        _args - Represents the rank or unit for which the promotions required OP is calculated. [STRING or OBJECT]

    Returns:
        _opRequirement - The required OP for promotion.
*/
params ["_args"];

private _rank = "";

if (typeName _args == "STRING") then 
{
    _rank = _args;
};

if (typeName _args == "OBJECT") then 
{
    private _unit = _args;
    // Get the unit's rank
    _rank = [_unit] call F90_fnc_getUnitRank;
};

// Get the rank index in PRS_AllRanks
private _rankIndex = [_rank] call F90_fnc_getRankIndex;
// Get the bonus points for each successful operation
private _bonusPoints = (PRS_AllRanks select _rankIndex) select 1;
// Get the required successfull operation counts
private _requiredOperationCounts = (PRS_AllRanks select _rankIndex) select 2;
// Get the previous rank
private _previousRank = (PRS_AllRanks select (_rankIndex -1)) select 0;
// Get previous rank promotion requirement
private _previousRequirement = 0;
if (_rankIndex != 0) then 
{
    _previousRequirement = [_previousRank] call F90_fnc_getPromotionOP;
};
// Calculation 
private _opRequirement = (_bonusPoints * _requiredOperationCounts) + _previousRequirement;

_opRequirement