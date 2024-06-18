[0] call BIS_fnc_cinemaBorder;
private _date = [] call F90_fnc_getDate;

sleep 0.0001;
private _content = "<t font='PuristaSemibold' size='2.0'>Krasnaya Volchitsa</t><br />by PrinceF90";
cutText [_content, "BLACK", 1, true, true];
sleep 4;

cutText [_date, "BLACK FADED", 1, true, true];
sleep 5;

cutText ["", "BLACK IN", 3];
[1] call BIS_fnc_cinemaBorder;