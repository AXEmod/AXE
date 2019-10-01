/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_hints\functions\ace_common\fn_displayTextPicture.sqf
 *	by Ojemineh
 *	
 *	replace ace common displayTextPicture
 *	
 *	Arguments:
 *	0: text			- <ANY>
 *	1: image		- <STRING>
 *	2: image color	- <ARRAY>
 *	3: target unit	- <OBJECT>
 *	4: size			- <NUMBER>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	["text", "image", [1, 1, 1], ACE_player, 2] call ACE_common_fnc_displayTextPicture
 *	
 */

// -------------------------------------------------------------------------------------------------

params [["_text", ""], ["_image", "", [""]], ["_imageColor", [1,1,1], [[]]], ["_target", ACE_player, [objNull]], ["_size", 2, [0]]];

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
	
	_text = format [hint_tpl_image_3, _image, _imageColor call BIS_fnc_colorRGBtoHTML, _text];
	
	[_text] call axe_fnc_hint;
	
} else {
	[_text, _image, _imageColor, _target, _size] call ace_common_fnc_displayTextPictureEx;
};
