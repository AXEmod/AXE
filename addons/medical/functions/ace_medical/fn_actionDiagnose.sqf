/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\functions\ace_medical\fn_actionDiagnose.sqf
 *	by Ojemineh
 *	
 *	overwrite ace medical actionDiagnose
 *	
 *	Arguments:
 *	0: medic		- <OBJECT>
 *	1: patient		- <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[bob, kevin] call ACE_medical_fnc_actionDiagnose;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_medic", "_patient"];

private _genericMessages = [localize "STR_ACE_Medical_diagnoseMessage", [_patient] call ACE_common_fnc_getName];

if (alive _patient) then {
    _genericMessages pushBack (localize "STR_ACE_Medical_diagnoseAlive");
} else {
    _genericMessages pushBack (localize "STR_ACE_Medical_diagnoseDead");
};

if (_patient getVariable["ace_medical_hasLostBlood", 0] > 0) then {
    if (_patient getVariable["ace_medical_hasLostBlood", 0] > 1) then {
        _genericMessages pushBack (localize "STR_ACE_Medical_lostBloodALot");
    } else {
        _genericMessages pushBack (localize "STR_ACE_Medical_lostBlood");
    };
} else {
    _genericMessages pushBack (localize "STR_ACE_Medical_noBloodloss");
};

if (alive _patient) then {
    if (_patient getVariable["ace_medical_hasPain", false]) then {
        _genericMessages pushBack (localize "STR_ACE_Medical_inPain");
    } else {
        _genericMessages pushBack (localize "STR_ACE_Medical_noPain");
    };
} else {
	_genericMessages pushBack (localize "STR_AXE_Medical_NoPainIfDead");
};

["ace_common_displayTextStructured", [_genericMessages, 3.5, _medic], [_medic]] call CBA_fnc_targetEvent;
