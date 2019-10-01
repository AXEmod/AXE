/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\functions\ace_medical\fn_actionCheckPulseLocal.sqf
 *	by Ojemineh
 *	
 *	local callback for checking the pulse or heart rate of a patient.
 *	
 *	Arguments:
 *	0: medic		- <OBJECT>
 *	1: patient		- <OBJECT>
 *	2: body part	- <STRING>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[bob, kevin] call ACE_medical_fnc_actionCheckPulseLocal;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_medic", "_patient", "_bodyPart"];

private _heartRate = _patient getVariable ["ace_medical_heartRate", 80];
private _inRevive = _patient getVariable ["ace_medical_inReviveState",false];

if (Not alive _patient || _inRevive) then { _heartRate = 0; };

private _output = localize "STR_AXE_Medical_Check_Pulse_Output_3";
private _outputEx = "";
private _logOutPut = localize "STR_AXE_Medical_Check_Pulse_None";

if (_heartRate > 1) then {
    if ([_medic] call ace_medical_fnc_isMedic) then {
        _output = localize "STR_AXE_Medical_Check_Pulse_Output_1";
        _logOutPut = format ["%1", round(_heartRate)];
    } else {
        _output = localize "STR_AXE_Medical_Check_Pulse_Output_2";
        _outputEx = format ["<t color='#ffff00'>%1</t>", localize "STR_ACE_Medical_Check_Pulse_Weak"];
        _logOutPut = localize "STR_ACE_Medical_Check_Pulse_Weak";
        if (_heartRate > 60) then {
            if (_heartRate > 100) then {
                _output = localize "STR_AXE_Medical_Check_Pulse_Output_2";
                _outputEx = format ["<t color='#ffff00'>%1</t>", localize "STR_ACE_Medical_Check_Pulse_Strong"];
                _logOutPut = localize "STR_ACE_Medical_Check_Pulse_Strong";
            } else {
                _output = localize "STR_AXE_Medical_Check_Pulse_Output_2";
                _outputEx = format ["<t color='#00ff00'>%1</t>", localize "STR_ACE_Medical_Check_Pulse_Normal"];
                _logOutPut = localize "STR_ACE_Medical_Check_Pulse_Normal";
            };
        };
    };
};

if (_bodyPart in ["hand_l","hand_r"] && {[_patient, _bodyPart] call ACE_medical_fnc_hasTourniquetAppliedTo}) then {
    _output = localize "STR_AXE_Medical_Check_Pulse_Output_3";
    _logOutPut = localize "STR_AXE_Medical_Check_Pulse_None";
};

private _height = 3.0;

if (_inRevive) then {
	private _outputAdd = format [".<br/>%1", localize "STR_AXE_Medical_Need_CPR_AED"];
	_output = _output + _outputAdd;
	_height = 3.5;
};

private _arg1 = format [hint_tpl_var_1, [_patient] call ACE_common_fnc_getName];
private _arg2 = "";
private _hint = "";

if (_outputEx isEqualTo "") then {
	private _tmp = format ["%1 bpm", round(_heartRate)];
	if (_heartRate >= 1) then {
		_hint = format ["<t color='#ff0000'>%1</t>", _tmp];
		if (_heartRate >= 50) then {
			_hint = format ["<t color='#ffff00'>%1</t>", _tmp];
			if (_heartRate >= 70) then {
				_hint = format ["<t color='#00ff00'>%1</t>", _tmp];
				if (_heartRate >= 100) then {
					_hint = format ["<t color='#ffff00'>%1</t>", _tmp];
					if (_heartRate >= 120) then {
						_hint = format ["<t color='#ff0000'>%1</t>", _tmp];
					};
				};
			};
		};
	} else {
		_hint = format ["<t color='#ff0000'>%1</t>", _tmp];
	};
	_arg2 = format [hint_tpl_var_1, _hint];
} else {
	_arg2 = format [hint_tpl_var_1, _outputEx];
};

if (_logOutPut != "") then {
    [_patient, "quick_view", localize "STR_ACE_Medical_Check_Pulse_Log", [[_medic] call ACE_common_fnc_getName, _logOutPut]] call ACE_medical_fnc_addToLog;
};

["ace_common_displayTextStructured", [[_output, _arg1, _arg2], _height, _medic], [_medic]] call CBA_fnc_targetEvent;
