// Logistic convoys (groups)
logisticConvoys = [];
firebases = [];
convoyId = 0;
activeSectors = [];
spawnScriptPatrol = compileFinal preprocessFileLineNumbers "scripts\core\helpers\fn_spawn_group_safe_patrol.sqf";
patrolScript = compileFinal preprocessFileLineNumbers "scripts\core\objectives\UPS.sqf";

execVM "scripts\core\tickets\fn_init_tickets.sqf";
execVM "scripts\core\objectives\fn_createTriggers.sqf";
execVM "scripts\core\objectives\fn_spawn_firebases.sqf";