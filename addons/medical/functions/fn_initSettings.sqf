/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\functions\fn_initSettings.sqf
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
 *	[] call AXE_medical_fnc_initSettings;
 *	
 */

// -------------------------------------------------------------------------------------------------

// MEDICAL

[
	"axe_medical_consume_tourniquet",
	"CHECKBOX",
	[
		localize "STR_AXE_Medical_CBA_Consume_Tourniquet_Title", 
		localize "STR_AXE_Medical_CBA_Consume_Tourniquet_Tip"
	],
	[
		localize "STR_AXE_Medical_CBA_Category", 
		localize "STR_AXE_Medical_CBA_Category_Common"
	],
	false,
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_medical_stethoscope_enabled",
	"CHECKBOX",
	[
		localize "STR_AXE_Medical_CBA_Stethoscope_Enabled_Title", 
		localize "STR_AXE_Medical_CBA_Stethoscope_Enabled_Tip"
	],
	[
		localize "STR_AXE_Medical_CBA_Category", 
		localize "STR_AXE_Medical_CBA_Category_Common"
	],
	true,
	0,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

[
	"axe_medical_usage_order_responder",
	"LIST",
	[
		localize "STR_AXE_Medical_CBA_Usage_Order_Responder_Title",
		localize "STR_AXE_Medical_CBA_Usage_Order_Responder_Tip"
	],
	[
		localize "STR_AXE_Medical_CBA_Category",
		localize "STR_AXE_Medical_CBA_Category_Consume"
	],
	[
		[0,1], 
		[
			localize "STR_AXE_Medical_CBA_Usage_Order_Responder_0",
			localize "STR_AXE_Medical_CBA_Usage_Order_Responder_1"
		], 
		0
	],
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_medical_usage_order_medics",
	"LIST",
	[
		localize "STR_AXE_Medical_CBA_Usage_Order_Medics_Title", 
		localize "STR_AXE_Medical_CBA_Usage_Order_Medics_Tip"
	],
	[
		localize "STR_AXE_Medical_CBA_Category", 
		localize "STR_AXE_Medical_CBA_Category_Consume"
	],
	[
		[0,1], 
		[
			localize "STR_AXE_Medical_CBA_Usage_Order_Medics_0",
			localize "STR_AXE_Medical_CBA_Usage_Order_Medics_1"
		], 
		1
	],
	0,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

[
	"axe_medical_return_items",
	"CHECKBOX",
	[
		localize "STR_AXE_Medical_CBA_Return_Items_Title", 
		localize "STR_AXE_Medical_CBA_Return_Items_Tip"
	],
	[
		localize "STR_AXE_Medical_CBA_Category", 
		localize "STR_AXE_Medical_CBA_Category_Return"
	],
	true,
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"axe_medical_return_tourniquets",
	"SLIDER",
	[
		localize "STR_AXE_Medical_CBA_Return_Tourniquets_Title", 
		localize "STR_AXE_Medical_CBA_Return_Tourniquets_Tip"
	],
	[
		localize "STR_AXE_Medical_CBA_Category", 
		localize "STR_AXE_Medical_CBA_Category_Return"
	],
	[0,4,1,0],
	0,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------
