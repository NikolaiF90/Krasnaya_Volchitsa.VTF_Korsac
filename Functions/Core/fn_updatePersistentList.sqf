/*
	Author: PrinceF90 
 
	Description: 
	Function to populates provided list box by retrieving saves from profileNamespace. 
	
	Parameter(s): 
	0: SCALAR - _listID: The idc of the list box to populate with save slots. 
	
	Returns: 
	None 
	
	Examples: 
	// Example 1: 
	["exampleListBox"] call F90_fnc_updatePersistentList; 
	
	// Example 2: 
	["anotherListBox"] call F90_fnc_updatePersistentList;
*/

// ToDo -------------------------------------------------
// Deprecated -----------------------------------------------
params ["_listID"];

lbClear _listID;
private _slotArray = profileNameSpace getVariable Persistent_PersistentListKey;
if (isNil "_slotArray") then 
{
	Persistent_Slots = Persistent_DefaultSlots;
} else 
{
	Persistent_Slots = _slotArray;
};

{
	lbAdd [_listID, _x];
} forEach Persistent_Slots;