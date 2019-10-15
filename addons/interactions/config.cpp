#include "script_component.hpp"
#include "BIS_AddonInfo.hpp"

class CfgPatches {

	class AXE_Interactions {
		name = "$STR_AXE_Interactions_Title";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"axe_common"
		};
		units[] = {};
		weapons[] = {};
		author = "$STR_AXE_Interactions_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Interactions_URL";
		VERSION_CONFIG;
	};

};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"

#include "CfgActions.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
