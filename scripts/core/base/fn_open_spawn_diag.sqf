_dialog = createDialog "vehicleSpawnerDialog";
_vehicleTypes = ['Cars', 'Armored', 'Armor'];

_cars = [
	["rhs_uaz_vdv", false, 5, false],
	["rhs_uaz_open_vdv", false, 5, false],
	["rhsgref_ins_uaz_spg9", false, 5, false],
	["rhsgref_ins_uaz_ags", false, 5, false],
	["rhsgref_ins_uaz_dshkm", false, 5, false],
	["rhs_kamaz5350_vdv", true, 5, false],
	["rhs_kamaz5350_open_vdv", true, 5, false],
	["RHS_Ural_Fuel_VDV_01", true, 5, false],
	["RHS_Ural_Repair_VDV_01", true, 5, false],
	["RHS_Ural_Zu23_VDV_01", true, 5, false],
	["rhs_gaz66_ammo_vdv", true, 5, false]
];

_armored = [
	["rhs_tigr_vdv", false, 10, false],
	["rhs_tigr_3camo_vdv", false, 10, false],
	["rhs_tigr_sts_vdv", false, 10, false],
	["rhs_tigr_sts_3camo_vdv", false, 10, false],
	["rhsgref_BRDM2_vdv", false, 10, false],
	["rhsgref_BRDM2_ATGM_vdv", false, 10, false],
	["rhsgref_BRDM2_HQ_vdv", false, 10, false],
	["rhs_bmd1r", true, 10, false],
	["rhs_bmd1p", true, 10, false],
	["rhs_bmd1", true, 10, false],
	["rhs_bmd2k", true, 10, false],
	["rhs_bmd4ma_vdv", true, 10, false],
	["rhs_bmp1p_vdv", true, 10, false],
	["rhs_brm1k_vdv", true, 10, false],
	["rhs_btr60_vv", true, 10, false],
	["rhs_btr70_vv", true, 10, false],
	["rhs_btr80a_vv", true, 10, false],
	["rhs_btr80_vv", true, 10, false]
];

_armor= [
 ["rhs_sprut_vdv", true, 30],
 ["rhs_t14_tv", true, 30],
 ["rhs_t72be_tv", true, 30],
 ["rhs_t80um", true, 30],
 ["rhs_t90sm_tv", true, 30],
 ["rhs_t90sab_tv", true, 30],
 ["rhs_2s3_tv", true, 30],
 ["rhs_zsu234_aa", true, 30]
];


selectedVehicleType = "Cars";
_oldSelectedVehicleType = "";
waitUntil { dialog };
((findDisplay 5501) displayCtrl (1601)) ctrlEnable false;
{
	((findDisplay 5501) displayCtrl (2100)) lbAdd _x;
	
} forEach _vehicleTypes;
((findDisplay 5501) displayCtrl (2100)) lbSetCurSel 0;

while{dialog && alive player} do {
	if (selectedVehicleType != _oldSelectedVehicleType) then {
		_oldSelectedVehicleType = selectedVehicleType;
		lbClear 1500;
		if (selectedVehicleType == "Cars") then {
			{
				_className = (_x select 0);
				_vehicleCost = (_x select 2);
				_displayName = (getText (configfile >> "CfgVehicles" >> _className >> "displayName"));
				_icon = (getText (configfile >> "CfgVehicles" >> _className >> "Icon"));
				((findDisplay 5501) displayCtrl (1500)) lnbAddRow [_displayName, format["%1 Tickets", _vehicleCost]];
				lnbSetPicture [1500, [((lnbSize 1500) select 0) - 1, 0], _icon];
				lnbSetData [1500, [((lnbSize 1500) select 0) - 1, 0], _className];
				lnbSetData [1500, [((lnbSize 1500) select 0) - 1, 1], str(_vehicleCost)];
				lnbSetData [1500, [((lnbSize 1500) select 0) - 1, 2], str(_x select 1)];
				lnbSetData [1500, [((lnbSize 1500) select 0) - 1, 3], str(_x select 3)];
			} forEach _cars;
		};
		if (selectedVehicleType == "Armored") then {
			{
				_className = (_x select 0);
				_vehicleCost = (_x select 2);
				_displayName = (getText (configfile >> "CfgVehicles" >> _className >> "displayName"));
				_icon = (getText (configfile >> "CfgVehicles" >> _className >> "Icon"));
				((findDisplay 5501) displayCtrl (1500)) lnbAddRow [_displayName, format["%1 Tickets", _vehicleCost]];
				lnbSetPicture [1500, [((lnbSize 1500) select 0) - 1, 0], _icon];
				lnbSetData [1500, [((lnbSize 1500) select 0) - 1, 0], _className];
				lnbSetData [1500, [((lnbSize 1500) select 0) - 1, 1], str(_vehicleCost)];
				lnbSetData [1500, [((lnbSize 1500) select 0) - 1, 2], str(_x select 1)];
				lnbSetData [1500, [((lnbSize 1500) select 0) - 1, 3], str(_x select 3)];
			} forEach _armored;
		};
		if (selectedVehicleType == "Armor") then {
			{
				_className = (_x select 0);
				_vehicleCost = (_x select 2);
				_displayName = (getText (configfile >> "CfgVehicles" >> _className >> "displayName"));
				_icon = (getText (configfile >> "CfgVehicles" >> _className >> "Icon"));
				((findDisplay 5501) displayCtrl (1500)) lnbAddRow [_displayName, format["%1 Tickets", _vehicleCost]];
				lnbSetPicture [1500, [((lnbSize 1500) select 0) - 1, 0], _icon];
				lnbSetData [1500, [((lnbSize 1500) select 0) - 1, 0], _className];
				lnbSetData [1500, [((lnbSize 1500) select 0) - 1, 1], str(_vehicleCost)];
				lnbSetData [1500, [((lnbSize 1500) select 0) - 1, 2], str(_x select 1)];
				lnbSetData [1500, [((lnbSize 1500) select 0) - 1, 3], str(_x select 3)];
			} forEach _armor;
		};
	};
}
