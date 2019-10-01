/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_hints\functions\cba_ui\fn_displayText.sqf
 *	by Ojemineh
 *	
 *	replace cba notify
 *	
 *	Arguments:
 *	0: text			- <STRING>
 *	1: sound		- <BOOLEAN>
 *	2: delay		- <NUMBER>
 *	3: priority		- <NUMBER>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	["Banana", 1.5, [1, 1, 0, 1]] call CBA_fnc_notify
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_text"];

private _hint_option_cba = (missionNamespace getVariable ["axe_hint_option_cba", true]);

if (_hint_option_cba) then {
	
	if (_text isEqualType []) then {
		if (count _text > 0) then {_text = _text select 0;};
	};
	
	_text = format [hint_tpl_liner_1, _text];
	
	[_text, -1, -1] call AXE_fnc_hint;
	
} else {
	
	[_text] call CBA_fnc_notifyEx;
	
};
