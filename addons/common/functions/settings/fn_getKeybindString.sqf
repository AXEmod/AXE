/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\settings\fn_getKeybindString.sqf
 *	by Ojemineh
 *	
 *	get keybind string
 *	
 *	Arguments:
 *	0: addon		- <STRING>
 *	1: actionName	- <STRING>
 *	
 *	Return:
 *	STRING
 *	
 *	Example:
 *	["CH View Distance", "open_settings"] call AXE_fnc_getKeybindString;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_addon", "_actionName"];

_addon		= [_this, 0, "", [""]] call BIS_fnc_param;
_actionName	= [_this, 1, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_addon isEqualTo "") exitWith {""};
if (_actionName isEqualTo "") exitWith {""};

// -------------------------------------------------------------------------------------------------

private _entry = [_addon, _actionName] call CBA_fnc_getKeybind;
private _return = "";

if (!isNil "_entry") then {
	
	private _keybind = _entry select 5;
	
	private _useShift = (_keybind select 1) select 0;
	private _useCtrl = (_keybind select 1) select 1;
	private _useAlt = (_keybind select 1) select 2;
	
	private _modifier = 
		(if (_useShift) then {localize "STR_AXE_KeyBinds_Shift_Modifier"} else {""}) +
		(if (_useCtrl) then {localize "STR_AXE_KeyBinds_Ctrl_Modifier"} else {""}) +
		(if (_useAlt) then {localize "STR_AXE_KeyBinds_Alt_Modifier"} else {""});
	
	_return = toUpper(format ["%1%2", _modifier, [_keybind select 0] call BIS_fnc_keyCode]);
	
};

_return;