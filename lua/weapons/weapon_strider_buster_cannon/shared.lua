
if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
	SWEP.HoldType			= "rpg"
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "Strider Buster Cannon"
	SWEP.Author				= "Nova Prospekt"
	SWEP.Category 			= "Fiery"

	SWEP.Slot				= 4
	SWEP.SlotPos			= 15

	SWEP.IconFont 			= "HalfLife" // -- "CSKillIcons" for CSS, "HL2MPTypeDeath" for HL2
	SWEP.IconLetter			= "i"
	SWEP.WeaponSelectIconLetter	= "i"
	SWEP.WepSelectFont		= "HalfLife"
	SWEP.StockWep			= true -- Wanna say this is obsoleet

end

SWEP.Base					= "weapon_fiery_base"
SWEP.Category				= "Fiery Dev"

SWEP.ViewModel      		= "models/weapons/c_irifle.mdl"
SWEP.WorldModel   			= "models/weapons/w_irifle.mdl"

SWEP.Spawnable      		= true
SWEP.AdminSpawnable  		= true

SWEP.Primary.Sound			= Sound("Weapon_RPG.Single")
SWEP.Primary.Recoil			= 2.2
SWEP.Primary.Damage			= 150
SWEP.Primary.NumShots		= 1 // --  I'd advise to keep this at 0, unless you want some crazy ass RPG rifle thing >.>
SWEP.Primary.Cone			= 0.2 -- Not actually used outside of HUD
SWEP.Primary.ClipSize		= 1
SWEP.Primary.Delay			= 1
SWEP.Primary.DefaultClip	= SWEP.Primary.ClipSize or 20
SWEP.Primary.Automatic   	= !false
SWEP.Primary.Ammo			= "SMG1_Grenade" // -- NOTE TO SELF: Add Idle to this too
SWEP.Mag					= "models/Items/combine_rifle_cartridge01.mdl"

SWEP.Secondary.Delay		= 0
SWEP.Secondary.Recoil		= 0
SWEP.Secondary.Damage		= 0
SWEP.Secondary.Numshot		= 0
SWEP.Secondary.Cone			= 0
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.Delay		= 0
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.UseHands 				= true
SWEP.NoMag					= true

SWEP.IronSightsPos = Vector(-6.031, -8.04, 1.24)
SWEP.IronSightsAng = Vector(0.4, -0.5, 0)

SWEP.Secondary.ShootAnim	= ACT_VM_PRIMARYATTACK -- Melee, Special action, Secondary fire

/*---------------------------------------------------------
Pre-Cache
---------------------------------------------------------*/
function SWEP:Precache()
	util.PrecacheSound(self.Primary.Sound)
end

/*---------------------------------------------------------
Primary Attack
---------------------------------------------------------*/
function SWEP:PrimaryAttack()

	--if self:CanPrimaryAttack() then
		--self.Weapon:SetNextPrimaryFire( self.Primary.Delay or 1 )
		self:LaunchGrenade(true)
		--self:Reload()
	--end
end


function SWEP:LaunchGrenade( side )
	if not side then side = false end
	
	if side == false then
		
		if self:CanSecondaryAttack() == false then 
			self:DebugTalk("Cant Secondary! Exiting LaunchGrenade()")
			return -1 
		end
	elseif side == true then
		
		if self:CanPrimaryAttack() == false then 
			self:DebugTalk("Cant Primary! Exiting LaunchGrenade()")
			return -1 
		end
	end
	

	self:DebugTalk("Inside LaunchGrenade")
	
	local t = 1
