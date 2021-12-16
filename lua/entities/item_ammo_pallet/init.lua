/* Fiery Magazine Sent */
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.MODEL 				= "models/props/de_prodigy/ammo_can_03.mdl" 

ENT.MASS				= 200 -- This should be impossible to move with grav gun, but that wont fly

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
	AmmoTypes = {} -- LOWER CASE THESE ALL
	local pistol_amt = 2.45
		AmmoTypes["ar2"]					= self.AMOUNT
		AmmoTypes["ar2altfire"]				= self.AMOUNT / 62
		AmmoTypes["pistol"]					= self.AMOUNT * pistol_amt
		AmmoTypes["smg1"]					= self.AMOUNT * 1.25
		AmmoTypes["357"]					= self.AMOUNT * 1.50
		AmmoTypes["xbowbolt"]				= self.AMOUNT / 10
		AmmoTypes["buckshot"]				= self.AMOUNT / 2
		AmmoTypes["rpg_round"]				= self.AMOUNT / 22
		AmmoTypes["smg1_grenade"]			= self.AMOUNT / 38
		AmmoTypes["grenade"]				= self.AMOUNT / 50
		AmmoTypes["slam"]					= self.AMOUNT / 240 -- This is C4(slams), a rare item, on some darkRP servers...
		AmmoTypes["alyxgun"]				= self.AMOUNT * 1.25
		AmmoTypes["sniperround"]			= self.AMOUNT / 4
		AmmoTypes["sniperpenetratedround"]	= self.AMOUNT / 4
		AmmoTypes["thumper"]				= self.AMOUNT
		AmmoTypes["gravity"]				= self.AMOUNT
		AmmoTypes["battery"]				= self.AMOUNT
		AmmoTypes["gaussenergy"]			= self.AMOUNT
		AmmoTypes["combinecannon"]			= self.AMOUNT / 2
		AmmoTypes["airboatgun"]				= self.AMOUNT
		AmmoTypes["striderminigun"]			= self.AMOUNT/2
		AmmoTypes["helicoptergun"]			= self.AMOUNT/2
		AmmoTypes["9mmround"]				= self.AMOUNT * pistol_amt
		AmmoTypes["mp5_grenade"]			= self.AMOUNT / 38
		AmmoTypes["hornet"]					= self.AMOUNT / 420 -- Determine use case?
		AmmoTypes["striderminigundirect"]	= self.AMOUNT
		AmmoTypes["combineheavycannon"]		= self.AMOUNT / 16
	
	
	if activator:IsPlayer() then
		
		self.Entity:EmitSound( "items/ammo_pickup.wav" ) -- No sound option?
		self.Entity:Remove()
		
		--self:DebugTalk("PICKUP DATA - AMMO: " .. tostring(self.AMMOTYPE).. " x"..tostring(self.AMOUNT).."\n\n")
		
		
		for k,v in pairs(AmmoTypes) do
		
			activator:GiveAmmo( v, k )	
		
		end
		
		
	end

end
