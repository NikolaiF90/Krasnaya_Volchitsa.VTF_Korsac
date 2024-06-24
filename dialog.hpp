class tacticalMenu
{
	idd = 1200;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Tofasy)
		////////////////////////////////////////////////////////

		class RscText_1000: RscText
		{
			idc = 1201;

			x = 0.005 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_TacticalTab: RscText
		{
			idc = 1202;

			text = "Tactical Tab"; //--- ToDo: Localize;
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscText_1003: RscText
		{
			idc = 1203;

			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_Money: RscText
		{
			idc = 1204;

			text = "Money: 000000"; //--- ToDo: Localize;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
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
			y = 0.247 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
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
		class RscText_1008: RscText
		{
			idc = 1209;

			text = "Total Arrested HVT: 0"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscText_1009: RscText
		{
			idc = 1210;

			text = "Total Killed HVT: 0"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscText_1010: RscText
		{
			idc = 1211;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1212;
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class RscText_1011: RscText
		{
			idc = 1213;
			text = "WANTED LIST"; //--- ToDo: Localize;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
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
	};
};

class dutyReportMenu 
{
	idd = 1300;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Zuwiry)
		////////////////////////////////////////////////////////

		class bg_DutyReport1: RscText
		{
			idc = 1301;

			x = 0.350469 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.429 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class bg_DutyReport2: RscText
		{
			idc = 1302;

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_DutyReport3: RscText
		{
			idc = 1303;

			x = 0.489687 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_DutyReport4: RscText
		{
			idc = 1304;

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_DutyReport5: RscText
		{
			idc = 1305;

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class button_CloseDutyReport: RscButton
		{
			idc = 1306;
			action = "[] call F90_fnc_closeReport";

			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_DutyReport1: RscText
		{
			idc = 1307;

			text = "Duty Report"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyReport2: RscText
		{
			idc = 1308;

			text = "POINTS RECEIVED"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text_DutyReport3: RscText
		{
			idc = 1309;

			text = "POINTS DEDUCTION"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text_DutyReportConfirmedKills: RscText
		{
			idc = 1311;

			text = "Confirmed Kills: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyReportHVTKilled: RscText
		{
			idc = 1312;

			text = "HVT Killed: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyReportHVTCaptured: RscText
		{
			idc = 1313;

			text = "HVT Captured: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyReportAirSupports: RscText
		{
			idc = 1314;

			text = "Air Supports: 0"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyReportArtillery: RscText
		{
			idc = 1315;

			text = "Artillery: 0"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyReportHelicopters: RscText
		{
			idc = 1316;

			text = "Helicopters: 0"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyReportVehicles: RscText
		{
			idc = 1317;

			text = "Vehicles: 0"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyReportWages: RscText
		{
			idc = 1318;

			text = "Subordinate Wages : 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyReportTotalReward: RscText
		{
			idc = 1319;

			text = "Total Milcash Reward: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyReportMilcash: RscText
		{
			idc = 1320;

			text = "Milcash Rewards: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyReportSuccessfulOperation: RscText
		{
			idc = 1321;

			text = "Sucessful Operation: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyReportTotalPoints: RscText
		{
			idc = 1322;

			text = "Total Points: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class text_CapturedPrisoners: RscText
		{
			idc = 1323;

			text = "Captured Prisoners: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_SeizedAssets: RscText
		{
			idc = 1324;

			text = "Seized Assets: 0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

class hireMenu 
{
	idd = 1400;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Maqocy)
		////////////////////////////////////////////////////////

		class bg_hire1: RscText
		{
			idc = 1401;

			x = 0.005 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.33 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class bg_hire2: RscText
		{
			idc = 1402;

			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_hire3: RscText
		{
			idc = 1403;

			x = 0.133906 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_hire4: RscText
		{
			idc = 1404;

			x = 0.257656 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_hire5: RscText
		{
			idc = 1405;

			x = 0.381406 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_hire1: RscText
		{
			idc = 1406;

			text = "RECRUIT MENU"; //--- ToDo: Localize;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class text_TierOne: RscText
		{
			idc = 1407;

			text = "Tier 1"; //--- ToDo: Localize;
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class text_TierTwo: RscText
		{
			idc = 1408;

			text = "Tier 2"; //--- ToDo: Localize;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class text_TierThree: RscText
		{
			idc = 1409;

			text = "Tier 3"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class text_Squad: RscText
		{
			idc = 1410;

			text = "Squad"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class button_CloseHire: RscButton
		{
			idc = 1411;
			action = "[] call F90_fnc_closeMenu";

			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class button_RecruitT1: RscButton
		{
			idc = 1412;
			action = "['TierOne'] call F90_fnc_hireUnit";

			text = "Recruit Unit"; //--- ToDo: Localize;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class button_RecruitT2: RscButton
		{
			idc = 1413;
			action = "['TierTwo'] call F90_fnc_hireUnit";

			text = "Recruit Unit"; //--- ToDo: Localize;
			x = 0.133906 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class button_RecruitT3: RscButton
		{
			idc = 1414;
			action = "['TierThree'] call F90_fnc_hireUnit";

			text = "Recruit Unit"; //--- ToDo: Localize;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class button_RecruitSquad: RscButton
		{
			idc = 1415;
			action = "['Squad'] call F90_fnc_hireUnit";

			text = "Recruit Squad"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listbox_TierOne: RscListBox
		{
			idc = 1416;

			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listbox_TierTwo: RscListBox
		{
			idc = 1417;

			x = 0.133906 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listbox_TierThree: RscListBox
		{
			idc = 1418;

			x = 0.257656 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listbox_Squad: RscListBox
		{
			idc = 1419;

			x = 0.381406 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class squadManagementMenu
{
	idd = 1500;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Boxade)
		////////////////////////////////////////////////////////

		class bg_Squad1: RscText
		{
			idc = 1501;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.561 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class bg_Squad2: RscText
		{
			idc = 1502;
			x = 0.510313 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_Squad3: RscText
		{
			idc = 1503;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.198 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_Squad4: RscText
		{
			idc = 1504;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.154 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_Squad1: RscText
		{
			idc = 1505;
			text = "Squad Management"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class button_CloseSquad: RscButton
		{
			idc = 1506;
			action = "[] call F90_fnc_closeMenu";

			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
		};
		class text_Squad2: RscText
		{
			idc = 1507;
			text = "Your Squad"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text_Squad3: RscText
		{
			idc = 1508;
			text = "High Command"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text_Squad4: RscText
		{
			idc = 1509;
			text = "Reserved Pool"; //--- ToDo: Localize;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class button_Pool1: RscButton
		{
			idc = 1510;
			action = "[] call F90_fnc_addToPlayerSquad";

			text = "To Your Squad"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Transfer The Selected Unit To Your Squad"; //--- ToDo: Localize;
		};
		class button_Pool2: RscButton
		{
			idc = 1511;
			action = "[] call F90_fnc_addUnitToHC";

			text = "To High Command"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Transfer The Selected Unit To The Selected Squad On High Command"; //--- ToDo: Localize;
		};
		class button_Pool3: RscButton
		{
			idc = 1512;
			action = "[] call F90_fnc_addNewHC";
			text = "To New Squad"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Transfer The Selected Unit To A New Squad"; //--- ToDo: Localize;
		};
		class button_TrainPool: RscButton
		{
			idc = 1513;
			action = "[] call F90_fnc_showTrainMenu";
			text = "Train"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.561,0.494,0.114,1};
			tooltip = "Train The Selected Unit"; //--- ToDo: Localize;
		};
		class button_DismissPool: RscButton
		{
			idc = 1514;
			action = "[] call F90_fnc_dismissUnit";
			
			text = "Dismiss"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5,-1,-1,1};
			tooltip = "Dismiss The Selected Unit"; //--- ToDo: Localize;
		};
		class button_UnitReserve: RscButton
		{
			idc = 1515;
			action = "[] call F90_fnc_reserveUnit";

			text = "To Reserve"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Trasnfer The Selected Unit To Reserve Pool"; //--- ToDo: Localize;
		};
		class button_SquadDisband: RscButton
		{
			idc = 1516;
			action = "[] call F90_fnc_disbandSquad";

			text = "Disband Selected Squad"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Disband The Squad And Transfer All Of Its Unit To Reserve Pool"; //--- ToDo: Localize;
		};
		class button_SquadRename: RscButton
		{
			idc = 1517;
			action = "[] call F90_fnc_showRenameHCMenu";

			text = "Rename Squad"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Rename The Selected Squad"; //--- ToDo: Localize;
		};
		class listbox_PlayerSquad: RscListbox
		{
			idc = 1518;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listbox_HighCommand: RscListbox
		{
			idc = 1519;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.121 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listbox_ReservePool: RscListbox
		{
			idc = 1520;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.242 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class renameHighCommandMenu 
{
	idd = 1600;

	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Sipoku)
		////////////////////////////////////////////////////////

		class bg_RenameHC1: RscText
		{
			idc = 1601;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.143 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_RenameHC1: RscText
		{
			idc = 1602;
			text = "RENAME"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class editbox_RenameHC1: RscEdit
		{
			idc = 1603;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.055 * safezoneH;
			tooltip = "Make Sure The New Name Is Not Already Exist On Another Squad. If It Does, The Name Will Be Swapped Instead";
		};
		class button_ConfirmRenameHC1: RscButton
		{
			idc = 1604;
			action = "[] call F90_fnc_renameHC";

			text = "CONFIRM"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Apply Changes"; //--- ToDo: Localize;
		};
		class button_CancelRenameHC1: RscButton
		{
			idc = 1605;
			action = "[] call F90_fnc_closeMenu";

			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5,-1,-1,1};
			tooltip = "Cancel Any Changes Made"; //--- ToDo: Localize;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class trainMenu 
{
	idd = 1700;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Xarixi)
		////////////////////////////////////////////////////////

		class bg_TrainMenu1: RscText
		{
			idc = 1701;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class bg_TrainMenu2: RscText
		{
			idc = 1702;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_Cost: RscText
		{
			idc = 1703;
			text = "Cost: 0 milcash (0)"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class button_ConfirmTraining: RscButton
		{
			idc = 1704;
			action = "[] call F90_fnc_trainUnit";

			text = "Train"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class button_CancelTraining: RscButton
		{
			idc = 1705;
			action = "[] call F90_fnc_closeMenu";

			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5,-1,-1,1};
			tooltip = "Cancel Training"; //--- ToDo: Localize;
		};
		class text_AimingAccuracy: RscText
		{
			idc = 1706;
			text = "Aiming Accuracy"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Affects how accurately the AI estimate range and calculates bullet drop"; //--- ToDo: Localize;
		};
		class text_AimingShake: RscText
		{
			idc = 1707;
			text = "Aiming Shake"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Affects how steadily the AI can hold a weapon"; //--- ToDo: Localize;
		};
		class text_AimingSpeed: RscText
		{
			idc = 1708;

			text = "Aiming Speed"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Affects how quickly the AI can rotate and stabilize its aim"; //--- ToDo: Localize;
		};
		class text_SpotDistance: RscText
		{
			idc = 1709;
			text = "Spot Distance"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Affects the AI ability to spot targets within it is visual or audible range and the accuracy of the information"; //--- ToDo: Localize;
		};
		class text_SpotTime: RscText
		{
			idc = 1710;
			text = "Spot Time"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Affects how quick the AI react to death, damage or observing an enemy"; //--- ToDo: Localize;
		};
		class text_Courage: RscText
		{
			idc = 1711;
			text = "Courage"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Affects unit's subordinates' morale"; //--- ToDo: Localize;
		};
		class text_ReloadSpeed: RscText
		{
			idc = 1712;
			text = "Reload Speed"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Affects the delay between switching or reloading a weapon"; //--- ToDo: Localize;
		};
		class text_Commanding: RscText
		{
			idc = 1713;
			text = "Commanding"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Affects how quickly recognized targets are shared with the group"; //--- ToDo: Localize;
		};
		class slider_AimingAccuracy: RscSlider
		{
			idc = 1714;
			style = SL_HORZ + SL_TEXTURES;
			type = CT_XSLIDER ;

			x = 0.386562 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class slider_AimingShake: RscSlider
		{
			idc = 1715;
			style = SL_HORZ + SL_TEXTURES;
			type = CT_XSLIDER ;

			x = 0.510312 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class slider_AimingSpeed: RscSlider
		{
			idc = 1716;
			style = SL_HORZ + SL_TEXTURES;
			type = CT_XSLIDER ;

			x = 0.386562 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class slider_SpotDistance: RscSlider
		{
			idc = 1717;
			style = SL_HORZ + SL_TEXTURES;
			type = CT_XSLIDER ;

			x = 0.510312 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class slider_SpotTime: RscSlider
		{
			idc = 1718;
			style = SL_HORZ + SL_TEXTURES;
			type = CT_XSLIDER ;

			x = 0.386562 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class slider_Courage: RscSlider
		{
			idc = 1719;
			style = SL_HORZ + SL_TEXTURES;
			type = CT_XSLIDER ;

			x = 0.510312 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class slider_ReloadSpeed: RscSlider
		{
			idc = 1720;
			style = SL_HORZ + SL_TEXTURES;
			type = CT_XSLIDER ;

			x = 0.386562 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class slider_Commanding: RscSlider
		{
			idc = 1721;
			style = SL_HORZ + SL_TEXTURES;
			type = CT_XSLIDER ;

			x = 0.510312 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class text_SoldierName: RscText
		{
			idc = 1722;
			text = "Soldier Name Goes Here"; //--- ToDo: Localize;
			x = 0.383333 * safezoneW + safezoneX;
			y = 0.211926 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.055 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
