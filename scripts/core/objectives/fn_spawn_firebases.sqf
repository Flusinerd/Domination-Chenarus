/**
 * Function for spawning firebases
 * Author: Flusinerd(Jan)
 * 
 */
_numFirebases = 7;

waitUntil {(!isNull firebase_pos_6)};

for [{_i = 0}, {_i < _numFirebases}, {_i = _i + 1}] do {
	_spawnPosition = missionNamespace getVariable ("firebase_pos_" + str(_i));
	diag_log format["I: %1, _spawnPosition: %2", _i, _spawnPosition];
	_referenceString = [ "Firebase", _spawnPosition, [0,0,0], true, true] call LARs_fnc_spawnComp;
	_firebaseStats = [_i, 40, []];
	firebases pushBack _firebaseStats;
};
systemChat "Spawning done";
diag_log ["%1", firebases];