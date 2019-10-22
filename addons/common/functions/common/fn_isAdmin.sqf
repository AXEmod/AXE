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

private _return = false;

if (isMultiplayer) then {
	
	if (hasInterface && isServer) then {
		// HOSTED
		_return = true;
	} else {
		if ((call BIS_fnc_admin) > 0) then {
			// DEDICATED
			_return = true;
		};
	};
	
} else {
	// SINGLEPLAYER
	_return = true;
};

_return;