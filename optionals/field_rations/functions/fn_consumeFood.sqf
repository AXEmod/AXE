/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_field_rations\functions\fn_consumeFood.sqf
 *	by Ojemineh
 *	
 *	consume food
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
 *	[player, "ACE_MRE_LambCurry", 10] call AXE_field_rations_fnc_consumeFood;
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

if !(missionNamespace getVariable ["axe_field_rations_food_enabled", false]) exitWith {};

// -------------------------------------------------------------------------------------------------

private _anReserve = (missionNamespace getVariable ["ace_advanced_fatigue_anReserve", AXE_FIELD_RATIONS_MAXRESERVE]);
private _anModify = (15 * _value);

private _anMinimum = (AXE_FIELD_RATIONS_MAXRESERVE / 2);
private _anResult = _anReserve - _anModify;

if (_anResult < _anMinimum) then {_anResult = _anMinimum};
missionNamespace setVariable ["ace_advanced_fatigue_anReserve", _anResult];
