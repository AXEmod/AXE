/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\functions\ace_medical\fn_actionCheckResponse.sqf
 *	by Ojemineh
 *	
 *	overwrite ace medical actionCheckResponse
 *	
 *	Arguments:
 *	0: medic		- <OBJECT>
 *	1: patient		- <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[bob, kevin] call ACE_medical_fnc_actionCheckResponse;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_medic", "_patient"];

private _medicName = [_medic] call ACE_common_fnc_getName;
private _patientName = [_patient] call ACE_common_fnc_getName;

private _output = localize "STR_AXE_Medical_Check_Response_Output";
private _outputEx = "";

if ([_patient] call ACE_common_fnc_isAwake) then {
	_outputEx = format ["<t color='#00ff00'>%1</t>", localize "STR_AXE_Medical_Check_Response_Responsive"];
} else {
	_outputEx = format ["<t color='#ff0000'>%1</t>", localize "STR_AXE_Medical_Check_Response_Unresponsive"];
};

private _arg1 = format [hint_tpl_var_1, _patientName];
private _arg2 = format [hint_tpl_var_1, _outputEx];

["ace_common_displayTextStructured", [[_output, _arg1, _arg2], 3, _medic], [_medic]] call CBA_fnc_targetEvent;

private _log1 = [
	localize "STR_AXE_Medical_Check_Response_Unresponsive", 
	localize "STR_AXE_Medical_Check_Response_Responsive"
] select ([_patient] call ACE_common_fnc_isAwake);
private _logOutput = format [localize "STR_AXE_Medical_Check_Response_Log_Output", _medicName, _log1];

[_patient, "quick_view", _logOutput, [[_patient, false, true] call ACE_common_fnc_getName]] call ACE_medical_fnc_addToLog;
