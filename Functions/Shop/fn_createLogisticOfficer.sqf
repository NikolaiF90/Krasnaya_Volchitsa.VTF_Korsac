/*
    Author: PrinceF90

    Description:
        Create a logistic officer unit, set up actions, and initialize systems.

    Parameter(s):
        None

    Returns:
        None
*/
private _fn_createOfficer = 
{
    // Create logistic officer
    private _group = createGroup [Mission_AlliedSide, true];
    private _officerClass = [DSC_AlliedUnitList, ["officer", "sl", "tl", "commander", "squadleader"]] call F90_fnc_getSuitableClass;
    Shop_LogisticOfficer = _group createUnit [_officerClass, [0,0,0], [], 0, "FORM"];
    [Shop_LogisticOfficer, Shop_WeaponShop] spawn F90_fnc_teleportObject;
    [Shop_LogisticOfficer] call F90_fnc_setStandingAnimation;

    // Init revive system
    [Shop_LogisticOfficer] call AIS_System_fnc_loadAIS;
};

private _fn_createShopBox = 
{
    if (isNil {Shop_InventoryBox}) then 
    {
        // Create Shopbox 
        Shop_InventoryBox = "VirtualReammoBox_small_F" createVehicle [0,0,0];
        sleep 0.1;
        [Shop_InventoryBox, Shop_LogisticOfficer, 90] call F90_fnc_teleportObject;
    };
};

// create officer
if (isNil {Shop_LogisticOfficer}) then 
{
    [] call _fn_createOfficer;
} else 
{
    if !(alive Shop_LogisticOfficer) then 
    {
        [] call _fn_createOfficer;
    };
};
// Create Shopbox
[] call _fn_createShopBox;

// Create officer's action
[
    Shop_LogisticOfficer,
    "Open Weapon Shop",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        
        [] call F90_fnc_openWeaponShop;
    },
    "alive _target && alive _this",
    "RSW_OpenShopActionID"    
] remoteExec ["F90_fnc_addAction", 0, true];

[
    Shop_LogisticOfficer,
    "Open Item Shop",
    {
        [] call F90_fnc_openItemShop;
    },
    "alive _target && alive _this",
    "RSW_ItemActionAdded"
] remoteExec ["F90_fnc_addAction", 0, true];