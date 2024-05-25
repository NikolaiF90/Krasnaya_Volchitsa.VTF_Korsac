class F90
{
    class Ambient 
    {
        file = "Functions\Ambient"

    };

    class CivilianAndBounty
    {
        file = "Functions\CivilianAndBounty";
        class addWantedPerson {};
        class arrest {};
        class askForID {};
        class civilianHandler {};
        class registerCivilian {};
        class scanHouses {};
        class spawnCivilian {};
    };

    class Configure 
    {
        file = "Functions\Configure";
        class configureAmbient {};
        class configureCAB {};
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
        class initAmbient {};
        class initCAB {};
        class persistentInit {};
        class initTask {};
        class initVariables {};
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

    class Reset 
    {
        file = "Functions\Reset";
        class resetMap {};
        class resetTask {};
        class resetTempRecord {};
        class resetUnit {};
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

    class Task
    {
        file = "Functions\Task";
        class activeTaskHandler {};
        class completePatrol {};
        class createAmbush {};
        class createAOMarker {};
        class createAOTrigger {};
        class createTask {};
        class reportMission {};
        class requestMission {};
        class showTaskNotification {};
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
        class filterGoodHouses {};
        class generateCargoData {};
        class generateGroupData {};
        class generatePositioningData {};
        class generateUniqueID {};
        class generateUnitData {};
        class generateVehicleID {};
        class getByKey {};
        class loadFromNamespace {};
        class saveToNamespace {};
    }; 

    class VeteranCombatRecord 
    {
        file = "Functions\VeteranCombatRecord";
        class addKillCount {};
        class closeReport {};
        class confirmKill {};
        class openTacticalTab {};
        class showReport {};
        class transferRecord {};
        class updateWantedList {};
    };
};