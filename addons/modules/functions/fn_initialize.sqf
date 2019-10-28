/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_modules\functions\fn_initialize.sqf
 *	by Ojemineh
 *	
 *	initialize modules addon
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_modules_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _version = ["axe_modules"] call AXE_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "modules"] call AXE_fnc_log;

// -------------------------------------------------------------------------------------------------
