// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_isObjectSaveable.sqf
//	@file Author: AgentRev

private ["_obj", "_class"];
_obj = _this;
_class = typeOf _obj;

#include "functions.sqf"

(alive _obj &&
{((_obj getVariable ["objectLocked", false] || {!isNil {_obj getVariable "A3W_objectID"} && {_savingMethod == "extDB" && ["A3W_extDB_SaveUnlockedObjects"] call isConfigOn}}) &&
   {(_baseSavingOn && {_class call _isSaveable}) ||
    (_boxSavingOn && {_class call _isBox}) ||
    (_staticWeaponSavingOn && {_class call _isStaticWeapon}) ||
	(_cctvCameraSavingOn && {_obj call _isCamera}) || //Camera saving
	(_boomerangSavingOn && {_obj call _isBoomerang})})  //boomerang
{_warchestSavingOn && {_obj call _isWarchest}} ||
{_beaconSavingOn && {_obj call _isBeacon}}})
