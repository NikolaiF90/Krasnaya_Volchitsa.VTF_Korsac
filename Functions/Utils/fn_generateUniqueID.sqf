params ["_additionalID"];

private _uniqueID = "";

private _unique1 = floor random 10;
private _unique2 = floor random 10;
private _unique3 = floor random 10;
private _unique4 = floor random 10;

if (!isNil {_additionalID}) then 
{
    _uniqueID = format ["%1%2%3%4%5", _additionalID, _unique1, _unique2, _unique3, _unique4];
}else 
{
    _uniqueID = format ["%1%2%3%4", _unique1, _unique2, _unique3, _unique4];
};

[true, "generateUniqueID", format ["Unique ID generated: %1", _uniqueID], false] call F90_fnc_debug;

_uniqueID;