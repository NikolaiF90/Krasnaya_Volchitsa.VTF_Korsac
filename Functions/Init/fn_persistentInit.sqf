[PersistentDebug, "persistentInit", "Initializing persistence system...", true] call F90_fnc_debug;

Persistent_DefaultSlots = ["New Slot"];

//Keys
Persistent_PersistentListKey = Scenario_Name + "_PersistentList"; 
Persistent_VehicleIDKey = "Save_QueueID";

Persistent_Host addAction ["<t color='#0089f2'>Persistent</t>", { [] call F90_fnc_openPersistentTab;}];

[PersistentDebug, "persistentInit", "Done initializing persistence system.", true] call F90_fnc_debug;