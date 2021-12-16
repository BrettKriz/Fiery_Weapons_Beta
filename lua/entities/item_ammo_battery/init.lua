/* Fiery Magazine Sent */
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.MODEL 				= "models/items/combine_rifle_cartridge01.mdl" 

ENT.MASS				= 4

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
	
	local phys = self:GetPhysicsObject()  	
	if phys:IsValid() then 
		if( self.MASS )then	
			phys:SetMass( self.MASS )
		end 		
		phys:Wake()
	end
	
	self:DrawShadow(false)
	-- COLLISION_GROUP_NONE 
	-- COLLISION_GROUP_WEAPON
	-- COLLISION_GROUP_WORLD
	-- COLLISION_GROUP_INTERACTIVE_DEBRIS
	
	if SERVER then
		self:SetUseType( SIMPLE_USE )
	end

	--self:DebugTalk("\n\t COLLISION GROUP #: " .. self:GetCollisionGroup() .. "\n\tEXPECTED: " .. cg .. "\n")
	--self:DebugTalk("\n\t SOLID GROUP #: " .. self:GetSolid()  .. "\n\tEXPECTED: " .. sg .. "\n")
	--self:DebugTalk("\n\t SOLID FLAGS #: " .. self:GetSolidFlags().. "\n") -- .. "\n\tEXPECTED: " .. sg ..
	--self:DebugTalk("\n\t COLLISION BOUNDS: ".. tostring(self:GetCollisionBounds()).."\n")
	
	return self.Entity
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
		
		self.Entity:EmitSound( "items/spawn_item.wav" ) -- No sound option?
		self.Entity:Remove()
		
		--self:DebugTalk("PICKUP DATA - AMMO: " .. tostring(self.AMMOTYPE).. " x"..tostring(self.AMOUNT).."\n\n")
		
		activator:GiveAmmo( self.AMOUNT, self.AMMOTYPE )	
	end

end
