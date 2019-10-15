/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\fn_initServer.sqf
 *	by Ojemineh
 *	
 *	initialize server
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_curator_fnc_initServer;
 *	
 */

// -------------------------------------------------------------------------------------------------

if !(isServer) exitWith {};
if  (is3DEN) exitWith {};

// -------------------------------------------------------------------------------------------------

[] call AXE_curator_fnc_server_registerEvents;

// -------------------------------------------------------------------------------------------------
