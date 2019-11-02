/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_teleport\functions\flag\fn_flag_isEnabled.sqf
 *	by Ojemineh
 *	
 *	check if teleport flag is enabled
 *	
 *	Arguments:
 *	0: teleporter - <OBJECT>
 *	
 *	Return:
 *	<BOOLEAN>
 *	
 *	Example:
 *	[teleport1] call AXE_teleport_fnc_flag_isEnabled;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_teleporter"];

_teleporter	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _teleporter) exitWith {};

// -------------------------------------------------------------------------------------------------

private _controller = objNull;
private _return = false;

if ((_teleporter getVariable ["network", ""]) != "") then {
	_controller = missionNamespace getVariable (_teleporter getVariable ["network", ""]);
};

_return = (
	!(isNull _controller) && 
	((_controller getVariable ["enabled", 0]) > 0) && 
	((_teleporter getVariable ["enabled", 0]) > 0)
);

_return;