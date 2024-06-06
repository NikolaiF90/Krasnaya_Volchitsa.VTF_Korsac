/*
	Author: NetFusion, Psycho, PrinceF90(Revisited)
	
	Description:
		This function displays a progress bar dialog with a specified title and duration, along with optional callback functions on completion or abortion. 
 
	Parameter(s):
		0: STRING - _title: Title of the progress bar.
		1: INT - _duration: Duration of the progress bar display. 
		2: CODE - _callback:  Callback function to execute upon completion. 
		3: ANY - _arguments:  Additional arguments for the callback function. Can be OBJECT or ARRAY.
		4: CODE - _onAbort (optional): Function to call if the progress bar is aborted. Default: {}.
		5: BOOLEAN - doAbort (optional): Flag indicating whether the progress bar can be aborted. Default: false.
	
	Return:
		None
*/
params ["_title", "_duration", "_callback", "_arguments", "_onAbort", "_doAbort"];

if(isNil{_onAbort})then{_onAbort={}};
if(isNil{_doAbort})then{_doAbort=false};

private _endTime = time + _duration;
private _affectingObject = if (typeName _arguments == "ARRAY") then {_arguments select 0} else {_arguments};

if (typeName _affectingObject == "OBJECT") then {
    if (_affectingObject getVariable ["AIS_Core_Progress_inUse", false]) exitWith {
		["Object in use" call XOrangeText] call AIS_Core_fnc_dynamicText;
    };

    _affectingObject setVariable ["AIS_Core_Progress_inUse", true, true];
};

closeDialog 0;
createDialog "AIS_Core_Progress_BarDlg";

_texts = player getVariable ["AIS_Core_displayText", []];
_texts pushBack ("(" + _title + ")");
player setVariable ["AIS_Core_displayText", _texts, true];

disableSerialization;
_progressBar = uiNamespace getVariable "AIS_Core_Progress_ProgressBar";

_progressBar ctrlSetPosition [safeZoneX + 0.298906 * safeZoneW, safeZoneY + 0.082 * safeZoneH, 0.407344 * safeZoneW, 0.011 * safeZoneH];
_progressBar ctrlCommit (_duration / accTime);

_time = time;

//waitUntil {!dialog || time > _endTime || !alive player || _doAbort};
while {dialog && {time < _endTime} && {alive player} && {!_doAbort}} do {
	sleep 0.5;
	[_title, ((time - _time) / (_duration)) min 1] spawn AIS_Core_fnc_progress_showBarText;
};

closeDialog 0;

_texts = _texts - ["(" + _title + ")"];
player setVariable ["AIS_Core_displayText", _texts, true];

if (time > _endTime) then {
    _arguments spawn _callback;
} else {
    ["Abbort..."] call AIS_Core_fnc_dynamicText;
    _arguments spawn _onAbort;
};

if (typeName _affectingObject == "OBJECT") then {
    _affectingObject setVariable ["AIS_Core_Progress_inUse", false, true];
};