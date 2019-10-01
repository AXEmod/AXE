/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\fn_initSettings.sqf
 *	by Ojemineh
 *	
 *	register cba settings
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_common_fnc_initSettings;
 *	
 */

// -------------------------------------------------------------------------------------------------

// COMMON SETTINGS

[
	"axe_debug_enabled",
	"CHECKBOX",
	[
		localize "STR_AXE_Common_CBA_Debug_Enabled_Title", 
		localize "STR_AXE_Common_CBA_Debug_Enabled_Tip"
	],
	[
		localize "STR_AXE_Common_CBA_Category", 
		localize "STR_AXE_Common_CBA_Category_Common"
	],
	false,
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_showNewsOnMainMenu",
	"CHECKBOX",
	[
		localize "STR_AXE_Common_CBA_Show_News_Title", 
		localize "STR_AXE_Common_CBA_Show_News_Tip"
	],
	[
		localize "STR_AXE_Common_CBA_Category", 
		localize "STR_AXE_Common_CBA_Category_Common"
	],
	true,
	0,
	{
		params ["_value"];
		if (_value) then {
			profileNamespace setVariable ["axe_showNewsOnMainMenu", true];
		} else {
			profileNamespace setVariable ["axe_showNewsOnMainMenu", false];
		};
		saveProfileNamespace;
		[(uiNamespace getVariable "RscDisplayMain")] call compile preprocessfilelinenumbers '\axe_mainmenu\scripts\versionInfo.sqf';
	}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------
