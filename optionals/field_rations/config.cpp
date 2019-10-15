#include "script_component.hpp"
#include "BIS_AddonInfo.hpp"

class CfgPatches {
	
	class AXE_Field_Rations {
		name = "$STR_AXE_Field_Rations_Title";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"a3_props_f_orange",
			"ace_advanced_fatigue",
			"acex_field_rations",
			"axe_common"
		};
		units[] = {
			"AXE_Field_Rations_Box_MRE",
			"AXE_Field_Rations_Box_RedGull",
			"AXE_Field_Rations_Box_Water"
		};
		weapons[] = {
			"ACE_Canteen",
			"ACE_Canteen_Half",
			"ACE_Canteen_Empty",
			"ACE_Can_Spirit",
			"ACE_Can_Franta",
			"ACE_Can_RedGull",
			"ACE_WaterBottle",
			"ACE_WaterBottle_Half",
			"ACE_WaterBottle_Empty",
			"ACE_MRE_LambCurry",
			"ACE_MRE_BeefStew",
			"ACE_MRE_CreamTomatoSoup",
			"ACE_MRE_CreamChickenSoup",
			"ACE_MRE_ChickenTikkaMasala",
			"ACE_MRE_SteakVegetables",
			"ACE_MRE_MeatballsPasta",
			"ACE_MRE_ChickenHerbDumplings",
			"ACE_Humanitarian_Ration"
		};
		author = "$STR_AXE_Field_Rations_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Field_Rations_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
