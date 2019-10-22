/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_interactions\functions\inventory\fn_gear_canAccess.sqf
 *	by Ojemineh
 *	
 *	check if unit can search targets gear
 *	
 *	Arguments:
 *	0: player	- <OBJECT>
 *	1: target	- <OBJECT>
 *	
 *	Return:
 *	<BOOLEAN>
 *	
 *	Example:
 *	[player, unit1] call AXE_interactions_fnc_gear_canAccess;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_player", "_target"];

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _player) exitWith {false};
if (isNull _target) exitWith {false};

// -------------------------------------------------------------------------------------------------

private _return = false;
private _enabled = false;

if (missionNamespace getVariable ["axe_interactions_gear_access_enabled", 0] > 0) then {
	_enabled = true;
};

_return = (
	((_player distance _target) <= 2.5) && 
	(_enabled) && 
	!(_player getVariable ["ace_captives_isSurrendering", false]) && 
	!(_player getVariable ["ace_captives_isHandcuffed", false]) && 
	!(_player getVariable ["ACE_isUnconscious", false]) && 
	((vehicle _target) == _target) && 
	(
		(_target getVariable ["ace_captives_isSurrendering", false]) ||
		(_target getVariable ["ace_captives_isHandcuffed", false]) ||
		(_target getVariable ["ACE_isUnconscious", false])
	)
);

_return;