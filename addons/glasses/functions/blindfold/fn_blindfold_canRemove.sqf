/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_glasses\functions\blindfold\fn_blindfold_canRemove.sqf
 *	by Ojemineh
 *	
 *	check if blindfold can be removed from unit
 *	
 *	Arguments:
 *	0: caller	- <OBJECT>
 *	1: target	- <OBJECT>
 *	
 *	Return:
 *	<BOOLEAN>
 *	
 *	Example:
 *	[_player, _target] call AXE_glasses_fnc_blindfold_canRemove;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_caller", "_target"];

_caller = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _caller) exitWith {false};
if (isNull _target) exitWith {false};

// -------------------------------------------------------------------------------------------------

private _return = false;

_return = (
	((goggles _target) in ["AXE_Blindfold_Black", "AXE_Blindfold_White", "AXE_Blindfold_White_Blood"]) &&
	(alive _caller) && 
	!(_caller getVariable ["ace_captives_isSurrendering", false]) && 
	!(_caller getVariable ["ace_captives_isHandcuffed", false]) && 
	!(_caller getVariable ["ace_isUnconscious", false]) && 
	(Not visibleMap)
);

_return