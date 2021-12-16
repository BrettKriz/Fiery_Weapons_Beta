if( SERVER ) then
	AddCSLuaFile( "shared.lua" );
end

if( CLIENT ) then
	SWEP.PrintName 		= "Katana Test1";
	SWEP.Slot 			= 3;
	SWEP.SlotPos 		= 0;
	SWEP.DrawAmmo 		= false;
	SWEP.DrawCrosshair 	= false;
	
	SWEP.IconColor				= Color( 255, 120, 45, 120 )
	SWEP.WepSelectFont 			= "csd" -- Needs to be shared ;D
	SWEP.IconLetter				= "o"
	SWEP.SelectIconLetter		= "O"
	
	--killicon.AddFont( SWEP.ClassName , SWEP.WepSelectFont, SWEP.IconLetter, SWEP.IconColor ) -- OBSOL33T
end

SWEP.Author			= "Jazz Joyce"
SWEP.Purpose			= ""

SWEP.ViewModelFOV		= 62
SWEP.ViewModelFlip		= false

SWEP.Base			= "weapon_fiery_base"
SWEP.Category 		= "Fiery Dev"	// -- SWEP Category

SWEP.HoldType2			= "melee2"
SWEP.HoldType			= "melee2"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.NextStrike 		= 0
SWEP.Range			= 75 -- How far in source units (inches) does this reach
  
SWEP.ViewModel      		= "models/weapons/v_katana.mdl"
SWEP.WorldModel   			= "models/weapons/w_katana.mdl" -- 
  
-------------Primary Fire Attributes----------------------------------------
SWEP.Primary.HullSize			= 5
SWEP.Primary.Delay			= 0.9 	--In seconds
SWEP.Primary.Recoil			= 0.2		--Gun Kick
SWEP.Primary.Damage			= 15	--Damage per Bullet, see numshot
SWEP.Primary.NumShots		= 5		--Number of shots per one fire
SWEP.Primary.Cone			= 0.07 	--Bullet Spread
SWEP.Primary.ClipSize		= -1	--Use "-1 if there are no clips"
SWEP.Primary.Automatic   	= true	--Pistol fire (false) or SMG fire (true)
SWEP.Primary.Ammo         	= "none"	--Ammo Type
--SWEP.Primary.Ignite			= true
 
-------------Secondary Fire Attributes-------------------------------------
SWEP.Secondary.Delay		= 0.9
SWEP.Secondary.Recoil		= 0
SWEP.Secondary.Damage		= 0
SWEP.Secondary.NumShots		= 1
SWEP.Secondary.Cone			= 0
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.Automatic   	= false
SWEP.Secondary.Ammo         = "none"

util.PrecacheSound("weapons/knife/knife_deploy1.wav")
util.PrecacheSound("weapons/knife/knife_hitwall1.wav")
util.PrecacheSound("weapons/knife/knife_hit1.wav")
util.PrecacheSound("weapons/knife/knife_hit2.wav")
util.PrecacheSound("weapons/knife/knife_hit3.wav")
util.PrecacheSound("weapons/knife/knife_hit4.wav")
util.PrecacheSound("weapons/iceaxe/iceaxe_swing1.wav")

function SWEP:Initialize()
	
	--self:SetHoldType( self.HoldType );
	
	self.Hit = { 
	Sound( "weapons/knife/knife_hitwall1.wav" )};
	self.FleshHit = {
  	Sound( "weapons/knife/knife_hit1.wav" ),
	Sound( "weapons/knife/knife_hit2.wav" ),
	Sound( "weapons/knife/knife_hit3.wav" ),
  	Sound( "weapons/knife/knife_hit4.wav" ) };



end

function SWEP:Precache()
	
end

function SWEP:Deploy()
	self:SetHoldType( self.HoldType );
	self.Owner:EmitSound( "weapons/knife/knife_deploy1.wav" );
	return true;
end

function SWEP:PrimaryAttack()
	if( CurTime() < self.NextStrike ) then return; end
	
	--self:AimAssist() -- Not in fiery anymore!
	
	self.NextStrike = ( CurTime() + self.Primary.Delay );
 	local trace = self.Owner:GetEyeTrace();
	
	if trace.HitPos:Distance(self.Owner:GetShootPos()) <= self.Range then
	
		if( trace.Entity:IsPlayer() or trace.Entity:IsNPC() or trace.Entity:GetClass()=="prop_ragdoll" ) then
			self.Owner:EmitSound( self.FleshHit[math.random(1,#self.FleshHit)] );
		else
			self.Owner:EmitSound( self.Hit[math.random(1,#self.Hit)] );
		end
			self.Owner:SetAnimation( PLAYER_ATTACK1 );
			self.Weapon:SendWeaponAnim( ACT_VM_HITCENTER );
			local num = self.Primary.NumShots

				bullet = {}
				bullet.Num    = num
				bullet.Src    = self.Owner:GetShootPos()
				bullet.Dir    = self.Owner:GetAimVector()
				bullet.Spread = Vector(self.Primary.Cone, self.Primary.Cone, 0)
				bullet.Tracer = 0
				bullet.Distance = self.Range + 16 -- Make sure it can deal with lag movements
				bullet.Force  = self.Primary.Damage/num
				bullet.Damage = self.Primary.Damage
				bullet.HullSize = self.Primary.HullSize -- How BIG are these traces?
				--bullet.Callback		= DoCallback -- Not in fiery anymore
			self.Owner:FireBullets(bullet) 
	else
		self.Owner:SetAnimation( PLAYER_ATTACK1 );
		self.Weapon:SendWeaponAnim( ACT_VM_HITCENTER );
		self.Weapon:EmitSound("weapons/iceaxe/iceaxe_swing1.wav")
	end
end

function SWEP:SecondaryAttack()
	self:PrimaryAttack()
end
