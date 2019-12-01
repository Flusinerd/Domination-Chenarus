/**
 * Function for putting triggers on all town markers
 * Author: Flusinerd(Jan)
 */

_markerNo = 45;
_triggerAreaOffset = 300;

for [{_i = 0}, {_i < _markerNo}, {_i = _i + 1}] do {
	_marker = (format ["marker_%1", _i]);
	_marker setMarkerAlpha 0.5;
	_markerSize = getMarkerSize _marker;
	_triggerSize = [((_markerSize select 0) + _triggerAreaOffset), ((_markerSize select 1) + _triggerAreaOffset)];
	_markerPosition = getMarkerPos _marker;
	_markerColor = getMarkerColor _marker;
	_trigger = createTrigger ["EmptyDetector", _markerPosition, false];
	_trigger setTriggerActivation ["EAST", "PRESENT", true];
	_trigger setTriggerArea [(_triggerSize select 0), (_triggerSize select 1), 0, false, 0];
	_trigger setTriggerStatements ["this", format["[thisTrigger, thisList, '%1'] execVM 'scripts\core\objectives\fn_player_entered.sqf'", _marker], format["[thisTrigger, thisList, '%1'] execVM 'scripts\core\objectives\fn_player_left.sqf'", _marker]];
	_outlineMarker = createMarker [format["trigger_outline_%1", _i], _markerPosition];
	_outlineMarker setMarkerShape "ELLIPSE";
	_outlineMarker setMarkerSize _triggerSize;
	_outlineMarker setMarkerColor _markerColor;
	_outlineMarker setMarkerBrush "BORDER";
	_outlineMarker setMarkerAlpha 0.5;
};
systemChat "Triggers created"