--[[
	if side == true then
		self.Weapon:SetNextPrimaryFire( t ) -- Slow them down
	else
		self.Weapon:SetNextSecondaryFire( t ) -- Slow them down
	end
--]]

	-- Take ammo, animate, delay here
	local amt = 0

	if not side then
		self:DebugTalk("Side was FALSE or NULL, using SecondaryAmmo type: ".. tostring(self.Secondary.Ammo))
		amt = self.Owner:GetAmmoCount(self.Secondary.Ammo) -- Afix to smg1_grenade ?.
		
		if self.Weapon:Clip2() > 0 then
			-- Take ammo
			self.Weapon:TakeSecondaryAmmo(1)
		else
			if amt < 1 then 
				self:DebugTalk("Cant Secondary! No Ammo, Exiting LaunchGrenade()")
				self.Weapon:EmitSound("weapons/ar2/ar2_empty.wav")
				return false 
			end
			--self.Owner:SetAmmo(amt - 1, self.Secondary.Ammo) -- Trying to remember usage
		end
	else
		self:DebugTalk("Side was TRUE (or an object of any kind), using PrimaryAmmo type: ".. tostring(self.Primary.Ammo))
		amt = self.Owner:GetAmmoCount(self.Primary.Ammo)
		
		if self.Weapon:Clip1() > 0 then
			-- Take ammo
			self.Weapon:TakePrimaryAmmo(1)
		else
			if amt < 1 then 
				self:DebugTalk("Cant Primary! No Ammo, Exiting LaunchGrenade()")
				self.Weapon:EmitSound("weapons/ar2/ar2_empty.wav")
				return false 
			end
			--self.Owner:SetAmmo(amt - 1, self.Primary.Ammo) -- Trying to remember usage
		end
	end
	
	
	
	local str = "weapon_striderbuster" -- Check for lower case requirements
	local power = 1820 --2250 -- @@@USE VAR!!!!!!!
	
	local aim = self.Owner:GetAimVector()
	local si = aim:Cross(Vector(0,0,1))
	local up = si:Cross( aim )
	local pos = self.Owner:GetShootPos() +  (aim * 25) + (si * 5) + (up * -6)	
	--offsets the rocket so it spawns from the muzzle (hopefully)
	-- @@@ Add code for Ironsights vs hipfire offsets
	
	local rocket = ents.Create( str )
	
	if not rocket:IsValid() then
		self:DebugTalk("[i] '"..tostring(str).."' isn't valid, lowering case...")
		rocket = ents.Create( string.lower(str) )
	end
	if not rocket:IsValid() then
		self:Talk("[!] Failure to create a'"..tostring(str).."' (even in lower case too) inside of LaunchGrenade()!\nPlease notify Nova Prospekt!")
		return false
	end
	
	rocket:SetAngles( aim:Angle() )
	rocket:SetPos( pos )
	rocket:SetOwner( self.Owner )
	-- Place into world
	rocket:Input("ExplodeIn", self.Owner, nil, 5.0)
	
	rocket:Spawn()
	rocket:Activate()
	rocket:SetVelocity( rocket:GetForward() * power )
	-- ExplodeIn
	
	--self:FireRocket()

	local anim = self.Secondary.ShootAnim or ACT_VM_SECONDARYATTACK
	self:DebugTalk("anim = "..tostring(anim))
	-- 
	self:VMact( anim, 1, self.Secondary.Sound or self.Primary.Sound or "weapons/grenade_launcher1.wav", nil, true ) -- @@ Needs logic work done
	self.Owner:SetAnimation( PLAYER_ATTACK1 ) -- Because we might be sending an Enum to VMact
	--local t = self:GetSeqDur() * 60
	
	if side == true then
		self:DebugTalk("Waiting on NextPrimary <>")
		self.Weapon:SetNextPrimaryFire( t ) -- Slow them down
	else
		self:DebugTalk("Waiting on NextSecondary <>")
		self.Weapon:SetNextSecondaryFire( t ) -- Aim assist rate might mess with this... self.Secondary.Delay
	end
	self:DebugTalk("FireTime: "..tostring(t).."\n")
	
	--self.Owner:GetViewModel():SetPlaybackRate(5)
	--self.Owner:MuzzleFlash() -- IDK...

	return true
end