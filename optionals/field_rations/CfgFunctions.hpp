class CfgFunctions {
	
	class AXE_Field_Rations {
		
		tag = "axe_field_rations";
		
		class Field_Rations {
			file = "\axe_field_rations\functions";
			class consumeEnergy {};
			class consumeEnergyLoop {};
			class consumeFood {};
			class consumeWater {};
			class handleItem {};
			class initialize {};
			class initSettings {};
		};
		
	};
	
	class AXE_Field_Rations_ACEX {
		
		tag = "acex_field_rations";
		
		class acex_field_rations {
			file = "\axe_field_rations\functions\acex_field_rations";
			class consumeItem {};
		};
		
	};
	
};
