params ["_unit", "_caller"];
        
[_unit, true] remoteExec ["stop", 0, true];

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
    if (CAB_HVTChance >= _bountyChance && (count REC_WantedList) > 0) then 
    {
        _bountyIndex = floor random (count REC_WantedList);
        private _unitData = REC_WantedList # _bountyIndex;
        
        _fullName = _unitData # 0;
        _firstName = _unitData # 1;
        _surname = _unitData # 2;
        
        _unit setName [_fullName, _firstName, _surname];

        _unit setVariable ["Record_IsHVT", true, true];
        _unit setVariable ["CAB_WantedID", _bountyIndex, true];

        _isWanted = true;
    } else 
    {
        private _generatedName = [CAB_CivilianNationality] call F90_fnc_generateName;
        
        _fullName = _generatedName # 0;
        _firstName = _generatedName # 1;
        _surname = _generatedName # 2;

        _unit setName [_fullName, _firstName, _surname];

        _unit setVariable ["Record_IsHVT", false, true];
    };
} else 
{
    private _unitName = name _unit;

    private _name = [_unitName, " "] call BIS_fnc_splitString;
    
    if (count _name == 2) then 
    {
        _firstName = _name # 0;
        _surname = _name # 1;
    } else 
    {
        _firstName = _name # 1;
        _surname = _name # 2;
    };
};

private _civInfo = format ["First Name: %1<br />Surname: %2", _firstName, _surname];
[_civInfo] call F90_fnc_textNotification;

_unit setVariable ["CAB_IDChecked", true, true];

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
    [_unit, false] remoteExec ["stop", 0, true];
};