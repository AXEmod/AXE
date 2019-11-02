/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_teleport\functions\flag\fn_flag_getFlags.sqf
 *	by Ojemineh
 *	
 *	get all teleporters in the network
 *	
 *	Arguments:
 *	0: player - <OBJECT>
 *	1: target - <OBJECT>
 *	
 *	Return:
 *	<ARRAY>
 *	
 *	Example:
 *	[_player, _target] call AXE_teleport_fnc_flag_getFlags;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_player", "_target"];

_player	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target	= [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _player) exitWith {[]};
if (isNull _target) exitWith {[]};

// -------------------------------------------------------------------------------------------------

private _controller = objNull;
private _actions = [];
private _counter = 1;

if ((_target getVariable ["network", ""]) != "") then {
	_controller = missionNamespace getVariable (_target getVariable ["network", ""]);
};
if (isNull _controller) exitWith {[]};

private _synchronizedObjects = [_controller, "AXE_Flag_Teleport"] call BIS_fnc_synchronizedObjects;
if ((count _synchronizedObjects) isEqualTo 0) exitWith {[]};

private _allTeleporters = [];
{
	if (((_x getVariable ["enabled", 0]) > 0) && (_x getVariable ["isArrival", false])) then {
		_allTeleporters pushBack _x;
	};
} forEach _synchronizedObjects;
if ((count _allTeleporters) < 2) exitWith {[]};

{
	
	if (_x != _target) then {
		
		private _displayName = _x getVariable ["FlagName", ""];
		if (_displayName isEqualTo "") then {
			_displayName = format [localize "STR_AXE_Teleport_Flag_Default_Name", _counter];
		} else {
			if (isLocalized _displayName) then {_displayName = localize _displayName;};
		};
		
		_statement = {
			params ["_target", "_player", "_params"];
			[_player, _params] call AXE_teleport_fnc_flag_toFlag;
		};
		
		private _action = [_x, _displayName, "", _statement, {true}, {}, _x] call ACE_interact_menu_fnc_createAction;
		_actions pushBack [_action, [], _target];
		_counter = _counter + 1;
		
	};
	
} forEach _allTeleporters;

_actions;