class ACE_Head {
	
	class AXE_Glasses_Action_Blindfold_PutOn {
		displayName = "$STR_AXE_Glasses_Action_Blindfold_PutOn";
		condition = "[_player, _target] call AXE_glasses_fnc_blindfold_canPutOn";
		statement = "[_player, _target] call AXE_glasses_fnc_blindfold_doPutOn";
		exceptions[] = {"isNotInside", "isNotSitting"};
		icon = "";
		distance = 2.0;
		showDisabled = 0;
	};
	
	class AXE_Glasses_Action_Blindfold_Remove {
		displayName = "$STR_AXE_Glasses_Action_Blindfold_Remove";
		condition = "[_player, _target] call AXE_glasses_fnc_blindfold_canRemove";
		statement = "[_player, _target] call AXE_glasses_fnc_blindfold_doRemove";
		exceptions[] = {"isNotInside", "isNotSitting"};
		icon = "";
		distance = 2.0;
		showDisabled = 0;
	};
	
};
