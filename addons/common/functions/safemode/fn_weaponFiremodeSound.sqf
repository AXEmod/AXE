/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\common\fn_weaponFiremodeSound.sqf
 *	by Ojemineh
 *	
 *	weapon saftey lock
 *	
 *	Arguments:
 *	0: unit		- <OBJECT>
 *	1: weapon	- <STRING>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, (primaryWeapon player)] call AXE_fnc_weaponFiremodeSound;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_weapon"];

_unit	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_weapon	= [_this, 1, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

private _sound = getArray (configFile >> "CfgWeapons" >> _weapon >> "changeFiremodeSound");

if (_sound isEqualTo []) exitWith {
    playSound "ACE_Sound_Click";
};

// get position where to play the sound (position of the weapon)
private _position = AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "RightHand"));

_sound params ["_filename", ["_volume", 1], ["_soundPitch", 1], ["_distance", 0]];

playSound "ACE_Sound_Click";

// add file extension .wss as default
if !(toLower (_filename select [count _filename - 4]) in [".wav", ".ogg", ".wss"]) then {
    _filename = format ["%1.wss", _filename];
};

playSound3D [_filename, objNull, false, _position, _volume, _soundPitch, _distance];
