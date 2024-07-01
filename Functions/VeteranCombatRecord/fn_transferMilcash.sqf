private _caller = player;
private _transferAmount = parseNumber (ctrlText TransferMenu_AmountEditBox);
private _friendID = ctrlText TransferMenu_PlayerIDEditBox;
private _friend = objNull;

{
    private _uid = _x getVariable ["Record_PlayerUID", nil];
    if !(isNil {_uid}) then 
    {
        if (_uid == _friendID) exitWith
        {
            _friend = _x;
        };
    };
} forEach allPlayers;

if !(isNull _friend) then 
{
    private _balance = ["GETMONEY", [_caller]] call F90_fnc_economyHandler;

    if (_balance >= _transferAmount) then 
    {
        ["DEDUCTMONEY", [_caller, _transferAmount]] call F90_fnc_economyHandler;
        ["ADDMONEY", [_friend, _transferAmount]] call F90_fnc_economyHandler;
        
        // Notify sender
        [format ["%1 milcash has been transferred to %2(%3)", _transferAmount, name _friend, _friendID], "DEFAULT"] call F90_fnc_textNotification;

        // Notify receiver
        private _onlineID = owner _friend;
        private _callerID = _caller getVariable "Record_PlayerUID";
        private _text = format ["%1(%2) has send you %3 milcash", name _caller, _callerID, _transferAmount];
        if (_onlineID != 0) then 
        {
            [_text, "DEFAULT"] remoteExec ["F90_fnc_textNotification", _onlineID];
        };
    } else 
    {
        ["You do not have enough milcash", "ERROR"] call F90_fnc_textNotification;
    };
} else
{
    ["Player not found", "ERROR"] call F90_fnc_textNotification;
};

closeDialog 2;