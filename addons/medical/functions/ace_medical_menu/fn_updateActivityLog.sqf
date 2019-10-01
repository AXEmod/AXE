/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\functions\ace_medical_menu\fn_updateActivityLog.sqf
 *	by Ojemineh
 *	
 *	overwrite ace medical menu updateActivityLog
 *	
 *	Arguments:
 *	0: display	- <CONTROL>
 *	1: logs		- <ARRAY>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[bob, kevin] call ACE_medical_menu_fnc_updateActivityLog;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_display", "_logs"];

private _logCtrl = _display displayCtrl 214;
lbClear _logCtrl;

{
    
	_x params ["_message", "_moment", "_logType", "_arguments"];
	
    if (isLocalized _message) then { _message = localize _message; };
	
    {
        if (_x isEqualType "" && {isLocalized _x}) then {
            _arguments set [_foreachIndex, localize _x];
        };
    } forEach _arguments;
	
	if (count _moment < 5) then {_moment = format ["0%1", _moment];};
	
    _message = format ([_message] + _arguments);
    _logCtrl lbAdd format ["%1 - %2", _moment, _message];
	
    nil
	
} count _logs;
