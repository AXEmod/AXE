/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\common\fn_client.sqf
 *	by Ojemineh
 *	
 *	setup client
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_curator_fnc_client;
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
// PLAYER FPS

private _fpsInterval = round (missionNamespace getVariable ["axe_curator_fps_interval", 3]);
if (_fpsInterval < 1) then {_fpsInterval = 1;};

[{
	player setVariable ["axe_current_fps", (round diag_fps), true];
}, _fpsInterval] call CBA_fnc_addPerFrameHandler;

// -------------------------------------------------------------------------------------------------
