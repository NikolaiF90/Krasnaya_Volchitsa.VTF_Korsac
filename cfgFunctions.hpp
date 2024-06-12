class F90
{
    class Ambient 
    {
        file = "Functions\Ambient";

    };

    class CivilianAndBounty
    {
        file = "Functions\CivilianAndBounty";
        class addArrestAction {};
        class addAskIDAction {};
        class addWantedPerson {};
        class arrest {};
        class askForID {};
        class civilianHandler {};
        class registerCivilian {};
        class scanHouses {};
        class spawnCivilian {};
        class updateSpawnerList {};
    };

    class Configure 
    {
        file = "Functions\Configure";
        class configureAmbient {};
        class configureCAB {};
        class configureEconomy {};
        class configureIdentity {};
        class configurePersistent {};
        class configureTask {};
        class configureREC {};
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
        class initCABPlayer {};
        class initCABServer {};
        class initCivilian {};
        class initEconomy {};
        class initGlobalVariables {};
        class initPersistent {};
        class initREC {};
        class initServerVariables {};
        class initTask {};
    };

    class Load
    {
        file = "Functions\Load";
        class loadContainers {};
        class loadEnvironment {};
        class loadGame {};
        class loadMapMarkers {};
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
        class savePlayer {};
        class saveVariables {};
        class saveVehicles {};
    };

    class Task
    {
        file = "Functions\Task";
        class activeTaskHandler {};
        class addReportDutyAction {};
        class addReportMissionAction {};
        class completePatrol {};
        class createAmbush {};
        class createAOMarker {};
        class createAOTrigger {};
        class createHVT {};
        class createPatrol {};
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
        class generateName {};
        class generatePositioningData {};
        class generateUniqueID {};
        class generateUnitData {};
        class generateVehicleID {};
        class getByKey {};
        class loadFromNamespace {};
        class removeActionGlobal {};
        class saveToNamespace {};
    }; 

    class VeteranCombatRecord 
    {
        file = "Functions\VeteranCombatRecord";
        class addConfirmKillAction {};
        class addKillCount {};
        class calculatePoints {};
        class closeReport {};
        class confirmKill {};
        class getWantedList {};
        class openTacticalTab {};
        class showReport {};
        class transferRecord {};
        class updateWantedList {};
    };
};