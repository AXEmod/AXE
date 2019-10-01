class CfgWeapons {
	
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;
	
    class ACE_Banana: ACE_ItemCore {
        acex_field_rations_consumeTime = 10;
        acex_field_rations_hungerSatiated = 3;
        acex_field_rations_consumeText = "$STR_AXE_Field_Rations_EatingX";
        acex_field_rations_consumeAnims[] = {"acex_field_rations_drinkStand", "acex_field_rations_drinkCrouch", "acex_field_rations_drinkProne"};
        acex_field_rations_consumeSounds[] = {"axe_field_rations_eat5", "axe_field_rations_eat5", "axe_field_rations_eat5"};
    };
	
    // - Water Bottles --------------------------------------------------------
    class ACE_WaterBottle: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = "$STR_ACEX_Field_Rations_WaterBottle_DisplayName";
        descriptionShort = "$STR_ACEX_Field_Rations_WaterBottle_Description";
        model = "\a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = "\z\acex\addons\field_rations\ui\item_waterbottle_full_co.paa";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
        acex_field_rations_consumeTime = 10;
        acex_field_rations_thirstQuenched = 10;
        acex_field_rations_consumeText = "$STR_AXE_Field_Rations_DrinkingFromX";
        acex_field_rations_replacementItem = "ACE_WaterBottle_Half";
        acex_field_rations_consumeAnims[] = {"acex_field_rations_drinkStand", "acex_field_rations_drinkCrouch", "acex_field_rations_drinkProne"};
        acex_field_rations_consumeSounds[] = {"acex_field_rations_drink1", "acex_field_rations_drink1", "acex_field_rations_drink2"};
    };
	
    class ACE_WaterBottle_Half: ACE_WaterBottle {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACEX_Field_Rations_WaterBottleHalf_DisplayName";
        descriptionShort = "$STR_ACEX_Field_Rations_WaterBottleHalf_Description";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
        acex_field_rations_replacementItem = "ACE_WaterBottle_Empty";
        acex_field_rations_refillItem = "ACE_WaterBottle";
        acex_field_rations_refillAmount = 0.5;
        acex_field_rations_refillTime = 8;
    };
	
    class ACE_WaterBottle_Empty: ACE_WaterBottle {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACEX_Field_Rations_WaterBottleEmpty_DisplayName";
        descriptionShort = "$STR_ACEX_Field_Rations_WaterBottleEmpty_Description";
        picture = "\z\acex\addons\field_rations\ui\item_waterbottle_empty_co.paa";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
        acex_field_rations_thirstQuenched = 0;
        acex_field_rations_replacementItem = "";
        acex_field_rations_refillItem = "ACE_WaterBottle";
        acex_field_rations_refillAmount = 1;
        acex_field_rations_refillTime = 8;
    };
	
    // - Canteens -------------------------------------------------------------
    class ACE_Canteen: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = "$STR_AXE_Field_Rations_Canteen_DisplayName";
        descriptionShort = "$STR_AXE_Field_Rations_Canteen_Description";
        model = "\a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = "\z\acex\addons\field_rations\ui\item_canteen_co.paa";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
        acex_field_rations_consumeTime = 10;
        acex_field_rations_thirstQuenched = 10;
        acex_field_rations_consumeText = "$STR_AXE_Field_Rations_DrinkingFromX";
        acex_field_rations_replacementItem = "ACE_Canteen_Half";
        acex_field_rations_consumeAnims[] = {"acex_field_rations_drinkStand", "acex_field_rations_drinkCrouch", "acex_field_rations_drinkProne"};
        acex_field_rations_consumeSounds[] = {"acex_field_rations_drink1", "acex_field_rations_drink1", "acex_field_rations_drink2"};
    };
	
    class ACE_Canteen_Half: ACE_Canteen {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_AXE_Field_Rations_CanteenHalf_DisplayName";
        descriptionShort = "$STR_AXE_Field_Rations_CanteenHalf_Description";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
        acex_field_rations_replacementItem = "ACE_Canteen_Empty";
        acex_field_rations_refillItem = "ACE_Canteen";
        acex_field_rations_refillAmount = 0.5;
        acex_field_rations_refillTime = 8;
    };
	
    class ACE_Canteen_Empty: ACE_Canteen {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_AXE_Field_Rations_CanteenEmpty_DisplayName";
        descriptionShort = "$STR_AXE_Field_Rations_CanteenEmpty_Description";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
        acex_field_rations_thirstQuenched = 0;
        acex_field_rations_replacementItem = "";
        acex_field_rations_refillItem = "ACE_Canteen";
        acex_field_rations_refillAmount = 1;
        acex_field_rations_refillTime = 8;
    };
	
    // - Soda Cans ------------------------------------------------------------
    class ACE_Can_Spirit: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = "$STR_a3_cfgvehicles_land_can_v1_f0";
        descriptionShort = "$STR_ACEX_Field_Rations_Can_Spirit_Description";
        model = "\a3\structures_f\items\food\can_v1_f.p3d";
        picture = "\z\acex\addons\field_rations\ui\icon_can_spirit_ca.paa";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
        acex_field_rations_consumeTime = 10;
        acex_field_rations_thirstQuenched = 5;
        acex_field_rations_consumeText = "$STR_AXE_Field_Rations_DrinkingX";
        acex_field_rations_consumeAnims[] = {"acex_field_rations_drinkStandCan", "acex_field_rations_drinkCrouchCan", "acex_field_rations_drinkProneCan"};
        acex_field_rations_consumeSounds[] = {"acex_field_rations_drinkCan1", "acex_field_rations_drinkCan1", "acex_field_rations_drinkCan2"};
    };
	
    class ACE_Can_Franta: ACE_Can_Spirit {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_a3_cfgvehicles_land_can_v2_f0";
        descriptionShort = "$STR_ACEX_Field_Rations_Can_Franta_Description";
        model = "\a3\structures_f\items\food\can_v2_f.p3d";
        picture = "\z\acex\addons\field_rations\ui\icon_can_franta_ca.paa";
    };
	
    class ACE_Can_RedGull: ACE_Can_Spirit {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_a3_cfgvehicles_land_can_v3_f0";
        descriptionShort = "$STR_ACEX_Field_Rations_Can_RedGull_Description";
        model = "\a3\structures_f\items\food\can_v3_f.p3d";
        picture = "\z\acex\addons\field_rations\ui\icon_can_redgull_ca.paa";
    };
	
    // - MREs -----------------------------------------------------------------
    class ACE_MRE_LambCurry: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = "$STR_ACEX_Field_Rations_MRE_LambCurry_DisplayName";
        descriptionShort = "$STR_ACEX_Field_Rations_MRE_LambCurry_Description";
        model = "\z\acex\addons\field_rations\data\mre_type1.p3d";
        picture = "\z\acex\addons\field_rations\ui\item_mre_type1_co.paa";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
        acex_field_rations_consumeTime = 10;
        acex_field_rations_hungerSatiated = 20;
        acex_field_rations_consumeText = "$STR_AXE_Field_Rations_EatingX";
        acex_field_rations_consumeAnims[] = {"acex_field_rations_drinkStand", "acex_field_rations_drinkCrouch", "acex_field_rations_drinkProne"};
        acex_field_rations_consumeSounds[] = {"axe_field_rations_eat1", "axe_field_rations_eat1", "axe_field_rations_eat1"};
    };
	
    class ACE_MRE_BeefStew: ACE_MRE_LambCurry {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACEX_Field_Rations_MRE_BeefStew_DisplayName";
        descriptionShort = "$STR_ACEX_Field_Rations_MRE_BeefStew_Description";
        model = "\z\acex\addons\field_rations\data\mre_type2.p3d";
        picture = "\z\acex\addons\field_rations\ui\item_mre_type2_co.paa";
    };
	
    class ACE_MRE_CreamTomatoSoup: ACE_MRE_LambCurry {
        author = "$STR_ACE_Common_ACETeam";
        displayName ="$STR_ACEX_Field_Rations_MRE_CreamTomatoSoup_DisplayName";
        descriptionShort = "$STR_ACEX_Field_Rations_MRE_CreamTomatoSoup_Description";
        model = "\z\acex\addons\field_rations\data\mre_type3.p3d";
        picture = "\z\acex\addons\field_rations\ui\item_mre_type3_co.paa";
        acex_field_rations_consumeSounds[] = {"axe_field_rations_eat4", "axe_field_rations_eat4", "axe_field_rations_eat4"};
    };
	
    class ACE_MRE_CreamChickenSoup: ACE_MRE_CreamTomatoSoup {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACEX_Field_Rations_MRE_CreamChickenSoup_DisplayName";
        descriptionShort = "$STR_ACEX_Field_Rations_MRE_CreamChickenSoup_Description";
    };
	
    class ACE_MRE_ChickenTikkaMasala: ACE_MRE_LambCurry {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACEX_Field_Rations_MRE_ChickenTikkaMasala_DisplayName";
        descriptionShort = "$STR_ACEX_Field_Rations_MRE_ChickenTikkaMasala_Description";
        model = "\z\acex\addons\field_rations\data\mre_type4.p3d";
        picture = "\z\acex\addons\field_rations\ui\item_mre_type4_co.paa";
    };
	
    class ACE_MRE_SteakVegetables: ACE_MRE_LambCurry {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACEX_Field_Rations_MRE_SteakVegetables_DisplayName";
        descriptionShort = "$STR_ACEX_Field_Rations_MRE_SteakVegetables_Description";
        model = "\z\acex\addons\field_rations\data\mre_type5.p3d";
        picture = "\z\acex\addons\field_rations\ui\item_mre_type5_co.paa";
    };
	
    class ACE_MRE_MeatballsPasta: ACE_MRE_LambCurry {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACEX_Field_Rations_MRE_MeatballsPasta_DisplayName";
        descriptionShort = "$STR_ACEX_Field_Rations_MRE_MeatballsPasta_Description";
        model = "\z\acex\addons\field_rations\data\mre_type6.p3d";
        picture = "\z\acex\addons\field_rations\ui\item_mre_type6_co.paa";
        acex_field_rations_consumeSounds[] = {"axe_field_rations_eat3", "axe_field_rations_eat3", "axe_field_rations_eat3"};
    };
	
    class ACE_MRE_ChickenHerbDumplings: ACE_MRE_MeatballsPasta {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACEX_Field_Rations_MRE_ChickenHerbDumplings_DisplayName";
        descriptionShort = "$STR_ACEX_Field_Rations_MRE_ChickenHerbDumplings_Description";
    };
	
    class ACE_Humanitarian_Ration: ACE_MRE_LambCurry {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACEX_Field_Rations_Humanitarian_Ration_DisplayName";
        descriptionShort = "$STR_ACEX_Field_Rations_Humanitarian_Ration_Description";
        model = "\z\acex\addons\field_rations\data\mre_human.p3d";
        picture = "\z\acex\addons\field_rations\ui\item_mre_human_co.paa";
        acex_field_rations_consumeSounds[] = {"axe_field_rations_eat2", "axe_field_rations_eat2", "axe_field_rations_eat2"};
    };
	
};
