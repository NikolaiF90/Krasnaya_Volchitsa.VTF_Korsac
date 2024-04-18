/*
 * Author: Alwarren
 
 * Remove first aid and Medikits
 
 * Arguments:
	0: Unit (Object)
	
 * Example:
	[player] call AIS_System_fnc_removeFaks;
 
 * Return value:
	BOOL - false if items already stored
*/

params ["_unit"];

// Count the number of FAK's and Medikits this unit has
_storage = _unit getVariable ["AIS_MedicalStore", [0,0,0,0,0,0,0,0,0,0,0]];
_storage params ["_fakUni","_fakUniSOG","_fakUnioSOG","_fakVest","_fakVestSOG","_fakVestoSOG","_fakBackP","_fakBackPSOG","_fakBackoPSOG","_medK","_medKSOG"];
_numFakUniform = _fakUni;
_numFakUniform_b_SOGDLC = _fakUniSOG;
_numFakUniform_o_SOGDLC = _fakUnioSOG;
_numFaksVest = _fakVest;
_numFaksVest_b_SOGDLC = _fakVestSOG;
_numFaksVest_o_SOGDLC = _fakVestoSOG;
_numFaksBackpack = _fakBackP;
_numFaksBackpack_b_SOGDLC = _fakBackPSOG;
_numFaksBackpack_o_SOGDLC = _fakBackoPSOG;
_numMedi = _medK;
_numMediSOGDLC = _medKSOG;

// Faks from the uniform
{
	if (_x isEqualTo "FirstAidKit") then {
		_numFakUniform = _numFakUniform + 1;
		_unit removeItemFromUniform "FirstAidKit";
	};
	nil
} count (uniformItems _unit);
{
	if (_x isEqualTo "vn_b_item_firstaidkit") then {
		_numFakUniform_b_SOGDLC = _numFakUniform_b_SOGDLC + 1;
		_unit removeItemFromUniform "vn_b_item_firstaidkit";
	};
	nil
} count (uniformItems _unit);
{
	if (_x isEqualTo "vn_o_item_firstaidkit") then {
		_numFakUniform_o_SOGDLC = _numFakUniform_o_SOGDLC + 1;
		_unit removeItemFromUniform "vn_o_item_firstaidkit";
	};
	nil
} count (uniformItems _unit);

// Faks from the vest
{
	if (_x isEqualTo "FirstAidKit") then {
		_numFaksVest = _numFaksVest + 1;
		_unit removeItemFromVest "FirstAidKit";
	};
	nil
} count (vestItems _unit);
{
	if (_x isEqualTo "vn_b_item_firstaidkit") then {
		_numFaksVest_b_SOGDLC = _numFaksVest_b_SOGDLC + 1;
		_unit removeItemFromUniform "vn_b_item_firstaidkit";
	};
	nil
} count (uniformItems _unit);
{
	if (_x isEqualTo "vn_o_item_firstaidkit") then {
		_numFaksVest_o_SOGDLC = _numFaksVest_o_SOGDLC + 1;
		_unit removeItemFromUniform "vn_o_item_firstaidkit";
	};
	nil
} count (uniformItems _unit);

// Faks and Medikits from the backpack. Kits can only be in backpack, so we don't search for them anywhere else
{
	if (_x isEqualTo "FirstAidKit") then {
		_numFaksBackpack = _numFaksBackpack + 1;
		_unit removeItemFromBackpack "FirstAidKit";
	};
	if (_x isEqualTo "vn_b_item_firstaidkit") then {
		_numFaksBackpack_b_SOGDLC = _numFaksBackpack_b_SOGDLC + 1;
		_unit removeItemFromBackpack "vn_b_item_firstaidkit";
	};
	if (_x isEqualTo "vn_o_item_firstaidkit") then {
		_numFaksBackpack_o_SOGDLC = _numFaksBackpack_o_SOGDLC + 1;
		_unit removeItemFromBackpack "vn_o_item_firstaidkit";
	};
	if (_x isEqualTo "Medikit") then {
		_numMedi = _numMedi + 1;
		_unit removeItemFromBackpack "Medikit";
	};
	if (_x isEqualTo "vn_b_item_medikit_01") then {
		_numMediSOGDLC = _numMediSOGDLC + 1;
		_unit removeItemFromBackpack "vn_b_item_medikit_01";
	};
	nil
} count (backpackItems _unit);

// Store the result
_unit setVariable ["AIS_MedicalStore", [
	_numFakUniform,
	_numFakUniform_b_SOGDLC,
	_numFakUniform_o_SOGDLC,
	_numFaksVest,
	_numFaksVest_b_SOGDLC,
	_numFaksVest_o_SOGDLC,
	_numFaksBackpack,
	_numFaksBackpack_b_SOGDLC,
	_numFaksBackpack_o_SOGDLC,
	_numMedi,
	_numMediSOGDLC
],true];


true