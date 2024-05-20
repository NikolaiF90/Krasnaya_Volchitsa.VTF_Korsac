class tacticalMenu
{
	idd = 1200;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Delyga)
		////////////////////////////////////////////////////////

		class RscText_1000: RscText
		{
			idc = 1201;

			x = 0.005 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_TacticalTab: RscText
		{
			idc = 1202;

			text = "Tactical Tab"; //--- ToDo: Localize;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscText_1003: RscText
		{
			idc = 1203;

			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_Money: RscText
		{
			idc = 1204;

			text = "Money: 000000"; //--- ToDo: Localize;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text_ConfirmedKills: RscText
		{
			idc = 1205;

			text = "Confirmed Kills: 00000"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text_ActiveTask: RscText
		{
			idc = 1206;

			text = "There are no active task currently."; //--- ToDo: Localize;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.132 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class RscText_1006: RscText
		{
			idc = 1207;
			text = "Total Conducted Missions: 0"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscText_1007: RscText
		{
			idc = 1208;
			text = "Total Successful Missions: 0"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
}


class persistentMenu
{
	idd = 1100;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Hotoqu)
		////////////////////////////////////////////////////////

		class RscText_1000: RscText
		{
			idc = 1101;

			x = 0.005 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0.071,0.239,0.11,1};
		};
		class listBox_saveList: RscListBox
		{
			idc = 1102;

			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.341 * safezoneH;
			colorBackground[] = {0.235,0.388,0.306,1};
		};
		class button_save: RscButton
		{
			idc = 1103;
			action = "[] call F90_fnc_saveToSlot";

			text = "Save"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.235,0.388,0.306,1};
			tooltip = "Save progress to selected slot"; //--- ToDo: Localize;
		};
		class button_load: RscButton
		{
			idc = 1104;
			action = "[] call F90_fnc_loadFromSlot";

			text = "Load"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.235,0.388,0.306,1};
			tooltip = "Load progress from selected slot"; //--- ToDo: Localize;
		};
		class button_delete: RscButton
		{
			idc = 1105;
			action = "[] call F90_fnc_deleteSlot";

			text = "Delete"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.569,0.059,0.059,1};
			tooltip = "Delete selected slot"; //--- ToDo: Localize;
		};
		class text_scenarioName: RscText
		{
			idc = 1106;

			text = "Scenario Name"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.235,0.388,0.306,1};
		};
		class button_saveVehicle: RscButton
		{
			idc = 1107;
			action = "[] call F90_fnc_saveTarget";

			text = "Save Vehicle"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.141,0.38,0.184,1};
			tooltip = "Save the vehicle you're looking at"; //--- ToDo: Localize;
		};
		class button_saveContainer: RscButton
		{
			idc = 1108;
			action = "[] call F90_fnc_saveTargetContainer";

			text = "Save Container"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.141,0.38,0.184,1};
			tooltip = "Caution! Must point at container first."; //--- ToDo: Localize;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
		/* #Hotoqu
		$[
			1.063,
			["persistentMenu",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
			[1000,"RscText_1000",[1,"",["0.005 * safezoneW + safezoneX","0.00500001 * safezoneH + safezoneY","0.299062 * safezoneW","0.44 * safezoneH"],[-1,-1,-1,-1],[0.071,0.239,0.11,1],[-1,-1,-1,-1],"","-1"],["idc = 1101;"]],
			[1001,"listBox_saveList: RscListBox",[1,"",["0.0153125 * safezoneW + safezoneX","0.071 * safezoneH + safezoneY","0.195937 * safezoneW","0.341 * safezoneH"],[-1,-1,-1,-1],[0.235,0.388,0.306,1],[-1,-1,-1,-1],"","-1"],["idc = 1102;"]],
			[1600,"button_save",[1,"Save",["0.216406 * safezoneW + safezoneX","0.071 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.235,0.388,0.306,1],[-1,-1,-1,-1],"Save progress to selected slot","-1"],["idc = 1103;","action = |[] call F90_fnc_saveToSlot|;"]],
			[1601,"button_load",[1,"Load",["0.216406 * safezoneW + safezoneX","0.115 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.235,0.388,0.306,1],[-1,-1,-1,-1],"Load progress from selected slot","-1"],["idc = 1104;","action = |[] call F90_fnc_loadFromSlot|;"]],
			[1602,"button_delete",[1,"Delete",["0.216406 * safezoneW + safezoneX","0.379 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.569,0.059,0.059,1],[-1,-1,-1,-1],"Delete selected slot","-1"],["idc = 1105;","action = |[] call F90_fnc_deleteSlot|;"]],
			[1002,"text_scenarioName",[1,"Scenario Name",["0.0153125 * safezoneW + safezoneX","0.027 * safezoneH + safezoneY","0.273281 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.235,0.388,0.306,1],[-1,-1,-1,-1],"","-1"],["idc = 1106;"]],
			[1603,"button_saveVehicle",[1,"Save Vehicle",["0.216406 * safezoneW + safezoneX","0.159 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.141,0.38,0.184,1],[-1,-1,-1,-1],"Save the vehicle you're looking at","-1"],["idc = 1107;","action = |[] call F90_fnc_saveTarget|;"]],
			[1604,"button_saveContainer",[1,"Save Container",["0.216406 * safezoneW + safezoneX","0.203 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.141,0.38,0.184,1],[-1,-1,-1,-1],"Caution! Must point at container first.","-1"],["idc = 1108;","action = |[] call F90_fnc_saveTargetContainer|;"]],
			[1605,"",[1,"Save Unit",["0.216406 * safezoneW + safezoneX","0.247 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0.141,0.38,0.184,1],[-1,-1,-1,-1],"Save the unit you're looking at.","-1"],["idc = 1108;","action = |[] call F90_fnc_saveTargetContainer|;"]]
		]
		*/
	};
};

