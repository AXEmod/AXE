#include "\axe_main\script_macros.hpp"

class CfgPatches {
	
	class AXE_Medical_Area {
		name = "$STR_AXE_Medical_Area_Title";
		addonRootClass = "AXE_Medical";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"a3_props_f_enoch",
			"axe_medical"
		};
		units[] = {
			"AXE_Item_MedicalArea"
		};
		weapons[] = {
			"AXE_MedicalArea"
		};
		author = "$STR_AXE_Medical_Area_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Medical_Area_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
