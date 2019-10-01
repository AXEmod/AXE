#include "\axe_main\script_macros.hpp"

class CfgPatches {
	
	class AXE_Medical_Crates {
		name = "$STR_AXE_Medical_Crates_Title";
		addonRootClass = "AXE_Medical";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"axe_medical"
		};
		units[] = {
			"AXE_Crate_Medical_Default",
			"AXE_Crate_Medical_Equipment",
			"AXE_Crate_Medical_Dressing",
			"AXE_Crate_Medical_Medicine",
			"AXE_Crate_Medical_Transfusion",
			"AXE_Crate_Medical_TransfusionEx",
			"AXE_Crate_Medical_Ordnance",
			"AXE_Crate_Medical_Supplies"
		};
		weapons[] = {};
		author = "$STR_AXE_Medical_Crates_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Medical_Crates_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgVehicles.hpp"
