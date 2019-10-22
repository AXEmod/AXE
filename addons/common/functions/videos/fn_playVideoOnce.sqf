/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\videos\fn_playVideoOnce.sqf
 *	by Ojemineh
 *	
 *	play video once in a mission (by id)
 *	
 *	Arguments:
 *	0: filename	- <STRING>
 *	1: id		- <STRING>
 *	2: canSkip	- <BOOLEAN>
 *	3: showSkip	- <BOOLEAN>
 *	4: showTime	- <ARRAY>		(FadeIn, FadeOut)
 *	
 *	Return:
 *	ID
 *	
 *	Example:
 *	["intro.ogv"] call AXE_fnc_playVideoOnce;
 *	
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_filename", "_videoID", "_canSkip", "_showSkip", "_showTime"];

_filename	= [_this, 0, "", [""]] call BIS_fnc_param;
_videoID	= [_this, 1, "", [""]] call BIS_fnc_param;
_canSkip	= [_this, 2, true, [true]] call BIS_fnc_param;
_showSkip	= [_this, 3, true, [true]] call BIS_fnc_param;
_showTime	= [_this, 4, [3,3], [[]]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_filename isEqualTo "") exitWith {};
if (_videoID isEqualTo "") then {_videoID = "ONCE";};
if (_showTime isEqualTo []) then {_showTime = [3,3];};

// -------------------------------------------------------------------------------------------------

private _return = [_filename, _videoID, _canSkip, _showSkip, _showTime] spawn {
	
	params ["_filename", "_videoID", "_canSkip", "_showSkip", "_showTime"];
	
	missionNamespace setVariable ["BIS_fnc_playVideo_skipVideo", false];
	
	if (_canSkip) then {
		missionNamespace setVariable ["BIS_fnc_playVideo_canSkip", true];
	} else {
		missionNamespace setVariable ["BIS_fnc_playVideo_canSkip", false];
	};
	
	private _uID = getPlayerUID player;
	private _videoTag = format ["AXE_Video_%1", _videoID];
	private _usersPlayed = (missionNamespace getVariable [_videoTag, []]);
	
	if (_uID in _usersPlayed) exitWith {};
	
	private _script = 0 spawn {};
	
	if ( (_canSkip) && (_showSkip) ) then {
		_script = [_showTime] spawn {
			
			params ["_showTime"];
			
			private _r = profileNamespace getVariable ['GUI_BCG_RGB_R',0];
			private _g = profileNamespace getVariable ['GUI_BCG_RGB_G',0];
			private _b = profileNamespace getVariable ['GUI_BCG_RGB_B',0];
			private _a = profileNamespace getVariable ['GUI_BCG_RGB_A',1];
			private _rgb = [_r,_g,_b] call BIS_fnc_colorRGBtoHTML;
			
			private _keyName = format ["<t color='%1'>[%2]</t>", _rgb, toUpper(((keyname 57) splitString '"') joinString '')];
			private _skipMsg = format ["<t font='RobotoCondensed' color='#ffffff' shadow='2' size='1.6'>%1</t>", localize "STR_AXE_Message_SkipVideo"];
			private _message = format [_skipMsg, _keyName];
			
			uiSleep (_showTime select 0);
			99 cutText [_message, "PLAIN DOWN", 0.5, true, true];
			uiSleep (_showTime select 1);
			99 cutFadeOut 0.5;
			
		};
	};
	
	_usersPlayed pushBackUnique _uID;
	missionNamespace setVariable [_videoTag, _usersPlayed, true];
	
	private _keyHandler = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call AXE_fnc_videoKeyDown"];
	private _video = [_filename] spawn BIS_fnc_playVideo;
	
	waitUntil { scriptDone _video };
	
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", _keyHandler];
	if ( (_canSkip) && (_showSkip) && (!scriptDone _script) ) then { 99 cutFadeOut 0.01; terminate _script; };
	
};

_return;