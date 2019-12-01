/**
 * Function to spawn a group at a safe location in a marker and apply patrolScript
 * Author: Flusinerd(Jan)
 * params: [_groupName, _marker]
 * returns: _group
 */

 _groupName = (_this select 0);
 _marker = (_this select 1);
 _markerSize = getMarkerSize _marker;
 _markerPosition = getMarkerPos _marker;

_spawnPosition = [_markerPosition, 0, (_markerSize select 0), 3, 0, 35, 0] call BIS_fnc_findSafePos;
_group = [_spawnPosition, WEST, _groupName] call BIS_fnc_spawnGroup;
_leader = leader _group;
[_leader, _marker, "SHOWMARKER"] call patrolScript;
_group;
 
