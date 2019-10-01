/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\common\fn_isCurator.sqf
 *	by Ojemineh
 *	
 *	check if unit is curator/zeus
 *	
 *	Arguments:
 *	0: unit - <OBJECT>
 *	
 *	Return:
 *	<BOOLEAN>
 *	
 *	Example:
 *	[player] call AXE_fnc_isCurator;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {false};

// -------------------------------------------------------------------------------------------------

private _return = Not isNull (getAssignedCuratorLogic _unit);

_return