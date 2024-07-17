waitUntil {Mission_DoneInitGlobalVariables};

if (isServer && hasInterface) then 
{
    [] spawn F90_fnc_showServerStartMenu;
};

if (hasInterface && !isServer) then 
{
    0 = [] spawn 
    {
        while {true} do
        {
            // Terminate loops once server started
            if (Server_Started) exitWith {};

            // Debug
            [true, "initStartGame", format ["Server_Started: %1, Mission_InitDone: %2", Server_Started, Mission_InitDone], false, false] call F90_fnc_debug;
            // Inform player that the server owner still setting up
            ["Server host is setting up. Please wait", "DEFAULT", 4, 101, false] call F90_fnc_textNotification;
            sleep 5;
        };
    };
};