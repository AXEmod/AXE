/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\common\fn_weaponLock.sqf
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
 *	[player, (primaryWeapon player), (primaryWeapon player)] call AXE_fnc_weaponLock;
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
if (inputAction "nextWeapon" > 0) exitWith {};

// -------------------------------------------------------------------------------------------------

private _lockedWeapons = _unit getVariable ["ace_safemode_safedWeapons", []];
if (_weapon in _lockedWeapons) exitWith {
	[_unit, _weapon, _muzzle] call ACE_safemode_fnc_unlockSafety;
};

_lockedWeapons pushBack _weapon;
_unit setVariable ["ace_safemode_safedWeapons", _lockedWeapons];

if (_unit getVariable ["ace_safemode_actionID", -1] == -1) then {
	_unit setVariable ["ace_safemode_actionID", [
		_unit, "DefaultAction", {
			if (
				([_this select 1] call CBA_fnc_canUseWeapon) &&
				{
					if (currentMuzzle (_this select 1) in ((_this select 1) getVariable ["ace_safemode_safedWeapons", []])) then {
						if (inputAction "nextWeapon" > 0) exitWith {
							[_this select 1, currentWeapon (_this select 1), currentMuzzle (_this select 1)] call ACE_safemode_fnc_unlockSafety;
							false
						};
						true
					} else {false}
				}
			) then {
				true
			} else {
				false
			};
		}, {}
	] call ACE_common_fnc_addActionEventHandler];
};

// -------------------------------------------------------------------------------------------------

if (_showHint) then {
	[_unit, _weapon] call AXE_fnc_weaponFiremodeSound;
	private _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
	[localize "STR_ACE_SafeMode_PutOnSafety", _picture] call ACE_common_fnc_displayTextPicture;	
};
