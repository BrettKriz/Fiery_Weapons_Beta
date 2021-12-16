/*=====================================*\
		NOVA PROSPEKT ~ 3/20/2014
\*=====================================*/

if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if ( CLIENT ) then

	SWEP.PrintName			= "FIREY TESTER 1\nMISC"
	SWEP.Author				= "Nova Prospekt"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 3
	SWEP.IconLetter			= "X"
	SWEP.ViewModelFOV		= 90
	--SWEP.AutomaticFrameAdvance =  true -- animations


	
	killicon.AddFont( "fiery_tester1", "CSKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ) )
	
end

SWEP.Base					= "weapon_fiery_base_auto_rifle"
SWEP.Category				= "Fiery Dev"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.HoldType2				= "357"
SWEP.HoldType				= "pistol"

SWEP.ViewModel				= "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.WorldModel				= "models/alyx_emptool_prop.mdl"
SWEP.ViewModelFlip			= false
SWEP.ViewModelFOV			= 72

SWEP.Weight					= 7

SWEP.Primary.Sound			= Sound( "Weapon_mp44.Shoot" )
SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 20
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.04
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.1
SWEP.Primary.Automatic		= false
SWEP.Primary.BurstFire 		= 3


SWEP.DryFires				= true
SWEP.WorldModelHoldFix		= true -- Fix the Model
SWEP.WMx					= 0.5
SWEP.WMy					= 2
SWEP.WMz					= 2
SWEP.WMa					= Angle(0, 180, 0)

SWEP.IronSightsPos = Vector(-8.32, 0, 0.079)
SWEP.IronSightsAng = Vector(2.799, -2.901, -1.9)

SWEP.ArmOffset = Vector(0.759, -2.481, 0.079)
SWEP.ArmAngle = Vector(-9.2, -5.5, -12.7)

SWEP.EmptyReloadAnim		= ACT_VM_RELOAD
SWEP.DryFires				= true

-- ACT_VM_RELOAD_SILENCED 
-- self.Weapon:SetNetworkedBool("reloading", true)
--  Entity:SetupBones
function SWEP:PrimaryAttack( arg )
if !self.Owner:KeyPressed(IN_ATTACK) then return end 
self.Owner:SetAnimation( PLAYER_ATTACK1 )
local anim_name = "open"

if self.WMEnt and false then
	self:Talk("Have self.WMEnt already... animating")
	self.WMEnt:SetSequence(self.WMEnt:LookupSequence(anim_name))

end

local tc = self.ViewModel
local t1 = "models/alyx_emptool_prop.mdl"
local t = t1 
local m1 = ents.FindByModel(tc)
local m2 = ents.FindInSphere(self.Owner:GetPos(), 200)
local m = m2

	for k, v in pairs( m ) do 
	local model = v:GetModel() or "<No Model>"
	local vmodel = "<VM>"
	if v:IsWeapon() and false then
		vmodel = v:GetViewModel()
	end
		self:Talk( type(v).." ("..model..")&("..vmodel..") ->Wep? "..tostring(v:IsWeapon()) )
		
		if model == tc then
			self:Talk("Target found! Attmepting Anim")
			self.WMEnt = v
			v:SetAnimation(v:LookupSequence(anim_name))
			v:SetSequence(v:LookupSequence(anim_name))

		end
	end

end

/*---------------------------------------------------------
   Name: SWEP:DrawWorldModel() 
   Desc: Draws the world model (not the viewmodel).
---------------------------------------------------------*/ 
function SWEP:DrawWorldModel()
	local b1 = self.WorldModelHoldFix == true
	
	if b1 then
		local hand, offset, rotate
		
		if not IsValid(self.Owner) then
			self:DrawModel()
			return
		end
		
		
		hand = self.Owner:GetAttachment(self.Owner:LookupAttachment("anim_attachment_rh"))
		local x = hand.Ang:Right() 		* (self.WMx or 2)
		local y = hand.Ang:Forward() 	* (self.WMy or -4)
		local z = hand.Ang:Up() 		* (self.WMz or -0.25)
		--local x = hand.Ang:Right() 		* 2
		--local y = hand.Ang:Forward() 	* -4
		--local z = hand.Ang:Up() 		* -0.5

		offset = x + y + z
		
		hand.Ang:RotateAroundAxis(hand.Ang:Right(), 0)
		hand.Ang:RotateAroundAxis(hand.Ang:Forward(), 0)
		hand.Ang:RotateAroundAxis(hand.Ang:Up(), 0)
		
		self:SetRenderOrigin(hand.Pos + offset)
		self:SetRenderAngles(hand.Ang + self.WMa)
	end
	
	self:DrawModel()
end

