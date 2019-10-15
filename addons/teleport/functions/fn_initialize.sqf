/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_teleport\functions\fn_initialize.sqf
 *	by Ojemineh
 *	
 *	initialize teleport addon
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_teleport_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _version = ["axe_teleport"] call AXE_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "teleport"] call AXE_fnc_log;

// -------------------------------------------------------------------------------------------------
