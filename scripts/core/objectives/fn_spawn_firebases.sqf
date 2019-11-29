/**
 * Function for spawning firebases
 * Author: Flusinerd(Jan)
 * 
 */
_numFirebases = 7;

for [{_i = 1}, {_i <= _numFirebases}, {_i = _i + 1}] do {
	_spawnPosition = missionNamespace getVariable ("firebase_pos_" + str(_i));
	_referenceString = [ "Firebase", _spawnPosition, [0,0,0], true, true] call LARs_fnc_spawnComp;
};
systemChat "Spawning done";