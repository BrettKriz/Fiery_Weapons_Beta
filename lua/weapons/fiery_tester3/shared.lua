/*=====================================*\
		NOVA PROSPEKT ~ 6/6/2016
\*=====================================*/

if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if ( CLIENT ) then

	SWEP.PrintName			= "FIREY TESTER 3 - VEHICLE SHOOTING"
	SWEP.Author				= "Nova Prospekt"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 3
	SWEP.IconLetter			= "X"
	
	killicon.AddFont( "fiery_tester3", "CSKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ) )
	
end

SWEP.Base				= "weapon_fiery_base"
SWEP.Category			= "Fiery Dev"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.HoldType2			= "csspistol"
SWEP.HoldType			= "onehand"

SWEP.ViewModelFlip		= true
SWEP.ViewModel			= "models/weapons/v_smg_tmp.mdl"
SWEP.WorldModel			= "models/weapons/w_smg_tmp.mdl"

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound( "Weapon_pistol.Single" )
SWEP.Primary.Recoil			= 2
SWEP.Primary.Damage			= 18
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.07
SWEP.Primary.ClipSize		= 18
SWEP.Primary.Delay			= 0.25
SWEP.Primary.Automatic		= false

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos = Vector(-7, -1, 2.68)
SWEP.IronSightsAng = Vector(-0.101, -0.796, 0)

SWEP.DoesIdle				= true

/*---------------------------------------------------------
	PrimaryAttack
---------------------------------------------------------*/
function SWEP:PrimaryAttack()
	ErrorNoHalt("ENABLING WEAPONS IN VEHICLE")
	self.Owner:SetAllowWeaponsInVehicle(true)
end

function SWEP:SecondaryAttack()
	ErrorNoHalt("DISABLING WEAPONS IN VEHICLE")
	self.Owner:SetAllowWeaponsInVehicle(false)
end
