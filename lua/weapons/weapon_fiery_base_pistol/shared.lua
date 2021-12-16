/* An extention of the base */

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

end

	SWEP.PrintName			= "Fiery PISTOL Base"			

if ( CLIENT ) then

	SWEP.Author				= "Nova Prospekt"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 3

	SWEP.IconLetter			= "c"

end

SWEP.Category				= "Fiery Tools"
SWEP.Base					= "weapon_fiery_base"

SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false

SWEP.HoldType				= "csspistol"
SWEP.HoldType2				= "357"
SWEP.ReloadHoldType			= "pistol"

SWEP.ViewModel				= "models/weapons/v_pistol.mdl"
SWEP.WorldModel				= "models/weapons/w_alyxgun.mdl"

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound			= Sound( "Weapon_pistol.Single" )
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 5
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.2
SWEP.Primary.ClipSize		= 20
SWEP.Primary.Delay			= 0.55
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

/*---------------------------------------------------------
	Animation Index
---------------------------------------------------------*/
--
SWEP.Primary.EmptyAnim		= ACT_VM_DRYFIRE
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