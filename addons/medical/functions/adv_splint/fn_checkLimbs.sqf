/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\functions\adv_splint\fn_checkLimbs.sqf
 *	by Ojemineh
 *	
 *	initialize medical addon
 *	
 *	Arguments:
 *	0: medic		- <OBJECT>
 *	1: patient		- <OBJECT>
 *	2: body part	- <STRING>
 *	3: treatment	- <STRING>
 *	4: item			- <STRING>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_medical_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_medic", "_patient", "_bodyPart", "_treatment", "_item"];

if (isNull _medic) exitWith {};
if (isNull _patient) exitWith {};

// -------------------------------------------------------------------------------------------------

private _medicName = [_medic] call ACE_common_fnc_getName;
private _patientName = format [hint_tpl_var_1, [_patient] call ACE_common_fnc_getName];

private _iconTemplate = "<img size='2.0' shadow='0' image='%1' />";
private _iconHands = "";
private _iconLegs = "";

private _logHands = "";
private _logLegs = "";

if ( _patient getHitPointDamage "HitHands" < 0.5 ) then {
	_iconHands = format [_iconTemplate, "\axe_medical\data\icons\splint_hand_0_ca.paa"];
	_logHands = localize "STR_AXE_Medical_Splint_Log_Hands_Normal";
} else {
	_iconHands = format [_iconTemplate, "\axe_medical\data\icons\splint_hand_1_ca.paa"];
	_logHands = localize "STR_AXE_Medical_Splint_Log_Hands_Splint";
};

if ( _patient getHitPointDamage "HitLegs" < 0.5 ) then {
	_iconLegs = format [_iconTemplate, "\axe_medical\data\icons\splint_leg_0_ca.paa"];
	_logLegs = localize "STR_AXE_Medical_Splint_Log_Legs_Normal";
} else {
	_iconLegs = format [_iconTemplate, "\axe_medical\data\icons\splint_leg_1_ca.paa"];
	_logLegs = localize "STR_AXE_Medical_Splint_Log_Legs_Splint";
};

private _message = format [localize "STR_AXE_Medical_Splint_Output", _patientName, _iconHands, _iconLegs];

["ace_common_displayTextStructured", [_message, 4.0, _medic], [_medic]] call CBA_fnc_targetEvent;

private _logOutput = format [localize "STR_AXE_Medical_Splint_Log", _medicName, _logHands, _logLegs];

[_patient, "activity", _logOutput, [[_patient, false, true] call ACE_common_fnc_getName]] call ACE_medical_fnc_addToLog;
[_patient, "quick_view", _logOutput, [[_patient, false, true] call ACE_common_fnc_getName]] call ACE_medical_fnc_addToLog;
