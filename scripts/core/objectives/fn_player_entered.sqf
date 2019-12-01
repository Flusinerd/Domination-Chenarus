/**
 * Function that is called, when a player enters a town trigger;
 * Author: Flusinerd(Jan)
 * params: [_trigger, _triggerList, _marker];
 */

 // Check if trigger already active
 _marker = (_this select 2);
 if ((activeSectors findIf { _x == _marker})) exitWith {};

 activeSectors pushBack _marker;
 hint ("Player entered marker: " + _marker);
 _marker setMarkerAlpha 1;
