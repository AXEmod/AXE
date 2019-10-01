/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_field_rations\functions\fn_initialize.sqf
 *	by Ojemineh
 *	
 *	initialize field rations addon
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_field_rations_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _version = ["axe_field_rations"] call AXE_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "field_rations"] call AXE_fnc_log;

// -------------------------------------------------------------------------------------------------

AXE_FIELD_RATIONS_MAXRESERVE = 2300;

// -------------------------------------------------------------------------------------------------

AXE_FIELD_RATIONS_EH = [
	"acex_rationConsumed", 
	{
		_this params ["_player", "_consumeItem", "_replacementItem", "_thirstQuenched", "_hungerSatiated"];
		[_player, _consumeItem, _replacementItem, _thirstQuenched, _hungerSatiated] call AXE_field_rations_fnc_handleItem;
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
