/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_interactions\functions\tapshoulder\fn_tapshoulder_canTap.sqf
 *	by Ojemineh
 *	
 *	check if player can tap targets shoulder
 *	
 *	Arguments:
 *	0: player	- <OBJECT>
 *	1: target	- <OBJECT>
 *	
 *	Return:
 *	<BOOLEAN>
 *	
 *	Example:
 *	[player, unit1] call AXE_interactions_fnc_tapshoulder_canTap;
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

private _enableAI = (missionNamespace getVariable ["axe_interactions_tapshoulder_ai", true]);
private _condition = false;

if (_enableAI) then {
	_condition = (_target isKindOf "CAManBase");
} else {
	_condition = (isPlayer _target);
};

private _return = false;

_return = (
	((_player distance _target) <= 2) && 
	(_condition) && 
	!(_player getVariable ["ace_captives_isSurrendering", false]) && 
	!(_player getVariable ["ace_captives_isHandcuffed", false]) && 
	!(_player getVariable ["ACE_isUnconscious", false]) && 
	(alive _target) && 
	!(_target getVariable ["ace_captives_isSurrendering", false]) && 
	!(_target getVariable ["ace_captives_isHandcuffed", false]) && 
	!(_target getVariable ["ACE_isUnconscious", false])
);

_return;