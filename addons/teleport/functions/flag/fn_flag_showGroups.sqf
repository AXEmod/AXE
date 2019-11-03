/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_teleport\functions\flag\fn_flag_showGroups.sqf
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
 *	[_player, _target] call AXE_teleport_fnc_flag_showGroups;
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

private _sideGroups = allGroups select {side _x isEqualTo playerSide};
if ((count _sideGroups) isEqualTo 0) exitWith {false};

private _allGroups = [];
if ((count units (group _player)) > 1) then {
	_allGroups pushBack (group _player);
};

{
	
	if (_x != (group _player)) then {
		
		private _group = _x;
		private _isPlayerInGroup = false;
		
		{
			if (isPlayer _x) exitWith {_isPlayerInGroup = true;};
		} forEach (units _group);
		
		if (_isPlayerInGroup) then {_allGroups pushBack _x;};
		
	};
	
} forEach _sideGroups;

// -------------------------------------------------------------------------------------------------

_return = (
	((_controller getVariable ["enabled", 0]) > 0) && 
	(_target getVariable ['isGroup', false]) && 
	((count _allGroups) > 0)
);

_return;