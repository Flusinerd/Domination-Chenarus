class vehicleSpawnerDialog
{
	idd = 5501;
	movingenabled = false;

	class controls
	{
		class background: IGUIBack
		{
			idc = 2200;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			colorActive[] = {0,0,0,0.8};
		};
		class vehicleSelect: RscListNBox
		{
			idc = 1500;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.319 * safezoneH;
			tooltip = "Select a vehicle"; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.2};
			colorSelectBackground[] = {0.95,0.61,0.07,1};
			columns[] = {
				0,
				0.65,
				0.85
			};
			rowHeight = 1.5 * 0.018 * safezoneH;
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};
			onLBSelChanged = "((findDisplay 5501) displayCtrl (1601)) ctrlEnable true;"
		};
		class categorySelect: RscCombo
		{
			idc = 2100;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Select the vehicle category"; //--- ToDo: Localize;
			onLBSelChanged = "selectedVehicleType = (lbText [2100, (_this select 1)]);"
		};
		class closeButton: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Close the Dialog"; //--- ToDo: Localize;
			action = "closeDialog 0;";
		};
		class spawnButton: RscButton
		{
			idc = 1601;
			text = "Spawn"; //--- ToDo: Localize;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Spawn the Vehicle at a free location"; //--- ToDo: Localize;
			action = "[] call compile preProcessFile 'scripts\core\base\fn_spawn_vehicle.sqf'"
		};
		class helperText: RscText
		{
			idc = 1001;
			text = "Please select a vehicle and click spawn"; //--- ToDo: Localize;
			x = 0.30125 * safezoneW + safezoneX;
			y = 0.257306 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class title: RscText
		{
			idc = 1000;
			text = "Vehicle Spawner"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,0.8,0,1};
			colorActive[] = {1,0.8,0,1};
		};
	};
};