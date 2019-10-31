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
		
		class Reaction {
			displayName = "$STR_AXE_ModuleProperty_Speech_Reaction_Title";
			tooltip = "$STR_AXE_ModuleProperty_Speech_Reaction_Tip";
			defaultValue = 0;
			typeName = "NUMBER";
			expression = "_this setVariable ['%s', _value, true];";
			property = "AXE_ModuleGlobalSpeech_Reaction";
			control = "Combo";
			class Values {
				class Reaction_0	{
					name = "$STR_AXE_ModuleProperty_Speech_Reaction_0";
					value = 0;
				};
				class Reaction_1	{
					name = "$STR_AXE_ModuleProperty_Speech_Reaction_1";
					value = 1;
				};
				class Reaction_2	{
					name = "$STR_AXE_ModuleProperty_Speech_Reaction_2";
					value = 2;
				};
				class Reaction_3	{
					name = "$STR_AXE_ModuleProperty_Speech_Reaction_3";
					value = 3;
				};
			};
		};
		
		class Animation {
			displayName = "$STR_AXE_ModuleProperty_Speech_Animation_Title";
			tooltip = "$STR_AXE_ModuleProperty_Speech_Animation_Tip";
			defaultValue = "''";
			typeName = "STRING";
			expression = "_this setVariable ['%s', _value, true];";
			property = "AXE_ModuleGlobalSpeech_Animation";
			control = "Edit";
		};
		
		class CodeStart {
			displayName = "$STR_AXE_ModuleProperty_Speech_CodeStart_Title";
			tooltip = "$STR_AXE_ModuleProperty_Speech_CodeStart_Tip";
			defaultValue = "''";
			typeName = "STRING";
			expression = "_this setVariable ['%s', _value, true];";
			property = "AXE_ModuleGlobalSpeech_CodeStart";
			control = "EditCodeMulti3";
		};
		
		class CodeEnd {
			displayName = "$STR_AXE_ModuleProperty_Speech_CodeEnd_Title";
			tooltip = "$STR_AXE_ModuleProperty_Speech_CodeEnd_Tip";
			defaultValue = "''";
			typeName = "STRING";
			expression = "_this setVariable ['%s', _value, true];";
			property = "AXE_ModuleGlobalSpeech_CodeEnd";
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
