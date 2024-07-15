[0] call BIS_fnc_cinemaBorder;
private _date = [true, false, true] call F90_fnc_getDate;

sleep 0.0001;
private _content = "<t font='PuristaSemibold' size='5.0'>RED SHE-WOLF </t>by PrinceF90<br />KRASNAYA VOLCHITSA"; 
cutText [_content, "BLACK", 3, true, true];
sleep 4;

cutText [_date, "BLACK FADED", 1, true, true];
sleep 5;

cutText ["", "BLACK IN", 3];
[1] call BIS_fnc_cinemaBorder;