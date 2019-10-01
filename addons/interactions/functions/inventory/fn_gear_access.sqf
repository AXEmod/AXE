/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_interactions\functions\inventory\fn_gear_access.sqf
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
 *	[player, unit1] call AXE_interactions_fnc_gear_access;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_player", "_target"];

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _player) exitWith {};
if (isNull _target) exitWith {};

if !(isPlayer _target) exitWith {};
if (_target getVariable ["ACE_isUnconscious", false]) exitWith {};

// -------------------------------------------------------------------------------------------------

enableCamShake true;
setCamShakeParams [0, 1, 1, 0, true];
addCamShake [5, 1, 5];

if (missionNamespace getVariable ["axe_interactions_gear_access_hint", true]) then {
	
	private _playerName = format [hint_tpl_var_1, [_player] call ACE_common_fnc_getName];
	private _iconTemplate = "<img size='2.0' shadow='0' image='%1' />";
	private _iconFile = "\axe_interactions\data\icons\search_gear_ca.paa";
	private _icon = format [_iconTemplate, _iconFile];
	private _hintMessage = format [localize "STR_AXE_Interactions_Hint_Gear_Access", _playerName, _icon];
	
	[format [hint_tpl_default, _hintMessage], -1, 0] call AXE_fnc_hint;
	
	if !(missionNamespace getVariable ["axe_interactions_global_sounds", false]) then {
		private _soundClass = selectRandom ["AXE_Action_Backpack_Search_1"];
		playSound _soundClass;
	};
	
};
