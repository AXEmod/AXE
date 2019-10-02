/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_fatigue\functions\fn_initSettings.sqf
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
 *	[] call AXE_fatigue_fnc_initSettings;
 *	
 */

// -------------------------------------------------------------------------------------------------

// FATIGUE

[
	"axe_fatigue_global_sounds",
	"CHECKBOX",
	[
		localize "STR_AXE_Fatigue_CBA_Global_Sounds_Title", 
		localize "STR_AXE_Fatigue_CBA_Global_Sounds_Tip"
	],
	[
		localize "STR_AXE_Fatigue_CBA_Category", 
		localize "STR_AXE_Fatigue_CBA_Category_Common"
	],
	true,
	0,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------
