class F90
{
    class Configure 
    {
        class configureEconomy {};
        class configurePersistent {};
        class configureTask {};
        class configureVCR {};
    };
    class Core 
    {
        file = "Functions\Core";
        class clearSave {};
        class createUnit {};
        class deleteSlot {};
        class generateSaveDate {};
        class getSelectedList {};
        class loadData {};
        class loadFromSlot {};
        class makePersistent {};
        class openPersistentTab {};
        class openTacticalTab {};
        class saveTarget {};
        class saveTargetContainer {};
        class saveData {};
        class saveToSlot {};
        class switchUnitAddAction {};
        class updatePersistentList {};
    };

    class Economy 
    {
        file = "Functions\Economy";
        class economyHandler {};
    };

    class Init 
    {
        file = "Functions\Init";
        class persistentInit {};
        class initTask {};
        class initVCR {};
        class initEconomy {};
    };

    class Load
    {
        file = "Functions\Load";
        class loadContainers {};
        class loadEnvironment {};
        class loadGame {};
        class loadMapMarkers {};
        class loadPlayables {};
        class loadPlayer {};
        class loadUnitData {};
        class loadUnitsInGroup {};
        class loadVariables {};
        class loadVehicles {};
    };

    class Save 
    {
        file = "Functions\Save";
        class saveContainers {};
        class saveEnvironment {};
        class saveGame {};
        class saveMapMarkers {};
        class savePlayables {};
        class savePlayer {};
        class saveVariables {};
        class saveVehicles {};
    };

    class initTask
    {
        file = "Functions\Task";
        class requestMission {};
    };

    class Utils
    {
        file = "Functions\Utils";
        class addUnitToVehicle {};
        class applyCargoData {};
        class applyDamage {};
        class applyPositioningData {};
        class clearArray {};
        class clearGarbage {};
        class debug {};
        class generateCargoData {};
        class generateGroupData {};
        class generatePositioningData {};
        class generateUnitData {};
        class generateVehicleID {};
        class getByKey {};
        class loadFromNamespace {};
        class resetMap {};
        class resetTask {};
        class resetUnit {};
        class saveToNamespace {};
    }; 

    class VeteranCombatRecord 
    {
        file = "Functions\VeteranCombatRecord";
        class addKillCount {};
        class confirmKill {};
    };
};