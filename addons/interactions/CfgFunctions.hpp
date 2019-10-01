class CfgFunctions {
	
	class AXE_Interactions {
		
		tag = "axe_interactions";
		
		class Interactions {
			file = "\axe_interactions\functions";
			class initialize {};
			class initSettings {};
		};
		
		class Inventory {
			file = "\axe_interactions\functions\inventory";
			class backpack_canAccess {};
			class backpack_doAccess {};
			class backpack_access {};
			class gear_canAccess {};
			class gear_doAccess {};
			class gear_access {};
		};
		
		class TapShoulder {
			file = "\axe_interactions\functions\tapshoulder";
			class tapshoulder_canTap {};
			class tapshoulder_doTap {};
			class tapshoulder_tap {};
		};
		
	};
	
};
