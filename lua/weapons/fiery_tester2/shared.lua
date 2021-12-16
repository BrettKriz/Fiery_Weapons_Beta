/*=====================================*\
		NOVA PROSPEKT ~ 6/6/2016
\*=====================================*/

if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if ( CLIENT ) then

	SWEP.PrintName			= "FIREY TESTER 2 - Tracer Origin"
	SWEP.Author				= "Nova Prospekt"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 3
	SWEP.IconLetter			= "II"
	
	killicon.AddFont( "fiery_tester2", "CSKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ) )
	
end

SWEP.Base				= "weapon_fiery_base_dual"
SWEP.Category			= "Fiery Dev"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.HoldType				= "dual"
SWEP.HoldType2				= "dual"
SWEP.ReloadType				= "dual"

SWEP.ViewModelFlip		= !true
SWEP.ViewModel			= "models/weapons/cstrike/c_pist_elite.mdl"
--SWEP.ViewModel			= "models/weapons/c_smg1.mdl"
SWEP.WorldModel			= "models/weapons/w_pist_elite.mdl"

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound( "Weapon_TMP.Single" )
SWEP.Primary.Recoil			= 0
SWEP.Primary.Damage			= 18
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.04
SWEP.Primary.ClipSize		= 15
SWEP.Primary.Delay			= 0.25
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357"

SWEP.Secondary.Sound			= Sound( "Weapon_elite.Single" )
SWEP.Secondary.Recoil			= 0
SWEP.Secondary.Damage			= 18
SWEP.Secondary.NumShots		= 1
SWEP.Secondary.Cone			= 0.04
SWEP.Secondary.ClipSize		= 15
SWEP.Secondary.Delay			= 0.25
SWEP.Secondary.Automatic		= false
SWEP.Secondary.Ammo			= "357"

SWEP.IronSightsPos = Vector(-7, -1, 2.68)
SWEP.IronSightsAng = Vector(-0.101, -0.796, 0)

SWEP.DryFires				= true

SWEP.Primary.ShootAnim		= ACT_VM_PRIMARYATTACK
SWEP.Secondary.ShootAnim	= ACT_VM_PRIMARYATTACK
--[[
function SWEP:CanPrimaryAttack()
	if (anim_name == nil) or (self.Owner:IsNPC()) then
		-- Checks
	end
	return true
end
--]]

/*---------------------------------------------------------
   Name: SWEP:PrimaryAttack( )
   Desc: +attack1 has been pressed
---------------------------------------------------------*/
function SWEP:PrimaryAttack()

	// Make sure we can shoot first
	if not self:CanPrimaryAttack() then return end
	self.Weapon:SetVar("AkimboSide", false)
	self:ShootBullet( 1, self.Primary.Damage, self.Primary.NumShots, self.Primary.Cone )

	// Punch the player's view
	--self.Owner:ViewPunch( Angle( -2, self.Primary.Recoil, 0 ) )
end

function SWEP:SecondaryAttack()
	-- Convert to using SWEP:FireSpare()! 
	
	// Make sure we can shoot first
	local flag = self:CanSecondaryAttack()
	--Msg (tostring(flag))
	if not flag then return end
	
	self:FireSpare()

end

function SWEP:FireSpare() -- NEDDS WORK !!!!
	--  @@@Edit
	-- Make sure we can shoot first
	local b1 = self:CanSecondaryAttack()
	--self:Talk("Secondary Attack: Can? "..tostring(b1))
	if not b1 then return end
	
	self.Weapon:SetVar("AkimboSide", true)

	-- damage, bullets, aimcone
	self:ShootBullet( 	2,
						self.Secondary.Damage 	or self.Primary.Damage,
						self.Secondary.NumShots or self.Primary.NumShots,
						self.Secondary.Cone 	or self.Primary.Cone 		or 0.05,
						self.Secondary.Ammo,
						self.Secondary.ShootAnim
						)
	-- Remove 1 bullet from our clip
	-- Punch the player's view @@@FIX ME!!
	--self.Owner:SetAnimation( PLAYER_ATTACK1 )
	
 end

function SWEP:ShootBullet( side, dmg, recoil, numbul, cone, ammo, forcedAnim)
	--if (self.Weapon:Clip1() <= 0 and self.Primary.ClipSize > 0) then self:Reload() return false end
	-- Add side consideration for effects
	if (side == nil) then
		side = 1
	end
	numbul 	= numbul 	or 1 -- Doesnt Have to be sent
	cone 	= self:CurrentCone(cone) or cone or 0.01 -- Doesnt have to be sent 
	if forcedAnim == nil then
		-- I cant remember the relivance, but very important?
		forcedAnim = true
	end
	

	-- local DEBUG = true
	-- FOR self.DEBUGING AND FUN LOL
	if tobool(tonumber(self.DEBUG)) then
		CreateClientConVar("swep_cone", self.Primary.Cone, false, true)
		cone = GetConVarNumber("swep_cone")
	end

	local Ammo = AmmoTypes[ammo] or 3  -- AMMO doesn't have to be sent
	local bullet = {}
	local f = 0
	-- Aimvector:  -1 -> 1  (-90 to 90)
	--
	local AngTotal = 60
	local correction = Vector(0,0, math.max(math.min( math.abs( self.Owner:GetViewPunchAngles().pitch ) / AngTotal , 1 ), 0) )
	local 	dir1 = self.Owner:GetAimVector()
			dir1:Add( correction )
	
	--SWEP.MuzzleAttachment		= "1" -- Should be "1" for CSS models or "muzzle" for hl2 models
--SWEP.ShellEjectAttachment	= "2" -- Should be "2" for CSS models or "1" for hl2 models
	-- 1 = RIGHT
	-- 2 = LEFT
	-- Therefor, side is flipped possibly...
	-------------------------------------------------- @@@
	local src = self.Owner:GetShootPos()
	--local a = side					-- side
	local a
	local mdl = (self.Owner:GetViewModel())
	local mdl2 = (self.Weapon)
	
	local a1 = mdl:LookupAttachment( "2" )
	--local a1 = mdl2:LookupAttachment( "muzzle_flash_l" )
	
	local a2 = mdl:LookupAttachment( "1" )
	--local a2 = mdl2:LookupAttachment( "muzzle_flash_r" )
	if side == 1 then
		a = a1
		--ErrorNoHalt("1-"..tostring(a1))
	else
		a = a2
		--ErrorNoHalt("2-"..tostring(a2))
	end
	local b = mdl:GetAttachment(a)
	
	--local b1 = mdl:GetAttachment(a1).Pos
	--local b1 = mdl:GetAttachment(a1).Pos
	local b1 = mdl:GetAttachment(a1).Pos
	
	--local b2 = mdl:GetAttachment(a2).Pos
	--local b2 = mdl:GetAttachment(a2).Pos
	local b2 = mdl:GetAttachment(a2).Pos
	
	local diff
	diff = Vector( b1.x - b2.x, 	b1.y - b2.y,	 b1.z - b2.z )
	--ErrorNoHalt("  1vs2\n"..tostring(b1).."\n"..tostring(b2).."\n-> "..tostring(diff).."\n\n")
	
	local src2
	
	if (b == nil or b.Pos == nil) then
		ErrorNoHalt("\n\nCant get pos with attachment #"..a.."\n")
		src2 = src
	else
		src2 = (b.Pos) --+ Vector(0,0,350)
	end
	
	diff = Vector(src.x - src2.x, src.y - src2.y, src.z - src2.z)
	--ErrorNoHalt("\nSHOOT BULLET - SIDE #"..side.."\n\t src:\t"..tostring(src).."\n\t src2:\t"..tostring(src2).." \n-> "..tostring(diff).."\n")
	
	bullet.Num 			= numbul
	bullet.Src 			= src
	bullet.Dir 			= dir1		-- Dir of bullet
	bullet.Spread 		= Vector( cone*0.5, cone*1, 0 )	
	-- Aim Cone
	bullet.Tracer		= 2500		-- Show a tracer on every 1/x bullets   
	bullet.TracerName	= Tracers[ GetConVarNumber("swep_tracer") ]
	-- LETS USE SOME CALCULATIONS
	bullet.Force		= (dmg/3.336) -- Force applied to target
	bullet.Damage		= dmg
	bullet.AmmoType		= Ammo
	
	//PenetrateBullet	
	bullet.Callback		= DoCallback -- Yee
	--bullet.Callback		= OnHeadshot -- Yee
	
	--SuppressHostEvents(self.Owner) -- Ignore the tracer stuff
	self.Owner:FireBullets( bullet )
	

	-- @@@BELOW HERE NEEDS TO BE INDEPENDANT FUNCTION(S)
	
	-- Arm stability... so yes akimbo
	self.Weapon:SetNetworkedFloat( "LastShootTime", CurTime() ) --Primary, Secondary, Trinary
	-- @@@ Weapon:LastShootTime() instead? integrate?

	-- Check the side of fire
	if numbul > 1 and Ammo == 7 then -- Add acception to shotguns
		numbul = 1
	end
	--self:ShootEffects(side, recoil, forcedAnim, nil, numbul)
	self:ShootEffects(side, recoil, ACT_VM_PRIMARYATTACK, nil, numbul)
	
	--[[
	local fx 		= EffectData()
	fx:SetEntity(self.Weapon)
	fx:SetOrigin(self.Owner:GetShootPos())
	fx:SetNormal(self.Owner:GetAimVector())
	fx:SetAttachment(self.MuzzleAttachment)
	util.Effect(self.MuzzleEffect,fx)		-- Additional muzzle effects
	--]]
	
	-- @@@ LEGACY (Use CallBack)
	self:BreakDoor() -- If applicable
	if (side == 1 and self.Primary.Ignite == true) then
	--	self:IgniteTarget( math.Rand(11,120), self.Primary.Damage*1.5 )
	elseif (side == 2 and self.Secondary.Ignite == true) then
	--	self:IgniteTarget( math.Rand(11,120), self.Secondary.Damage*1.5 )
	end

end


function DoCallback( ply, tr, dmginfo )
	-- A hub for bullet callback functions
	--ErrorNoHalt("Im at callback")
	--OnHeadshot(ply, tr, dmginfo)
	
	if GetConVar("swep_penetration"):GetBool() then
		PenetrateBullet(ply, tr, dmginfo)
	end
	
	-- @@@IGNITE TARGET CODE HERE
	local ent
	local side
	if ply:IsWeapon() then
		ent = ply
	else
		ent = ply:GetActiveWeapon()
	end
	
	-- Code for tracers
	MakeTracer(ent, tr)
	
	if (ent).Primary.Ignite == true then
		IgniteTarget( ply,tr.Entity, math.Rand(11,120), dmginfo:GetDamage()*1.5)
	end
	

end

function MakeTracer(ent, tr)
	if CLIENT then -- 
	--if IsFirstTimePredicted() then
	local x = ent:GetVar("AkimboSide")
	
	local s,a = ent:GetTracerOrigin( x ) -- self.Owner:GetShootPos()
	local s2 = ent.Owner:GetShootPos()
	
	local s3 = tr.StartPos 
	local s4 = ent:GetTracerShootPos(s2, ent, a )
	
	local e = tr.HitPos
	--[[
	local ed = EffectData()
	ed:SetEntity(ent) 
	ed:SetNormal(self.Owner:GetAimVector())
	ed:SetAttachment(a)
	ed:SetOrigin(s2)
	ed:SetStart(s)
	ed:
	util.Effect( Tracers[ GetConVarNumber("swep_tracer") ], ed )
	
	local fx = EffectData()
	fx:SetEntity(self.Weapon)
	fx:SetNormal(PlayerAim)
	fx:SetAttachment(self.ShellEjectAttachment)
	util.Effect(self.ShellEffect,fx)						-- Shell ejection
	--]]
	util.ParticleTracer( Tracers[ GetConVarNumber("swep_tracer") ], s4, e, true )
	ErrorNoHalt("MakeTracer -  SIDE: "..tostring(x).." Hitpos: "..tostring(e).."\nGTO vs GSP vs GTSP\n"..tostring(s).."\n"..tostring(s2).."\n"..tostring(s4).."\n\n")
	--SuppressHostEvents(nil)
	
	
	end
	
end


--[[---------------------------------------------------------
	Returns the right shoot start position for a tracer
	Source: Garry Newman
-----------------------------------------------------------]]
function SWEP:GetTracerShootPos( Position, Ent, Attachment )

	--self.ViewModelTracer = false
	--if SERVER then return end

	if ( !IsValid( Ent ) ) then return Position end
	if ( !Ent:IsWeapon() ) then return Position end

	-- Shoot from the viewmodel
	if ( Ent:IsCarriedByLocalPlayer() && !LocalPlayer():ShouldDrawLocalPlayer() ) then

		local ViewModel = LocalPlayer():GetViewModel()

		if ( ViewModel:IsValid() ) then

			local att = ViewModel:GetAttachment( Attachment )
			if ( att ) then
				Position = att.Pos
				--self.ViewModelTracer = true
			end

		end

	-- Shoot from the world model
	else

		local att = Ent:GetAttachment( Attachment )
		if ( att ) then
			Position = att.Pos
		end

	end

	return Position
end

--
function SWEP:GetTracerOrigin(side) -- @@@TRACER START
	local ans -- CLIENT SIDE
	local str
	if side == nil then
		side = false
	end
	--	local vm = ply:GetViewModel()
	-- local obj = vm:LookupAttachment( "muzzle" )
	-- local muzzlepos = vm:GetAttachment( obj )
	local mdl = (self.Owner:GetViewModel())
	local a1 = mdl:LookupAttachment( "2" )
	local a2 = mdl:LookupAttachment( "1" )
	-- 1 = RIGHT
	-- 2 = LEFT
	-- Therefor, side is flipped possibly...
	if side == false then
		a = a1
		str = "2"
		ErrorNoHalt("1-"..tostring(a1))
	else
		a = a2
		str = "1"
		ErrorNoHalt("2-"..tostring(a2))
	end
	local b = mdl:GetAttachment(a)

	if (b == nil or b.Pos == nil) then
		ErrorNoHalt("\n\nCant get pos with attachment #"..a.."\n")
		ans = self.Owner:GetShootPos()
	else
		ans = (b.Pos) --+ Vector(0,0,350)
	end
	
	--ErrorNoHalt("TracerOrigin: "..tostring(ans).."\n")
	return ans, str
end
--]]