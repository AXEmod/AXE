/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_hints\functions\ace_common\fn_stringToColoredText.sqf
 *	by Ojemineh
 *	
 *	replace ace common displayIcon
 *	
 *	Arguments:
 *  0: Text <ANY>
 *  1: Color <ARRAY, STRING>
 *	
 *	Return:
 *	Text <STRING>
 *	
 *	Example:
 *	["text", [0, 1, 2]] call ACE_common_fnc_stringToColoredText
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_string", "_color"];

_string = format ["%1", _string];
_return = "";

if (_color isEqualType []) then {
    _color = "#" + (
        [255 * (_color select 0), 2] call ace_common_fnc_toHex
    ) + (
        [255 * (_color select 1), 2] call ace_common_fnc_toHex
    ) + (
        [255 * (_color select 2), 2] call ace_common_fnc_toHex
    );
};

private _hint_enabled = (missionNamespace getVariable ["axe_hint_enabled", true]);
private _hint_option_ace = (missionNamespace getVariable ["axe_hint_option_ace", true]);

if (_hint_enabled && _hint_option_ace) then {
	_return = format ["<t align='center' color='%1' >%2</t>", _color, _string];
} else {
	_return = parseText format ["<t align='center' color='%1' >%2</t>", _color, _string];
};

_return