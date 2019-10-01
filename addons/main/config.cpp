#include "script_macros.hpp"
#include "BIS_AddonInfo.hpp"

class CfgPatches {
	
	class AXE_Main {
		name = "$STR_AXE_Main_Title";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"a3_data_f",
			"cba_main",
			"ace_main"
		};
		units[] = {};
		weapons[] = {};
		author = "$STR_AXE_Main_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Main_URL";
		VERSION_CONFIG;
		versionDesc = "$STR_AXE_Addon_Title";
	};
	
};

#include "CfgMods.hpp"
#include "CfgSettings.hpp"

#include "CfgEditorCategories.hpp"
#include "CfgFactionClasses.hpp"
