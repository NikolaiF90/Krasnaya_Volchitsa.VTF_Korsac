[0] call BIS_fnc_cinemaBorder;

sleep 0.0001;
cutText ["", "BLACK", 3, true, true];
skipTime ([2, 5] call BIS_fnc_randomInt);
private _date = [true, false, true] call F90_fnc_getDate;
sleep 4;

cutText [_date, "BLACK FADED", 1, true, true];
sleep 5;

cutText ["", "BLACK IN", 3];
[1] call BIS_fnc_cinemaBorder;