/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_fatigue\functions\ace_advanced_fatigue\fn_handleEffects.sqf
 *	by Ojemineh
 *	
 *	handle fatigue effects
 *	
 *	Arguments:
 *  0: Unit				- <OBJECT>
 *  1: Fatigue			- <NUMBER>
 *  2: Speed			- <NUMBER>
 *  3: Overexhausted	- <BOOLEAN>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[_player, 0.5, 3.3, true] call ACE_advanced_fatigue_fnc_handleEffects;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_unit", "_fatigue", "_speed", "_overexhausted"];

#ifdef DEBUG_MODE_FULL
    systemChat str _fatigue;
    systemChat str vectorMagnitude velocity _unit;
#endif

// - Audible effects -------------------------------------------------------------------------------

private _globalSounds = (missionNamespace getVariable ["axe_fatigue_global_sounds", false]);
private _breathSound = "";
private _pain = player getVariable ["ace_medical_pain", 0];
private _painSuppress = player getVariable ["ace_medical_painSuppress", 0];

if (isNil "axe_advanced_fatigue_breathVoice") then { 
	axe_advanced_fatigue_breathVoice = selectRandom [0,1,2,3,4,5,6,7];
	if (_globalSounds) then {[5, "Use Global Sounds", [], "fatigue"] call AXE_fnc_diagLog;};
	[5, "Selected Voice: %1", [axe_advanced_fatigue_breathVoice], "fatigue"] call AXE_fnc_diagLog;
};
ace_advanced_fatigue_lastBreath = ace_advanced_fatigue_lastBreath + 1;

if (_fatigue > 0.4 && {ace_advanced_fatigue_lastBreath > (_fatigue * -10 + 9)} && {!underwater _unit}) then {
    switch (true) do {
        case (_fatigue < 0.6): {
			_breathSound = "AXE_Advanced_Fatigue_BreathLow";
			if (_pain > _painSuppress) then {_breathSound = ["AXE_Advanced_Fatigue_BreathLow", "AXE_Advanced_Fatigue_BreathInjuredLow"] select ((random 1) > 0.66);};
			if (_globalSounds) then {
				[_breathSound + format ["_%1_%2", axe_advanced_fatigue_breathVoice, selectRandom [0,1,2,3,4]], _unit, AGLToASL (_unit modelToWorld (_unit selectionPosition "head")), 60, 1.4, -1, false] call AXE_fnc_playSound3d;
			} else {
				playSound (_breathSound + format ["_%1_%2", axe_advanced_fatigue_breathVoice, selectRandom [0,1,2,3,4]]);
			};
        };
        case (_fatigue < 0.85): {
			_breathSound = "AXE_Advanced_Fatigue_BreathMid";
			if (_pain > _painSuppress) then {_breathSound = ["AXE_Advanced_Fatigue_BreathMid", "AXE_Advanced_Fatigue_BreathInjuredMid"] select ((random 1) > 0.66);};
			if (_globalSounds) then {
				[_breathSound + format ["_%1_%2", axe_advanced_fatigue_breathVoice, selectRandom [0,1,2,3,4]], _unit, AGLToASL (_unit modelToWorld (_unit selectionPosition "head")), 60, 1.4, -1, false] call AXE_fnc_playSound3d;
			} else {
				playSound (_breathSound + format ["_%1_%2", axe_advanced_fatigue_breathVoice, selectRandom [0,1,2,3,4]]);
			};
        };
        default {
			_breathSound = "AXE_Advanced_Fatigue_BreathMax";
			if (_pain > _painSuppress) then {_breathSound = ["AXE_Advanced_Fatigue_BreathMax", "AXE_Advanced_Fatigue_BreathInjuredMax"] select ((random 1) > 0.66);};
			if (_globalSounds) then {
				[_breathSound + format ["_%1_%2", axe_advanced_fatigue_breathVoice, selectRandom [0,1,2,3,4]], _unit, AGLToASL (_unit modelToWorld (_unit selectionPosition "head")), 60, 1.4, -1, false] call AXE_fnc_playSound3d;
			} else {
				playSound (_breathSound + format ["_%1_%2", axe_advanced_fatigue_breathVoice, selectRandom [0,1,2,3,4]]);
			};
        };
    };
    ace_advanced_fatigue_lastBreath = 0;
};

// - Visual effects --------------------------------------------------------------------------------
ace_advanced_fatigue_ppeBlackoutLast = ace_advanced_fatigue_ppeBlackoutLast + 1;
if (ace_advanced_fatigue_ppeBlackoutLast == 1) then {
    ace_advanced_fatigue_ppeBlackout ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
    ace_advanced_fatigue_ppeBlackout ppEffectCommit 1;
} else {
    if (_fatigue > 0.85) then {
        if (ace_advanced_fatigue_ppeBlackoutLast > (100 - _fatigue * 100) / 3) then {
            ace_advanced_fatigue_ppeBlackout ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[2,2,0,0,0,0.1,0.5]];
            ace_advanced_fatigue_ppeBlackout ppEffectCommit 1;
            ace_advanced_fatigue_ppeBlackoutLast = 0;
        };
    };
};

// - Physical effects ------------------------------------------------------------------------------
if (ace_advanced_fatigue_isSwimming) exitWith {
    _unit setAnimSpeedCoef linearConversion [0.7, 0.9, _fatigue, 1, 0.5, true];

    if ((isSprintAllowed _unit) && {_fatigue > 0.7}) then {
        [_unit, "blockSprint", "ace_advanced_fatigue", true] call ACE_common_fnc_statusEffect_set;
    } else {
        if ((!isSprintAllowed _unit) && {_fatigue < 0.7}) then {
            [_unit, "blockSprint", "ace_advanced_fatigue", false] call ACE_common_fnc_statusEffect_set;
        };
    };
};
if ((getAnimSpeedCoef _unit) != 1) then {
    _unit setAnimSpeedCoef 1;
};

if (_overexhausted) then {
    [_unit, "forceWalk", "ace_advanced_fatigue", true] call ACE_common_fnc_statusEffect_set;
} else {
    if (isForcedWalk _unit && {_fatigue < 0.7}) then {
        [_unit, "forceWalk", "ace_advanced_fatigue", false] call ACE_common_fnc_statusEffect_set;
    } else {
        if ((isSprintAllowed _unit) && {_fatigue > 0.7}) then {
            [_unit, "blockSprint", "ace_advanced_fatigue", true] call ACE_common_fnc_statusEffect_set;
        } else {
            if ((!isSprintAllowed _unit) && {_fatigue < 0.6}) then {
                [_unit, "blockSprint", "ace_advanced_fatigue", false] call ACE_common_fnc_statusEffect_set;
            };
        };
    };
};

switch (stance _unit) do {
	case ("CROUCH"): {
		[_unit, "ace_advanced_fatigue", (1.0 + _fatigue ^ 2 * 0.1) * ace_advanced_fatigue_swayFactor] call ACE_common_fnc_setAimCoef;
	};
	case ("PRONE"): {
		[_unit, "ace_advanced_fatigue", (1.0 + _fatigue ^ 2 * 2.0) * ace_advanced_fatigue_swayFactor] call ACE_common_fnc_setAimCoef;
	};
	default {
		[_unit, "ace_advanced_fatigue", (1.5 + _fatigue ^ 2 * 3.0) * ace_advanced_fatigue_swayFactor] call ACE_common_fnc_setAimCoef;
	};
};
