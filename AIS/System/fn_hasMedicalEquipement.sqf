/*
 * Author: Psycho
 * config numbers from panther42 - thx!
 
 * Chck if the unit has medikits or first aid kits
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	bool
	
 * Example:
	player call AIS_System_fnc_hasMedicalEquipement;
 */


private _healer = _this;
private _items = assignedItems _healer + items _healer;

_hasMedicalEquipement = if (
	(_items findIf {getNumber (configFile >> "cfgWeapons" >> _x >> "ItemInfo" >> "type") isEqualTo 401}) > -1 || 
	{(_items findIf {getNumber (configFile >> "cfgWeapons" >> _x >> "ItemInfo" >> "type") isEqualTo 619}) > -1}
) then {true} else {false};


_hasMedicalEquipement