/* Fiery Ballistic Vest */
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.MODEL 			= "models/weapons_ges/halfarmor/halfarmor.mdl"
ENT.MULTIPLY 		= 1
ENT.ARMORGIFT		= 200 		-- 2 armor is equal to about 1 health
ENT.LASTHIT			= CurTime()

local snd			= "player/kevlar1.wav" -- Impact sound

function ENT:SpawnFunction( ply, tr ) 
   
 	if ( !tr.Hit ) then return end 
 	 
 	local SpawnPos = tr.HitPos + tr.HitNormal * 16 
 	 
 	local 	ent = ents.Create( self.Classname ) 
			ent:SetPos( SpawnPos ) 
			ent:Spawn() 
			ent:Activate() 
 	 
 	return ent 
 	 
 end 

function ENT:Initialize()	

	self:SetModel( self.MODEL )
	
	self:PhysicsInit( SOLID_VPHYSICS )

	local phys = self:GetPhysicsObject()  	
	if phys:IsValid() then  		
		phys:Wake()  	
	end
	
	if( self.MASS )then
		self.Entity:GetPhysicsObject():SetMass( self.MASS );
	end
	
end

function ENT:OnTakeDamage( dmginfo )
 
	if ( self.LASTHIT >= CurTime()+1 ) then
		self.Entity:TakePhysicsDamage( dmginfo ) 
		self.Entity:EmitSound( snd )
		self.LASTHIT = CurTime()+2
	end
 end

function ENT:PhysicsCollide( data, physobj )
	
	// Play sound on impact
	if (data.Speed > 15 && data.DeltaTime > 0.5 ) then
		self.Entity:EmitSound( snd )
	end
end

function ENT:Use(activator,caller)
	
	if ( activator:IsPlayer() and activator:IsSuitEquipped() and (activator:Armor() < self.ARMORGIFT) ) then
		self.Entity:Remove()
		self.Entity:EmitSound( "items/armor_pickup.wav", 75, 60 )
		local Armor = activator:Armor()
		
		activator:SetArmor( self.ARMORGIFT )
		
	end

end
