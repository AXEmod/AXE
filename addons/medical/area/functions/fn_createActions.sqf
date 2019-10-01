/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\area\functions\fn_createActions.sqf
 *	by Ojemineh
 *	
 *	create medical area interactions
 *	
 *	Arguments:
 *	0: medical area	- <OBJECT>
 *	1: medical menu	- <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[area1, menu1] call AXE_medical_area_fnc_createActions;
 *	
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_area", "_menu"];

_area = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_menu = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _area) exitWith {};
if (isNull _menu) exitWith {};

// -------------------------------------------------------------------------------------------------

["_menu", 0] call ACE_interact_menu_fnc_addMainAction;

// -------------------------------------------------------------------------------------------------

private _medical_area_action_dismantle = [
	"AXE_Medical_Area_Action_Dismantle", 
	localize "STR_AXE_Medical_Area_Action_Dismantle",
	"\axe_medical\data\icons\medical_cross_ca.paa", 
	{
		params ["_target", "_player", "_params"]; 
		[_player, (_params select 0)] call AXE_medical_area_fnc_doDismantle;
	}, 
	{
		params ["_target", "_player", "_params"];
		[_player, (_params select 0)] call AXE_medical_area_fnc_canDismantle
	},
	{},
	[_area]
] call ACE_interact_menu_fnc_createAction;

[_menu, 0, ["ACE_MainActions"], _medical_area_action_dismantle] call ACE_interact_menu_fnc_addActionToObject;

// -------------------------------------------------------------------------------------------------

private _medical_area_action_lightoff = [
	"AXE_Medical_Area_Action_LightOff", 
	localize "STR_AXE_Medical_Area_Action_LightOff",
	"", 
	{
		params ["_target", "_player", "_params"];
		[(_params select 0)] call AXE_medical_area_fnc_doLightOff;
	}, 
	{
		params ["_target", "_player", "_params"];
		[(_params select 0)] call AXE_medical_area_fnc_canLightOff
	},
	{},
	[_area]
] call ACE_interact_menu_fnc_createAction;

[_menu, 0, ["ACE_MainActions"], _medical_area_action_lightoff] call ACE_interact_menu_fnc_addActionToObject;

// -------------------------------------------------------------------------------------------------

private _medical_area_action_lighton = [
	"AXE_Medical_Area_Action_LightOn", 
	localize "STR_AXE_Medical_Area_Action_LightOn",
	"", 
	{
		params ["_target", "_player", "_params"];
		[(_params select 0)] call AXE_medical_area_fnc_doLightOn;
	}, 
	{
		params ["_target", "_player", "_params"];
		[(_params select 0)] call AXE_medical_area_fnc_canLightOn
	},
	{},
	[_area]
] call ACE_interact_menu_fnc_createAction;

[_menu, 0, ["ACE_MainActions"], _medical_area_action_lighton] call ACE_interact_menu_fnc_addActionToObject;
