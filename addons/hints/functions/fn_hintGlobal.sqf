/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_hints\functions\fn_hintGlobal.sqf
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
 *	[ format [hint_tpl_default, "Hello World"] ] call AXE_fnc_hintGlobal;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_text", "_color", "_delay", "_sound", "_position"];

_text		= [_this, 0, "", [""]] call BIS_fnc_param;
_color		= [_this, 1, -1, [0,[]]] call BIS_fnc_param;
_sound		= [_this, 2, -1, [0]] call BIS_fnc_param;
_delay		= [_this, 3, -1, [0]] call BIS_fnc_param;
_position	= [_this, 4, -1, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

[_text, _color, _sound, _delay, _position] remoteExec ["axe_fnc_hint", 0];
