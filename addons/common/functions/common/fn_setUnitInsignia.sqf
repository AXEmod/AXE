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

private _selectionIndex = -1;
private _uniformClass = getText (configFile >> "CfgWeapons" >> (uniform _unit) >> "ItemInfo" >> "uniformClass");
private _material = getText (configFile >> "CfgUnitInsignia" >> _insignia >> "material");
private _texture = getText (configFile >> "CfgUnitInsignia" >> _insignia >> "texture");

{
	if (_x == "insignia") exitWith {_selectionIndex = _forEachIndex;};
} foreach getArray (configFile >> "CfgVehicles" >> _uniformClass >> "hiddenSelections");

if (_selectionIndex > -1) then {
	
	if (_material != "") then {
		_unit setObjectMaterialGlobal [_selectionIndex, _material];
	} else {
		_unit setObjectMaterialGlobal [_selectionIndex, "\a3\data_f\default.rvmat"];
	};
	
	if (_texture != "") then {
		_unit setObjectTextureGlobal [_selectionIndex, _texture];
	} else {
		_unit setObjectTextureGlobal [_selectionIndex, "#(rgb,8,8,3)color(0,0,0,0)"];
	};
	
	_unit setVariable ["BIS_fnc_setUnitInsignia_class", _insignia, true];
	
} else {
	
	_unit setVariable ["BIS_fnc_setUnitInsignia_class", nil, true];
	
};
