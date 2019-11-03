/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_teleport\functions\flag\fn_flag_getGroups.sqf
 *	by Ojemineh
 *	
 *	get all groups on player side
 *	
 *	Arguments:
 *	0: player - <OBJECT>
 *	1: target - <OBJECT>
 *	
 *	Return:
 *	<ARRAY>
 *	
 *	Example:
 *	[_player, _target] call AXE_teleport_fnc_flag_getGroups;
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

private _actions = [];
private _action = [];
private _displayName = "";

private _controller = objNull;
if ((_target getVariable ["network", ""]) != "") then {
	_controller = missionNamespace getVariable (_target getVariable ["network", ""]);
};
if (isNull _controller) exitWith {[]};

private _allGroups = [];
_allGroups = allGroups select {side _x isEqualTo playerSide};
if ((count _allGroups) isEqualTo 0) exitWith {[]};

if ((count units (group _player)) > 1) then {
	_displayName = format ["%1 (%2)", localize "STR_AXE_Teleport_Flag_OwnGroup", [(leader (group _player))] call ACE_common_fnc_getName];
	_statement = {
		params ["_target", "_player", "_params"];
		[_player, _params] call AXE_teleport_fnc_flag_toGroup;
	};
	_action = [(group _player), _displayName, "", _statement, {true}, {}, (group _player)] call ACE_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], _target];
};

{
	
	if (_x != (group _player)) then {
		
		private _group = _x;
		private _isPlayerInGroup = false;
		
		{
			if (isPlayer _x) exitWith {_isPlayerInGroup = true;};
		} forEach (units _group);
		
		if (_isPlayerInGroup) then {
			
			_displayName = format ["%1 (%2)", (groupId _group), [(leader _group)] call ACE_common_fnc_getName];
			
			_statement = {
				params ["_target", "_player", "_params"];
				[_player, _params] call AXE_teleport_fnc_flag_toGroup;
			};
			
			_action = [_group, _displayName, "", _statement, {true}, {}, _group] call ACE_interact_menu_fnc_createAction;
			_actions pushBack [_action, [], _target];
			
		};
		
	};
	
} forEach _allGroups;

_actions;