
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )


// This is the spawn function. It's called when a client calls the entity to be spawned.
// If you want to make your SENT spawnable you need one of these functions to properly create the entity
//
// ply is the name of the player that is spawning it
// tr is the trace from the player's eyes 
//
function ENT:SpawnFunction( ply, tr )

	if ( !tr.Hit ) then return end
	
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	
	local ent = ents.Create( "item_kevlar" )
		ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	
	return ent
	
end


/*---------------------------------------------------------
   Name: Initialize
---------------------------------------------------------*/
function ENT:Initialize()

	
	self.Entity:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
	
	// Don't use the model's physics - create a sphere instead
	self.Entity:PhysicsInitBox( 16, "metal_bouncy" )
	
	// Wake the physics object up. It's time to have fun!
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	
	// Set collision bounds exactly
	self.Entity:SetCollisionBounds( Vector( -16, -16, -16 ), Vector( 16, 16, 16 ) )
	
end


/*---------------------------------------------------------
   Name: PhysicsCollide
---------------------------------------------------------*/
function ENT:PhysicsCollide( data, physobj )
	
	// Play sound on bounce
	if (data.Speed > 80 && data.DeltaTime > 0.2 ) then
		self.Entity:EmitSound( "Rubber.BulletImpact" )
	end
	
	// Bounce like a crazy bitch
	local LastSpeed = math.max( data.OurOldVelocity:Length(), data.Speed )
	local NewVelocity = physobj:GetVelocity()
	NewVelocity:Normalize()
	
	LastSpeed = math.max( NewVelocity:Length(), LastSpeed )
	
	local TargetVelocity = NewVelocity * LastSpeed * 0.9
	
	physobj:SetVelocity( TargetVelocity )
	
end

/*---------------------------------------------------------
   Name: OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage( dmginfo )

	// React physically when shot/getting blown
	self.Entity:TakePhysicsDamage( dmginfo )
	
end


/*---------------------------------------------------------
   Name: Use
---------------------------------------------------------*/
function ENT:Use( activator, caller )

	self.Entity:Remove()
	
	if ( activator:IsPlayer() ) then
	
		self.Entity:EmitSound( "Rubber.BulletImpact" )
		local health = activator:Health()
		activator:SetHealth( health + 1000 )
		
	end

end



