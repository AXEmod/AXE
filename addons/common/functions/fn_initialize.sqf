/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\fn_initialize.sqf
 *	by Ojemineh
 *	
 *	initialize common addon
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_common_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _version = ["axe_common"] call AXE_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "common"] call AXE_fnc_log;

// -------------------------------------------------------------------------------------------------

AXE_COMMON_HELPER_OBJECT = "Sign_Sphere10cm_Geometry_F";

// -------------------------------------------------------------------------------------------------

[
	"axe_common_log", 
	{
		_this call AXE_fnc_log;
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
