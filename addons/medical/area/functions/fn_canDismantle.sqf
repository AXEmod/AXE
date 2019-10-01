/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\area\functions\fn_canDismantle.sqf
 *	by Ojemineh
 *	
 *	check if a existing medical area can be removed
 *	
 *	Arguments:
 *	0: unit			- <OBJECT>
 *	1: medical area	- <OBJECT>
 *	
 *	Return:
 *	<BOOLEAN>
 *	
 *	Example:
 *	[player, area1] call AXE_medical_area_fnc_canDismantle;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_area"];

_unit	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_area	= [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {false};
if (isNull _area) exitWith {false};

// -------------------------------------------------------------------------------------------------

private _return = false;

_return = (
	(alive _unit) && 
	!(_unit getVariable ["ace_captives_isSurrendering", false]) && 
	!(_unit getVariable ["ace_captives_isHandcuffed", false]) && 
	!(_unit getVariable ["ace_isUnconscious", false]) && 
	(isNull (objectParent _unit)) && 
	!(_area getVariable ["AXE_MedicalArea_DismantleInProgress", false])
);

_return