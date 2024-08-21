// ToDo - Optimize
private _fn_spawnVeh = 
{
    params ["_helipad", "_index", "_dropOffKey"];
    private _heliData = selectRandom Support_HelicoptersList;

    // Spawn transport heli
    private _helicopter = createVehicle [_heliData select 0, position _helipad, [], 0, "NONE"];
    _helicopter setDir (direction _helipad);

    // Spawn Crew 
    createVehicleCrew _helicopter;

    // Create heli variables 
    _helicopter setVariable ["RSW_OnTransportMission", false, true];
    _helicopter setVariable ["RSW_BasePosition", position _helipad, true];
    _helicopter setVariable ["RSW_IsIdle", true, true];

    Support_TransportHelicopters pushBack [_helicopter, _heliData select 1];
    Support_HeliSlot set [_index, [[_helicopter, _heliData select 1], _helipad]];

    // Create request drop off action
    [_helicopter, _dropOffKey] remoteExec ["F90_fnc_addTransportHeliAction", 0, true];
};

{
    private _heliData = _x select 0;
    private _helipad = _x select 1;
    private _dropOffKey = format ["RSW_DropOffAction%1Added", _forEachIndex];

    // Nothing created
    if (isNil {_heliData}) then 
    {
        [_helipad, _forEachIndex, _dropOffKey] call _fn_spawnVeh;
    } else
    {
        private _heliObject = _heliData select 0;
        if (isNil {_heliObject}) then 
        {
            [_helipad, _forEachIndex, _dropOffKey] call _fn_spawnVeh;
        } else 
        {
            if !(alive _heliObject) then 
            {
                [_helipad, _forEachIndex, _dropOffKey] call _fn_spawnVeh;
            };
        };
    };
} forEach Support_HeliSlot;