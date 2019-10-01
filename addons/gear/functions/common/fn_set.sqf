/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_gear\functions\common\fn_set.sqf
 *	by Ojemineh
 *	
 *	set unit role
 *	
 *	Arguments:
 *	0: unit	- <OBJECT>
 *	1: role	- <STRING>
 *	2: type	- <STRING>
 *	3: team	- <STRING>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, "curator", "0", "nato"] call AXE_gear_fnc_set;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_role", "_type", "_team", "_load"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_role = [_this, 1, "", [""]] call BIS_fnc_param;
_type = [_this, 2, "", [""]] call BIS_fnc_param;
_team = [_this, 3, "", [""]] call BIS_fnc_param;
_load = [_this, 4, true, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

if (Not local _unit) exitWith {
	[_unit, _role, _type, _team, _load] remoteExecCall ["AXE_gear_fnc_set", _unit];
};

// -------------------------------------------------------------------------------------------------

private _loadout_path = GEAR_LOADOUT_PATH;
private _default_role = GEAR_DEFAULT_ROLE;
private _default_type = GEAR_DEFAULT_TYPE;
private _default_team = GEAR_DEFAULT_TEAM;

if (_role isEqualTo "") then { _role = toUpper(_default_role); };
if (_type isEqualTo "") then { _type = toUpper(_default_type); };
if (_team isEqualTo "") then { _team = toUpper(_default_team); };

_unit setVariable ["gear_role", _role, true];
_unit setVariable ["gear_type", _type, true];
_unit setVariable ["gear_team", _team, true];

// -------------------------------------------------------------------------------------------------

if (_load) then { [_unit] call AXE_gear_fnc_load; };
