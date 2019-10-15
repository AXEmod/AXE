#include "script_component.hpp"
#include "BIS_AddonInfo.hpp"

class CfgPatches {
	
	class AXE_Fatigue {
		name = "$STR_AXE_Fatigue_Title";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"ace_advanced_fatigue",
			"axe_common"
		};
		units[] = {};
		weapons[] = {};
		author = "$STR_AXE_Fatigue_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Fatigue_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
