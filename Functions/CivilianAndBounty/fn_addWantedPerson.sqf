/*
    Author: PrinceF90

    Description: 
        Function to add a specified number of wanted persons from a list of potential high-value targets to a wanted list.

    Parameter(s):
        0: NUMBER - _count: Number or HVT to add to the wanted list;

    Returns: 
        _addedPOI - An array containing the added HVTs
*/

params ["_count"];

private _addedPOI = [];

for "_i" from 0 to _count do 
{
    private _wantedIndex = floor random (count CAB_PotentialHVT);
    private _wantedName = CAB_PotentialHVT # _wantedIndex;
    CAB_WantedList pushBack _wantedName;
    CAB_PotentialHVT deleteAt _wantedIndex;
    _addedPOI pushBack _wantedName;
};

_addedPOI;