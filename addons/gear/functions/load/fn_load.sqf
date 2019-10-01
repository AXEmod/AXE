/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_gear\functions\load\fn_load.sqf
 *	by Ojemineh
 *	
 *	load files
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
 *	[player, "curator"] call AXE_gear_fnc_load;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_role", "_type", "_team"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_role = [_this, 1, "", [""]] call BIS_fnc_param;
_type = [_this, 2, "", [""]] call BIS_fnc_param;
_team = [_this, 4, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

if (Not local _unit) exitWith {
	[_unit, _role, _type, _team] remoteExecCall ["AXE_gear_fnc_load", _unit];
};

// -------------------------------------------------------------------------------------------------

private _loadout_path = GEAR_LOADOUT_PATH;
private _default_role = GEAR_DEFAULT_ROLE;
private _default_type = GEAR_DEFAULT_TYPE;
private _default_team = GEAR_DEFAULT_TEAM;

private _gear_role = toUpper( _unit getVariable ["gear_role", _default_role] );
private _gear_type = toUpper( _unit getVariable ["gear_type", _default_type] );
private _gear_team = toUpper( _unit getVariable ["gear_team", _default_team] );

if (_role isEqualTo "") then { _role = _gear_role; };
if (_type isEqualTo "") then { _type = _gear_type; };
if (_team isEqualTo "") then { _team = _gear_team; };

// -------------------------------------------------------------------------------------------------
// PLAYERS DEFAULT GOGGLES

if (GEAR_KEEP_GOGGLES) then {
	if ((goggles _unit) != "") then {
		_unit setVariable ["gear_user_goggles", (goggles _unit)];
	};
};

// -------------------------------------------------------------------------------------------------

[_unit] call AXE_gear_fnc_removeAll;

[_unit, _role, _type, _team] call AXE_gear_fnc_load_loadout;
[_unit, _role, _type, _team] call AXE_gear_fnc_load_properties;
