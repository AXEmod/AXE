class CBA_Extended_EventHandlers;
class CfgVehicles {
	
	// INTERACTIONS
	
	class Man;
	class CAManBase: Man {
		
		// exceptions[] = {"isNotDead", "isNotUnconscious", "isNotSurrendering", "isNotHandcuffed", "isNotCarrying", "isNotDragging", "isNotEscorting", "isNotSwimming", "isNotRefueling", "isNotOnLadder", "isNotSitting", "isNotInside", "isNotInZeus", "notOnMap"};
		
		class ACE_Actions {
			#include "ACE_Medical_Actions.hpp"
			class ACE_MainActions {
				class Medical {
					#include "ACE_Medical_Actions.hpp"
				};
			};
		};
		
		class ACE_SelfActions {
			class Medical {
				#include "ACE_Medical_Actions.hpp"
			};
		};
		
	};
	
};
