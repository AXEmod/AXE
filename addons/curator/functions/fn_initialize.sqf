/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\fn_initialize.sqf
 *	by Ojemineh
 *	
 *	initialize curator addon
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_curator_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _version = ["axe_curator"] call AXE_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "curator"] call AXE_fnc_log;

// -------------------------------------------------------------------------------------------------

AXE_CURATOR_FPS_SHOW = false;

AXE_CURATOR_PING_TIMEOUT = 10;
AXE_CURATOR_PING_MAXTIME = 60;
AXE_CURATOR_PING_LASTTIME = 0;
AXE_CURATOR_PING_LASTUNIT = objNull;

AXE_CURATOR_FOOTPRINT_HANDLER = -1;

// -------------------------------------------------------------------------------------------------
