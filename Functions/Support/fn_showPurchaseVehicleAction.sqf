
// Create a purchase vehicle action
[
    repairX,
    "Purchase Vehicle",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        
        if (dialog) then { closeDialog 2};

        createDialog "purchaseVehicleMenu";

        // Populate listbox
        private _content = [];

        {
            private _text = format ["%1 (%2)", _x select 1, _x select 0];
            _content pushBack _text;
        } forEach Support_AlliedFactionVehicles;

        [PurchaseVehMenu_VehiclesListBoxIDC, _content] call F90_fnc_populateListBox;
        
    },
    "true",
    "RSW_PurchaseVehActionID"    
] remoteExec ["F90_fnc_addAction", 0, true];