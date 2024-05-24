params ["_unit"];
        
_unit stop true;

private _idChecked = _unit getVariable "CAB_IDChecked";
private _firstName = "";
private _surname = "";

if (!_idChecked) then 
{
    // generate bounty 
    private _bountyChance = floor random 101;
    if (CAB_HVTChance >= _bountyChance && (count CAB_WantedList) > 0) then 
    {
        private _bountyIndex = floor random (count CAB_WantedList);
        private _unitName = CAB_WantedList # _bountyIndex;
        CAB_WantedList deleteAt _bountyIndex;

        _unit setName _unitName;
        _firstName = _unitName # 1;
        _surname = _unitName # 2;
    } else 
    {
        private _unitName = name _unit;
        private _fullName = [_unitName, " "] call BIS_fnc_splitString;
        
        _firstName = _fullName # 0;
        _surname = _fullName #1;
    };
} else 
{
    private _unitName = name _unit;
    private _fullName = [_unitName, " "] call BIS_fnc_splitString;
    
    _firstName = _fullName # 0;
    _surname = _fullName #1;
};

hint "";
hint format ["First Name: %1\nSurname: %2", _firstName, _surname];
_unit setVariable ["CAB_IDChecked", true];

sleep CAB_CivilianWaitingTime;
_unit doWatch objNull;
_unit stop false;