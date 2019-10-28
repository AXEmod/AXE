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
	
	// AMBIENT SOUND
	
	class AXE_ModuleAmbientSound: Module_F {
		
		scope = 2;
		
		displayName = "$STR_AXE_Module_AmbientSound_DisplayName";
		category = "AXE";
		author = "$STR_AXE_Modules_Author";
		icon = "\axe_modules\data\icons\module_sound_0_ca.paa";
		
		function = "AXE_fnc_moduleAmbientSound";
		functionPriority = 1;
		
		isGlobal = 0;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 1;
		
		class Attributes: AttributesBase {
			
			class Enabled {
				displayName = "$STR_AXE_ModuleProperty_Sound_Enabled_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Enabled_Tip";
				defaultValue = 1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleAmbientSound_Enabled";
				control = "Combo";
				class Values {
					class Enabled_0	{
						name = "$STR_AXE_ModuleProperty_Sound_Enabled_0";
						value = 0;
					};
					class Enabled_1	{
						name = "$STR_AXE_ModuleProperty_Sound_Enabled_1";
						value = 1;
					};
				};
			};
			
			class Source {
				displayName = "$STR_AXE_ModuleProperty_Sound_Source_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Source_Tip";
				defaultValue = "''";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleAmbientSound_Source";
				control = "Edit";
			};
			
			class Sound {
				displayName = "$STR_AXE_ModuleProperty_Sound_Classname_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Classname_Tip";
				defaultValue = "''";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleAmbientSound_Sound";
				control = "Sound";
			};
			
			class Offset {
				displayName = "$STR_AXE_ModuleProperty_Sound_Offset_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Offset_Tip";
				defaultValue = "'[0,0,0]'";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleAmbientSound_Offset";
				control = "EditShort";
			};
			
			class Distance {
				displayName = "$STR_AXE_ModuleProperty_Sound_Distance_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Distance_Tip";
				defaultValue = 100;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleAmbientSound_Distance";
				control = "EditShort";
			};
			
			class MaxDistance {
				displayName = "$STR_AXE_ModuleProperty_Sound_MaxDistance_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_MaxDistance_Tip";
				defaultValue = -1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleAmbientSound_MaxDistance";
				control = "EditShort";
			};
			
			class Duration {
				displayName = "$STR_AXE_ModuleProperty_Sound_Duration_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Duration_Tip";
				defaultValue = -1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleAmbientSound_Duration";
				control = "EditShort";
			};
			
			class ModuleDescription: ModuleDescription {
				property = "ModuleInfo";
				control = "ModuleInfo";
			};
			
		};
		
		class ModuleDescription: ModuleDescription {
			description = "$STR_AXE_Module_AmbientSound_Description";
		};
		
	};
	
	// TRIGGER SOUND
	
	class AXE_ModuleTriggerSound: Module_F {
		
		scope = 2;
		
		displayName = "$STR_AXE_Module_TriggerSound_DisplayName";
		category = "AXE";
		author = "$STR_AXE_Modules_Author";
		icon = "\axe_modules\data\icons\module_sound_1_ca.paa";
		
		function = "AXE_fnc_moduleTriggerSound";
		functionPriority = 1;
		
		isGlobal = 0;
		isTriggerActivated = 1;
		isDisposable = 0;
		is3DEN = 1;
		
		class Attributes: AttributesBase {
			
			class Enabled {
				displayName = "$STR_AXE_ModuleProperty_Sound_Enabled_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Enabled_Tip";
				defaultValue = 1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSound_Enabled";
				control = "Combo";
				class Values {
					class Enabled_0	{
						name = "$STR_AXE_ModuleProperty_Sound_Enabled_0";
						value = 0;
					};
					class Enabled_1	{
						name = "$STR_AXE_ModuleProperty_Sound_Enabled_1";
						value = 1;
					};
				};
			};
			
			class Source {
				displayName = "$STR_AXE_ModuleProperty_Sound_Source_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Source_Tip";
				defaultValue = "''";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSound_Source";
				control = "Edit";
			};
			
			class Sound {
				displayName = "$STR_AXE_ModuleProperty_Sound_Classname_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Classname_Tip";
				defaultValue = "''";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSound_Sound";
				control = "Sound";
			};
			
			class Offset {
				displayName = "$STR_AXE_ModuleProperty_Sound_Offset_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Offset_Tip";
				defaultValue = "'[0,0,0]'";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSound_Offset";
				control = "EditShort";
			};
			
			class Distance {
				displayName = "$STR_AXE_ModuleProperty_Sound_Distance_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Distance_Tip";
				defaultValue = 100;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSound_Distance";
				control = "EditShort";
			};
			
			class MaxDistance {
				displayName = "$STR_AXE_ModuleProperty_Sound_MaxDistance_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_MaxDistance_Tip";
				defaultValue = -1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSound_MaxDistance";
				control = "EditShort";
			};
			
			class Duration {
				displayName = "$STR_AXE_ModuleProperty_Sound_Duration_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Duration_Tip";
				defaultValue = -1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSound_Duration";
				control = "EditShort";
			};
			
			class Loop {
				displayName = "$STR_AXE_ModuleProperty_Sound_Loop_Title";
				tooltip = "$STR_AXE_ModuleProperty_Sound_Loop_Tip";
				defaultValue = "false";
				typeName = "BOOL";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSound_Loop";
				control = "Checkbox";
			};
			
			class ModuleDescription: ModuleDescription {
				property = "ModuleInfo";
				control = "ModuleInfo";
			};
			
		};
		
		class ModuleDescription: ModuleDescription {
			description = "$STR_AXE_Module_TriggerSound_Description";
		};
		
	};
	
	// GLOBAL SPEECH
	
	class AXE_ModuleGlobalSpeech: Module_F {
		
		scope = 2;
		
		displayName = "$STR_AXE_Module_GlobalSpeech_DisplayName";
		category = "AXE";
		author = "$STR_AXE_Modules_Author";
		icon = "\axe_modules\data\icons\module_speech_0_ca.paa";
		
		function = "AXE_fnc_moduleGlobalSpeech";
		functionPriority = 1;
		
		isGlobal = 0;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 1;
		
		class Attributes: AttributesBase {
			
			class Enabled {
				displayName = "$STR_AXE_ModuleProperty_Speech_Enabled_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_Enabled_Tip";
				defaultValue = 1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleGlobalSpeech_Enabled";
				control = "Combo";
				class Values {
					class Enabled_0	{
						name = "$STR_AXE_ModuleProperty_Speech_Enabled_0";
						value = 0;
					};
					class Enabled_1	{
						name = "$STR_AXE_ModuleProperty_Speech_Enabled_1";
						value = 1;
					};
				};
			};
			
			class Source {
				displayName = "$STR_AXE_ModuleProperty_Speech_Source_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_Source_Tip";
				defaultValue = "''";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleGlobalSpeech_Source";
				control = "Edit";
			};
			
			class Sound {
				displayName = "$STR_AXE_ModuleProperty_Speech_Classname_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_Classname_Tip";
				defaultValue = "''";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleGlobalSpeech_Sound";
				control = "Sound";
			};
			
			class Distance {
				displayName = "$STR_AXE_ModuleProperty_Speech_Distance_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_Distance_Tip";
				defaultValue = 30;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleGlobalSpeech_Distance";
				control = "EditShort";
			};
			
			class MaxDistance {
				displayName = "$STR_AXE_ModuleProperty_Speech_MaxDistance_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_MaxDistance_Tip";
				defaultValue = -1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleGlobalSpeech_MaxDistance";
				control = "EditShort";
			};
			
			class Duration {
				displayName = "$STR_AXE_ModuleProperty_Speech_Duration_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_Duration_Tip";
				defaultValue = -1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleGlobalSpeech_Duration";
				control = "EditShort";
			};
			
			class OnlyOnce {
				displayName = "$STR_AXE_ModuleProperty_Speech_OnlyOnce_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_OnlyOnce_Tip";
				defaultValue = "false";
				typeName = "BOOL";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleGlobalSpeech_OnlyOnce";
				control = "Checkbox";
			};
			
			class CodeFunc {
				displayName = "$STR_AXE_ModuleProperty_Speech_CodeFunc_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_CodeFunc_Tip";
				defaultValue = "''";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleGlobalSpeech_CodeFunc";
				control = "EditCodeMulti3";
			};
			
			class ModuleDescription: ModuleDescription {
				property = "ModuleInfo";
				control = "ModuleInfo";
			};
			
		};
		
		class ModuleDescription: ModuleDescription {
			description = "$STR_AXE_Module_GlobalSpeech_Description";
		};
		
	};
	
	// TRIGGER SPEECH
	
	class AXE_ModuleTriggerSpeech: Module_F {
		
		scope = 2;
		
		displayName = "$STR_AXE_Module_TriggerSpeech_DisplayName";
		category = "AXE";
		author = "$STR_AXE_Modules_Author";
		icon = "\axe_modules\data\icons\module_speech_1_ca.paa";
		
		function = "AXE_fnc_moduleTriggerSpeech";
		functionPriority = 1;
		
		isGlobal = 0;
		isTriggerActivated = 1;
		isDisposable = 0;
		is3DEN = 1;
		
		class Attributes: AttributesBase {
			
			class Enabled {
				displayName = "$STR_AXE_ModuleProperty_Speech_Enabled_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_Enabled_Tip";
				defaultValue = 1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSpeech_Enabled";
				control = "Combo";
				class Values {
					class Enabled_0	{
						name = "$STR_AXE_ModuleProperty_Speech_Enabled_0";
						value = 0;
					};
					class Enabled_1	{
						name = "$STR_AXE_ModuleProperty_Speech_Enabled_1";
						value = 1;
					};
				};
			};
			
			class Source {
				displayName = "$STR_AXE_ModuleProperty_Speech_Source_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_Source_Tip";
				defaultValue = "''";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSpeech_Source";
				control = "Edit";
			};
			
			class Sound {
				displayName = "$STR_AXE_ModuleProperty_Speech_Classname_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_Classname_Tip";
				defaultValue = "''";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSpeech_Sound";
				control = "Sound";
			};
			
			class Distance {
				displayName = "$STR_AXE_ModuleProperty_Speech_Distance_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_Distance_Tip";
				defaultValue = 30;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSpeech_Distance";
				control = "EditShort";
			};
			
			class MaxDistance {
				displayName = "$STR_AXE_ModuleProperty_Speech_MaxDistance_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_MaxDistance_Tip";
				defaultValue = -1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSpeech_MaxDistance";
				control = "EditShort";
			};
			
			class Duration {
				displayName = "$STR_AXE_ModuleProperty_Speech_Duration_Title";
				tooltip = "$STR_AXE_ModuleProperty_Speech_Duration_Tip";
				defaultValue = -1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTriggerSpeech_Duration";
				control = "EditShort";
			};
			
			class ModuleDescription: ModuleDescription {
				property = "ModuleInfo";
				control = "ModuleInfo";
			};
			
		};
		
		class ModuleDescription: ModuleDescription {
			description = "$STR_AXE_Module_TriggerSpeech_Description";
		};
		
	};
	
};
