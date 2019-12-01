/**
 * Function for spawning a bluefor defense force
 * Author: Flusinerd (Jan)
 * params [_marker];
 */

_marker = (_this select 0);

_squad = (configfile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_infantry" >> "rhs_group_nato_usmc_wd_infantry_squad");
_aaTeam = (configfile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_infantry" >> "rhs_group_nato_usmc_wd_infantry_team_AA");
_atTeam = (configfile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_infantry" >> "rhs_group_nato_usmc_wd_infantry_team_heavy_AT");
_weaponsSquad = (configfile >> "CfgGroups" >> "West" >> "rhs_faction_usmc_wd" >> "rhs_group_nato_usmc_wd_infantry" >> "rhs_group_nato_usmc_wd_infantry_weaponsquad");

_mgHmmwv = "rhsusf_m1043_w_s_m2";
_gmgHmmwv = "rhsusf_m1043_w_s_mk19";
_towHmmwv = "rhsusf_m1045_w_s";

_mortar = "RHS_M252_USMC_WD";

_tanks = ["rhsusf_m1a1fep_wd", "rhsusf_m1a2sep1tuskiiwd_usarmy", "rhsusf_m1a2sep1tuskiwd_usarmy"];
_aaLauncher = "RHS_Stinger_AA_pod_WD";
_IFVs = ["RHS_M6_wd", "RHS_M2A3_BUSKI_wd", "RHS_M2A3_BUSKIII_wd"];

 // Spawn two squads
for [{_i = 0}, {_i < 2}, {_i = _i + 1 }] do {
	_spawnedGroup = [_squad, _marker] call spawnScriptPatrol;
};

 // Spawn one AA team
_spawnedGroup = [_aaTeam, _marker] call spawnScriptPatrol;

 // Spawn one weapons Squad
_spawnedGroup = [_weaponsSquad, _marker];

 // Spawn two AT Teams
for [{_i = 0}, {_i < 2}, {_i = _i + 1 }] do {
	_spawnedGroup = [_atTeam, _marker] call spawnScriptPatrol;
};