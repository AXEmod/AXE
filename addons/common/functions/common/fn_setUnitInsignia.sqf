/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\common\fn_setUnitInsignia.sqf
 *	by Ojemineh
 *	
 *	set unit insignia
 *	
 *	Arguments:
 *	0: unit		- <OBJECT>
 *	1: insignia	- <STRING>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, "curator"] call AXE_fnc_setUnitInsignia;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_insignia"];

_unit		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_insignia	= [_this, 1, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};
if ((uniform _unit) isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

[_unit, ""] call BIS_fnc_setUnitInsignia;
[_unit, _insignia] call BIS_fnc_setUnitInsignia;

private _index = -1;
private _class = getText (configFile >> "CfgWeapons" >> uniform _unit >> "ItemInfo" >> "uniformClass");

{
	if (_x == "insignia") exitWith {_index = _foreachindex;};
} foreach getArray (configFile >> "CfgVehicles" >> _class >> "hiddenSelections");

private _texture = getText (configFile >> "CfgUnitInsignia" >> _insignia >> "texture");

if ((_index > -1) && (_texture != "")) then {
	_unit setObjectTextureGlobal [_index, _texture];
};
