/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_teleport\functions\flag\fn_flag_showFlags.sqf
 *	by Ojemineh
 *	
 *	get all teleporters in the network
 *	
 *	Arguments:
 *	0: player - <OBJECT>
 *	1: target - <OBJECT>
 *	
 *	Return:
 *	<BOOLEAN>
 *	
 *	Example:
 *	[_player, _target] call AXE_teleport_fnc_flag_showFlags;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_player", "_target"];

_player	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target	= [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _player) exitWith {false};
if (isNull _target) exitWith {false};

// -------------------------------------------------------------------------------------------------

private _return = false;

private _controller = objNull;
if ((_target getVariable ["network", ""]) != "") then {
	_controller = missionNamespace getVariable (_target getVariable ["network", ""]);
};
if (isNull _controller) exitWith {false};

private _synchronizedObjects = [_controller, "AXE_Flag_Teleport"] call BIS_fnc_synchronizedObjects;
if ((count _synchronizedObjects) isEqualTo 0) exitWith {false};

private _allTeleporters = [];
{
	if (((_x getVariable ["enabled", 0]) > 0) && (_x getVariable ["isArrival", false])) then {
		_allTeleporters pushBack _x;
	};
} forEach _synchronizedObjects;
if ((count _allTeleporters) < 2) exitWith {false};

// -------------------------------------------------------------------------------------------------

_return = (
	((_controller getVariable ["enabled", 0]) > 0) && 
	(_target getVariable ['isDeparture', false]) && 
	((count _allTeleporters) > 1)
);

_return;