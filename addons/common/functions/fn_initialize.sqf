#include "\a3\ui_f\hpp\definedikcodes.inc"
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

[
	"axe_common_diagLog", 
	{
		if (missionNamespace getVariable ["axe_debug_enabled", false]) then {
			_this call AXE_fnc_log;
		};
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------

if !(hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------
// KEY: SCREENSHOT

[
	"STR_AXE_Common_CBA_Category", 
	"AXE_Common_KEY_Screenshot", 
	["STR_AXE_Common_KEY_Screenshot_Title", "STR_AXE_Common_KEY_Screenshot_Tip"], 
	{
		[] call AXE_fnc_screenshot;
	}, 
	{}, 
	[DIK_F12, [false, true, false]]
] call CBA_fnc_addKeybind;

// -------------------------------------------------------------------------------------------------
// TACTICAL VIEW

[{
	
	params ["_params", "_pfhHandler"];
	
	if (cameraView isEqualTo "GROUP") then {
		if !(missionNamespace getVariable ["axe_tactical_view_enabled", false]) then {
			player switchCamera "INTERNAL";
		};
	};
	
}, 0, []] call CBA_fnc_addPerFrameHandler;

// -------------------------------------------------------------------------------------------------
