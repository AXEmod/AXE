class CBA_Extended_EventHandlers;
class CfgVehicles {
	
	// MODIFIED ENOCH RADIOBAGS
	
	class B_RadioBag_01_base_F;
	
	// RADIOBAG 01 BASE
	
	class AXE_RadioBag_01_Base: B_RadioBag_01_base_F {
		scope = 1;
		scopeArsenal = 0;
		scopeCurator = 0;
		author = "$STR_AXE_Backpacks_RadioBag_Author";
		// maximumLoad = 80;
		// mass = 160;
		maximumLoad = 160;
		mass = 121.2;
		transportMaxBackpacks = 1;
		transportMaxMagazines = 30;
		transportMaxWeapons = 1;
		class TransportItems {};
		class TransportMagazines {};
		class TransportWeapons {};
		isBackpack = 1;
	};
	
	// RADIOBAG BLACK
	
	class AXE_RadioBag_01_BLACK: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_A3_C_CfgVehicles_B_RadioBag_01_black_F0";
		descriptionShort = "";
		editorPreview = "";
		picture = "\a3\Supplies_F_Enoch\Bags\Data\UI\icon_B_RadioBag_01_black_F_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\a3\Supplies_F_Enoch\Bags\Data\B_RadioBag_01_black_CO.paa"};
		tf_dialog = "anprc155_radio_dialog";
		tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
		tf_encryptionCode = "tf_independent_radio_code";
		tf_hasLRradio = 1;
		tf_range = 20000;
		tf_subtype = "digital_lr";
		class TransportItems {
			MACRO_ADDITEM(ACRE_PRC117F,1);
		};
	};
	
	// RADIOBAG DIGI
	
	class AXE_RadioBag_01_DIGI: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_A3_C_CfgVehicles_B_RadioBag_01_digi_F0";
		descriptionShort = "";
		editorPreview = "";
		picture = "\a3\Supplies_F_Enoch\Bags\Data\UI\icon_B_RadioBag_01_digi_F_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\a3\Supplies_F_Enoch\Bags\Data\B_RadioBag_01_AAF_CO.paa"};
		tf_dialog = "anprc155_radio_dialog";
		tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
		tf_encryptionCode = "tf_independent_radio_code";
		tf_hasLRradio = 1;
		tf_range = 20000;
		tf_subtype = "digital_lr";
		class TransportItems {
			MACRO_ADDITEM(ACRE_PRC117F,1);
		};
	};
	
	// RADIOBAG EAF
	
	class AXE_RadioBag_01_EAF: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_A3_C_CfgVehicles_B_RadioBag_01_eaf_F0";
		descriptionShort = "";
		editorPreview = "";
		picture = "\a3\Supplies_F_Enoch\Bags\Data\UI\icon_B_RadioBag_01_eaf_F_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\a3\Supplies_F_Enoch\Bags\Data\B_RadioBag_01_EAF_CO.paa"};
		tf_dialog = "anprc155_radio_dialog";
		tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
		tf_encryptionCode = "tf_independent_radio_code";
		tf_hasLRradio = 1;
		tf_range = 20000;
		tf_subtype = "digital_lr";
		class TransportItems {
			MACRO_ADDITEM(ACRE_PRC117F,1);
		};
	};
	
	// RADIOBAG GHEX
	
	class AXE_RadioBag_01_GHEX: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_A3_C_CfgVehicles_B_RadioBag_01_ghex_F0";
		descriptionShort = "";
		editorPreview = "";
		picture = "\a3\Supplies_F_Enoch\Bags\Data\UI\icon_B_RadioBag_01_hex_F_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\a3\Supplies_F_Enoch\Bags\Data\B_RadioBag_01_gHex_CO.paa"};
		tf_dialog = "bussole_radio_dialog";
		tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
		tf_encryptionCode = "tf_east_radio_code";
		tf_hasLRradio = 1;
		tf_range = 20000;
		tf_subtype = "digital_lr";
		class TransportItems {
			MACRO_ADDITEM(ACRE_PRC117F,1);
		};
	};
	
	// RADIOBAG HEX
	
	class AXE_RadioBag_01_HEX: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_A3_C_CfgVehicles_B_RadioBag_01_hex_F0";
		descriptionShort = "";
		editorPreview = "";
		picture = "\a3\Supplies_F_Enoch\Bags\Data\UI\icon_B_RadioBag_01_hex_F_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\a3\Supplies_F_Enoch\Bags\Data\B_RadioBag_01_Hex_CO.paa"};
		tf_dialog = "bussole_radio_dialog";
		tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
		tf_encryptionCode = "tf_east_radio_code";
		tf_hasLRradio = 1;
		tf_range = 20000;
		tf_subtype = "digital_lr";
		class TransportItems {
			MACRO_ADDITEM(ACRE_PRC117F,1);
		};
	};
	
	// RADIOBAG MTP
	
	class AXE_RadioBag_01_MTP: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_A3_C_CfgVehicles_B_RadioBag_01_mtp_F0";
		descriptionShort = "";
		editorPreview = "";
		picture = "\a3\Supplies_F_Enoch\Bags\Data\UI\icon_B_RadioBag_01_mtp_F_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\a3\Supplies_F_Enoch\Bags\Data\B_RadioBag_01_mtp_co.paa"};
		tf_dialog = "rt1523g_radio_dialog";
		tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
		tf_encryptionCode = "tf_west_radio_code";
		tf_hasLRradio = 1;
		tf_range = 20000;
		tf_subtype = "digital_lr";
		class TransportItems {
			MACRO_ADDITEM(ACRE_PRC117F,1);
		};
	};
	
	// RADIOBAG TROPIC
	
	class AXE_RadioBag_01_TROPIC: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_A3_C_CfgVehicles_B_RadioBag_01_tropic_F0";
		descriptionShort = "";
		editorPreview = "";
		picture = "\a3\Supplies_F_Enoch\Bags\Data\UI\icon_B_RadioBag_01_tropic_F_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\a3\Supplies_F_Enoch\Bags\Data\B_RadioBag_01_tropic_CO.paa"};
		tf_dialog = "rt1523g_radio_dialog";
		tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
		tf_encryptionCode = "tf_west_radio_code";
		tf_hasLRradio = 1;
		tf_range = 20000;
		tf_subtype = "digital_lr";
		class TransportItems {
			MACRO_ADDITEM(ACRE_PRC117F,1);
		};
	};
	
	// RADIOBAG OUCAMO
	
	class AXE_RadioBag_01_OUCAMO: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_A3_C_CfgVehicles_B_RadioBag_01_oucamo_F0";
		descriptionShort = "";
		editorPreview = "";
		picture = "\a3\Supplies_F_Enoch\Bags\Data\UI\icon_B_RadioBag_01_oucamo_F_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\a3\Supplies_F_Enoch\Bags\Data\B_RadioBag_01_urban_CO.paa"};
		tf_dialog = "bussole_radio_dialog";
		tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
		tf_encryptionCode = "tf_east_radio_code";
		tf_hasLRradio = 1;
		tf_range = 20000;
		tf_subtype = "digital_lr";
		class TransportItems {
			MACRO_ADDITEM(ACRE_PRC117F,1);
		};
	};
	
	// RADIOBAG WDL
	
	class AXE_RadioBag_01_WDL: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_A3_C_CfgVehicles_B_RadioBag_01_wdl_F0";
		descriptionShort = "";
		editorPreview = "";
		picture = "\a3\Supplies_F_Enoch\Bags\Data\UI\icon_B_RadioBag_01_wdl_F_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\a3\Supplies_F_Enoch\Bags\Data\B_RadioBag_01_WDL_CO.paa"};
		tf_dialog = "rt1523g_radio_dialog";
		tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
		tf_encryptionCode = "tf_west_radio_code";
		tf_hasLRradio = 1;
		tf_range = 20000;
		tf_subtype = "digital_lr";
		class TransportItems {
			MACRO_ADDITEM(ACRE_PRC117F,1);
		};
	};
	
};
