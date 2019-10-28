class CBA_Extended_EventHandlers;
class CfgVehicles {
	
	// MEDICAL CRATE (DEFAULT)
	
	class ACE_medicalSupplyCrate;
	
	class AXE_Crate_Medical_Default: ACE_medicalSupplyCrate {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		author = "$STR_AXE_Medical_Crates_Author";
		displayName = "$STR_AXE_Crate_Medical_Default";
		editorPreview = "\axe_medical\crates\data\previews\medical_crate.jpg";
		editorCategory = "EdCat_Supplies";
		editorSubcategory = "EdSubcat_Medicine";
		vehicleClass = "Ammo";
		icon = "AXE_iconCrateMedical";
		maximumLoad = 1300;
		ace_cookoff_probability = 0;
		ace_cargo_canLoad = 1;
		ace_cargo_size = 2;
		ace_dragging_canCarry = 1;
		ace_dragging_carryDirection = 180;
		ace_dragging_carryPosition[] = {0,0.8,1};
		ace_dragging_canDrag = 1;
		ace_dragging_dragDirection = 180;
		ace_dragging_dragPosition[] = {0,0.8,0};
		class TransportBackpacks {};
		class TransportItems {};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "cover_action";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Crate_Medical_Default_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "\axe_medical\data\icons\medical_cross_ca.paa";
				};
				class AXE_OpenLid {
					displayName = "$STR_AXE_Crate_Medical_OpenLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' <= 0.1}";
					statement = "_target animate ['Cover', 1, 3]";
					showDisabled = 0;
					icon = "";
				};
				class AXE_CloseLid {
					displayName = "$STR_AXE_Crate_Medical_CloseLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' >= 0.9}";
					statement = "_target animate ['Cover', 0, 3]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
	// MEDICAL CRATE (EQUIPMENT)
	
	class AXE_Crate_Medical_Equipment: AXE_Crate_Medical_Default {
		displayName = "$STR_AXE_Crate_Medical_Equipment";
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(ADV_aceCPR_AED,10);
			MACRO_ADDITEM(ACE_personalAidKit,10);
			MACRO_ADDITEM(ACE_surgicalKit,10);
			MACRO_ADDITEM(AXE_MedicArea,10);
			MACRO_ADDITEM(AXE_Stethoscope,10);
		};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "cover_action";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Crate_Medical_Equipment_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "\axe_medical\data\icons\medical_cross_ca.paa";
				};
				class AXE_OpenLid {
					displayName = "$STR_AXE_Crate_Medical_OpenLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' <= 0.1}";
					statement = "_target animate ['Cover', 1, 3]";
					showDisabled = 0;
					icon = "";
				};
				class AXE_CloseLid {
					displayName = "$STR_AXE_Crate_Medical_CloseLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' >= 0.9}";
					statement = "_target animate ['Cover', 0, 3]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
	// MEDICAL CRATE (DRESSING)
	
	class AXE_Crate_Medical_Dressing: AXE_Crate_Medical_Default {
		displayName = "$STR_AXE_Crate_Medical_Dressing";
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(ACE_fieldDressing,180);
			MACRO_ADDITEM(ACE_elasticBandage,180);
			MACRO_ADDITEM(ACE_packingBandage,180);
			MACRO_ADDITEM(ACE_quikClot,180);
			MACRO_ADDITEM(ADV_aceSplint_splint,60);
			MACRO_ADDITEM(ACE_tourniquet,60);
		};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "cover_action";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Crate_Medical_Dressing_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "\axe_medical\data\icons\medical_cross_ca.paa";
				};
				class AXE_OpenLid {
					displayName = "$STR_AXE_Crate_Medical_OpenLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' <= 0.1}";
					statement = "_target animate ['Cover', 1, 3]";
					showDisabled = 0;
					icon = "";
				};
				class AXE_CloseLid {
					displayName = "$STR_AXE_Crate_Medical_CloseLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' >= 0.9}";
					statement = "_target animate ['Cover', 0, 3]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
	// MEDICAL CRATE (MEDICINE)
	
	class AXE_Crate_Medical_Medicine: AXE_Crate_Medical_Default {
		displayName = "$STR_AXE_Crate_Medical_Medicine";
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(ACE_adenosine,180);
			MACRO_ADDITEM(ACE_atropine,180);
			MACRO_ADDITEM(ACE_epinephrine,180);
			MACRO_ADDITEM(ACE_morphine,180);
		};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "cover_action";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Crate_Medical_Medicine_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "\axe_medical\data\icons\medical_cross_ca.paa";
				};
				class AXE_OpenLid {
					displayName = "$STR_AXE_Crate_Medical_OpenLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' <= 0.1}";
					statement = "_target animate ['Cover', 1, 3]";
					showDisabled = 0;
					icon = "";
				};
				class AXE_CloseLid {
					displayName = "$STR_AXE_Crate_Medical_CloseLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' >= 0.9}";
					statement = "_target animate ['Cover', 0, 3]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
	// MEDICAL CRATE (TRANSFUSION)
	
