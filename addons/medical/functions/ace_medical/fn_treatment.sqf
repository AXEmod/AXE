/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\functions\ace_medical\fn_treatment.sqf
 *	by Ojemineh
 *	
 *	use equipment if any is available
 *	
 *	Arguments:
 *	0: medic		- <OBJECT>
 *	1: patient		- <OBJECT>
 *	2: body part	- <STRING>
 *	3: className	- <STRING>
 *	
 *	Return:
 *  <BOOLEAN>
 *	
 *	Example:
 *	[medic, patient, "SelectionName", "bandage"] call ACE_medical_fnc_treatment
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_medic", "_patient", "_bodyPart", "_className"];

// If the cursorMenu is open, the loading bar will fail. If we execute the function one frame later, it will work fine
if (uiNamespace getVariable ["ace_interact_menu_cursorMenuOpened", false]) exitWith {
    [ACE_medical_fnc_treatment, _this] call CBA_fnc_execNextFrame;
};

if !(_patient isKindOf "CAManBase") exitWith {false};

private _config = (configFile >> "ACE_Medical_Actions" >> "Basic" >> _className);
if (ace_medical_level >= 2) then {
    _config = (configFile >> "ACE_Medical_Actions" >> "Advanced" >> _className);
};

if !(isClass _config) exitWith {false};

// Allow self treatment check
if (_medic == _patient && {getNumber (_config >> "allowSelfTreatment") == 0}) exitWith {false};

private _medicRequired = if (isNumber (_config >> "requiredMedic")) then {
    getNumber (_config >> "requiredMedic");
} else {
    // Check for required class
    if (isText (_config >> "requiredMedic")) exitWith {
        missionNamespace getVariable [(getText (_config >> "requiredMedic")), 0];
    };
    0;
};

if !([_medic, _medicRequired] call ACE_medical_fnc_isMedic) exitWith {false};

private _allowedSelections = getArray (_config >> "allowedSelections");
if !("All" in _allowedSelections || {(_bodyPart in _allowedSelections)}) exitWith {false};

// Check item
private _items = getArray (_config >> "items");
if (count _items > 0 && {!([_medic, _patient, _items] call ACE_medical_fnc_hasItems)}) exitWith {false};

private _return = true;
if (isText (_config >> "condition")) then {
    private _condition = getText(_config >> "condition");
    if (_condition != "") then {
        if (isnil _condition) then {
            _condition = compile _condition;
        } else {
            _condition = missionNamespace getVariable _condition;
        };
        if (_condition isEqualType false) then {
            _return = _condition;
        } else {
            _return = [_medic, _patient, _bodyPart, _className] call _condition;
        };
    };
};
if (!_return) exitWith {false};

private _patientStateCondition = if (isText(_config >> "patientStateCondition")) then {
    missionNamespace getVariable [getText(_config >> "patientStateCondition"), 0]
} else {
    getNumber(_config >> "patientStateCondition")
};
if (_patientStateCondition == 1 && {!([_patient] call ACE_medical_fnc_isInStableCondition)}) exitWith {false};

// Check allowed locations
private _locations = getArray (_config >> "treatmentLocations");

if ("All" in _locations) then {
    _return = true;
} else {
    private _medFacility = {([_medic] call ACE_medical_fnc_isInMedicalFacility) || ([_patient] call ACE_medical_fnc_isInMedicalFacility)};
    private _medVeh = {([_medic] call ACE_medical_fnc_isInMedicalVehicle) || ([_patient] call ACE_medical_fnc_isInMedicalVehicle)};

    {
        if (_x == "field") exitWith {_return = true;};
        if (_x == "MedicalFacility" && _medFacility) exitWith {_return = true;};
        if (_x == "MedicalVehicle" && _medVeh) exitWith {_return = true;};
        if !(isnil _x) exitWith {
            private _val = missionNamespace getVariable _x;
            if (_val isEqualType 0) then {
                _return = switch (_val) do {
                    case 0: {true};										// AdvancedMedicalSettings_anywhere
                    case 1: {call _medVeh};								// AdvancedMedicalSettings_vehicle
                    case 2: {call _medFacility};						// AdvancedMedicalSettings_facility
                    case 3: {(call _medFacility) || {call _medVeh}};	// AdvancedMedicalSettings_vehicleAndFacility
                    default {false};									// Disabled
                };
            };
        };
    } foreach _locations;
};

if !(_return) exitWith {false};

private _usersOfItems = [];
private _consumeItems = if (isNumber (_config >> "itemConsumed")) then {
    getNumber (_config >> "itemConsumed");
} else {
    // Check for required class
    if (isText (_config >> "itemConsumed")) exitWith {
        missionNamespace getVariable [(getText (_config >> "itemConsumed")), 0];
    };
    0;
};
if (_consumeItems > 0) then {
    _usersOfItems = ([_medic, _patient, _items] call ACE_medical_fnc_useItems) select 1;
};

// Parse the config for the progress callback
private _callbackProgress = getText (_config >> "callbackProgress");
if (_callbackProgress == "") then {
    _callbackProgress = "true";
};
if (isNil _callbackProgress) then {
    _callbackProgress = compile _callbackProgress;
} else {
    _callbackProgress = missionNamespace getVariable _callbackProgress;
};

// Patient Animation
private _patientAnim = getText (_config >> "animationPatient");
if (_patient getVariable ["ACE_isUnconscious", false] && ace_medical_allowUnconsciousAnimationOnTreatment) then {
    if !(animationState _patient in (getArray (_config >> "animationPatientUnconsciousExcludeOn"))) then {
        _patientAnim = getText (_config >> "animationPatientUnconscious");
    };
};

