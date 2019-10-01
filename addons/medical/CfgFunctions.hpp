class CfgFunctions {
	
	class AXE_Medical {
		
		tag = "axe_medical";
		
		class Medical {
			file = "\axe_medical\functions";
			class initialize {};
			class initSettings {};
		};
		
	};
	
	class AXE_Medical_ACE_Medical {
		
		tag = "ace_medical";
		
		class ace_medical {
			file = "\axe_medical\functions\ace_medical";
			class actionCheckBloodPressureLocal {};
			class actionCheckPulseLocal {};
			class actionCheckResponse {};
			class actionDiagnose {};
			class actionRemoveTourniquet {};
			class itemCheck {};
			class treatment {};
			class useItem {};
		};
		
	};
	
	class AXE_Medical_ACE_Medical_Menu {
		
		tag = "ace_medical_menu";
		
		class ace_medical_menu {
			file = "\axe_medical\functions\ace_medical_menu";
			class updateActivityLog {};
			class updateQuickViewLog {};
		};
		
	};
	
	class adv_aceCPR_ace_medical {
		
		tag = "ace_medical";
		
		class ace_medical {
			class actionCheckPulseLocal { file = "\axe_medical\functions\ace_medical\fn_actionCheckPulseLocal.sqf"; };
		};
		
	};
	
	class adv_aceSplint {
		
		tag = "adv_aceSplint";
		
		class init {
			class checkLimbs { file = "\axe_medical\functions\adv_splint\fn_checkLimbs.sqf"; };
		};
		
	};
	
};
