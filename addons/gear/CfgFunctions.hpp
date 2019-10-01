class CfgFunctions {
	
	class AXE_Gear {
		
		tag = "axe_gear";
		
		class Gear {
			file = "\axe_gear\functions";
			class initialize {};
			class initSettings {};
		};
		
		class Common {
			file = "\axe_gear\functions\common";
			class initPlayer {};
			class removeAll {};
			class restore {};
			class set {};
			class store {};
		};
		
		class Load {
			file = "\axe_gear\functions\load";
			class load {};
			class load_loadout {};
			class load_properties {};
		};
		
	};
	
};
