/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\diagnostics\fn_log.sqf
 *	by Ojemineh
 *	
 *	add a rpt-log
 *	
 *	Arguments:
 *	0: type			- <NUMBER>
 *	1: message		- <STRING>
 *	2: params		- <ARRAY>
 *	3: extension	- <STRING>
 *	4: modification - <STRING>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[4, "Player: '%1', Time: '%2'", [player, time], "core"] call AXE_fnc_log;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_level", "_message", "_params", "_extension", "_modification"];

_level			= [_this, 0, 0, [0]] call BIS_fnc_param;
_message		= [_this, 1, "", [""]] call BIS_fnc_param;
_params			= [_this, 2, [], [[]]] call BIS_fnc_param;
_extension		= [_this, 3, "", [""]] call BIS_fnc_param;
_modification	= [_this, 4, "AXE", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

//if (_modification isEqualTo "") then {_modification = "AXE";};

// -------------------------------------------------------------------------------------------------

private _levelStr = "";

switch (_level) do {
	case 1: { _levelStr = "fatal"; };
	case 2: { _levelStr = "error"; };
	case 3: { _levelStr = "warning"; };
	case 4: { _levelStr = "info"; };
	case 5: { _levelStr = "debug"; };
	case 6: { _levelStr = "trace"; };
	default { _levelStr = ""; };
};

// -------------------------------------------------------------------------------------------------

private _messageStr = "";

if (_params isEqualTo []) then {
	_messageStr = _message;
} else {
	_messageStr = _message;
	if (count _params > 0) then {
		for "_i" from 1 to (count _params) do {
			private _param = "";
			if ((_params select (_i-1)) isEqualType "") then {
				_param = (_params select (_i-1));
			} else {
				_param = str (_params select (_i-1));
			};
			private _pattern = "%" + (str _i);
			_messageStr = [_messageStr, _pattern, _param] call CBA_fnc_replace; 
		};
	};
};

// -------------------------------------------------------------------------------------------------

private _logStr = "";

if (_modification != "") then {
	_logStr = _logStr + format ["[%1] ", toUpper(_modification)];
};

if (_extension != "") then {
	_logStr = _logStr + format ["(%1) ", toLower(_extension)];
};

if (_levelStr != "") then {
	_logStr = _logStr + format ["%1: ", toUpper(_levelStr)];
};

if (_messageStr != "") then {
	_logStr = _logStr + _messageStr;
};

// -------------------------------------------------------------------------------------------------

if (_logStr != "") then { diag_log (text _logStr); };
