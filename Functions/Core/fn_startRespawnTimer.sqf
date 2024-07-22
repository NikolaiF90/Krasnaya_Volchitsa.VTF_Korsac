/*
 * Author: Psycho
 
 * Visual bleeding effects and counter for revive time. Will self-run in a loop till unit get revived/stabilized or died.
 
 * Arguments:
	0: Unit (Object)
	1: Revive Time (Number)
 
 * Return value:
	-
*/

params ["_unit", "_deadTime"];

// Stop loops if unit is no longer on respawning state
if !(_unit getVariable ["RSW_IsRespawning", false]) exitWith {_unit setDamage 0};

private _spawnTime = RESPAWN_Timer;
private _timeLeft = (_deadTime + _spawnTime) - diag_tickTime;

// Reach spawn time
if (_timeLeft <= 0) exitWith 
{
	resetCamShake;
	titleText ["", "PLAIN DOWN", 1];
	
	{_x ppEffectEnable false; true} count ais_ppEff;
	ppEffectDestroy ais_ppEff;
};

titleText [format ["Respawning in %1 Seconds", floor _timeLeft],"PLAIN DOWN",0.2];

sleep 1;
// Starts another loop
[_unit, _deadTime] call F90_fnc_startRespawnTimer;