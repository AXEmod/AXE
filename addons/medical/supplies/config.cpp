#include "\axe_main\script_macros.hpp"

class CfgPatches {
	
	class AXE_Medical_Supplies {
		name = "$STR_AXE_Medical_Supplies_Title";
		addonRootClass = "AXE_Medical";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"a3_props_f_orange",
			"axe_medical"
		};
		units[] = {
			"AXE_Item_FirstAid",
			"AXE_Item_MedicKit"
		};
		weapons[] = {
			"AXE_FirstAid",
			"AXE_MedicKit"
		};
		author = "$STR_AXE_Medical_Supplies_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Medical_Supplies_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
