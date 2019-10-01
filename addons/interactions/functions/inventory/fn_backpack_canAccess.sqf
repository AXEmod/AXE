/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_interactions\functions\inventory\fn_backpack_canAccess.sqf
 *	by Ojemineh
 *	
 *	check if player can access targets backpack
 *	
 *	Arguments:
 *	0: player	- <OBJECT>
 *	1: target	- <OBJECT>
 *	
 *	Return:
 *	<BOOLEAN>
 *	
 *	Example:
 *	[player, unit1] call AXE_interactions_fnc_backpack_canAccess;
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

private _backpack = (unitBackpack _target);
if (_backpack isEqualTo "") exitWith {false};

private _backpackClass = (typeOf _backpack);
private _config = (configFile >> "CfgVehicles" >> _backpackClass);

private _isFriendly = [(side _player), (side _target)] call BIS_fnc_sideIsFriendly;
private _isEnemy = [(side _player), (side _target)] call BIS_fnc_sideIsEnemy;

private _enabled = false;

if ((side _player) == (side _target)) then {
	if ((group _player) == (group _target)) then {
		if (missionNamespace getVariable ["axe_interactions_backpack_access_faction", 0] >= 1) then {_enabled = true;};
	} else {
		if (missionNamespace getVariable ["axe_interactions_backpack_access_faction", 0] == 2) then {_enabled = true;};
	};
} else {
	if (_isFriendly) then {
		if (missionNamespace getVariable ["axe_interactions_backpack_access_friendly", 0] > 0) then {_enabled = true;};
	} else {
		if (missionNamespace getVariable ["axe_interactions_backpack_access_enemy", 0] > 0) then {_enabled = true;};
	};
};

private _return = false;

_return = (
	((_player distance _target) <= 2.5) && 
	(getText (_config >> "vehicleClass") == "backpacks") && 
	(getNumber (_config >> "maximumLoad") > 0) && 
	(_enabled) && 
	!(_player getVariable ["ace_captives_isSurrendering", false]) && 
	!(_player getVariable ["ace_captives_isHandcuffed", false]) && 
	!(_player getVariable ["ACE_isUnconscious", false]) && 
	(alive _target) && 
	((vehicle _target) == _target) && 
	!(_target getVariable ["ace_captives_isSurrendering", false]) && 
	!(_target getVariable ["ace_captives_isHandcuffed", false]) && 
	!(_target getVariable ["ACE_isUnconscious", false])
);

_return