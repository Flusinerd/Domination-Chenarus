/**
 * Function to spawn a logistic convoy from the FOB to the given location;
 * Author: Flusinerd(Jan)
 * params [_location:Position, targetPool: number]
 */

_convoyClassNames = [
 "B_MRAP_01_hmg_F",
 "B_MRAP_01_gmg_F",
 "rhsusf_M978A4_BKIT_usarmy_d",
 "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d",
 "rhsusf_M977A4_REPAIR_BKIT_usarmy_d"
];

_spawnPosition = [10248.5,2135.13,0];
diag_log format["Driving to: %1", (_this select 0)];
_offsetX = 20;
_offsetY = 5;
_i = 0;
_convoy = [];
_targetPool = (_this select 1);
{
	_spawnPositionUnit = [((_spawnPosition select 0) + (_offsetX * _i)), ((_spawnPosition select 1) + (_offsetY * _i)), (_spawnPosition select 2)];
	diag_log format["%1", _spawnPositionUnit];
	_createdInstance = [_spawnPositionUnit, 254, _x, west] call BIS_fnc_spawnVehicle;
	_group = _createdInstance select 2;
	_group setBehaviour "CARELESS";
	_wp = _group addWaypoint [(_this select 0), 0];
	_wp setWaypointStatements ["true", "[this]execVm 'scripts\bluefor\convoys\fn_waypoint_finished.sqf'"];
	_wp setWaypointCompletionRadius 100;
	_group setCurrentWaypoint _wp;
	_convoy pushBack _group;
	_i = _i + 1;
	(_createdInstance select 0) setVariable ["target", _targetPool];
	sleep 5;
} forEach _convoyClassNames;

logisticConvoys pushBack _convoy;
convoyId = convoyId + 1;

systemChat "Convoy spawned";



