/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_field_rations\functions\ace\fn_consumeItem.sqf
 *	by Ojemineh
 *	
 *	Consumes an item. Creates a progress bar and handles relevant thirst/hunger values.
 *	
 *	Arguments:
 *  0: target	- <OBJECT>	(not used)
 *  1: player	- <OBJECT>
 *  2: item		- <STRING>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[objNull, ACE_player, "ACE_WaterBottle"] call ACEX_field_rations_fnc_consumeItem;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["", "_player", "_consumeItem"];


private _config = configFile >> "CfgWeapons" >> _consumeItem;

// Get consume time for item
private _consumeTime = getNumber (_config >> "acex_field_rations_consumeTime");

// Get restored values and replacement item
//private _thirstQuenched = acex_field_rations_thirstQuenched * getNumber (_config >> "acex_field_rations_thirstQuenched");
private _thirstQuenched = getNumber (_config >> "acex_field_rations_thirstQuenched");
//private _hungerSatiated = acex_field_rations_hungerSatiated * getNumber (_config >> "acex_field_rations_hungerSatiated");
private _hungerSatiated = getNumber (_config >> "acex_field_rations_hungerSatiated");
private _replacementItem = getText (_config >> "acex_field_rations_replacementItem");

// Create consume text for item
private _displayName = getText (_config >> "displayName");
private _consumeText = getText (_config >> "acex_field_rations_consumeText");

if (_consumeText == "") then {
    _consumeText = if (_hungerSatiated > 0) then {
        localize "STR_AXE_Field_Rations_EatingX";
    } else {
        localize "STR_AXE_Field_Rations_DrinkingX";
    };
};

// Format displayName onto consume text
// Allows for common strings to be used for multiple items
_consumeText = format [_consumeText, _displayName];

// Get consume animation and sound for item
private _stanceIndex = ["STAND", "CROUCH", "PRONE"] find stance _player;

// Handle in vehicle when stance is UNDEFINED
if (vehicle _player != _player) then {_stanceIndex = 0};

private _consumeAnim = getArray (_config >> "acex_field_rations_consumeAnims") param [_stanceIndex, "", [""]];
private _consumeSound = getArray (_config >> "acex_field_rations_consumeSounds") param [_stanceIndex, "", [""]];

private _soundPlayed = if (_consumeAnim != "" && {vehicle _player == _player && {!(_player call ACE_common_fnc_isSwimming)}}) then {
    // Store current animation for resetting
    _player setVariable ["acex_field_rations_previousAnim", animationState _player];
    [_player, _consumeAnim, 1] call ACE_common_fnc_doAnimation;
    false
} else {
    // No animation to sync sound to
    if (_consumeSound != "") then {
		if (missionNamespace getVariable ["axe_field_rations_global_sounds", false]) then {
			[_player, _consumeSound, 30, 1.7] call AXE_fnc_playSound3d;
		} else {
			playSound _consumeSound;
		};
    };
    true
};

private _fnc_onSuccess = {
	
    params ["_args"];
	
    _args params ["_player", "_consumeItem", "_replacementItem", "_thirstQuenched", "_hungerSatiated"];
    //TRACE_1("Consume item successful",_args);
	
    // Remove consumed item
    _player removeItem _consumeItem;
	
    // Add replacement item if needed
    if (_replacementItem != "") then {
        [_player, _replacementItem] call ACE_common_fnc_addToInventory;
    };
	
    // Handle thirst and hunger values
    if (_thirstQuenched > 0) then {
        private _thirst = _player getVariable ["acex_field_rations_thirst", 0];
        _player setVariable ["acex_field_rations_thirst", (_thirst - _thirstQuenched) max 0];
    };
	
    if (_hungerSatiated > 0) then {
        private _hunger = _player getVariable ["acex_field_rations_hunger", 0];
        _player setVariable ["acex_field_rations_hunger", (_hunger - _hungerSatiated) max 0];
    };
	
    ["acex_rationConsumed", [_player, _consumeItem, _replacementItem, _thirstQuenched, _hungerSatiated]] call CBA_fnc_localEvent;
	
    _player setVariable ["acex_field_rations_previousAnim", nil];
	
};

private _fnc_onFailure = {
	
    params ["_args"];
	
    _args params ["_player"];
	
    //TRACE_1("Consume item failed",_args);
    // Reset animation if needed
    if (vehicle _player == _player && {!(_player call ACE_common_fnc_isSwimming)}) then {
        private _previousAnim = _player getVariable ["acex_field_rations_previousAnim", ""];
        if (_previousAnim != "") then {
            [_player, _previousAnim, 2] call ACE_common_fnc_doAnimation;
        };
    };
	
    _player setVariable ["acex_field_rations_previousAnim", nil];
	
};

private _fnc_condition = {
	
    params ["_args"];
	
    _args params ["_player", "_consumeItem", "", "", "", "_consumeAnim", "_consumeSound", "_soundPlayed"];
	
    // Attempt to sync sound with animation start
    if (!_soundPlayed && {_consumeSound != "" && {_consumeAnim == "" || {animationState _player == _consumeAnim}}}) then {
		if (missionNamespace getVariable ["axe_field_rations_global_sounds", false]) then {
			[_player, _consumeSound, 30, 1.7] call AXE_fnc_playSound3d;
		} else {
			playSound _consumeSound;
		};
        _args set [7, true];
    };
	
    _consumeItem in (_player call ACE_common_fnc_uniqueItems);
	
};

[
    _consumeTime,
    [
        _player,
        _consumeItem,
        _replacementItem,
        _thirstQuenched,
        _hungerSatiated,
        _consumeAnim,
        _consumeSound,
        _soundPlayed
    ],
    _fnc_onSuccess,
    _fnc_onFailure,
    _consumeText,
    _fnc_condition,
    ["isNotInside"]
] call ACE_common_fnc_progressBar;
