#include "\a3\ui_f\hpp\defineResinclDesign.inc"
/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_mainmenu\scripts\versionInfo.sqf
 *	by Ojemineh
 *	
 *	show version info box
 *	
 *	Arguments:
 *	0: Display	- <DISPLAY>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[0] execVM "\axe_mainmenu\scripts\versionInfo.sqf";
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_display"];

private _controlsGroup = _display displayCtrl 90090;

// -------------------------------------------------------------------------------------------------

private _projectOPFOR = isClass (configfile >> "CfgPatches" >> "po_main");

// -------------------------------------------------------------------------------------------------

if (profileNamespace getVariable ["axe_showNewsOnMainMenu", true]) then {
	
	if (_projectOPFOR) then {
		private _poCtrl = _display displayCtrl 1299;
		_poCtrl ctrlShow false;
	};
	
    _controlsGroup ctrlShow true;
	
    private _fnc_onSetFocus = {
		
        params ["_control"];
        private _controlsGroup = ctrlParentControlsGroup _control;

        (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BACKGROUND) ctrlSetTextColor [1,1,1,1];
        (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BACKGROUND_ICON) ctrlSetTextColor [1,1,1,1];
        (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_ICON) ctrlSetTextColor [0,0,0,1];
		
    };
	
    private _fnc_onKillFocus = {
		
        params ["_control"];
        private _controlsGroup = ctrlParentControlsGroup _control;

        (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BACKGROUND) ctrlSetTextColor [0,0,0,0.75];
        (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BACKGROUND_ICON) ctrlSetTextColor [0,0,0,0.75];
        (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_ICON) ctrlSetTextColor [1,1,1,0.5];
		
    };
	
    (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BUTTON) ctrlAddEventHandler ["MouseEnter", _fnc_onSetFocus];
    (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BUTTON) ctrlAddEventHandler ["MouseExit", _fnc_onKillFocus];
    (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BUTTON) ctrlAddEventHandler ["SetFocus", _fnc_onSetFocus];
    (_controlsGroup controlsGroupCtrl IDC_MAIN_INFO_BUTTON) ctrlAddEventHandler ["KillFocus", _fnc_onKillFocus];
	
    private _versionStr = getText (configFile >> "CfgPatches" >> "axe_main" >> "versionStr") splitString ".";
    _versionStr resize 3;
    _versionStr = _versionStr joinString ".";
	
    (_display displayCtrl 90091) ctrlSetText format ["Version: %1", _versionStr];
    (_display displayCtrl 90092) htmlLoad (localize "STR_AXE_Addon_URL_Version");
	
} else {
	
    _controlsGroup ctrlShow false;
	
	if (_projectOPFOR) then {
		private _poCtrl = _display displayCtrl 1299;
		_poCtrl ctrlShow true;
	};
	
};
