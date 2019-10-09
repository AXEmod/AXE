class CfgFunctions {
	
	class AXE_Glasses {
		
		tag = "axe_glasses";
		
		class Glasses {
			file = "\axe_glasses\functions";
			class initialize {};
			class initSettings {};
		};
		
		class Blindfold {
			file = "\axe_glasses\functions\blindfold";
			class blindfold_canPutOn {};
			class blindfold_canRemove {};
			class blindfold_doPutOn {};
			class blindfold_doRemove {};
		};
		
	};
	
};
