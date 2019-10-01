/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\functions\fn_initialize.sqf
 *	by Ojemineh
 *	
 *	initialize medical addon
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_medical_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _version = ["axe_medical"] call AXE_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "medical"] call AXE_fnc_log;

// -------------------------------------------------------------------------------------------------
