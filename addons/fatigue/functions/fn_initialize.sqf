/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_fatigue\functions\fn_initialize.sqf
 *	by Ojemineh
 *	
 *	initialize fatigue addon
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_fatigue_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _version = ["axe_fatigue"] call AXE_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "fatigue"] call AXE_fnc_log;

// -------------------------------------------------------------------------------------------------
