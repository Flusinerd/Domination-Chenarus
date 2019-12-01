/**
 * Function that is executed, if a convoy finished his waypoint (is at target location)
 * Author: Flusinerd(Jan)
 * params [groupLeader:object]
 */

_groupLeader = (_this select 0);
_group = group _groupLeader;
_units = units _group;
_vehicle = vehicle _groupLeader;
_targetPoolId = _vehicle getVariable "target";
_ammoCount = 0;
sleep 10;
switch ((typeof _vehicle)) do {
	case "rhsusf_M978A4_BKIT_usarmy_d": { _ammoCount = 5 };
	case "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d": { _ammoCount = 5 };
	case "rhsusf_M977A4_REPAIR_BKIT_usarmy_d": { _ammoCount = 5 };
	default { };
};

_firebasePool = (firebases select _targetPoolId);
_currentAmmoCount = (_firebasePool select 1);
_newAmmoCount = (_currentAmmoCount + _ammoCount);
_firebasePool set [1, _newAmmoCount];
firebases set [_targetPoolId, _firebasePool];
deleteVehicle _vehicle;
{
	deleteVehicle _x;
} forEach _units;

diag_log format ["%1", firebases];
