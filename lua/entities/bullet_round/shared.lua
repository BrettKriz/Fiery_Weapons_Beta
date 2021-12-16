ENT.Type 				= "anim"
ENT.Base 				= "base_gmodentity"
  
ENT.PrintName			= "Bullet_Round"
ENT.Author 				= "Nova Prospekt"
ENT.Contact 			= "FacePunch"
ENT.Purpose				= "Physical Bullets (2014 - )"
 
ENT.Spawnable 			= false
ENT.AdminSpawnable 		= false


ENT.WorldModel				= "models/weapons/w_bullet.mdl"
ENT.AmmoType				= "Pistol"
ENT.InitFPS					= nil

-- Physcial Properties
ENT.Mass					= nil
ENT.AttackDamage			= 25 -- Make it setable
ENT.Gravity					= 0.14	-- Between 0 and 1
ENT.OrgAng					= nil	-- In good time, you will be defined
ENT.OrgVec					= nil	-- DIDO
ENT.OwnersInitVel			= nil
ENT.StockBullet				= nil 	-- Becuase weapon systems need to be able to switch between Stock and Non-Stock damage

function ENT:OnRemove()
	--self.Entity:StopSound("Missile.Ignite")
end


	