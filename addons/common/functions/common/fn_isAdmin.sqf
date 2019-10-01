/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\common\fn_isAdmin.sqf
 *	by Ojemineh
 *	
 *	check if player is admin
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	<BOOLEAN>
 *	
 *	Example:
 *	[] call AXE_fnc_isAdmin;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _return = serverCommandAvailable "#logout";

_return