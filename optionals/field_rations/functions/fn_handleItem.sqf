/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_field_rations\functions\fn_handleItem.sqf
 *	by Ojemineh
 *	
 *	handle consumed item
 *	
 *	Arguments:
 *	0: player			- <OBJECT>
 *	1: consumeItem		- <STRING>
 *	2: replacementItem	- <STRING>
 *	3: thirstQuenched	- <NUMBER>
 *	4: hungerSatiated	- <NUMBER>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, "ACE_Canteen", "ACE_Canteen_Half", 10, 0] call AXE_field_rations_fnc_handleItem;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_player", "_consumeItem", "_replacementItem", "_thirstQuenched", "_hungerSatiated"];

_player				= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_consumeItem		= [_this, 1, "", [""]] call BIS_fnc_param;
_replacementItem	= [_this, 2, "", [""]] call BIS_fnc_param;
_thirstQuenched		= [_this, 3, 0, [0]] call BIS_fnc_param;
_hungerSatiated		= [_this, 4, 0, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _player) exitWith {};
if (_consumeItem isEqualTo "") exitWith {};

if !(missionNamespace getVariable ["axe_field_rations_enabled", false]) exitWith {};

// -------------------------------------------------------------------------------------------------

switch (_consumeItem) do {
	
	case "ACE_Can_RedGull": {
		[_player, _consumeItem, _thirstQuenched] call AXE_field_rations_fnc_consumeEnergy;
	};
	
	case "ACE_Canteen";
	case "ACE_Canteen_Half";
	case "ACE_WaterBottle";
	case "ACE_WaterBottle_Half": {
		[_player, _consumeItem, _thirstQuenched] call AXE_field_rations_fnc_consumeWater;
	};
	
	case "ACE_Banana";
	case "ACE_MRE_LambCurry";
	case "ACE_MRE_BeefStew";
	case "ACE_MRE_CreamTomatoSoup";
	case "ACE_MRE_CreamChickenSoup";
	case "ACE_MRE_ChickenTikkaMasala";
	case "ACE_MRE_SteakVegetables";
	case "ACE_MRE_MeatballsPasta";
	case "ACE_MRE_ChickenHerbDumplings";
	case "ACE_Humanitarian_Ration": {
		[_player, _consumeItem, _hungerSatiated] call AXE_field_rations_fnc_consumeFood;
	};
	
	default {};
	
};
