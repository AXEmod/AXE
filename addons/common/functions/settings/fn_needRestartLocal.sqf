/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\settings\fn_needRestartLocal.sqf
 *	by Ojemineh
 *	
 *	settings restart notification
 *	
 *	Arguments:
 *	0: setting		- <STRING>
 *	1: mission		- <BOOLEAN>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	["axe_debug_enabled", false] call AXE_fnc_needRestartLocal;
 *	
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_setting", "_mission"];

_setting	= [_this, 0, "", [""]] call BIS_fnc_param;
_mission	= [_this, 1, true, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_setting isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

private _message = "";

if (_mission) then {
	_message = format [localize "STR_AXE_Common_Hint_Need_Restart_Mission", toUpper(_setting)];
} else {
	_message = format [localize "STR_AXE_Common_Hint_Need_Restart_Client", toUpper(_setting)];
};

private _hint = format [hint_tpl_image_2, "\axe_common\data\icons\settings_ca.paa", _message];

[_hint, 1] call AXE_fnc_hint;
