/*=====================================*\
		NOVA PROSPEKT ~ 3/20/2014
\*=====================================*/

if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if ( CLIENT ) then

	SWEP.PrintName			= "Admin Gun 5" -- How cliche
	SWEP.Author				= "Nova Prospekt"
	SWEP.DrawCrosshair		= true
	SWEP.Slot				= 5
	SWEP.SlotPos			= 1
	SWEP.IconLetter			= "BI"
	SWEP.WepSelectLetter	= "NP"

end


SWEP.Base				= "weapon_fiery_base"
SWEP.Category			= "Fiery Tools"

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= true

SWEP.HoldType			= "rpg"
SWEP.HoldType2			= "ar2"
SWEP.ReloadHoldType		= "shotgun"
SWEP.ViewModel			= "models/weapons/cstrike/c_rif_sg552.mdl"
SWEP.WorldModel			= "models/weapons/w_snip_sg550.mdl"

SWEP.Weight				= 500


SWEP.Primary.Sound			= Sound( "Weapon_tmp.Single" )
SWEP.Primary.Recoil			= 0
SWEP.Primary.Damage			= 500
SWEP.Primary.NumShots		= 3
SWEP.Primary.Cone			= 0.0
SWEP.Primary.ClipSize		= 100 -- Abuse?
SWEP.Primary.Delay			= 0.08
SWEP.Primary.Clips			= 900
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "thumper" -- Structures/AmmoData
SWEP.Primary.Ignite			= true

SWEP.Range						= 250 *(12*3)
SWEP.AimAssist				= true

SWEP.IronSightsPos = Vector (6.6746, -21.2228, 3.4835)
SWEP.IronSightsAng = Vector (0.0148, -0.188, 0)

