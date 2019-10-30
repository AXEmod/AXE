class CfgVehicles {
	
	// MODULES
	
	class Logic;
	class Module_F: Logic {
		class AttributesBase {
			class Default;
			class Edit;
			class Combo;
			class Checkbox;
			class CheckboxNumber;
			class ModuleDescription;
		};
		class ModuleDescription {
			class AnyBrain;
		};
	};
	
	#include "modules\ambientSound.hpp"
	#include "modules\triggerSound.hpp"
	#include "modules\globalSpeech.hpp"
	#include "modules\triggerSpeech.hpp"
	
};
