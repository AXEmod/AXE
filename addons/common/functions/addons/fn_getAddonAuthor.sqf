/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\addons\fn_getAddonAuthor.sqf
 *	by Ojemineh
 *	
 *	get addon author
 *	
 *	Arguments:
 *	0: classname - <STRING>
 *	
 *	Return:
 *	<STRING>
 *	
 *	Example:
 *	["axe_core"] call AXE_fnc_getAddonAuthor;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_classname"];

_classname = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

private _return = "";

if (isClass (configfile >> "CfgPatches" >> _classname)) then {
	_return = getText (configfile >> "CfgPatches" >> _classname >> "author");
};

_return;