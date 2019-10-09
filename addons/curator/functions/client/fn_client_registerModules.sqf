/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\client\fn_client_registerModules.sqf
 *	by Ojemineh
 *	
 *	register client custom modules
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_curator_fnc_client_registerModules;
 *	
 */

// -------------------------------------------------------------------------------------------------

if !(hasInterface) exitWith {};
if !(["achilles_functions_f_ares"] call AXE_fnc_isAddon) exitWith {};

// -------------------------------------------------------------------------------------------------
// MODULE: PLAYER FPS

[
	localize "STR_AMAE_PLAYERS", 
	"Hide/Show FPS", 
	{
		
		params [
			["_position", [0,0,0], [[]], 3], 
			["_objectUnderCursor", objNull, [objNull]]
		];
		
		if (AXE_CURATOR_FPS_SHOW) then {
			AXE_CURATOR_FPS_SHOW = false;
		} else {
			AXE_CURATOR_FPS_SHOW = true;
		};
		
	}
] call Ares_fnc_RegisterCustomModule;

// -------------------------------------------------------------------------------------------------
// MODULE: ZEUS TELEPORT

[
	localize "STR_AMAE_ZEUS", 
	"Zeus Teleport", 
	{
		
		params [
			["_position", [0,0,0], [[]], 3], 
			["_objectUnderCursor", objNull, [objNull]]
		];
		
		player setPos _position;
		
	}
] call Ares_fnc_RegisterCustomModule;

// -------------------------------------------------------------------------------------------------
// MODULE: ZEUS HIDE/SHOW

[
	localize "STR_AMAE_ZEUS", 
	"Zeus Hide/Show", 
	{
		
		params [
			["_position", [0,0,0], [[]], 3], 
			["_objectUnderCursor", objNull, [objNull]]
		];
		
		if (Not isObjectHidden player) then {
			[player, true] remoteExecCall ["hideObjectGlobal", 2];
			player setCaptive true;
		} else {
			[player, false] remoteExecCall ["hideObjectGlobal", 2];
			player setCaptive false;
		};
		
	}
] call Ares_fnc_RegisterCustomModule;

// -------------------------------------------------------------------------------------------------
