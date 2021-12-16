/*=====================================*\
		NOVA PROSPEKT ~ 3/20/2014
\*=====================================*/

if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if ( CLIENT ) then

	SWEP.PrintName			= "Admin Gun 6" -- How cliche
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

SWEP.HoldType2			= "hipfire1"
SWEP.HoldType			= "ar2"
SWEP.ReloadHoldType		= "shotgun"
SWEP.ViewModel			= "models/weapons/cstrike/c_rif_galil.mdl"
SWEP.WorldModel			= "models/weapons/w_snip_g3sg1.mdl"

SWEP.Weight					= 500

SWEP.Primary.Sound			= Sound( "NPC_Hunter.FlechetteShoot" )
SWEP.Primary.Recoil			= 0
SWEP.Primary.Damage			= 100
SWEP.Primary.NumShots		= 11
SWEP.Primary.Cone			= 0.04
SWEP.Primary.ClipSize		= 2500 -- Abuse?
SWEP.Primary.Delay			= 0.1
SWEP.Primary.Clips			= 900
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "thumper" -- Structures/AmmoData
SWEP.Primary.Ignite			= true
SWEP.Primary.UseFlechette	= true

game.AddParticles( "particles/hunter_flechette.pcf" )
game.AddParticles( "particles/hunter_projectile.pcf" )

SWEP.Range						= 205 *(12*3)
SWEP.DryFires				= true
SWEP.AimAssist				= true

SWEP.IronSightsPos = Vector (6.6746, -21.2228, 3.4835)
SWEP.IronSightsAng = Vector (0.0148, -0.188, 0)

SWEP.ArmOffset = Vector (0.85, -6.6, 3.5) -- This is so there is a decent default run angle
SWEP.ArmAngle = Vector (-13, 28, 2) 		-- Im not sure how people will like these run angles


// Normal animations found in MOST pistols and some rifles
SWEP.Primary.EmptyAnim		= ACT_VM_PRIMARYATTACK
SWEP.Primary.ShootAnim		= ACT_VM_PRIMARYATTACK 
// If the weapon should be held like a shotgun when not in iron sight
// If the held animation is crossbow, then it will be held like an AR2
SWEP.Secondary.EmptyAnim	= ACT_VM_PRIMARYATTACK 			 // No dryfire anims for secondary attacks(normally)
SWEP.Secondary.ShootAnim	= ACT_VM_PRIMARYATTACK  // Melee, Special action, Secondary fire
// Abnormal reload, as in HL2 and DODS style pistol reloads
SWEP.ReloadAnim				= ACT_VM_RELOAD 
SWEP.EmptyReloadAnim		= ACT_VM_RELOAD
// Once agian, Abnormal as defined above
SWEP.DrawAnim				= ACT_VM_DRAW 
SWEP.EmptyDrawAnim			= ACT_VM_DRAW
// Most Pistol, rifle, and shotgun models have these animations... Because VALVe modelers are smart!lol
SWEP.EmpytyIdleAnim			= ACT_VM_IDLE
SWEP.IdleAnim 				= ACT_VM_IDLE 

--[[
function SWEP:PrimayAttack()
				self:ShootFlechette(
								self.Primary.Damage,
								self.Primary.Recoil,
								self.Primary.NumShots,
								self.Primary.Cone,
								self.Primary.Ammo,
								true 
							)
end
--]]