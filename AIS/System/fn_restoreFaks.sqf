/*
 * Author: Alwarren
   Changed: Psycho
 
 * Re-Add first aid and Medikits.
 
 * Arguments:
	0: Unit (Object)
	
 * Example:
	[player] call AIS_System_fnc_restoreFaks;
 
 * Return value:
	-
*/

params ["_unit"];
private _items = _unit getVariable ["AIS_MedicalStore", [0,0,0,0,0,0,0,0,0,0,0]];


for "_i" from 1 to (_items select 0) do {_unit addItemToUniform "FirstAidKit"};

for "_i" from 1 to (_items select 1) do {_unit addItemToUniform "vn_b_item_firstaidkit"};	

for "_i" from 1 to (_items select 2) do {_unit addItemToUniform "vn_o_item_firstaidkit"};

for "_i" from 1 to (_items select 3) do {_unit addItemToVest "FirstAidKit"};

for "_i" from 1 to (_items select 4) do {_unit addItemToVest "vn_b_item_firstaidkit"};

for "_i" from 1 to (_items select 5) do {_unit addItemToVest "vn_o_item_firstaidkit"};	

for "_i" from 1 to (_items select 6) do {_unit addItemToVest "FirstAidKit"};

for "_i" from 1 to (_items select 7) do {_unit addItemToVest "vn_b_item_medikit_01"};

for "_i" from 1 to (_items select 8) do {_unit addItemToVest "vn_o_item_firstaidkit"};	

for "_i" from 1 to (_items select 9) do {_unit addItem "Medikit"};

for "_i" from 1 to (_items select 10) do {_unit addItem "vn_b_item_medikit_01"};


_unit setVariable ["AIS_MedicalStore", [0,0,0,0,0,0,0,0,0,0,0], true];


true