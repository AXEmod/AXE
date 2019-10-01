/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\common\fn_weaponUnlock.sqf
 *	by Ojemineh
 *	
 *	weapon saftey lock
 *	
 *	Arguments:
 *	0: unit		- <OBJECT>
 *	1: weapon	- <STRING>
 *	2: muzzle	- <STRING>
 *	3: showHint	- <BOOLEAN>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, (primaryWeapon player), (primaryWeapon player)] call AXE_fnc_weaponUnlock;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_weapon", "_muzzle", "_showHint"];

_unit		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_weapon		= [_this, 1, "", [""]] call BIS_fnc_param;
_muzzle		= [_this, 2, "", [""]] call BIS_fnc_param;
_showHint	= [_this, 3, true, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};
if (Not isPlayer _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

private _lockedWeapons = _unit getVariable ["ace_safemode_safedWeapons", []];
_lockedWeapons deleteAt (_lockedWeapons find _weapon);

_unit setVariable ["ace_safemode_safedWeapons", _lockedWeapons];

if (_lockedWeapons isEqualTo []) then {
    [_unit, "DefaultAction", _unit getVariable ["ace_safemode_actionID", -1]] call ACE_common_fnc_removeActionEventHandler;
    _unit setVariable ["ace_safemode_actionID", -1];
};

if (inputAction "nextWeapon" > 0) then {
	
    private _modes = [];
	
    {
        if (getNumber (configFile >> "CfgWeapons" >> _weapon >> _x >> "showToPlayer") == 1) then {
            _modes pushBack _x;
        };
        if (_x == "this") then {
            _modes pushBack _weapon;
        };
        nil
    } count getArray (configFile >> "CfgWeapons" >> _weapon >> "modes");
	
    private _mode = _modes select (count _modes - 1);
    private _index = 0;
	
    while {_index < 299 && {currentMuzzle _unit != _weapon || {currentWeaponMode _unit != _mode}}} do {
        _unit action ["SwitchWeapon", _unit, _unit, _index];
        _index = _index + 1;
    };
	
} else {
	[_unit, _weapon, _muzzle] call AXE_fnc_weaponFiremodeSound;
};

// -------------------------------------------------------------------------------------------------

if (_showHint) then {
	private _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
	[localize "STR_ACE_SafeMode_TookOffSafety", _picture] call ACE_common_fnc_displayTextPicture;	
};
