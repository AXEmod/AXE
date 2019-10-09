/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_teleport\functions\fn_initSettings.sqf
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
 *	[] call AXE_teleport_fnc_initSettings;
 *	
 */

// -------------------------------------------------------------------------------------------------

// COMMON SETTINGS

[
	"axe_teleport_hint",
	"CHECKBOX",
	[
		localize "STR_AXE_Teleport_CBA_Hint_Title", 
		localize "STR_AXE_Teleport_CBA_Hint_Tip"
	],
	[
		localize "STR_AXE_Teleport_CBA_Category", 
		localize "STR_AXE_Teleport_CBA_Category_Common"
	],
	true,
	0,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

[
	"axe_teleport_safeMode",
	"CHECKBOX",
	[
		localize "STR_AXE_Teleport_CBA_SafeMode_Title", 
		localize "STR_AXE_Teleport_CBA_SafeMode_Tip"
	],
	[
		localize "STR_AXE_Teleport_CBA_Category", 
		localize "STR_AXE_Teleport_CBA_Category_Safemode"
	],
	true,
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_teleport_safeTime",
	"SLIDER",
	[
		localize "STR_AXE_Teleport_CBA_SafeTime_Title", 
		localize "STR_AXE_Teleport_CBA_SafeTime_Tip"
	],
	[
		localize "STR_AXE_Teleport_CBA_Category", 
		localize "STR_AXE_Teleport_CBA_Category_Safemode"
	],
	[3,30,5,0],
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_teleport_safeInfo",
	"CHECKBOX",
	[
		localize "STR_AXE_Teleport_CBA_SafeInfo_Title", 
		localize "STR_AXE_Teleport_CBA_SafeInfo_Tip"
	],
	[
		localize "STR_AXE_Teleport_CBA_Category", 
		localize "STR_AXE_Teleport_CBA_Category_Safemode"
	],
	true,
	0,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------
