class CfgFunctions {
	
	class AXE_Fatigue {
		
		tag = "axe_fatigue";
		
		class Recline {
			file = "\axe_fatigue\functions";
			class initialize {};
			class initSettings {};
		};
		
	};
	
	class AXE_Fatigue_ACE {
		
		tag = "ace_advanced_fatigue";
		
		class ace_advanced_fatigue {
			file = "\axe_fatigue\functions\ace_advanced_fatigue";
			class handleEffects {};
		};
		
	};
	
};