class dutyReportMenu 
{
	idd = 1300;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Bunyve)
		////////////////////////////////////////////////////////

		class RscText_1021: RscText
		{
			idc = 1301;

			x = 0.350468 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class RscText_1022: RscText
		{
			idc = 1302;

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.198 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class RscText_1023: RscText
		{
			idc = 1303;

			x = 0.489687 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.198 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class RscText_1024: RscText
		{
			idc = 1304;

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.154 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class RscText_1025: RscText
		{
			idc = 1305;

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class RscButton_1601: RscButton
		{
			idc = 1306;
			action = "[] call F90_fnc_closeReport";

			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class RscText_1026: RscText
		{
			idc = 1307;

			text = "Duty Report"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1027: RscText
		{
			idc = 1308;

			text = "KILLS"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscText_1028: RscText
		{
			idc = 1309;

			text = "ASSETS USED"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1029: RscText
		{
			idc = 1310;

			text = "CASUALTIES"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1030: RscText
		{
			idc = 1311;

			text = "Confirmed Kills: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1031: RscText
		{
			idc = 1312;

			text = "HVT Killed: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1032: RscText
		{
			idc = 1313;

			text = "HVT Captured: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1033: RscText
		{
			idc = 1314;

			text = "Air Supports: 0"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1034: RscText
		{
			idc = 1315;

			text = "Artillery: 0"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1035: RscText
		{
			idc = 1316;

			text = "Helicopters: 0"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1036: RscText
		{
			idc = 1317;

			text = "Vehicles: 0"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1037: RscText
		{
			idc = 1318;

			text = "Civilian Casualty: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1038: RscText
		{
			idc = 1319;

			text = "Team Casualty: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1039: RscText
		{
			idc = 1320;

			text = "Milcash Rewards: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1040: RscText
		{
			idc = 1321;

			text = "Sucessful Operation: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1041: RscText
		{
			idc = 1322;

			text = "Total Points: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

