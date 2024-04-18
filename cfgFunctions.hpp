class F90
{
    class Configure 
    {
        class configurePersistent {};
    };
    class Core 
    {
        file = "Functions\Core";
        class clearSave {};
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
        class updatePersistentList {};
    };

    class Init 
    {
        file = "Functions\Init";
        class persistentInit {};
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
        class saveToNamespace {};
    };
};