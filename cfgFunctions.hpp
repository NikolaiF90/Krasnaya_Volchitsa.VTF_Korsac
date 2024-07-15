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
        class configureDSC {};
        class configureEconomy {};
        class configureIdentity {};
        class configurePersistent {};
        class configurePRS {};
        class configureTask {};
        class configureSHARS {};
        class configureREC {};
    };
    class Core 
    {
        file = "Functions\Core";
        class addAction {};
        class addToHighCommand {};
        class checkCommandingEgibility {};
        class clearSave {};
        class closeMenu {};
        class createSquad {};
        class createUnit {};
        class deleteUnit {};
        class delVeh {};
        class generateSaveDate {};
        class generateSquadData {};
        class getDate {};
        class getLocations {};
        class getSelectedList {};
        class getSystemDate {};
        class joinGroup {};
        class loadData {};
        class makePersistent {};
        class missionKeyHandler {};
        class openTimeSkipMenu {};
        class saveTarget {};
        class saveTargetContainer {};
        class resetRespawnedUnit {};
        class respawnUnit {};
        class saveData {};
        class skipTime {};
        class spawnBaseGuard {};
        class showServerStartMenu {};
        class splashScreen {};
        class startDeadCamTimer {};
        class startRespawnTimer {};
        class startServer {};
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
        class initDSC {};
        class initEconomy {};
        class initGlobalVariables {};
        class initPersistent {};
        class initPRS {};
        class initREC {};
        class initServerVariables {};
        class initSHARS {};
        class initSHARSPlayers {};
        class initStartGame {};
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

    class PerksAndRankingSystem
    {
        file = "Functions\PerksAndRankingSystem";
        class addTotalOP {};
        class createPersonnelOfficer {};
        class getPerkKeyState {};
        class getPromotionOP {};
        class getRankIndex {};
        class getTotalOP {};
        class getUnitOperationPoints {};
        class getUnitRank {};
        class promoteUnit {};
        class setTotalOP {};
        class setUnitRank {};
        class unlockPerk {};
    };

    class Persistent
    {
        file = "Functions\Persistent";
        
        class createNewSlot {};
        class deleteSlot {};
        class loadFromSlot {};
        class openPersistentTab {};
        class saveToSlot {};
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
        class generateReserveData {};
        class generateShopData {};
        class generateSquadShopData {};
        class generateUnitTiers {};
        class generateWage {};
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
    
    class SideChange
    {
        file = "Functions\SideChange";
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
        class convertToTime {};
        class clearGarbage {};
        class debug {};
        class filterArray {};
        class filterGoodHouses {};
        class findFactionAddons {};
        class generateCargoData {};
        class generateDisplayName {};
        class generateGroupData {};
        class generateName {};
        class generatePositioningData {};
        class generateUniqueID {};
        class generateUnitData {};
        class generateVehicleID {};
        class getByKey {};
        class getSuitableClass {};
        class getFactionUnits {};
        class loadFromNamespace {};
        class populateListBox {};
        class removeActionGlobal {};
        class saveToNamespace {};
        class setMissionDate {};
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