/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\fn_initSettings.sqf
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
 *	[] call AXE_curator_fnc_initSettings;
 *	
 */

// -------------------------------------------------------------------------------------------------

// CURATOR

[
	"axe_curator_chat_enablefor",
	"LIST",
	[
		localize "STR_AXE_Curator_CBA_Chat_EnableFor_Title", 
		localize "STR_AXE_Curator_CBA_Chat_EnableFor_Tip"
	],
	[
		localize "STR_AXE_Curator_CBA_Category", 
		localize "STR_AXE_Curator_CBA_Category_Common"
	],
	[
		[0,1,2], 
		[
			"STR_AXE_Curator_CBA_Chat_EnableFor_0", 
			"STR_AXE_Curator_CBA_Chat_EnableFor_1", 
			"STR_AXE_Curator_CBA_Chat_EnableFor_2"
		], 
		1
	],
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_curator_keys_enablefor",
	"LIST",
	[
		localize "STR_AXE_Curator_CBA_Keys_EnableFor_Title", 
		localize "STR_AXE_Curator_CBA_Keys_EnableFor_Tip"
	],
	[
		localize "STR_AXE_Curator_CBA_Category", 
		localize "STR_AXE_Curator_CBA_Category_Common"
	],
	[
		[0,1,2], 
		[
			"STR_AXE_Curator_CBA_Keys_EnableFor_0", 
			"STR_AXE_Curator_CBA_Keys_EnableFor_1", 
			"STR_AXE_Curator_CBA_Keys_EnableFor_2"
		], 
		2
	],
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_curator_delete_empty",
	"CHECKBOX",
	[
		localize "STR_AXE_Curator_CBA_Delete_Empty_Title", 
		localize "STR_AXE_Curator_CBA_Delete_Empty_Tip"
	],
	[
		localize "STR_AXE_Curator_CBA_Category", 
		localize "STR_AXE_Curator_CBA_Category_Common"
	],
	true,
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_curator_add_players",
	"CHECKBOX",
	[
		localize "STR_AXE_Curator_CBA_Add_Players_Title", 
		localize "STR_AXE_Curator_CBA_Add_Players_Tip"
	],
	[
		localize "STR_AXE_Curator_CBA_Category", 
		localize "STR_AXE_Curator_CBA_Category_Common"
	],
	true,
	0,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

[
	"axe_curator_fps_interval",
	"SLIDER",
	[
		localize "STR_AXE_Curator_CBA_FPS_Interval_Title", 
		localize "STR_AXE_Curator_CBA_FPS_Interval_Tip"
	],
	[
		localize "STR_AXE_Curator_CBA_Category", 
		localize "STR_AXE_Curator_CBA_Category_FPS"
	],
	[1,10,3,0],
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_curator_fps_distance",
	"SLIDER",
	[
		localize "STR_AXE_Curator_CBA_FPS_Distance_Title", 
		localize "STR_AXE_Curator_CBA_FPS_Distance_Tip"
	],
	[
		localize "STR_AXE_Curator_CBA_Category", 
		localize "STR_AXE_Curator_CBA_Category_FPS"
	],
	[100,1000,300,0],
	0,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------
