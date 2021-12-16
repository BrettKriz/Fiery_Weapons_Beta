/* Fiery Magazine Sent */
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.MODEL 				= "models/items/boxsniperrounds.mdl" 

ENT.MASS				= 3

function ENT:Initialize()	

	local cg = COLLISION_GROUP_WEAPON
	local sg = SOLID_VPHYSICS

	self:SetModel( Model(self.MODEL) )	--self:SetModel( Model("models/props_c17/TrapPropeller_Lever.mdl") )
	self:SetMoveType(MOVETYPE_VPHYSICS) -- FINE
	self:SetSolid(sg)
	self:SetCollisionGroup( cg ) 
	-- 

	if SERVER then
		self:PhysicsInit(SOLID_VPHYSICS) -- FINE
	end
	local width = 4
	local length = 4
	local height = 8
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

function ENT:SpawnFunction( ply, tr, pos) -- pos, ang, mag, n, ammot
   
 	if (tr != nil and not tr.Hit ) then return end 
 	 
 	local SpawnPos
	if tr == nil then
		SpawnPos = pos
	else
		SpawnPos = tr.HitPos + tr.HitNormal * 16 
	end
 	 
 	local 	ent = ents.Create( self.Classname ) 
			ent:SetPos( SpawnPos ) 
			ent:Spawn() 
			ent:Activate() 

 	return ent 
 	 
 end 

function ENT:PhysicsCollide( data, phys )
	
	local ent = data.HitEntity
	if (ent:IsWorld()) then return end
	
	--if ent:IsPlayer() then
		-- Make a sound?
	--end	
end

function ENT:Use(activator,caller)
	
	if activator:IsPlayer() then
		
		self.Entity:EmitSound( "items/ammo_pickup.wav" ) -- No sound option?
		self.Entity:Remove()
		
		--self:DebugTalk("PICKUP DATA - AMMO: " .. tostring(self.AMMOTYPE).. " x"..tostring(self.AMOUNT).."\n\n")
		
		activator:GiveAmmo( self.AMOUNT, self.AMMOTYPE )	
	end

end
