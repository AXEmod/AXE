/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_hints\functions\ace_common\fn_displayIcon.sqf
 *	by Ojemineh
 *	
 *	replace ace common displayIcon
 *	
 *	Arguments:
 *	0: id			- <STRING>
 *	1: show			- <BOOLEAN>
 *	2: file			- <STRING>
 *	3: color		- <ARRAY>
 *	4: timeAlive	- <NUMBER>	[-1 = forever (default: 6)]
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	["myID", true, "data\icon_group.paa", [1,1,1,1], 0] call ACE_common_fnc_displayIcon;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_iconId", "_show", "_icon", ["_color", [1,1,1,1]], ["_timeAlive", 6]];

private _hint_enabled = (missionNamespace getVariable ["axe_hint_enabled", true]);
private _hint_option_ace = (missionNamespace getVariable ["axe_hint_option_ace", true]);

if (_hint_enabled && _hint_option_ace) then {
	
	private _text = format [hint_tpl_icon_1, _icon, _color];
	
	[_text, -1, 0] call AXE_fnc_hint;
	
} else {
	
	[_iconId, _show, _icon, _color, _timeAlive] call ACE_common_fnc_displayIconEx;
	
};