	class AXE_Crate_Medical_Transfusion: AXE_Crate_Medical_Default {
		displayName = "$STR_AXE_Crate_Medical_Transfusion";
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(ACE_salineIV,60);
			MACRO_ADDITEM(ACE_salineIV_500,60);
			MACRO_ADDITEM(ACE_salineIV_250,60);
		};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "cover_action";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Crate_Medical_Transfusion_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "\axe_medical\data\icons\medical_cross_ca.paa";
				};
				class AXE_OpenLid {
					displayName = "$STR_AXE_Crate_Medical_OpenLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' <= 0.1}";
					statement = "_target animate ['Cover', 1, 3]";
					showDisabled = 0;
					icon = "";
				};
				class AXE_CloseLid {
					displayName = "$STR_AXE_Crate_Medical_CloseLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' >= 0.9}";
					statement = "_target animate ['Cover', 0, 3]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
	// MEDICAL CRATE (TRANSFUSION COMPLETE)
	
	class AXE_Crate_Medical_TransfusionEx: AXE_Crate_Medical_Default {
		displayName = "$STR_AXE_Crate_Medical_TransfusionEx";
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(ACE_bloodIV,20);
			MACRO_ADDITEM(ACE_bloodIV_500,20);
			MACRO_ADDITEM(ACE_bloodIV_250,20);
			MACRO_ADDITEM(ACE_plasmaIV,20);
			MACRO_ADDITEM(ACE_plasmaIV_500,20);
			MACRO_ADDITEM(ACE_plasmaIV_250,20);
			MACRO_ADDITEM(ACE_salineIV,20);
			MACRO_ADDITEM(ACE_salineIV_500,20);
			MACRO_ADDITEM(ACE_salineIV_250,20);
		};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "cover_action";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Crate_Medical_TransfusionEx_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "\axe_medical\data\icons\medical_cross_ca.paa";
				};
				class AXE_OpenLid {
					displayName = "$STR_AXE_Crate_Medical_OpenLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' <= 0.1}";
					statement = "_target animate ['Cover', 1, 3]";
					showDisabled = 0;
					icon = "";
				};
				class AXE_CloseLid {
					displayName = "$STR_AXE_Crate_Medical_CloseLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' >= 0.9}";
					statement = "_target animate ['Cover', 0, 3]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
	// MEDICAL CRATE (ORDNANCE)
	
	class AXE_Crate_Medical_Ordnance: AXE_Crate_Medical_Default {
		displayName = "$STR_AXE_Crate_Medical_Ordnance";
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(ACE_fieldDressing,60);
			MACRO_ADDITEM(ACE_elasticBandage,60);
			MACRO_ADDITEM(ACE_packingBandage,60);
			MACRO_ADDITEM(ACE_quikClot,60);
			MACRO_ADDITEM(ACE_salineIV,30);
			MACRO_ADDITEM(ACE_salineIV_500,30);
			MACRO_ADDITEM(ACE_salineIV_250,30);
			MACRO_ADDITEM(ACE_adenosine,10);
			MACRO_ADDITEM(ACE_atropine,10);
			MACRO_ADDITEM(ACE_epinephrine,40);
			MACRO_ADDITEM(ACE_morphine,40);
			MACRO_ADDITEM(ACE_tourniquet,30);
			MACRO_ADDITEM(ADV_aceSplint_splint,30);
			MACRO_ADDITEM(ACE_bodyBag,10);
		};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "cover_action";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Crate_Medical_Ordnance_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "\axe_medical\data\icons\medical_cross_ca.paa";
				};
				class AXE_OpenLid {
					displayName = "$STR_AXE_Crate_Medical_OpenLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' <= 0.1}";
					statement = "_target animate ['Cover', 1, 3]";
					showDisabled = 0;
					icon = "";
				};
				class AXE_CloseLid {
					displayName = "$STR_AXE_Crate_Medical_CloseLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' >= 0.9}";
					statement = "_target animate ['Cover', 0, 3]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
	// MEDICAL CRATE (SUPPLIES)
	
	class AXE_Crate_Medical_Supplies: AXE_Crate_Medical_Default {
		displayName = "$STR_AXE_Crate_Medical_Supplies";
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(AXE_FirstAid,30);
			MACRO_ADDITEM(AXE_MedicKit,15);
			MACRO_ADDITEM(ACE_bodyBag,10);
		};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "cover_action";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Crate_Medical_Supplies_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "\axe_medical\data\icons\medical_cross_ca.paa";
				};
				class AXE_OpenLid {
					displayName = "$STR_AXE_Crate_Medical_OpenLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' <= 0.1}";
					statement = "_target animate ['Cover', 1, 3]";
					showDisabled = 0;
					icon = "";
				};
				class AXE_CloseLid {
					displayName = "$STR_AXE_Crate_Medical_CloseLid";
					condition = "(alive _target) && {_target animationPhase 'Cover' >= 0.9}";
					statement = "_target animate ['Cover', 0, 3]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
};
