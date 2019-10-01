/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_glasses\functions\fn_initialize.sqf
 *	by Ojemineh
 *	
 *	initialize glasses addon
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_glasses_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _version = ["axe_glasses"] call AXE_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "glasses"] call AXE_fnc_log;

// -------------------------------------------------------------------------------------------------