if (_medic != _patient && {vehicle _patient == _patient} && {_patientAnim != ""}) then {
    if (_patient getVariable ["ACE_isUnconscious", false]) then {
        [_patient, _patientAnim, 2, true] call ACE_common_fnc_doAnimation;
    } else {
        [_patient, _patientAnim, 1, true] call ACE_common_fnc_doAnimation;
    };
};

// Player Animation
private _medicAnim = [getText (_config >> "animationCaller"), getText (_config >> "animationCallerProne")] select (stance _medic == "PRONE");
if (_medic == _patient) then {
    _medicAnim = [getText (_config >> "animationCallerSelf"), getText (_config >> "animationCallerSelfProne")] select (stance _medic == "PRONE");
};

_medic setVariable ["ace_medical_selectedWeaponOnTreatment", (weaponState _medic)];

// Cannot use secondairy weapon for animation
if (currentWeapon _medic == secondaryWeapon _medic) then {
    _medic selectWeapon (primaryWeapon _medic);
};

private _wpn = ["non", "rfl", "pst"] select (1 + ([primaryWeapon _medic, handgunWeapon _medic] find (currentWeapon _medic)));
private _medicAnim = [_medicAnim, "[wpn]", _wpn] call CBA_fnc_replace;
if (vehicle _medic == _medic && {_medicAnim != ""}) then {
    if (primaryWeapon _medic == "") then {
        _medic addWeapon "ACE_FakePrimaryWeapon";
    };
    if (currentWeapon _medic == "") then {
        _medic selectWeapon (primaryWeapon _medic); // unit always has a primary weapon here
    };

    if !(_medic call ACE_common_fnc_isSwimming) then {
        // Weapon on back also does not work underwater
        if (isWeaponDeployed _medic) then {
            //TRACE_1("Weapon Deployed, breaking out first",(stance _medic));
            [_medic, "", 0] call ACE_common_fnc_doAnimation;
        };

        if ((stance _medic) == "STAND") then {
            switch (_wpn) do {//If standing, end in a crouched animation based on their current weapon
                case ("rfl"): {_medic setVariable ["ace_medical_treatmentPrevAnimCaller", "AmovPknlMstpSrasWrflDnon"];};
                case ("pst"): {_medic setVariable ["ace_medical_treatmentPrevAnimCaller", "AmovPknlMstpSrasWpstDnon"];};
                case ("non"): {_medic setVariable ["ace_medical_treatmentPrevAnimCaller", "AmovPknlMstpSnonWnonDnon"];};
            };
        } else {
            _medic setVariable ["ace_medical_treatmentPrevAnimCaller", animationState _medic];
        };
        [_medic, _medicAnim] call ACE_common_fnc_doAnimation;
    };
};

//Get treatment time
private _treatmentTime = if (isNumber (_config >> "treatmentTime")) then {
    getNumber (_config >> "treatmentTime");
} else {
    if (isText (_config >> "treatmentTime")) exitWith {
        private _treatmentTimeConfig = getText(_config >> "treatmentTime");
        if (isnil _treatmentTimeConfig) then {
            _treatmentTimeConfig = compile _treatmentTimeConfig;
        } else {
            _treatmentTimeConfig = missionNamespace getVariable _treatmentTimeConfig;
        };
        if (_treatmentTimeConfig isEqualType 0) exitWith {
            _treatmentTimeConfig;
        };
        [_medic, _patient, _bodyPart, _className] call _treatmentTimeConfig;
    };
    0;
};

// ####

if (missionNamespace getVariable ["axe_medical_stethoscope_enabled", false]) then {
	
	private _modifier = 0;
	
	if (_className in ["CheckPulse", "CheckBloodPressure", "CheckResponse", "CheckLimbs", "Diagnose"]) then {
		if ("AXE_Stethoscope" in items _medic) then {
			_modifier = -2;
		} else {
			_modifier = +2;
		};
	};
	
	private _newTreatmentTime = 0;
	_newTreatmentTime = _treatmentTime + _modifier;
	if (_newTreatmentTime <= 1) then {_newTreatmentTime = 1;};
	_treatmentTime = _newTreatmentTime;
	
};

// ####

// Start treatment
[
    _treatmentTime,
    [_medic, _patient, _bodyPart, _className, _items, _usersOfItems],
    ACE_medical_fnc_treatment_success,
    ACE_medical_fnc_treatment_failure,
    getText (_config >> "displayNameProgress"),
    _callbackProgress,
    ["isNotInside", "isNotSwimming"]
] call ACE_common_fnc_progressBar;

// Display Icon
private _iconDisplayed = getText (_config >> "actionIconPath");
if (_iconDisplayed != "") then {
    ["ace_medical_treatmentActionIcon", true, _iconDisplayed, [1,1,1,1], getNumber(_config >> "actionIconDisplayTime")] call ACE_common_fnc_displayIcon;
};

// handle display of text/hints
private _displayText = "";
if (_patient != _medic) then {
    _displayText = getText(_config >> "displayTextOther");
} else {
    _displayText = getText(_config >> "displayTextSelf");
};

if (_displayText != "") then {
    ["ace_common_displayTextStructured", [[_displayText, [_medic] call ACE_common_fnc_getName, [_patient] call ACE_common_fnc_getName], 1.5, _medic], [_medic]] call CBA_fnc_patientEvent;
};

true