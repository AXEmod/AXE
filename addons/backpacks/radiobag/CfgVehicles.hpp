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
		maximumLoad = 180;
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
		displayName = "$STR_AXE_Backpacks_RadioBag_01_BLACK";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_black.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_black_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_black_co.paa"};
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
	
	// RADIOBAG BW D
	
	class AXE_RadioBag_01_BW_D: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_BW_D";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_bw_d.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_bw_d_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_bw_d_co.paa"};
		tf_dialog = "rt1523g_radio_dialog";
		tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
		tf_encryptionCode = "tf_west_radio_code";
		tf_hasLRradio = 1;
		tf_range = 20000;
		tf_subtype = "digital_lr";
		class TransportItems {
			MACRO_ADDITEM(ACRE_SEM70,1);
		};
	};
	
	// RADIOBAG BW W
	
	class AXE_RadioBag_01_BW_W: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_BW_W";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_bw_w.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_bw_w_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_bw_w_co.paa"};
		tf_dialog = "rt1523g_radio_dialog";
		tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
		tf_encryptionCode = "tf_west_radio_code";
		tf_hasLRradio = 1;
		tf_range = 20000;
		tf_subtype = "digital_lr";
		class TransportItems {
			MACRO_ADDITEM(ACRE_SEM70,1);
		};
	};
	
	// RADIOBAG COYOTE
	
	class AXE_RadioBag_01_COYOTE: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_COYOTE";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_coyote.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_coyote_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_coyote_co.paa"};
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
	
	// RADIOBAG GEOMETRIC
	
	class AXE_RadioBag_01_GEOMETRIC: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_GEOMETRIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_geometric.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_geometric_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_geometric_co.paa"};
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
	
	// RADIOBAG GREEN DARK
	
	class AXE_RadioBag_01_GREEN_DARK: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_GREEN_DARK";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_green_dark.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_green_dark_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_green_dark_co.paa"};
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
	
	// RADIOBAG GREEN DIGITAL
	
	class AXE_RadioBag_01_GREEN_DGTL: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_GREEN_DGTL";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_green_dgtl.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_green_dgtl_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_green_dgtl_co.paa"};
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
	
	// RADIOBAG GREEN RANGER
	
	class AXE_RadioBag_01_GREEN_RNGR: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_GREEN_RNGR";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_green_rngr.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_green_rngr_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_green_rngr_co.paa"};
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
	
	// RADIOBAG HEX CAMO
	
	class AXE_RadioBag_01_HEX_CAMO: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_HEX_CAMO";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_hex_camo.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_hex_camo_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_hex_camo_co.paa"};
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
	
	// RADIOBAG HEX GREEN
	
	class AXE_RadioBag_01_HEX_GREEN: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_HEX_GREEN";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_hex_green.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_hex_green_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_hex_green_co.paa"};
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
	
	// RADIOBAG MARPAT D
	
	class AXE_RadioBag_01_MARPAT_D: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_MARPAT_D";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_marpat_d.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_marpat_d_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_marpat_d_co.paa"};
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
	
	// RADIOBAG MARPAT W
	
	class AXE_RadioBag_01_MARPAT_W: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_MARPAT_W";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_marpat_w.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_marpat_w_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_marpat_w_co.paa"};
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
	
	// RADIOBAG MTP
	
	class AXE_RadioBag_01_MTP: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_MTP";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_mtp.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_mtp_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_mtp_co.paa"};
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
	
	// RADIOBAG OCP
	
	class AXE_RadioBag_01_OCP: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_OCP";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_ocp.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_ocp_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_ocp_co.paa"};
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
		displayName = "$STR_AXE_Backpacks_RadioBag_01_TROPIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_tropic.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_tropic_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_tropic_co.paa"};
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
	
	// RADIOBAG UCP
	
	class AXE_RadioBag_01_UCP: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_UCP";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_ucp.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_ucp_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_ucp_co.paa"};
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
	
	// RADIOBAG URBAN
	
	class AXE_RadioBag_01_URBAN: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_URBAN";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_urban.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_urban_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_urban_co.paa"};
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
	
	// RADIOBAG WOODLAND
	
	class AXE_RadioBag_01_WDL: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_WDL";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_wdl.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_wdl_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_wdl_co.paa"};
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
	
	// RADIOBAG WOODLAND 2
	
	class AXE_RadioBag_01_WDL2: AXE_RadioBag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_RadioBag_01_WDL2";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\radiobag\data\previews\radiobag_wdl2.jpg";
		picture = "\axe_backpacks\radiobag\data\ui\radiobag_wdl2_ca.paa";
		hiddenSelections[] = {"Camo1"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\radiobag\data\textures\radiobag_wdl2_co.paa"};
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
