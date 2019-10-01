class CfgFunctions {
	
	class AXE_Hints {
		
		tag = "axe_hints";
		
		class Hints {
			file = "\axe_hints\functions";
			class cleanup {};
			class initialize {};
			class initSettings {};
		};
		
	};
	
	class AXE_Hints_Functions {
		
		tag = "axe";
		
		class Hints {
			file = "\axe_hints\functions";
			class hint {};
			class hintGlobal {};
		};
		
	};
	
	class AXE_Hints_ACE {
		
		tag = "ace_common";
		
		class ace_common {
			file = "\axe_hints\functions\ace_common";
			class displayIcon {};
			class displayIconEx { file = "\z\ace\addons\common\functions\fnc_displayIcon.sqf"; };
			class displayText {};
			class displayTextEx { file = "\z\ace\addons\common\functions\fnc_displayText.sqf"; };
			class displayTextPicture {};
			class displayTextPictureEx { file = "\z\ace\addons\common\functions\fnc_displayTextPicture.sqf"; };
			class displayTextStructured {};
			class displayTextStructuredEx { file = "\z\ace\addons\common\functions\fnc_displayTextStructured.sqf"; };
			class stringToColoredText {};
		};
		
	};
	
	class AXE_Hints_CBA {
		
		tag = "cba";
		
		class cba_ui {
			file = "\axe_hints\functions\cba_ui";
			class notify {};
			class notifyEx { recompile = 1; file = "\x\cba\addons\ui\fnc_notify.sqf"; };
		};
		
	};
	
};
