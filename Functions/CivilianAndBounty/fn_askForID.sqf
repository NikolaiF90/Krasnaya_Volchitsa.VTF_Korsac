params ["_unit", "_caller"];
        
_unit stop true;

private _idChecked = _unit getVariable "CAB_IDChecked";
private _isBeingArrested = _unit getVariable "CAB_IsArrested";

private _fullName = "";
private _firstName = "";
private _surname = "";
private _isWanted = false;
private _bountyIndex = -1;

if (!_idChecked) then 
{
    // generate bounty 
    private _bountyChance = floor random 101;
    if (CAB_HVTChance >= _bountyChance && (count CAB_WantedList) > 0) then 
    {
        _bountyIndex = floor random (count CAB_WantedList);
        private _unitData = CAB_WantedList # _bountyIndex;
        
        _fullName = _unitData # 0;
        _firstName = _unitData # 1;
        _surname = _unitData # 2;
        private _unitName = [_fullName, _firstName, _surname];
        
        _unit setName _unitName;

        _unit setVariable ["CAB_IsWanted", true];
        _unit setVariable ["CAB_WantedID", _bountyIndex];

        _isWanted = true;
    } else 
    {
        private _unitName = name _unit;
        private _name = [_unitName, " "] call BIS_fnc_splitString;
        
        _firstName = _name # 0;
        _surname = _name #1;
        
        _unit setVariable ["CAB_IsWanted", false];
    };
} else 
{
    private _unitName = name _unit;
    private _name = [_unitName, " "] call BIS_fnc_splitString;
    
    _firstName = _name # 0;
    _surname = _name #1;
};

hint "";
hint format ["First Name: %1\nSurname: %2", _firstName, _surname];
_unit setVariable ["CAB_IDChecked", true];

sleep CAB_CivilianWaitingTime;

if (_isBeingArrested) then 
{
    if (_isWanted) then 
    {
        ["ARREST", [_unit, _caller, _bountyIndex]] call F90_fnc_updateWantedList;
    };
} else 
{
    _unit doWatch objNull;
    _unit stop false;
};