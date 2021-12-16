ENT.Type 					= "anim"
ENT.Base 					= "base_gmodentity"
  
ENT.PrintName				= "Grenade_round"
ENT.Author 					= "Nova Prospekt"
ENT.Contact 				= "FacePunch"
ENT.Purpose					= "Grenade_round (2014 - )"
 
ENT.Spawnable 				= false
ENT.AdminSpawnable 			= false


--ENT.WorldModel				= "models/weapons/w_bullet.mdl"
ENT.WorldModel				= "models/weapons/ar2_grenade.mdl"
ENT.AmmoType				= "Pistol"
ENT.InitFPS					= nil

-- Physcial Properties
ENT.Mass					= 1
ENT.AttackDamage			= 200 -- Make it setable
ENT.AttackRadius			= 256
ENT.Gravity					= 0.70	-- Between 0 and 1
ENT.OrgAng					= nil	-- In good time, you will be defined
ENT.OrgVec					= nil	-- DIDO
ENT.OwnersInitVel			= nil

function ENT:OnRemove()
	--self.Entity:StopSound("Missile.Ignite")
end


	