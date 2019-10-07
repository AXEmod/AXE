/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\common\fn_server.sqf
 *	by Ojemineh
 *	
 *	setup server
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_curator_fnc_server;
 *	
 */

// -------------------------------------------------------------------------------------------------

if !(isServer) exitWith {};
if  (is3DEN) exitWith {};

// -------------------------------------------------------------------------------------------------

[] call AXE_curator_fnc_server_registerEvents;

// -------------------------------------------------------------------------------------------------
