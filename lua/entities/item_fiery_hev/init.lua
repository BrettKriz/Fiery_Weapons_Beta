/* Fiery HEV Suit */
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.MODEL 			= "models/Items/hevsuit.mdl"
ENT.MULTIPLY 		= 1
ENT.ARMORGIFT		= 1000		-- 2 armor is equal to about 1 health
ENT.HEALTHGIFT		= 50
ENT.ALLOWJUMPPLUS	= true
ENT.JUMPPLUS		= 300
ENT.ALLOWXHAIR		= true
ENT.ALLOWRUNPLUS	= true
ENT.RUNPLUS			= 550
ENT.ALLOWQUICKDUCK	= false
ENT.TODUCK			= 1
ENT.FROMDUCK		= 1
ENT.MASS			= 60

-- Code
function ENT:SpawnFunction( ply, tr ) 
   
 	if not tr.Hit then return end 
 	 
 	local SpawnPos = tr.HitPos + tr.HitNormal * 16 
 	 
 	local ent = ents.Create( self.Classname ) 
 		ent:SetPos( SpawnPos ) 
		
 	ent:Spawn() 
 	ent:Activate() 
 	 
 	return ent 
 	 
end 

function ENT:Initialize()

	local width = 15.5
	local length = 24.6
	local height = 64.6
	/*	The actual Vectors	X				Y				Z	*/
	local min = Vector( 0-(width/2), 0-(length/2), 0-(height/2) )
	local max = Vector( width/2, length/2, height/2 )
	
	local colmin = Vector( 0-(width/2), 0-(length/2), 0 )
	local colmax = Vector( width/2, length/2, height )

	self:PhysicsInitBox(colmin, colmax)
	self:SetCollisionBounds(colmin, colmax)

	self:SetModel( self.MODEL )

	local phys = self:GetPhysicsObject()  	
	if phys:IsValid() then
		phys:Wake()
	end
	
	if( self.MASS )then
		self.Entity:GetPhysicsObject():SetMass( self.MASS );
	end
	
end

function ENT:OnTakeDamage( dmginfo )
 

	self.Entity:TakePhysicsDamage( dmginfo ) 
	self.Entity:EmitSound( "MetalBox.BulletImpact" )
end

function ENT:PhysicsCollide( data, physobj )
	
	// Play sound on impact
	if (data.Speed > 15 && data.DeltaTime > 0.5 ) then
		if (data.Speed <= 35) then
			self.Entity:EmitSound( "Canister.ImpactHard" )
		else
			self.Entity:EmitSound( "Canister.ImpactSoft" )
		end
	end
end

function ENT:Use(activator,caller)
	
	
	if ( activator:IsPlayer() and (activator:Armor() < self.ARMORGIFT) ) then
		self.Entity:Remove()
		self.Entity:EmitSound( "items/ammopickup.wav" )
		
		activator:EquipSuit()
		
		local Armor = activator:Armor()
		local Health = activator:Health()
		
		activator:SetArmor( self.ARMORGIFT )
		activator:SetHealth( Health + self.HEALTHGIFT)
		
		if (self.ALLOWXHAIR) then activator:CrosshairEnable() end
		if (self.ALLOWJUMPPLUS) then activator:SetJumpPower( self.JUMPPLUS ) end
		if (self.ALLOWRUNPLUS) then activator:SetRunSpeed( self.RUNPLUS ) end
		if (self.ALLOWQUICKDUCK) then
			activator:SetDuckSpeed( self.TODUCK )
			activator:SetUnDuckSpeed( self.FROMDUCK )
		end
		--if (self.

	
	end
end

