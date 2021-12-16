/* Duel Elites hand made by Nova Prospekt 2011-2016 */

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

	SWEP.PrintName			= "Fiery DUAL BASE"			

if ( CLIENT ) then


	SWEP.Author				= "Nova Prospekt"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 3

	SWEP.IconLetter			= "s"
	SWEP.IconFont			= "CSKillIcons"
	SWEP.SelectIconLetter	= "S"
	SWEP.SelectIconLetter2	= "s"

end

SWEP.Category				= "Fiery Tools"
SWEP.Base					= "weapon_fiery_base"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.HoldType				= "dual"
SWEP.HoldType2				= "dual" -- Not used really
SWEP.ReloadType				= "dual"

SWEP.ViewModelFlip			= true --
SWEP.ViewModel				= "models/weapons/v_pist_elite.mdl"
SWEP.WorldModel				= "models/weapons/w_pist_elite.mdl"
SWEP.Weight					= 6.5

SWEP.Primary.Sound			= Sound( "Weapon_elite.Single" ) -- 
SWEP.Primary.Recoil			= 55
SWEP.Primary.Damage			= 1
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.08
SWEP.Primary.ClipSize		= 5
SWEP.Primary.Delay			= 0.05
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "alyxgun"
--[[
SWEP.Secondary.Sound		= SWEP.Primary.Sound
SWEP.Secondary.Recoil		= SWEP.Primary.Recoil
SWEP.Secondary.Damage		= SWEP.Primary.Damage
SWEP.Secondary.NumShots		= SWEP.Primary.NumShots
SWEP.Secondary.Cone			= SWEP.Primary.Cone
SWEP.Secondary.ClipSize		= SWEP.Primary.ClipSize
SWEP.Secondary.Delay		= SWEP.Primary.Delay
SWEP.Secondary.Automatic	= SWEP.Primary.Automatic
SWEP.Secondary.Ammo			= SWEP.Primary.Ammo
	]]--
SWEP.Secondary.StrictClipSize = false -- Prevent chambered ammo from adding to clipsize

SWEP.DryFires				= true
SWEP.WorksUnderWater		= false
SWEP.Akimbo					= true

SWEP.ArmOffset 				= Vector (0, -7, -11.38)
SWEP.ArmAngle 				= Vector (45, 1.42, 0)

--[[
SWEP.IronSightsPos = Vector(-0.201, -2.201, -3)
SWEP.IronSightsAng = Vector(35.2, -2, 0)
--]]

	SWEP.Primary.EmptyAnim		= 4
	SWEP.Primary.ShootAnim		= 2 -- + 1 if still animating
	-- If the weapon should be held like a shotgun when not in iron sight
	-- If the held animation is crossbow, then it will be held like an AR2
	SWEP.Secondary.EmptyAnim	= 7			 -- No dryfire anims for secondary attacks(normally)
	SWEP.Secondary.ShootAnim	= 5 -- + 1 if still animating

	--[[
	0,idle
	1,idle_leftempty -- Left goes empty first
	2,shoot_left1 -- "First" in sequence
	3,shoot_left2 -- Even shots left, on last 2nd bullet
	4,shoot_leftlast -- Will show right non-empty
	5,shoot_right1
	6,shoot_right2-- Odd shots right, to last 1 bullet
	7,shoot_rightlast -- Will show left empty too
	8,reload
	9,draw
	10,adjustment -- lmao some weird stuff
	]]--
	

/*---------------------------------------------------------
   Name: SWEP:PrimaryAttack( )
   Desc: +attack1 has been pressed
---------------------------------------------------------*/
function SWEP:PrimaryAttack()

	// Make sure we can shoot first
	if not self:CanPrimaryAttack() then return end

	-- SWEP:ShootBullet( side, dmg, recoil, numbul, cone, ammo, forcedAnim, forceAmmoUsage )
	self:ShootBullet( 	1,
								self.Primary.Damage,
								self.Primary.Recoil,
								self.Primary.NumShots,
								self.Primary.Cone,
								self.Primary.Ammo,
								self.Primary.ShootAnim
							) -- @@@ Add Forced Anim?

	// Punch the player's view
	--self.Owner:ViewPunch( Angle( -2, self.Primary.Recoil, 0 ) )
end

/*---------------------------------------------------------
   Name: SWEP:SecondaryAttack( )
   Desc: +attack2 has been pressed
---------------------------------------------------------*/
function SWEP:SecondaryAttack()
	-- Convert to using SWEP:FireSpare()! 
	
	// Make sure we can shoot first
	local flag = self:CanSecondaryAttack()
	--Msg (tostring(flag))
	if not flag then return end
	--ErrorNoHalt("@SecondaryAtt: "..tostring(self.Secondary.ShootAnim).."\n\n")
	--self:FireSpare()
		self:ShootBullet( 	2, -- Welcome to the future
						self.Secondary.Damage 	,
						self.Secondary.NumShots ,
						self.Secondary.Cone ,
						self.Secondary.Ammo,
						self.Secondary.ShootAnim  -- Why is this going bool?
						)
end
