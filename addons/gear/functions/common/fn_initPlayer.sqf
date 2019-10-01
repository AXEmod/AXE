/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_gear\functions\common\fn_initPlayer.sqf
 *	by Ojemineh
 *	
 *	initialize player
 *	
 *	Arguments:
 *	0: unit	- <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player] call AXE_gear_fnc_initPlayer;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

if (Not local _unit) exitWith {
	[_unit] remoteExecCall ["AXE_gear_fnc_initPlayer", _unit];
};

// -------------------------------------------------------------------------------------------------

private _loadout_path = GEAR_LOADOUT_PATH;
private _default_role = GEAR_DEFAULT_ROLE;
private _default_type = GEAR_DEFAULT_TYPE;
private _default_team = GEAR_DEFAULT_TEAM;

private _gear_role = toUpper( _unit getVariable ["gear_role", _default_role] );
private _gear_type = toUpper( _unit getVariable ["gear_type", _default_type] );
private _gear_team = toUpper( _unit getVariable ["gear_team", _default_team] );

// -------------------------------------------------------------------------------------------------

[_unit, _gear_role, _gear_type, _gear_team] call AXE_gear_fnc_load;
