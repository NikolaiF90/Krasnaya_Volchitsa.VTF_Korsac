class tacticalMenu
{
	idd = 1200;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Mawocy)
		////////////////////////////////////////////////////////

		class bg_Tactical1: RscText
		{
			idc = 1201;

			x = 0.324687 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_TacticalTitle: RscText
		{
			idc = 1202;

			text = "Tactical Tab"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class bg_Tactical2: RscText
		{
			idc = 1203;

			x = 0.329844 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.209 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_Tactical3: RscText
		{
			idc = 1204;

			x = 0.329843 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.340312 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_Tactical4: RscText
		{
			idc = 1205;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.209 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listBox_TacticalWanted: RscListBox
		{
			idc = 1206;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_TacticalWantedList: RscText
		{
			idc = 1207;

			text = "Wanted List"; //--- ToDo: Localize;
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class listBox_TacticalNotification: RscListBox
		{
			idc = 1208;

			x = 0.329841 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.340312 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_TacticalNotification: RscText
		{
			idc = 1209;

			text = "Recent Notification"; //--- ToDo: Localize;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class bg_Tactical5: RscText
		{
			idc = 1210;

			x = -0.000163675 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class button_TacticalPersistent: RscButton
		{
			idc = 1211;
			action = "[] call F90_fnc_openPersistentTab";

			text = "PERSISTENT"; //--- ToDo: Localize;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Open Persistent Menu"; //--- ToDo: Localize;
		};
		class button_TacticalTransferMilcash: RscButton
		{
			idc = 1212;
			action = "[] call F90_fnc_openTransferMenu";

			text = "TRANSFER MILCASH"; //--- ToDo: Localize;
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Transfer Milcash To Your Friend"; //--- ToDo: Localize;
		};
		class button_TacticalClose: RscButton
		{
			idc = 1213;
			action = "[] call F90_fnc_closeMenu";

			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.850625 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
		};
		class button_TacticalTimeSkip: RscButton
		{
			idc = 1214;
			action = "[] call F90_fnc_openTimeSkipMenu";

			text = "TIME SKIP"; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Skips The Time"; //--- ToDo: Localize;
		};
		class bg_Tactical6: RscText
		{
			idc = 1215;
			x = -0.0104713 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 1.01063 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_TacticalNameRank: RscText
		{
			idc = 1216;
			text = "Name: TestTestTestTest (Sergeant Major of the Army)"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text_TacticalMoney: RscText
		{
			idc = 1217;
			text = "Money: 000000"; //--- ToDo: Localize;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.083 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text_TacticalID: RscText
		{
			idc = 1218;
			text = "ID:00000000"; //--- ToDo: Localize;
			x = 0.838281 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.083 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class button_TacticalHelp: RscButton
		{
			idc = 1219;
			action = "";

			text = "?"; //--- ToDo: Localize;
			x = 0.814531 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Open Website For Guide"; //--- ToDo: Localize;
		};
		class listBox_TacticalStatistic: RscListbox
		{
			idc = 1220;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_TacticalStatistic: RscText
		{
			idc = 1221;
			text = "Statistic"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class text_TacticalSP: RscText
		{
			idc = 1222;
			text = "SP: 000000"; //--- ToDo: Localize;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.083 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class button_TacticalSupport: RscButton
		{
			idc = 1223;
			action = "[] call F90_fnc_openSupportMenu";

			text = "Support"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Open support menu"; //--- ToDo: Localize;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class persistentMenu
{
	idd = 1100;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Zybojo)
		////////////////////////////////////////////////////////

		class bg_Persistent1: RscText
		{
			idc = 1101;

			x = 0.278281 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.438281 * safezoneW;
			h = 0.517 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class button_PersistentSaveTo: RscButton
		{
			idc = 1102;
			action = "[] call F90_fnc_saveToSlot";

			text = "Save To"; //--- ToDo: Localize;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Overwrite Current Progress To Selected Slot With Provided Name"; //--- ToDo: Localize;
		};
		class button_PersistentLoad: RscButton
		{
			idc = 1103;
			action = "[] call F90_fnc_loadFromSlot";

			text = "Load"; //--- ToDo: Localize;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Load Progress From Selected Slot"; //--- ToDo: Localize;
		};
		class button_PersistentDelete: RscButton
		{
			idc = 1104;
			action = "[] call F90_fnc_deleteSlot";

			text = "Delete"; //--- ToDo: Localize;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.569,0.059,0.059,1};
			tooltip = "Delete Selected Slot"; //--- ToDo: Localize;
		};
		class bg_Persistent2: RscText
		{
			idc = 1105;

			x = 0.283437 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.407 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listBox_PersistentSaveList: RscListbox
		{
			idc = 1106;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class editBox_PersistentName: RscEdit
		{
			idc = 1107;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Enter A Name For Current Selected Slot"; //--- ToDo: Localize;
		};
		class text_PersistentTitle: RscText
		{
			idc = 1108;
			text = "Scenario Name"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class button_PersistentSaveNew: RscButton
		{
			idc = 1603;
			action = "[] call F90_fnc_createNewSlot";

			text = "Save New"; //--- ToDo: Localize;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Create A New Save With Provided Name"; //--- ToDo: Localize;
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
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Gudizy)
		////////////////////////////////////////////////////////

		class bg_Duty1: RscText
		{
			idc = 1301;

			x = 0.350469 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.429 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class bg_Duty2: RscText
		{
			idc = 1302;

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_Duty3: RscText
		{
			idc = 1303;

			x = 0.489687 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_Duty5: RscText
		{
			idc = 1304;

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.132 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_DutyTitle3: RscText
		{
			idc = 1305;

			text = "TOTAL"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class button_CloseDuty: RscButton
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
		class text_DutyTitle1: RscText
		{
			idc = 1307;

			text = "Duty Report"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_DutyTitle2: RscText
		{
			idc = 1308;

			text = "POINTS RECEIVED"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class listBox_DutyPointsReceived: RscListbox
		{
			idc = 1309;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class listBox_DutyPointsDeducted: RscListbox
		{
			idc = 1310;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class listBox_DutyTotal: RscListbox
		{
			idc = 1311;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class text_DutyTitle4: RscText
		{
			idc = 1312;

			text = "POINTS DEDUCTED"; //--- ToDo: Localize;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.044 * safezoneH;
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
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Xasoso)
		////////////////////////////////////////////////////////

		class bg_hire1: RscText
		{
			idc = 1401;

			x = 0.314375 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.366094 * safezoneW;
			h = 0.649 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class bg_hire2: RscText
		{
			idc = 1402;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_hire3: RscText
		{
			idc = 1403;

			x = 0.319531 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_hire4: RscText
		{
			idc = 1404;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_hire5: RscText
		{
			idc = 1405;

			x = 0.319531 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_hire1: RscText
		{
			idc = 1406;

			text = "RECRUIT MENU"; //--- ToDo: Localize;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class text_TierOne: RscText
		{
			idc = 1407;

			text = "Tier 1"; //--- ToDo: Localize;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class text_TierTwo: RscText
		{
			idc = 1408;

			text = "Tier 2"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0670311 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class text_TierThree: RscText
		{
			idc = 1409;

			text = "Tier 3"; //--- ToDo: Localize;
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0670311 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class text_Squad: RscText
		{
			idc = 1410;

			text = "Squad"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0670311 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class button_CloseHire: RscButton
		{
			idc = 1411;
			action = "[] call F90_fnc_closeMenu";

			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.355781 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
		};
		class button_RecruitT1: RscButton
		{
			idc = 1412;
			action = "['TierOne'] call F90_fnc_hireUnit";

			text = "Recruit Unit"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class button_RecruitT2: RscButton
		{
			idc = 1413;
			action = "['TierTwo'] call F90_fnc_hireUnit";

			text = "Recruit Unit"; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class button_RecruitT3: RscButton
		{
			idc = 1414;
			action = "['TierThree'] call F90_fnc_hireUnit";

			text = "Recruit Unit"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class button_RecruitSquad: RscButton
		{
			idc = 1415;
			action = "['Squad'] call F90_fnc_hireUnit";

			text = "Recruit Squad"; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listbox_TierOne: RscListBox
		{
			idc = 1416;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listbox_TierTwo: RscListBox
		{
			idc = 1417;

			x = 0.319531 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listbox_TierThree: RscListBox
		{
			idc = 1418;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listbox_Squad: RscListBox
		{
			idc = 1419;

			x = 0.319531 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
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

class transferMenu 
{
	idd = 1800;

	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Fitymu)
		////////////////////////////////////////////////////////

		class bg_Transfer1: RscText
		{
			idc = 1801;
			x = 0.381405 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_Transfer1: RscText
		{
			idc = 1802;
			text = "TRANSFER MILCASH"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class editBox_TransferPlayerID: RscEdit
		{
			idc = 1803;
			x = 0.386563 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "ID Of The Player To Transfer Your Milcash"; //--- ToDo: Localize;
		};
		class editBox_TransferAmount: RscEdit
		{
			idc = 1804;
			x = 0.386561 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Amount Of Milcash To Transfer"; //--- ToDo: Localize;
		};
		class button_TransferConfirm: RscButton
		{
			idc = 1805;
			action = "[] call F90_fnc_transferMilcash";

			text = "TRANSFER"; //--- ToDo: Localize;
			x = 0.458747 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class button_TransferClose: RscButton
		{
			idc = 1806;
			action = "[] call F90_fnc_closeMenu";

			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

class serverStartMenu 
{
	idd = 1900;

	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Keriji)
		////////////////////////////////////////////////////////

		class bg_serverStart01: RscText
		{
			idc = 1901;
			x = 0.355624 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.396 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class bg_serverStart02: RscText
		{
			idc = 1902;
			x = 0.360779 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.297 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_serverStartTitle: RscText
		{
			idc = 1903;
			text = "Server Setup: Krasnaya Volchitsa"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text_serverStartSideLabel01: RscText
		{
			idc = 1904;
			text = "Allied Side: "; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Choose Your Side"; //--- ToDo: Localize;
		};
		class combo_serverStartSideSelection01: RscCombo
		{
			idc = 1905;
			x = 0.438126 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_serverStartFactionLabel01: RscText
		{
			idc = 1906;
			text = "Allied Faction: "; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Choose Your Faction"; //--- ToDo: Localize;
		};
		class combo_serverStartFactionSelection01: RscCombo
		{
			idc = 1907;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_serverStartSideLabel02: RscText
		{
			idc = 1908;
			text = "Enemy Side: "; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Choose Enemy Side"; //--- ToDo: Localize;
		};
		class combo_serverStartSideSelection02: RscCombo
		{
			idc = 1909;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_serverStartFactionLabel02: RscText
		{
			idc = 1910;
			text = "Enemy Faction: "; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Choose Enemy Faction"; //--- ToDo: Localize;
		};
		class combo_serverStartFactionSelection02: RscCombo
		{
			idc = 1911;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_serverStartTimeLabel01: RscText
		{
			idc = 1912;
			text = "Start Time:"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class slider_serverStartTimeSelection: RscSlider
		{
			idc = 1913;
			style = SL_HORZ + SL_TEXTURES;
			type = CT_XSLIDER ;

			x = 0.45875 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class text_serverStartTimeLabel02: RscText
		{
			idc = 1914;
			text = "1200hrs"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text_serverStartAlliedSkillLabel01: RscText
		{
			idc = 1915;
			text = "Allied Skill:"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Skill Level Of Allied Units"; //--- ToDo: Localize;
		};
		class text_serverStartAlliedSkillLabel02: RscText
		{
			idc = 1916;
			text = "0.25"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text_serverStartEnemySkillLabel01: RscText
		{
			idc = 1917;
			text = "Enemy Skill:"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Skill Level Of Enemy Units"; //--- ToDo: Localize;
		};
		class text_serverStartEnemySkillLabel02: RscText
		{
			idc = 1918;
			text = "0.25"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class slider_serverStartAlliedSkillSelection: RscSlider
		{
			idc = 1919;
			style = SL_HORZ + SL_TEXTURES;
			type = CT_XSLIDER ;

			x = 0.45875 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class slider_serverStartEnemySkillSelection: RscSlider
		{
			idc = 1920;
			style = SL_HORZ + SL_TEXTURES;
			type = CT_XSLIDER ;

			x = 0.45875 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class button_serverStartConfirm: RscButton
		{
			idc = 1921;
			action = "[] call F90_fnc_startServer";

			text = "START MISSION"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

class timeskipMenu
{
	idd = 2000;

	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Qatico)
		////////////////////////////////////////////////////////

		class bg_timeskipMenu1: RscText
		{
			idc = 2001;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_timeskipTitle: RscText
		{
			idc = 2002;
			text = "Time Skip"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class slider_timeskipSelection: RscSlider
		{
			idc = 2003;
			style = SL_HORZ + SL_TEXTURES;
			type = CT_XSLIDER;

			x = 0.345312 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.033 * safezoneH;

			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
			thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
		};
		class text_timeskipTotal: RscText
		{
			idc = 2004;
			text = "+ 24 hours"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text_timeskipNextTime: RscText
		{
			idc = 2005;
			text = "00:00 hrs"; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class button_timeskipConfirm: RscButton
		{
			idc = 2006;
			action = "[] call F90_fnc_skipTime";

			text = "SKIP TIME"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class button_timeskipCancel: RscButton
		{
			idc = 2007;
			action = "[] call F90_fnc_closeMenu";

			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

class skillTreeMenu 
{
	idd = 2100;

	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Kuryzi)
		////////////////////////////////////////////////////////

		class bg_Skill1: RscText
		{
			idc = 2101;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_SkillTitle: RscText
		{
			idc = 2102;
			text = "Skill Upgrade"; //--- ToDo: Localize;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class bg_Skill2: RscText
		{
			idc = 2103;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listBox_SkillList: RscListbox
		{
			idc = 2104;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class button_SkillClose: RscButton
		{
			idc = 2105;
			action = "[] call F90_fnc_closeMenu";

			text = "Close"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Close This Menu"; //--- ToDo: Localize;
		};
		class button_SkillUpgrade: RscButton
		{
			idc = 2106;
			action = "[] call F90_fnc_upgradeSkill";

			text = "Upgrade (1000 SP)"; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_SkillPoints: RscText
		{
			idc = 2107;
			text = "SP: 0000000"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class button_SkillBuy1: RscButton
		{
			idc = 2108;
			action = "[1] call F90_fnc_buySP";

			text = "Buy 1 SP"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class button_SkillBuy2: RscButton
		{
			idc = 2109;
			action = "[5] call F90_fnc_buySP";

			text = "Buy 5 SP"; //--- ToDo: Localize;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class purchaseVehicleMenu 
{
	idd = 2200;

	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Sopeme)
		////////////////////////////////////////////////////////

		class bg_PurchaseVeh1: RscText
		{
			idc = 2201;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class bg_PurchaseVeh2: RscText
		{
			idc = 2202;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_PurchaseVehTitle: RscText
		{
			idc = 2203;
			text = "Purchase Vehicle"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class listBox_PurchaseVehList: RscListbox
		{
			idc = 2204;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class button_PurchaseVehSpawn: RscButton
		{
			idc = 2205;
			action = "[] call F90_fnc_spawnVehicle";

			text = "Spawn"; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class supportMenu 
{
	idd = 2300;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Bakure)
		////////////////////////////////////////////////////////

		class bg_supportMenu1: RscText
		{
			idc = 2301;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class button_SupportTransport: RscButton
		{
			idc = 2302;
			action = "[] call F90_fnc_openTransportSupportMenu";

			text = "Transport"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Open transport support menu"; //--- ToDo: Localize;
		};
		class text_SupportTitle1: RscText
		{
			idc = 2303;
			action = "";

			text = "SUPPORT"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class button_SupportCas: RscButton
		{
			idc = 2304;
			action = "";

			text = "Close Air Support"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Open CAS support menu"; //--- ToDo: Localize;
		};
		class button_SupportArtillery: RscButton
		{
			idc = 2305;
			action = "";

			text = "Artillery"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Open artillery support menu"; //--- ToDo: Localize;
		};
		class button_SupportClose: RscButton
		{
			idc = 2306;
			action = "[] call F90_fnc_closeMenu";

			text = "Close"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
		};
		class button_SupportSupply: RscButton
		{
			idc = 2307;
			action = "";

			text = "Supply"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Open supply support menu"; //--- ToDo: Localize;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class transportSupportMenu
{
	idd = 2400;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Nasudi)
		////////////////////////////////////////////////////////

		class bg_TransportSMenu1: RscText
		{
			idc = 2401;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.33 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class bg_TransportSMenu2: RscText
		{
			idc = 2402;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.231 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class text_TransportSTitle: RscText
		{
			idc = 2403;
			text = "Transport Support"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class listBox_TransportSList: RscListbox
		{
			idc = 2405;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.209 * safezoneH;
		};
		class button_TransportSClose: RscButton
		{
			idc = 2406;
			action = "[] call F90_fnc_closeMenu";

			text = "Close"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
		};
		class button_TransportSPickup: RscButton
		{
			idc = 2407;
			action = "[] call F90_fnc_requestPickup";

			text = "Pickup"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Request for a pickup"; //--- ToDo: Localize;
		};
		class button_TransportSRtb: RscButton
		{
			idc = 2408;
			action = "[] call F90_fnc_menuRequestRtb";

			text = "RTB"; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Command the selected vehicle to return to base"; //--- ToDo: Localize;
		};
		class button_TransportSSitrep: RscButton
		{
			idc = 2409;
			action = "[] call F90_fnc_transportSitrep";

			text = "SITREP"; //--- ToDo: Localize;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Ask for the status of the selected vehicle"; //--- ToDo: Localize;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class changeTransportHeliMenu 
{
	idd = 2500;

	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nikolai, v1.063, #Xuhavy)
		////////////////////////////////////////////////////////

		class bg_ChangeTransportHeli1: RscText
		{
			idc = 2501;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0.125,0.235,0.2,1};
		};
		class text_ChangeTransportHeliTitle: RscText
		{
			idc = 2502;
			text = "Change Transport Heli"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class bg_ChangeTransportHeli2: RscText
		{
			idc = 2503;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class bg_ChangeTransportHeli3: RscText
		{
			idc = 2504;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
		};
		class listBox_ChangeTransportHeliFrom: RscListbox
		{
			idc = 2505;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class text_ChangeTransportHeliTitle2: RscText
		{
			idc = 2506;
			text = "Spawned"; //--- ToDo: Localize;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class listBox_ChangeTransportHeliTo: RscListbox
		{
			idc = 2507;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class text_ChangeTransportHeliTitle3: RscText
		{
			idc = 2508;
			text = "Change To"; //--- ToDo: Localize;
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class button_ChangeTransportHeliConfirm: RscButton
		{
			idc = 2509;
			action = "[] call F90_fnc_changeTransportHeli";
			text = "Change"; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.192,0.365,0.31,1};
			tooltip = "Change Spawned Transport Heli"; //--- ToDo: Localize;
		};
		class button_ChangeTransportHeliClose: RscButton
		{
			idc = 2510;
			action = "[] call F90_fnc_closeMenu";
			text = "Close"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
			tooltip = "Close This Menu"; //--- ToDo: Localize;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};