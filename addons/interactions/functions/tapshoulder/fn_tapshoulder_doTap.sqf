/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_interactions\functions\tapshoulder\fn_tapshoulder_doTap.sqf
 *	by Ojemineh
 *	
 *	tap targets shoulder
 *	
 *	Arguments:
 *	0: player	- <OBJECT>
 *	1: target	- <OBJECT>
 *	2: shoulder	- <NUMBER>	(0: left, 1: right)
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, unit1, 0] call AXE_interactions_fnc_tapshoulder_doTap;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_player", "_target", "_shoulder"];

_player		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target		= [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_shoulder 	= [_this, 2, 0, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _player) exitWith {};
if (isNull _target) exitWith {};

if ((_shoulder < 0) || (_shoulder > 1)) exitWith {};

// -------------------------------------------------------------------------------------------------

[_player, _target, _shoulder] spawn {
	
	params ["_player", "_target", "_shoulder"];
	
	if (animationState _player isEqualTo "amovpercmstpsnonwnondnon") then {
		[_player, "ace_Gestures_pointStandLowered"] call ACE_common_fnc_doGesture;
	} else {
		[_player, "gesturePoint"] call ACE_common_fnc_doGesture;
	};
	
	sleep 0.4;
	
	private _selectionName = "";
	if (_shoulder == 0) then {
		_selectionName = "LeftShoulder";
	} else {
		_selectionName = "RightShoulder";
	};
	
	if (missionNamespace getVariable ["axe_interactions_global_sounds", false]) then {
		private _pitch = random [0.8, 1.0, 1.2];
		["AXE_Action_Shoulder_Tap_1", _target, AGLToASL (_target modelToWorld (_target selectionPosition _selectionName)), 20, 1, _pitch, false] call AXE_fnc_playSound3d;
	} else {
		playSound "AXE_Action_Shoulder_Tap_1";
	};
	
	if (isPlayer _target) then {
		[_player, _target, _shoulder] remoteExecCall ["AXE_interactions_fnc_tapshoulder_tap", _target];
	};
	
};
