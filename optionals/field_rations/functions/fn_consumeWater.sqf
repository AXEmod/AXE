/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_field_rations\functions\fn_consumeWater.sqf
 *	by Ojemineh
 *	
 *	consume water
 *	
 *	Arguments:
 *	0: unit		- <OBJECT>
 *	1: item		- <STRING>
 *	2: value	- <NUMBER>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, "ACE_WaterBottle_Half", 10] call AXE_field_rations_fnc_consumeWater;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_item", "_value"];

_unit	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_item	= [_this, 1, "", [""]] call BIS_fnc_param;
_value	= [_this, 2, 0, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};
if (_item isEqualTo "") exitWith {};

if !(missionNamespace getVariable ["axe_field_rations_water_enabled", false]) exitWith {};

// -------------------------------------------------------------------------------------------------

private _anReserve = (missionNamespace getVariable ["ace_advanced_fatigue_anReserve", AXE_FIELD_RATIONS_MAXRESERVE]);
private _anResult = 0;

private _anFactor = (missionNamespace getVariable ["axe_field_rations_water_factor", 1]);
private _anModify = 0;

if (_item in ["ACE_Canteen", "ACE_Canteen_Half"]) then {
	_anModify = 600;
} else {
	_anModify = 400;
};

if ((_item in ["ACE_Canteen", "ACE_Canteen_Half"]) && (missionNamespace getVariable ["axe_field_rations_canteen_enabled", true])) then {
	_anResult = AXE_FIELD_RATIONS_MAXRESERVE;
} else {
	_anResult = _anReserve + (_anModify * _anFactor);
};

if (_anResult > AXE_FIELD_RATIONS_MAXRESERVE) then {_anResult = AXE_FIELD_RATIONS_MAXRESERVE};
missionNamespace setVariable ["ace_advanced_fatigue_anReserve", _anResult];
