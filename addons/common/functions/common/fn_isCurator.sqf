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

if (isNull _unit) then {_unit = player};

// -------------------------------------------------------------------------------------------------

private _return = _unit in (allCurators apply {getAssignedCuratorUnit _x});

_return