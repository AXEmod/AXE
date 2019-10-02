/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\area\functions\fn_initSettings.sqf
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
 *	[] call AXE_medical_area_fnc_initSettings;
 *	
 */

// -------------------------------------------------------------------------------------------------

// MEDICAL AREA

[
	"axe_medical_area_constuct_time",
	"SLIDER",
	[
		localize "STR_AXE_Medical_Area_CBA_Construct_Time_Title", 
		localize "STR_AXE_Medical_Area_CBA_Construct_Time_Tip"
	],
	[
		localize "STR_AXE_Medical_Area_CBA_Category", 
		localize "STR_AXE_Medical_Area_CBA_Category_Common"
	],
	[3,60,20,0],
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_medical_area_dismantle_time",
	"SLIDER",
	[
		localize "STR_AXE_Medical_Area_CBA_Dismantle_Time_Title", 
		localize "STR_AXE_Medical_Area_CBA_Dismantle_Time_Tip"
	],
	[
		localize "STR_AXE_Medical_Area_CBA_Category", 
		localize "STR_AXE_Medical_Area_CBA_Category_Common"
	],
	[3,60,30,0],
	0,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

if (["adv_aceCPR"] call AXE_fnc_isAddon) then {
[
	"axe_medical_area_enable_defibrillator",
	"CHECKBOX",
	[
		localize "STR_AXE_Medical_Area_CBA_Enable_Defibrillator_Title", 
		localize "STR_AXE_Medical_Area_CBA_Enable_Defibrillator_Tip"
	],
	[
		localize "STR_AXE_Medical_Area_CBA_Category", 
		localize "STR_AXE_Medical_Area_CBA_Category_Common"
	],
	false,
	0,
	{}
] call CBA_Settings_fnc_init;
};

// -------------------------------------------------------------------------------------------------
