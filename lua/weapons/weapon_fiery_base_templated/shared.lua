/*=====================================*\
		NOVA PROSPEKT ~ 12/11/2015
\*=====================================*/

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" ) -- Keep

end

if ( CLIENT ) then

	SWEP.PrintName			= "Fiery Base for Template files"			
	SWEP.Author				= "Nova Prospekt"
	-- Where is it being selected from?
	SWEP.Slot				= 1
	SWEP.SlotPos			= 10

	SWEP.IconLetter			= "H"
	SWEP.IconFont			= "CSKillIcons" -- See resource/fonts/ csd
	SWEP.SelectIconLetter	= "<"
	-- SWEP.SelectIconFont		= "CSSelectIcons"

end

SWEP.Category				= "Fiery Tools" -- "Fiery" -- Put this when the SWEP is ready
SWEP.Base					= "weapon_fiery_base"

SWEP.Spawnable				= false -- Can anyone spawn?
SWEP.AdminSpawnable			= true -- Can admins spawn?

-- See weapon_fiery_base/sh_anim.lua -> SWEP:SetHoldType( t ) for definitions
SWEP.HoldType				= "onehand"
SWEP.HoldType2				= "twohand"
SWEP.ReloadHoldType			= "autopistol"

SWEP.ViewModel				= "models/weapons/v_pistol.mdl"
SWEP.WorldModel				= "models/weapons/w_alyxgun.mdl"
SWEP.UseHands				= false -- true when using C models

SWEP.Primary.Sound			= Sound( "Weapon_pistol.Single" )
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Damage			= 5
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.2
SWEP.Primary.ClipSize		= 20
SWEP.Primary.Delay			= 0.55
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"

SWEP.Secondary.ClipSize		= -1 -- -1 because its not 'empty'
SWEP.Secondary.DefaultClip	= -1 -- -1 because its not 'empty'
SWEP.Secondary.Automatic	= false -- Ironsights should be a toggle instead of a rapid back and forth, or not? ;D
SWEP.Secondary.Ammo			= "none" -- Doesn't have ammo

SWEP.isTemplate				= true -- Hmm, wonder what this dose?

/*---------------------------------------------------------
	Animation Index
---------------------------------------------------------*/
--[[
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
--]]
/*---------------------------------------------------------*/