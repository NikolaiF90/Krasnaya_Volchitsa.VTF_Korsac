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
        class configureSHARS {};
        class configureREC {};
    };
    class Core 
    {
        file = "Functions\Core";
        class addAction {};
        class addToHighCommand {};
        class clearSave {};
        class closeMenu {};
        class createUnit {};
        class deleteSlot {};
        class deleteUnit {};
        class delVeh {};
        class generateSaveDate {};
        class getDate {};
        class getLocations {};
        class getSelectedList {};
        class getSystemDate {};
        class loadData {};
        class loadFromSlot {};
        class makePersistent {};
        class openPersistentTab {};
        class saveTarget {};
        class saveTargetContainer {};
        class resetRespawnedUnit {};
        class respawnUnit {};
        class saveData {};
        class saveToSlot {};
        class splashScreen {};
        class startDeadCamTimer {};
        class startRespawnTimer {};
        class teleportUnit {};
        class textNotification {};
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
        class initSHARS {};
        class initSHARSPlayers {};
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

    class SHARS
    {
        file = "Functions\SHARS";
        class addNewHC {};
        class addToPlayerSquad {};
        class addTrainEH {};
        class addUnitToHC {};
        class disbandSquad {};
        class dismissSquad {};
        class dismissUnit {};
        class generateGroupWages {};
        class generateHireCost {};
        class generateHireData {};
        class generateReserveData {};
        class generateSquadData {};
        class generateUnitSkills {};
        class generateWage {};
        class getTierMultiplier {};
        class getUnitsTier {};
        class hireUnit {};
        class refreshSquadMenu {};
        class renameHC {};
        class reserveUnit {};
        class showHireMenu {};
        class showRenameHCMenu {};
        class showSquadManagementMenu {};
        class showTrainMenu {};
        class trainUnit {};
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
        class createSeizableAsset {};
        class createTask {};
        class reportMission {};
        class requestMission {};
        class seizeAsset {};
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
        class addToRecentNotification {};
        class calculatePoints {};
        class closeReport {};
        class confirmKill {};
        class getWantedList {};
        class openTacticalTab {};
        class openTransferMenu {};
        class showReport {};
        class transferMilcash {};
        class transferRecord {};
        class updateWantedList {};
    };
};