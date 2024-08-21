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
        class configureREC {};
        class configureShop {};
        class configureSHARS {};
        class configureSkillTree {};
        class configureSupport {};
        class configureTask {};
    };
    class Core 
    {
        file = "Functions\Core";
        class addAction {};
        class addActionGlobal {};
        class addToHighCommand {};
        class checkCommandingEgibility {};
        class clearSave {};
        class closeMenu {};
        class createBaseLocationMarkers {};
        class createSquad {};
        class createUnit {};
        class debriefingTimeSkip {};
        class deleteMarked {};
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
        class markUnit {};
        class missionKeyHandler {};
        class openTimeSkipMenu {};
        class saveTarget {};
        class saveTargetContainer {};
        class setStandingAnimation {};
        class removeVariable {};
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
        class teleportObject {};
        class textNotification {};
        class updatePersistentList {};
    };

    class Economy 
    {
        file = "Functions\Economy";
        class addMoney {};
        class deductMoney {};
        class getMoney {};
        class setMoney {};
        class transferMilcash {};
    };

    class Init 
    {
        file = "Functions\Init";
        class initAmbient {};
        class initCABPlayer {};
        class initCABServer {};
        class initCivilian {};
        class initDialogIDC {};
        class initDSC {};
        class initEconomy {};
        class initGlobalVariables {};
        class initHeal {};
        class initModConfigurations {};
        class initMods {};
        class initOP {};
        class initPersistent {};
        class initPRS {};
        class initREC {};
        class initServerVariables {};
        class initSHARS {};
        class initSHARSPlayers {};
        class initShop {};
        class initSkillTree {};
        class initSP {};
        class initStartGame {};
        class initSupport {};
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
        class generateUnitData {};
        class loadFromSlot {};
        class loadUnitData {};
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
    
    class Shop 
    {
        file = "Functions\Shop";

        class createLogisticOfficer {};
        class filterBaseWeapons {};
        class generateWeaponPrice {};
        class generateWeaponsData {};
        class getAllEquipments {};
        class getAllWeapons {};
        class getRecoilValue {};
        class getWeaponDamage {};
        class openItemShop {};
        class openWeaponShop {};
        class purchaseItem {};
        class purchaseWeapon {};
        class saleHandler {};
    };

    class SideChange
    {
        file = "Functions\SideChange";
    };

    class SkillTree
    {
        file = "Functions\SkillTree";

        class addSP {};
        class buySP {};
        class createRangeOfficer {};
        class deductSP {};
        class openSkillMenu {};
        class purchaseSkill {};
        class upgradeSkill {};
    };

    class Support
    {
        file = "Functions\Support";

        class addTransportHeliAction {};
        class changeTransportHeli {};
        class createSupportOfficer {};
        class createTransportVehicles {};
        class getFactionVehicles {};
        class getHelicopter {};
        class getTrucks {};
        class menuRequestRtb {};
        class openChangeTransportHeliMenu {};
        class openSupportMenu {};
        class openTransportSupportMenu {};
        class requestDropOff {};
        class requestPickup {};
        class requestRtb {};
        class showPurchaseVehicleAction {};
        class spawnVehicle {};
        class transportSitrep {};
    };

    class Task
    {
        file = "Functions\Task";
        class activeTaskHandler {};
        class addReportDutyAction {};
        class completePatrol {};
        class createAmbush {};
        class createAOMarker {};
        class createAOTrigger {};
        class createHVT {};
        class createPatrol {};
        class createSeizableAsset {};
        class createTask {};
        class createTaskOfficer {};
        class createTaskSupport {};
        class killHVTTaskHandler {};
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
        class convertToTime {};
        class createMarker {};
        class debug {};
        class deleteMarker {};
        class filterArray {};
        class filterGoodHouses {};
        class findFactionAddons {};
        class generateCargoData {};
        class generateDisplayName {};
        class generateGroupData {};
        class generateName {};
        class generatePositioningData {};
        class generateUniqueID {};
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
        class transferRecord {};
        class updateWantedList {};
    };
};