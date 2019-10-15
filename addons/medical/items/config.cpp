#include "..\script_component.hpp"

class CfgPatches {
	
	class AXE_Medical_Items {
		name = "$STR_AXE_Medical_Items_Title";
		addonRootClass = "AXE_Medical";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"a3_props_f_orange",
			"axe_medical"
		};
		units[] = {
			"AXE_Item_Stethoscope"
		};
		weapons[] = {
			"AXE_Stethoscope"
		};
		author = "$STR_AXE_Medical_Items_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Medical_Items_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
