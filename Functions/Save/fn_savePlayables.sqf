/*
	Author: PrinceF90 
 
    Description: 
        Function to save playable unit's data to a specified slot. 
    
    Parameter(s): 
        0: NUMBER - _slot: The slot where the player data will be saved. 
    
    Returns: 
        None 
    
    Examples: 
        [4] call F90_fnc_savePlayables;
*/
params ["_slot"];

[PersistentDebug, "savePlayables", format["Saving playable's data to slot %1...",_slot], false] call F90_fnc_debug;

{
    private _unitData = [_x, true] call F90_fnc_generateUnitData;
    private _key = format ["%1data", _x];
    [_key, _unitData, _slot] call F90_fnc_saveData;
} forEach Mission_Playables;

[PersistentDebug, "savePlayables", "Done saving playable's data.", false] call F90_fnc_debug;