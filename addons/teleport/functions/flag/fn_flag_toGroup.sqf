/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_teleport\functions\flag\fn_flag_toGroup.sqf
 *	by Ojemineh
 *	
 *	teleport player to group
 *	
 *	Arguments:
 *	0: player	- <OBJECT>
 *	1: group	- <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, (group player)] call AXE_teleport_fnc_flag_toGroup;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_player", "_group"];

_player	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_group	= [_this, 1, grpNull, [grpNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _player) exitWith {[]};
if (isNull _group) exitWith {[]};

// -------------------------------------------------------------------------------------------------

[_player, _group] call AXE_teleport_fnc_toGroup;
