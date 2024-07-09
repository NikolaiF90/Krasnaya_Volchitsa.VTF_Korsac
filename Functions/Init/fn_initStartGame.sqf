params ["_target"];

waitUntil {Mission_DoneInitGlobalVariables};
Server_Started = false;

if (_target == "Server") then 
{
    if (isServer && hasInterface) then 
    {
        [] spawn F90_fnc_showServerStartMenu;
    };
};

if (_target == "Client") then 
{
    if (hasInterface && !isServer) then 
    {
        0 = [] spawn 
        {
            while {true} do
            {
                // Terminate loops once server started
                if (Server_Started) exitWith {};

                // Inform player that the server owner still setting up
                ["Server host is setting up. Please wait", "DEFAULT", 4, 101, false] call F90_fnc_textNotification;
                sleep 5;
            };
        };
    };
};