/*
    Author: PrinceF90

    Description: 
        Function to generate a specified number of wanted persons from a list of potential high-value targets including generating a bounty rewards for each HVT.

    Parameter(s):
        _count - Number or HVT to add to the wanted list [INT]

    Returns: 
        _addedPOI - An array containing the added HVTs including their bounty rewards
*/

params ["_count"];

private _addedPOI = [];

for "_i" from 0 to (floor _count)-1 do 
{
    private _wantedIndex = floor random (count REC_PotentialHVT);
    private _wantedData = REC_PotentialHVT # _wantedIndex;

    private _arrestReward = floor (CAB_HVTReward call BIS_fnc_randomNum);
    private _deductAmount = (CAB_HVTKilledDeduction / 100) * _arrestReward;
    private _killReward = floor (_arrestReward - _deductAmount);

    _wantedData pushBack _arrestReward;
    _wantedData pushBack _killReward;

    REC_PotentialHVT deleteAt _wantedIndex;
    _addedPOI pushBack _wantedData;
};

_addedPOI;