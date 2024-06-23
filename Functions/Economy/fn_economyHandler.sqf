/*
    Author: PrinceF90

    Description:
        This function handles various operations related to economy system, such as getting, setting, adding, or deducting money for a specific unit.

    Parameter(s):
        0: STRING - _operation: The operation to be performed (e.g., "GETMONEY", "SETMONEY", "ADDMONEY", "DEDUCTMONEY")
        1: ARRAY - _args: An array containing necessary arguments based on the operation being performed. For "GETMONEY", the args: ARRAY [OBJECT] - unit to get the money count. For "SETMONEY", "ADDMONEY", and "DEDUCTMONEY", the args: ARRAY [OBEJCT,NUMBER] where index 0(object) is the unit to do the operation on, index 1(NUMBER) will be the amount to set, add, or deduct depending on the given operation.

    Returns:
        _returnValue = the updated money value after performing the specified operation.

    Examples:
        
*/
params ["_operation", "_args"];

private _returnValue = nil;

if (isNil {_operation}) then 
{
	_operation == "DEFAULT";
}else 
{
	if (_operation == "") then 
	{
		_operation == "DEFAULT";
	};
};

if (_operation == "GETMONEY") then 
{
	if (isNil {_args}) exitWith {[EconomyDebug, "economyHandler", "(ERROR) Handler 'GETMONEY' prevented from running because _args is not provided", true] call F90_fnc_debug};
	
	private _unit = objNull;
	
	if (_args isEqualType []) then 
	{
		_unit = _args # 0;
	} else 
	{
		_unit = _args;
	};

	private _money = _unit getVariable ["Milcash", Economy_DefaultCIVMoney];
	_returnValue = _money;
};

if (_operation == "SETMONEY") then 
{
	if (isNil {_args}) exitWith {[EconomyDebug, "economyHandler", "(ERROR) Handler 'SETMONEY' prevented from running because _args is not provided", true] call F90_fnc_debug};

	private _unit = _args # 0;
	private _amount = _args # 1;
	_unit setVariable ["Milcash", _amount];
	private _money = _unit getVariable ["Milcash", Economy_DefaultCIVMoney];
	_returnValue = _money;
};

if (_operation == "ADDMONEY") then 
{
	if (isNil {_args}) exitWith {[EconomyDebug, "economyHandler", "(ERROR) Handler 'ADDMONEY' prevented from running because _args is not provided", true] call F90_fnc_debug};

	private _unit = _args # 0;
	private _amount = _args # 1;
	private _money = _unit getVariable ["Milcash", Economy_DefaultCIVMoney];
	
	_money = _money + _amount;
	_unit setVariable ["Milcash", _money];
	_returnValue = _money;
};

if (_operation == "DEDUCTMONEY") then 
{
	if (isNil {_args}) exitWith {[EconomyDebug, "economyHandler", "(ERROR) Handler 'DEDUCTMONEY' prevented from running because _args is not provided", true] call F90_fnc_debug};

	private _unit = _args # 0;
	private _amount = _args # 1;
	private _money = _unit getVariable ["Milcash", Economy_DefaultCIVMoney];
	
	_money = _money - _amount;
	_unit setVariable ["Milcash", _money];
	_returnValue = _money;
};

_returnValue;