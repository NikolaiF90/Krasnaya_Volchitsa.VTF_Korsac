params [["_unit", player]];
Persistent_DefaultSlots = ["New Slot"];

//Keys
Persistent_PersistentListKey = Scenario_Name + "_PersistentList"; 
Persistent_VehicleIDKey = "Save_QueueID";

// Remove persistent action if already exist (to avoid duplicate action on server host)
private _persistentActionID = _unit getVariable ["Persistent_ActionID", nil];
if (!isNil {_persistentActionID}) then {_unit removeAction _persistentActionID};

// Create a new persistent action
_persistentActionID = _unit addAction 
[
    "<t color='#0089f2'>Persistent</t>", 
    {
        [] call F90_fnc_openPersistentTab;
    },
    nil,
    4,
    false,
    true,
    "",
    "_this == _target"
];

_unit setVariable ["Persistent_ActionID", _persistentActionID];