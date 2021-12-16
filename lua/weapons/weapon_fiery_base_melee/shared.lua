/* An extention of the base */

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "Firey MELEE Base"			
	SWEP.Author				= "Nova Prospekt"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 3
	SWEP.IconLetter			= "!!" -- Yeah idek
	SWEP.WepSelectLetter	= "!!"
	SWEP.WepSelectFont		= "hl2mp"
	SWEP.WepFolderPath		= "weapon_firey_base_melee"
	
	killicon.AddFont( SWEP.WepFolderPath, SWEP.WepSelectFont, SWEP.IconLetter, SWEP.IconColor )
	
end

SWEP.Category				= "Fiery Tools"
SWEP.Base					= "weapon_fiery_base"

SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false

SWEP.ViewModel				= "models/weapons/v_crowbar.mdl"
SWEP.WorldModel				= "models/weapons/w_crowbar.mdl"

SWEP.Weight					= 4
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
	
SWEP.HoldType				= "knife"
SWEP.HoldType2				= "knife"


SWEP.ReloadSound			= Sound( "weapons/vector/magrel.wav" )
SWEP.DrawSound				= Sound( "weapons/vector/unfold.wav.wav" )
SWEP.RemoveClipSound		= Sound( "weapons/vector/clipout.wav" )

SWEP.Primary.Sound			= Sound( "Weapon_pistol.Single" )

util.PrecacheSound("weapons/knife/knife_deploy1.wav")
util.PrecacheSound("weapons/knife/knife_hitwall1.wav")
util.PrecacheSound("weapons/knife/knife_hit1.wav")
util.PrecacheSound("weapons/knife/knife_hit2.wav")
util.PrecacheSound("weapons/knife/knife_hit3.wav")
util.PrecacheSound("weapons/knife/knife_hit4.wav")
util.PrecacheSound("weapons/iceaxe/iceaxe_swing1.wav")

SWEP.Primary.Recoil			= 0
SWEP.Primary.Damage			= 0
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= -1
SWEP.Primary.Delay			= 1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.MissSound 				= Sound("weapons/iceaxe/iceaxe_swing1.wav")
SWEP.WallSound 				= Sound("physics/flesh/flesh_impact_bullet3.wav")
SWEP.DeploySound			= Sound("weapons/slam/throw.wav")


SWEP.Melee					= true

SWEP.Range					= 15*(12*3)

SWEP.IronSightsPos = Vector(0, 0, 0)
SWEP.IronSightsAng = Vector(0, 0, 0)

function SWEP:AltMelee()
	self:Talk("Stab")
	return self:Stab()
end