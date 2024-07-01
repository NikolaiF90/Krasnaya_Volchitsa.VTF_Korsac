params ["_camera", "_endTime", "_startTime"];

// Stop execution if camera has been deleted
if (isNull _camera) exitWith {};

private _timeLeft = (_startTime + _endTime) - diag_tickTime;

// Reach end time
if (_timeLeft <= 0) exitWith 
{
    _camera cameraEffect ["Terminate", "BACK"];
    camDestroy _camera;
};

// Starts another loop
[_camera, _endTime, _startTime] call F90_fnc_startDeadCamTimer;