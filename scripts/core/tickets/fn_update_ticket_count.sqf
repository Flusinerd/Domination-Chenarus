/**
 * Function to update the ticket count
 * Author: Flusinerd (Jan)
 * params: [valueChange]
 */
currentTickets = currentTickets + (_this select 0);
publicVariable "currentTickets";

// if (!isServer) then {
	hint format["Current tickets: %1", currentTickets];
	sleep (5);
	hintSilent "";
// };