/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\functions\ace_medical\fn_actionCheckBloodPressureLocal.sqf
 *	by Ojemineh
 *	
 *	local callback for checking the blood pressure of a patient.
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
 *	[bob, kevin] call ACE_medical_fnc_actionCheckBloodPressureLocal;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_medic", "_patient", "_bodyPart"];

private _bloodPressure = if (Not alive _patient) then {
    [0,0]
} else {
    [_patient] call ACE_medical_fnc_getBloodPressure;
};

_bloodPressure params [ "_bloodPressureLow", "_bloodPressureHigh"];

private _output = "";
private _outputEx = "";
private _logOutPut = "";

if ([_medic] call ACE_medical_fnc_isMedic) then {
	
	//if (_bloodPressureHigh > 20) then {
	if (_bloodPressureHigh > 1) then {
		_output = localize "STR_AXE_Medical_Check_Bloodpressure_Output_1";
		_logOutPut = format ["%1/%2", round _bloodPressureHigh, round _bloodPressureLow];
	} else {
		_output = localize "STR_AXE_Medical_Check_Bloodpressure_Output_4";
		_logOutPut = localize "STR_AXE_Medical_Check_Bloodpressure_None";
	};
	
} else {
	
    //if (_bloodPressureHigh > 20) then {
    if (_bloodPressureHigh > 1) then {
        _output = localize "STR_AXE_Medical_Check_Bloodpressure_Output_2";
        _outputEx = format ["<t color='#ffff00'>%1</t>", localize "STR_ACE_Medical_Check_Bloodpressure_Low"];
        _logOutPut = localize "STR_ACE_Medical_Check_Bloodpressure_Low";
        if (_bloodPressureHigh > 100) then {
			_output = localize "STR_AXE_Medical_Check_Bloodpressure_Output_2";
			_outputEx = format ["<t color='#00ff00'>%1</t>", localize "STR_ACE_Medical_Check_Bloodpressure_Normal"];
			_logOutPut = localize "STR_ACE_Medical_Check_Bloodpressure_Normal";
            if (_bloodPressureHigh > 160) then {
				_output = localize "STR_AXE_Medical_Check_Bloodpressure_Output_2";
				_outputEx = format ["<t color='#ffff00'>%1</t>", localize "STR_ACE_Medical_Check_Bloodpressure_High"];
				_logOutPut = localize "STR_ACE_Medical_Check_Bloodpressure_High";
            };
        };
    } else {
		_output = localize "STR_AXE_Medical_Check_Bloodpressure_Output_4";
		_outputEx = format ["<t color='#ff0000'>%1</t>", localize "STR_AXE_Medical_Check_Bloodpressure_None"];
		_logOutPut = localize "STR_AXE_Medical_Check_Bloodpressure_None";
    };
	
};

if (_bodyPart in ["hand_l","hand_r"] && {[_patient, _bodyPart] call ACE_medical_fnc_hasTourniquetAppliedTo}) then {
	_output = localize "STR_AXE_Medical_Check_Bloodpressure_Output_4";
    _logOutPut = localize "STR_AXE_Medical_Check_Bloodpressure_None";
};

private _arg1 = format [hint_tpl_var_1, [_patient] call ACE_common_fnc_getName];
private _arg2 = "";
private _hint = "";

if (_outputEx isEqualTo "") then {
	private _tmp = format ["%1/%2", round _bloodPressureHigh, round _bloodPressureLow];
	if (_bloodPressureHigh >= 1) then {
		_hint = format ["<t color='#ff0000'>%1</t>", _tmp];
		if (_bloodPressureHigh >= 90) then {
			_hint = format ["<t color='#ffff00'>%1</t>", _tmp];
			if (_bloodPressureHigh >= 110) then {
				_hint = format ["<t color='#00ff00'>%1</t>", _tmp];
				if (_bloodPressureHigh >= 130) then {
					_hint = format ["<t color='#ffff00'>%1</t>", _tmp];
					if (_bloodPressureHigh >= 140) then {
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
    [_patient, "quick_view", localize "STR_ACE_Medical_Check_Bloodpressure_Log", [[_medic] call ACE_common_fnc_getName, _logOutPut]] call ACE_medical_fnc_addToLog;
};

["ace_common_displayTextStructured", [[_output, _arg1, _arg2], 3.0, _medic], [_medic]] call CBA_fnc_targetEvent;
