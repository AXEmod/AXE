/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_interactions\functions\inventory\fn_gear_doAccess.sqf
 *	by Ojemineh
 *	
 *	search targets gear
 *	
 *	Arguments:
 *	0: player	- <OBJECT>
 *	1: target	- <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, unit1] call AXE_interactions_fnc_gear_doAccess;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_player", "_target"];

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _player) exitWith {};
if (isNull _target) exitWith {};

// -------------------------------------------------------------------------------------------------

[_player, _target] spawn {
	
	params ["_player", "_target"];
	
	[_player, "PutDown"] call ACE_common_fnc_doGesture;
	
	uiSleep 0.5;
	
	private _soundClass = selectRandom ["AXE_Action_Backpack_Search_1"];
	if (missionNamespace getVariable ["axe_interactions_global_sounds", false]) then {
		private _pitch = random [0.8, 1.0, 1.2];
		[_soundClass, _target, AGLToASL (_target modelToWorld (_target selectionPosition "pelvis")), 20, 1, _pitch, false] call AXE_fnc_playSound3d;
	} else {
		playSound _soundClass;
	};
	
	_player action ["Gear", _target];
	
	if (isPlayer _target) then {
		[_player, _target] remoteExecCall ["AXE_interactions_fnc_gear_access", _target];
	};
	
};
