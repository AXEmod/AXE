#include "script_component.hpp"
#include "BIS_AddonInfo.hpp"

class CfgPatches {
	
	class AXE_Glasses {
		name = "$STR_AXE_Glasses_Title";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"a3_characters_f_enoch",
			"axe_common"
		};
		units[] = {};
		weapons[] = {};
		author = "$STR_AXE_Glasses_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Glasses_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgGlasses.hpp"
#include "CfgVehicles.hpp"
