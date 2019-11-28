_dialog = createDialog "vehicleSpawnerDialog";
_vehicleTypes = ['Helicopters', 'Planes'];

_helicopters = [
	["RHS_Mi8T_vdv", false, 5, true],
	["RHS_Mi8MTV3_heavy_vdv", false, 5, true],
	["RHS_Mi8mtv3_Cargo_vdv", false, 5, true],
	["RHS_Mi8MTV3_vdv", false, 5, true],
	["RHS_Mi8mt_Cargo_vdv", false, 5, true],
	["RHS_Mi8mt_vdv", false, 5, true],
	["rhs_ka60_grey", false, 5, true],
	["RHS_Mi24V_vdv", false, 5, true],
	["RHS_Mi24Vt_vvs", false, 5, true],
	["RHS_Mi24P_vdv", false, 5, true],
	["rhs_mi28n_vvs", false, 5, true],
	["RHS_Ka52_vvs", false, 5, true]
];

_planes = [
	["RHS_Su25SM_vvs", true, 10, true],
	["rhs_mig29sm_vvs", true, 10, true],
	["rhs_mig29s_vvs", true, 10, true],
	["RHS_T50_vvs_052", true, 10, true],
	["RHS_T50_vvs_generic_ext", true, 10, true],
	["RHS_TU95MS_vvs_chelyabinsk", true, 10, true]
];

selectedVehicleType = "Helicopters";
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
		if (selectedVehicleType == "Helicopters") then {
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
			} forEach _helicopters;
		};
		if (selectedVehicleType == "Planes") then {
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
			} forEach _planes;
		};
	};
}
