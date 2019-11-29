/*
 * Function for spawning a vehicle in the base and adding events
 * Author: Flusinerd (Jan)
 * params[]
 */

_smallShelter = "Land_SM_01_shelter_narrow_F";
_largeShelter = "Land_SM_01_shelter_wide_F";

_dialog = (findDisplay 5501);
_listCtrl = (_dialog displayCtrl (1500));
_selectedRow = lnbCurSelRow _listCtrl;
_className = _listCtrl lnbData [_selectedRow, 0];
_vehicleCost = _listCtrl lnbData [_selectedRow, 1];
_largeVehicle = _listCtrl lnbData [_selectedRow, 2];
_isPlane = _listCtrl lnbData [_selectedRow, 3];

// Find a free spawn location
_freeSpawnLocation = objNull;
if (_isPlane == "false") then {
	if (_largeVehicle == "false") then {
		for [{_i = 1}, { _i < 10}, {_i = _i+1}] do {
			_spawnLocation = missionnamespace getVariable("spawn_light_" + str(_i));
			_nearestObject = nearestObject  [(getPos _spawnLocation), "AllVehicles"];
			_spawnFree = false;
			if (isNull _nearestObject) then {
				_spawnFree = true;
			} else {
				_distance = _spawnLocation distance _nearestObject;
				if (_distance > 6) then {
					_spawnFree = true;
				} else {
					_spawnFree = false;
				};
			};
			diag_log _i;
			if (_spawnFree) exitWith {_freeSpawnLocation = _spawnLocation};
		};
	} else {
		for [{_i = 1}, { _i < 4}, {_i = _i+1}] do {
			_spawnLocation = missionnamespace getVariable("spawn_tank_" + str(_i));
			_nearestObject = nearestObject  [(getPos _spawnLocation), "AllVehicles"];
			_spawnFree = false;
			if (isNull _nearestObject) then {
				_spawnFree = true;
			} else {
				_distance = _spawnLocation distance _nearestObject;
				if (_distance > 6) then {
					_spawnFree = true;
				} else {
					_spawnFree = false;
				};
			};
			diag_log _i;
			if (_spawnFree) exitWith {_freeSpawnLocation = _spawnLocation};
		};
	};
} else {
	if (_largeVehicle == "false") then {
		for [{_i = 1}, { _i < 6}, {_i = _i+1}] do {
			_spawnLocation = missionnamespace getVariable("heli_spawn_" + str(_i));
			_nearestObject = nearestObject  [(getPos _spawnLocation), "AllVehicles"];
			_spawnFree = false;
			if (isNull _nearestObject) then {
				_spawnFree = true;
			} else {
				_distance = _spawnLocation distance _nearestObject;
				if (_distance > 15) then {
					_spawnFree = true;
				} else {
					_spawnFree = false;
				};
			};
			diag_log _i;
			if (_spawnFree) exitWith {_freeSpawnLocation = _spawnLocation};
		};
	} else {
		if (_className != "RHS_TU95MS_vvs_chelyabinsk") then  {
			for [{_i = 1}, { _i < 7}, {_i = _i+1}] do {
				_spawnLocation = missionnamespace getVariable("hangar_spawn_" + str(_i));
				_nearestObject = nearestObject  [(getPos _spawnLocation), "AllVehicles"];
				_spawnFree = false;
				if (isNull _nearestObject) then {
					_spawnFree = true;
				} else {
					_distance = _spawnLocation distance _nearestObject;
					if (_distance > 15) then {
						_spawnFree = true;
					} else {
						_spawnFree = false;
					};
				};
				diag_log _i;
				if (_spawnFree) exitWith {_freeSpawnLocation = _spawnLocation};
			};
		} else {
			for [{_i = 1}, { _i < 3}, {_i = _i+1}] do {
				_spawnLocation = missionnamespace getVariable("outside_spawn_plane_" + str(_i));
				_nearestObject = nearestObject  [(getPos _spawnLocation), "AllVehicles"];
				_spawnFree = false;
				if (isNull _nearestObject) then {
					_spawnFree = true;
				} else {
					_distance = _spawnLocation distance _nearestObject;
					if (_distance > 30) then {
						_spawnFree = true;
					} else {
						_spawnFree = false;
					};
				};
				diag_log _i;
				if (_spawnFree) exitWith {_freeSpawnLocation = _spawnLocation};
			};
		};
	};
};

// Spawn the vehicle
if (isNull _freeSpawnLocation) then {
	hint "No Free Spawn locations left";
} else {
	_dir = getDir _freeSpawnLocation;
	_spawnLocation = getPosATL (_freeSpawnLocation);
	_vehicle = createVehicle [_className, _spawnLocation, [], 0, "CAN_COLLIDE"];
	_vehicle setDir _dir;
	_vehicle setPos getPos _vehicle;
	_vehicle setVariable ["ticketCost", parseNumber(_vehicleCost)];
	_vehicle addEventHandler ["Killed", {
		_this execVM "scripts\core\tickets\fn_vehicle_destroyed.sqf";
	}];
	hint "Vehicle provided";
};

