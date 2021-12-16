/* An extention of the base */

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
	
	
end

	SWEP.PrintName			= "Fiery Machine Gun Base"			

if ( CLIENT ) then

	SWEP.Author				= "Nova Prospekt"
	SWEP.Slot				= 3
	SWEP.SlotPos			= 4

	SWEP.IconLetter			= "z"

end

SWEP.Category				= "Fiery Tools"
SWEP.Base					= "weapon_fiery_base_rifle"

SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false

SWEP.HoldType				= "rifle"
SWEP.HoldType2				= "hipfire2"
SWEP.ReloadHoldType			= "smg"

SWEP.ViewModel				= "models/weapons/v_mach_m249para.mdl"
SWEP.WorldModel				= "models/weapons/w_mach_m249para.mdl"

SWEP.Weight					= 8
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= true

SWEP.Primary.Sound			= Sound( "Weapon_smg1.Single" )
SWEP.Primary.Recoil			= 0
SWEP.Primary.Damage			= 0
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= 0
SWEP.Primary.Delay			= 1
SWEP.Primary.StrictClipSize = true -- Prevent chambered ammo from adding to clipsize
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

--[[
/*---------------------------------------------------------
	Animation Index
---------------------------------------------------------*/
SWEP.Primary.EmptyAnim		= ACT_VM_DRYFIRE
SWEP.Primary.ShootAnim		= ACT_VM_PRIMARYATTACK

SWEP.Secondary.EmptyAnim	= ACT_VM_FIDGET
SWEP.Secondary.ShootAnim	= ACT_VM_SECONDARYATTACK

SWEP.ReloadAnim				= ACT_VM_RELOAD
SWEP.EmptyReloadAnim		= ACT_VM_RELOAD

SWEP.DrawAnim				= ACT_VM_DRAW
SWEP.EmptyDrawAnim			= ACT_VM_DRAW

SWEP.EmpytyIdleAnim			= ACT_VM_IDLE
SWEP.IdleAnim 				= ACT_VM_IDLE
/*---------------------------------------------------------*/
--]]--