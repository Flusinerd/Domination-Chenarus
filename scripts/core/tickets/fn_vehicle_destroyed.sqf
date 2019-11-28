/**
 * Function for handling destruction of a vehicle
 * Author: Flusinerd (Jan)
 * params [vehicle]
 */
_vehicle = (_this select 0);
_ticketCost = _vehicle getVariable "ticketCost";
[(-1*_ticketCost)] execVM "scripts\core\tickets\fn_update_ticket_count.sqf";
sleep (5);
deleteVehicle _vehicle;