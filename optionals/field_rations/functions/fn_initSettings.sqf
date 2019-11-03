/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_field_rations\functions\fn_initSettings.sqf
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
 *	[] call AXE_field_rations_fnc_initSettings;
 *	
 */

// -------------------------------------------------------------------------------------------------

// FIELD RATIONS

[
	"axe_field_rations_enabled",
	"CHECKBOX",
	[
		localize "STR_AXE_Field_Rations_CBA_Enabled_Title", 
		localize "STR_AXE_Field_Rations_CBA_Enabled_Tip"
	],
	[
		localize "STR_AXE_Field_Rations_CBA_Category", 
		localize "STR_AXE_Field_Rations_CBA_Category_Common"
	],
	true,
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_field_rations_global_sounds",
	"CHECKBOX",
	[
		localize "STR_AXE_Field_Rations_CBA_Global_Sounds_Title", 
		localize "STR_AXE_Field_Rations_CBA_Global_Sounds_Tip"
	],
	[
		localize "STR_AXE_Field_Rations_CBA_Category", 
		localize "STR_AXE_Field_Rations_CBA_Category_Common"
	],
	true,
	1,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

[
	"axe_field_rations_water_enabled",
	"CHECKBOX",
	[
		localize "STR_AXE_Field_Rations_CBA_Water_Enabled_Title", 
		localize "STR_AXE_Field_Rations_CBA_Water_Enabled_Tip"
	],
	[
		localize "STR_AXE_Field_Rations_CBA_Category", 
		localize "STR_AXE_Field_Rations_CBA_Category_Water"
	],
	true,
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_field_rations_water_factor",
	"SLIDER",
	[
		localize "STR_AXE_Field_Rations_CBA_Water_Factor_Title", 
		localize "STR_AXE_Field_Rations_CBA_Water_Factor_Tip"
	],
	[
		localize "STR_AXE_Field_Rations_CBA_Category", 
		localize "STR_AXE_Field_Rations_CBA_Category_Water"
	],
	[0.1,2,1,2],
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_field_rations_canteen_enabled",
	"CHECKBOX",
	[
		localize "STR_AXE_Field_Rations_CBA_Canteen_Enabled_Title", 
		localize "STR_AXE_Field_Rations_CBA_Canteen_Enabled_Tip"
	],
	[
		localize "STR_AXE_Field_Rations_CBA_Category", 
		localize "STR_AXE_Field_Rations_CBA_Category_Water"
	],
	true,
	1,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

[
	"axe_field_rations_energy_enabled",
	"CHECKBOX",
	[
		localize "STR_AXE_Field_Rations_CBA_Energy_Enabled_Title", 
		localize "STR_AXE_Field_Rations_CBA_Energy_Enabled_Tip"
	],
	[
		localize "STR_AXE_Field_Rations_CBA_Category", 
		localize "STR_AXE_Field_Rations_CBA_Category_Energy"
	],
	true,
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_field_rations_energy_duration",
	"SLIDER",
	[
		localize "STR_AXE_Field_Rations_CBA_Energy_Duration_Title", 
		localize "STR_AXE_Field_Rations_CBA_Energy_Duration_Tip"
	],
	[
		localize "STR_AXE_Field_Rations_CBA_Category", 
		localize "STR_AXE_Field_Rations_CBA_Category_Energy"
	],
	[30,300,180,0],
	1,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

[
	"axe_field_rations_food_enabled",
	"CHECKBOX",
	[
		localize "STR_AXE_Field_Rations_CBA_Food_Enabled_Title", 
		localize "STR_AXE_Field_Rations_CBA_Food_Enabled_Tip"
	],
	[
		localize "STR_AXE_Field_Rations_CBA_Category", 
		localize "STR_AXE_Field_Rations_CBA_Category_Food"
	],
	true,
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_field_rations_food_factor",
	"SLIDER",
	[
		localize "STR_AXE_Field_Rations_CBA_Food_Factor_Title", 
		localize "STR_AXE_Field_Rations_CBA_Food_Factor_Tip"
	],
	[
		localize "STR_AXE_Field_Rations_CBA_Category", 
		localize "STR_AXE_Field_Rations_CBA_Category_Food"
	],
	[0.1,2,1,2],
	1,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------
