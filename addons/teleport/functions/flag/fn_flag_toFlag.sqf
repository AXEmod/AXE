/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_teleport\functions\flag\fn_flag_toFlag.sqf
 *	by Ojemineh
 *	
 *	teleport player to destination
 *	
 *	Arguments:
 *	0: player - <OBJECT>
 *	1: target - <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, teleport1] call AXE_teleport_fnc_flag_toFlag;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_player", "_target"];

_player	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target	= [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _player) exitWith {};
if (isNull _target) exitWith {};

// -------------------------------------------------------------------------------------------------

[_player, _target] spawn {
	
	params ["_player", "_target"];
	
	if (_player getVariable ["AXE_Teleport_InProgress", false]) exitWith {
		private _hintInProgress = format [hint_tpl_liner_1, localize "STR_AXE_Teleport_Hint_InProgress"];
		[_hintInProgress, 2] call AXE_fnc_hint;
	};
	
	if ( (missionNamespace getVariable ["axe_teleport_safemode", true]) ) then {
		[_player, "blockDamage", "axe_teleport_toFlag", true] call ACE_common_fnc_statusEffect_set;
	};
	
	_player setVariable ["AXE_Teleport_InProgress", true, true];
	
	100 cutText ["", "BLACK OUT", 0.5];
	uiSleep 2;
	
	_player hideObjectGlobal true;
	
	waitUntil {if (preloadCamera (getPos _target)) exitWith {true}; false};
	
	private _success = false;
	
	if (vehicle _player != _player) then {
		unassignVehicle _player;
		moveOut _player;
	};
	
	private _pos = _target modelToWorld [0, 0, 0];
	_pos = _pos findEmptyPosition [0, 30, (typeOf _player)];
	if (!(_pos isEqualTo [])) then {
		private _dir = _target getDir _pos;
		_player setDir _dir;
		_player setPos _pos;
		_success = true;
	};
	
	uiSleep 0.5;
	
	100 cutText ["", "BLACK IN", 1.0];
	
	_player hideObjectGlobal false;
	
	[_player, _success] spawn {
		
		params ["_player", "_success"];
		
		if ( (missionNamespace getVariable ["axe_teleport_safemode", true]) ) then {
			
			private _time = round (missionNamespace getVariable ["axe_teleport_safetime", 5]);
			
			if ( (missionNamespace getVariable ["axe_teleport_safeInfo", true]) ) then {
				
				private _info = format [localize "STR_AXE_Teleport_Hint_SafeMode_Message", _time];
				
				[
					format [
						"<t color='#ff0000' size='1.2'>%1</t><br/><t color='#ff0000' size='0.7'>%2</t>", 
						toUpper(localize "STR_AXE_Teleport_Hint_SafeMode_Title"), 
						_info
					],
					-1, 
					-1, 
					_time, 
					0
				] spawn BIS_fnc_dynamicText;
				
			};
			uiSleep _time;
			
			[_player, "blockDamage", "axe_teleport_toFlag", false] call ACE_common_fnc_statusEffect_set;
			
		};
		
		_player setVariable ["AXE_Teleport_InProgress", nil, true];
		
	};
	
	uiSleep 1;
	
	if ( (missionNamespace getVariable ["axe_teleport_hint", true]) ) then {
		
		if (_success) then {
			private _flagName = _target getVariable ["FlagName", ""];
			private _textToFlag = "";
			if (_flagName != "") then {
				if (isLocalized _flagName) then {_flagName = localize _flagName;};
				_textToFlag = format [localize "STR_AXE_Teleport_Hint_toFlag", _flagName];
			} else {
				_textToFlag = localize "STR_AXE_Teleport_Hint_toFlag_NoName";
			};
			private _hintToFlag = format [hint_tpl_liner_1, _textToFlag];
			[_hintToFlag, 0] call AXE_fnc_hint;
		} else {
			private _hintToFlag = format [hint_tpl_liner_1, localize "STR_AXE_Teleport_Hint_Failure"];
			[_hintToFlag, 2] call AXE_fnc_hint;
		};
		
	};
	
};
