class CfgFunctions {
	
	class AXE_Teleport {
		
		tag = "axe_teleport";
		
		class Teleport {
			file = "\axe_teleport\functions";
			class initialize {};
			class initSettings {};
		};
		
		class Common {
			file = "\axe_teleport\functions\common";
			class toGroup {};
			class toMarker {};
			class toPos {};
			class toUnit {};
		};
		
		class Flag {
			file = "\axe_teleport\functions\flag";
			class flag_getFlags {};
			class flag_getGroups {};
			class flag_isEnabled {};
			class flag_showFlags {};
			class flag_showGroups {};
			class flag_toFlag {};
			class flag_toGroup {};
		};
		
	};
	
};
