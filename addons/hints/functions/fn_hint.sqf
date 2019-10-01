/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_hints\functions\fn_hint.sqf
 *	by Ojemineh
 *	
 *	extended hint system
 *	
 *	Arguments:
 *	0: text		- <STRING>
 *	1: color	- <COLOR>	(Index 0-2 OR Array [0,0,1,1])
 *	2: sound	- <NUMBER>	(Index 0-4)
 *	3: delay	- <NUMBER>	(Seconds 5-30)
 *	1: position	- <NUMBER>	(0 top right, 1 top left, 2 bottom left, 3 bottom right)
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[ format [hint_tpl_default, "Hello World"] ] call AXE_fnc_hint;
 *	
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_text", "_color", "_delay", "_sound", "_position"];

_text		= [_this, 0, "", [""]] call BIS_fnc_param;
_color		= [_this, 1, -1, [0,[]]] call BIS_fnc_param;
_sound		= [_this, 2, -1, [0]] call BIS_fnc_param;
_delay		= [_this, 3, -1, [0]] call BIS_fnc_param;
_position	= [_this, 4, -1, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_text isEqualTo "") exitWith {};

[_text, _color, _sound, _delay, _position] spawn {
	
	params ["_text", "_color", "_sound", "_delay", "_position"];
	
	private ["_display", "_bwidth", "_spacer", "_alpha", "_stack", "_queue", "_width", "_height", 
	"_posX", "_posY", "_scrollDown", "_barLeft", "_barcolor", "_rgb_r", "_rgb_g", "_rgb_b", "_rgb_a", 
	"_Content", "_contentWidth", "_contentHeight", "_contentPosX", "_contentPosY", "_ColorBar", 
	"_barWidth", "_barHeight", "_barPosX", "_barPosY", "_totalY", "_activeNotifications", 
	"_ctrlContent", "_ctrlBar", "_contentH", "_contentY"];
	
	private _hint_enabled		= (missionNamespace getVariable ["axe_hint_enabled", true]);
	private _hint_position		= (missionNamespace getVariable ["axe_hint_position", 0]);
	private _hint_duration		= (missionNamespace getVariable ["axe_hint_duration", 15]);
	private _hint_sound			= (missionNamespace getVariable ["axe_hint_sound", 1]);
	private _hint_color_0		= (missionNamespace getVariable ["axe_hint_color_default", [0.000,0.824,0.000]]);
	private _hint_color_1		= (missionNamespace getVariable ["axe_hint_color_info", [0.824,0.824,0.000]]);
	private _hint_color_2		= (missionNamespace getVariable ["axe_hint_color_alert", [0.824,0.000,0.000]]);
	private _hint_queue_size	= (missionNamespace getVariable ["axe_hint_queue_size", 3]);
	private _hint_queue_fade	= (missionNamespace getVariable ["axe_hint_queue_alpha", 0.4]);
	
	if (!_hint_enabled) exitWith {};
	
	if (_color isEqualType 0) then {
		switch (_color) do {
			case -1: {
				_rgb_r = profileNamespace getVariable ["GUI_BCG_RGB_R", 0];
				_rgb_g = profileNamespace getVariable ["GUI_BCG_RGB_G", 0];
				_rgb_b = profileNamespace getVariable ["GUI_BCG_RGB_B", 0];
				_rgb_a = profileNamespace getVariable ["GUI_BCG_RGB_A", 1];
				_color = [_rgb_r,_rgb_g,_rgb_b,_rgb_a];
			};
			case  1: { _color = _hint_color_1; };
			case  2: { _color = _hint_color_2; };
			default  { _color = _hint_color_0; };
		};
	};
	
	if (_sound < 0) then { _sound = _hint_sound; };
	if (_delay < 0) then { _delay = round _hint_duration; };
	if (_position < 0) then { _position = _hint_position; };
	
	disableSerialization;
	
	//_display = findDisplay 46;
	_display = uiNamespace getVariable "AXE_ctrlHint";
	
	_bwidth = 0.003 * safezoneW;
	_spacer = 1.5 * (0.01 * safezoneH);
	_alpha = 0.8;
	_stack = _hint_queue_size;
	_queue = [];
	
	switch (_position) do {
		case 1: {
			_width = 0.15 * safezoneW;
			_height = 0.15 * safezoneH;
			_posX = 0.012 * safezoneW + safezoneX;
			_posY = 0.13 * safezoneH + safezoneY;
			_scrollDown = true;
			_barLeft = true;
			_queue = uiNamespace getVariable ["axe_hint_queue_1", []];
		};
		case 2: {
			_width = 0.15 * safezoneW;
			_height = 0.15 * safezoneH;
			_posX = 0.012 * safezoneW + safezoneX;
			_posY = safezoneY + safezoneH - (0.13 * safezoneH);
			_scrollDown = false;
			_barLeft = true;
			_queue = uiNamespace getVariable ["axe_hint_queue_2", []];
		};
		case 3: {
			_width = 0.15 * safezoneW;
			_height = 0.15 * safezoneH;
			_posX = safezoneX + safezoneW - _width - (0.012 * safezoneW);
			_posY = safezoneY + safezoneH - (0.13 * safezoneH);
			_scrollDown = false;
			_barLeft = false;
			_queue = uiNamespace getVariable ["axe_hint_queue_3", []];
		};
		default {
			_width = 0.15 * safezoneW;
			_height = 0.15 * safezoneH;
			_posX = safezoneX + safezoneW - _width - (0.012 * safezoneW);
			_posY = 0.13 * safezoneH + safezoneY;
			_scrollDown = true;
			_barLeft = false;
			_queue = uiNamespace getVariable ["axe_hint_queue_0", []];
		};
	};
	
	switch (_sound) do {
		case 1: { playSound ["HintExpand", true]; };
		case 2: { playSound ["Hint", true]; };
		case 3: { playSound ["taskCreated", true]; };
		case 4: { playSound ["TacticalPing4", true]; };
		default {};
	};
	
	if (_text isEqualType "") then { _text = parseText _text; };
	
	_Content = _display ctrlCreate ["RscStructuredText", -1];
	_Content ctrlSetStructuredText _text;
	_Content ctrlSetPosition [0,0,_width,0.5];
	_Content ctrlCommit 0;
	_contentWidth = _width;
	_contentHeight = ((ctrlTextHeight _Content) + (0.002 * safezoneH));
	_contentPosX = _posX;
	if (_scrollDown) then { _contentPosY = _posY; } else { _contentPosY = _posY - _contentHeight; };
	_Content ctrlSetPosition [_contentPosX,_contentPosY,_contentWidth,_contentHeight];
	_Content ctrlSetBackgroundColor [0,0,0,_alpha];
	_Content ctrlSetFade 1;
	_Content ctrlCommit 0;
	_Content ctrlSetFade 0;
	_Content ctrlCommit 0.25;
	
	_ColorBar = _display ctrlCreate ["RscText", -1];
	_barWidth = _bwidth;
	_barHeight = _contentHeight;
	if (_barLeft) then { _barPosX = _posX - _bwidth; } else { _barPosX = _posX + _contentWidth; };
	if (_scrollDown) then { _barPosY = _posY; } else { _barPosY = _posY - _contentHeight;; };
	_ColorBar ctrlSetPosition [_barPosX,_barPosY,_barWidth,_barHeight];
	_ColorBar ctrlSetBackgroundColor _color;
	_ColorBar ctrlSetFade 1;
	_ColorBar ctrlCommit 0;
	_ColorBar ctrlSetFade 0;
	_ColorBar ctrlCommit 0.25;
	
	[_Content,_ColorBar,_delay] spawn {
		disableSerialization;
		private _Content = _this select 0;
		private _ColorBar = _this select 1;
		private _delay = _this select 2;
		uiSleep _delay;
		_Content ctrlSetFade 1;
		_Content ctrlCommit 0.5;
		_ColorBar ctrlSetFade 1;
		_ColorBar ctrlCommit 0.5;
		uiSleep 0.5;
		ctrlDelete _Content;
		ctrlDelete _ColorBar;
	};
	
	if (_scrollDown) then {
		_totalY = _contentPosY + _contentHeight + _spacer;
	} else {
		_totalY = _contentPosY;
	};
	
	if (count _queue > 0) then {
		_activeNotifications = 0;
		{
			_ctrlContent = _x select 0;
			_ctrlBar = _x select 1;
			if (!isNull _ctrlContent && !isNull _ctrlBar) then {
				_contentH = (ctrlPosition (_ctrlContent)) select 3;
				_contentY = (ctrlPosition (_ctrlContent)) select 1;
				if (!_scrollDown) then { _totalY = _totalY - _contentH - _spacer; };
				_ctrlContent ctrlSetPosition [_contentPosX, _totalY];
				_ctrlContent ctrlSetFade _hint_queue_fade;
				_ctrlContent ctrlCommit 0.25;
				_ctrlBar ctrlSetPosition [_barPosX, _totalY];
				_ctrlBar ctrlSetFade _hint_queue_fade;
				_ctrlBar ctrlCommit 0.25;
				if (_scrollDown) then { _totalY = _totalY + _contentH + _spacer; };
				if (_activeNotifications >= _stack) then {
					_ctrlContent ctrlSetFade 1;
					_ctrlContent ctrlCommit 0.25;
					_ctrlBar ctrlSetFade 1;
					_ctrlBar ctrlCommit 0.2;
				};
				_activeNotifications = _activeNotifications + 1;
			};
		} forEach _queue;
	};
	
	_queue = ([[_Content,_ColorBar]] + _queue) select {!isNull (_x select 0) && !isNull (_x select 1)};
	
	switch (_position) do {
		case 0: { uiNamespace setVariable ["axe_hint_queue_0", _queue]; };
		case 1: { uiNamespace setVariable ["axe_hint_queue_1", _queue]; };
		case 2: { uiNamespace setVariable ["axe_hint_queue_2", _queue]; };
		case 3: { uiNamespace setVariable ["axe_hint_queue_3", _queue]; };
	};
	
};
