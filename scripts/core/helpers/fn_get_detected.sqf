/*
 * Function that returns a bool if the requested entity sees the other entity
 * Author: Flusinerd
 * params [origin, target]
 * returns: detected:bool
 */

_detectionValue = (this select 0) knowsAbout (this select 1);
_detected = false;
if (_detectionValue >= 1.5) then {
	_detected = true;
};
_detected;