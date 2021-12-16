/* An extention of the base */

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

if ( CLIENT ) then

	SWEP.PrintName			= "Fiery REVOLVER Base"			
	SWEP.Author				= "Nova Prospekt"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 1

	SWEP.IconLetter			= "."
	SWEP.IconFont			= "HLKillIcons"
	SWEP.SelectIconLetter	= "F"
	-- SWEP.SelectIconFont		= "HLSelectIcons"

end

SWEP.Category				= "Fiery Tools"
SWEP.Base					= "weapon_fiery_base"

SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false

SWEP.HoldType				= "357"
SWEP.HoldType2				= "hipfire3"
SWEP.ReloadHoldType			= "357"

SWEP.ViewModel				= "models/weapons/v_357.mdl"
SWEP.WorldModel				= "models/weapons/w_alyxgun.mdl"

SWEP.Weight					= 6
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound			= Sound( "Weapon_357.Single" )
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 10
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.2
SWEP.Primary.ClipSize		= 20
SWEP.Primary.Delay			= 0.55
SWEP.Primary.StrictClipSize = true -- Prevent chambered ammo from adding to clipsize
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357"
SWEP.Primary.AmmoLetter		= "T"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.NoMag					= true

/*---------------------------------------------------------
	Animation Index
---------------------------------------------------------*/
--
SWEP.Primary.EmptyAnim		= ACT_VM_PRIMARYATTACK
SWEP.Primary.ShootAnim		= ACT_VM_PRIMARYATTACK

SWEP.Secondary.EmptyAnim	= ACT_VM_FIDGET
SWEP.Secondary.ShootAnim	= ACT_VM_SECONDARYATTACK

SWEP.AbnormalReload			= false
SWEP.ReloadAnim				= ACT_VM_RELOAD
SWEP.EmptyReloadAnim		= ACT_VM_RELOAD

SWEP.AbnormalDraw			= false
SWEP.DrawAnim				= ACT_VM_DRAW
SWEP.EmptyDrawAnim			= ACT_VM_DRAW

SWEP.EmpytyIdleAnim			= ACT_VM_IDLE
SWEP.IdleAnim 				= ACT_VM_IDLE
--
/*---------------------------------------------------------*/