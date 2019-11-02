/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\fn_initClient.sqf
 *	by Ojemineh
 *	
 *	initialize client
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_curator_fnc_initClient;
 *	
 */

// -------------------------------------------------------------------------------------------------

if !(hasInterface) exitWith {};
if  (is3DEN) exitWith {};

// -------------------------------------------------------------------------------------------------

[] call AXE_curator_fnc_client_registerEvents;
[] call AXE_curator_fnc_client_registerChat;
[] call AXE_curator_fnc_client_registerKeys;
[] call AXE_curator_fnc_client_registerModules;

// -------------------------------------------------------------------------------------------------
// UPDATE PLAYER FPS

private _fpsInterval = round (missionNamespace getVariable ["axe_curator_fps_interval", 3]);
if (_fpsInterval < 1) then {_fpsInterval = 1;};

[{
	player setVariable ["axe_current_fps", (round diag_fps), true];
}, _fpsInterval] call CBA_fnc_addPerFrameHandler;

// -------------------------------------------------------------------------------------------------

[] spawn {
	
	waitUntil {if (!isNull player) exitWith {true}; false};
	
	["axe_curator_refreshPlayers", []] call CBA_fnc_serverEvent;
	
	player addMPEventHandler ["MPRespawn", {
		
		params ["_unit", "_corpse"];
		
		["axe_curator_reassignModule", [_unit, _corpse]] call CBA_fnc_serverEvent;
		
	}];
	
};

// -------------------------------------------------------------------------------------------------
