/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_hints\functions\fn_cleanup.sqf
 *	by Ojemineh
 *	
 *	cleanup extended hint system
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_hints_fnc_cleanup;
 *	
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_queue", "_Content", "_ColorBar"];

{
	
	_queue = _x;
	
	if (count _queue > 0) then {
		{
			_Content = _x select 0;
			_ColorBar = _x select 1;
			ctrlDelete _Content;
			ctrlDelete _ColorBar;
		} forEach _queue;
	};
	
} forEach [
	uiNamespace getVariable ["axe_hint_queue_0", []],
	uiNamespace getVariable ["axe_hint_queue_1", []],
	uiNamespace getVariable ["axe_hint_queue_2", []],
	uiNamespace getVariable ["axe_hint_queue_3", []]
];

uiNamespace setVariable ["axe_hint_queue_0", []];
uiNamespace setVariable ["axe_hint_queue_1", []];
uiNamespace setVariable ["axe_hint_queue_2", []];
uiNamespace setVariable ["axe_hint_queue_3", []];
