/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_hints\functions\ace_common\fn_displayTextPicture.sqf
 *	by Ojemineh
 *	
 *	replace ace common displayTextStructured
 *	
 *	Arguments:
 *	0: text			- <ANY>
 *	1: size			- <NUMBER>
 *	3: target unit	- <OBJECT>
 *	4: custom width	- <NUMBER>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[["Test: %1", 123], 1.5] call ACE_common_fnc_displayTextStructured
 *	
 */

// -------------------------------------------------------------------------------------------------

params [["_text", ""], ["_size", 1.5, [0]], ["_target", ACE_player, [objNull]], ["_width", 10, [0]]];

private _hint_enabled = (missionNamespace getVariable ["axe_hint_enabled", true]);
private _hint_option_ace = (missionNamespace getVariable ["axe_hint_option_ace", true]);

if (_hint_enabled && _hint_option_ace) then {
	
	if (_target != ACE_player) exitWith {};
	
	if (typeName _text != "TEXT") then {
		if (_text isEqualType []) then {
			if (count _text > 0) then {
				{
					if (_x isEqualType "" && {isLocalized _x}) then {
						_text set [_forEachIndex, localize _x];
					};
				} forEach _text;
				_text = format _text;
			};
		};
		if (_text isEqualType "" && {isLocalized _text}) then {
			_text = localize _text;
		};
	};
	
	_text = format [hint_tpl_liner_1, _text];
	
	[_text] call axe_fnc_hint;
	
} else {
	[_text, _size, _target, _width] call ace_common_fnc_displayTextStructuredEx;
};
