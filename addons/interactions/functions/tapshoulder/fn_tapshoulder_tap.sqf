/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_interactions\functions\tapshoulder\fn_tapshoulder_tap.sqf
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
 *	[player, unit1, 0] call AXE_interactions_fnc_tapshoulder_tap;
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

if !(isPlayer _target) exitWith {};
if (_target getVariable ["ACE_isUnconscious", false]) exitWith {};

if ((_shoulder < 0) || (_shoulder > 1)) exitWith {};

// -------------------------------------------------------------------------------------------------

enableCamShake true;
setCamShakeParams [0, 0, 1, 0, true];
addCamShake [5, 1, 5];

if (missionNamespace getVariable ["axe_interactions_tapshoulder_hint", true]) then {
	
	private _playerName = format [hint_tpl_var_1, [_player] call ACE_common_fnc_getName];
	private _shoulderName = "";
	private _iconTemplate = "<img size='2.0' shadow='0' image='%1' /><br/>%2";
	private _iconFile = "";
	
	if (_shoulder == 0) then {
		_shoulderName = format [hint_tpl_var_1, localize "STR_AXE_Interactions_Hint_TapShoulder_Left"];
		_iconFile = "\axe_interactions\data\icons\shoulder_left_ca.paa";
	} else {
		_shoulderName = format [hint_tpl_var_1, localize "STR_AXE_Interactions_Hint_TapShoulder_Right"];
		_iconFile = "\axe_interactions\data\icons\shoulder_right_ca.paa";
	};
	
	private _shoulderIcon = format [_iconTemplate, _iconFile, _shoulderName];;
	private _hintMessage = format [localize "STR_AXE_Interactions_Hint_TapShoulder", _playerName, _shoulderIcon];
	[format [hint_tpl_default, _hintMessage]] call AXE_fnc_hint;
	
	if !(missionNamespace getVariable ["axe_interactions_global_sounds", false]) then {
		playSound "AXE_Action_Shoulder_Tap_1";
	};
	
};
