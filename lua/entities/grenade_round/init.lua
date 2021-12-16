 AddCSLuaFile("cl_init.lua")
 AddCSLuaFile("shared.lua")

 include("shared.lua")
  
  function ENT:Initialize()
		--util.PrecacheSound("weapons\airboat\airboat_gun_lastshot1.wav")
		self.OrgAng = self.Entity:GetAngles() -- GOTCHA
		
		self.Entity:SetModel(self.WorldModel)
		
		self.Entity:SetMoveType(MOVETYPE_FLYGRAVITY)
		self.Entity:SetGravity(self.Gravity)
		self.Entity:SetSolid(SOLID_VPHYSICS) -- 
		
		self.ExpireTime = CurTime() + 8
		--self.Entity:EmitSound("")

				
		-- Add Trace
		local add = false
		local sw = 1
		local ew = 0.0
		local len = 0.05
		util.SpriteTrail(self.Entity, 0, Color(255,255,255), add, sw, ew, len, 1/(sw+ew)*0.5, "materials/trails/tube.vmt") -- Zeeuuuee
		
		timer.Simple(50, function()
			if(self.Entity == nil) then return end
			-- Now that we know were good
			self.Entity:Remove() -- Kill yourself ;D
		end)
		
		return true
end

function ENT:SetOrgVec(arg)
	if not type(arg) == "vector" then 
		MsgAll("MEOW!")
		return
	else
		self.OrgVec = arg
		
	end
end

function ENT:SetOrgVel(arg)
		if not arg then arg = 1 end
		self.OwnersInitVel = arg

end

function ENT:Think()
	
		--
		self.Entity:SetAngles( self.Entity:GetVelocity():Angle() )
		
		if self.ExpireTime and (CurTime() > self.ExpireTime) then
			--Msg("Expired!\n")
			self.Entity:SetGravity(self.Gravity)
			self.ExpireTime = CurTime() + 5
		end
		
end
	
	
function ENT:GetAttackDamage()
		-- Add distance tracking??
		
		if true then
			return self.AttackDamage
		end
		
		local dist 		= ( self:GetPos():Distance( Vector(self.OrgVec) ) ) -- Find Distance
		
		local AmmoTypes = {} -- All measurment from Federal manufacturers
			--							Bullet Diamiters n shit
			--							   Diam, mass, ft*lbf,
			--								IN,  LBS , ^^^^
			AmmoTypes["pistol"] 		= {0.35, 0.017, 410} 		-- 9x19mm
			AmmoTypes["alyxgun"] 		= {0.45, 0.033, 369} 		-- .45 APC Standard damage is 5 | Kriss Kard
			AmmoTypes["357"]			= {0.357, 0.017, 791}     	-- .357 Magnum silly, more velocity than the 9mm despite its size
			AmmoTypes["ar2"]			= {0.224, 0.027, 1456}		-- 5.56 NATO
			AmmoTypes["smg1"]			= {0.183, 0.003, 330}		-- 4.6
			AmmoTypes["shotgun"]		= {0.775, 0.06, 550}		-- Buckshot
			AmmoTypes["buckshot"]		= {0.775, 0.06, 550} 		-- Buckshot
			AmmoTypes["combinesniper"]	= {0.312, 0.055, 2416}		-- 7.92 NATO
			
		local bt		= AmmoTypes[ string.lower(self.AmmoType) ]
		local diam		= bt[1]
		local lbs		= bt[2]
		local flb		= bt[3]
		
		local dragf		= self:GetVelovity():Length() - (dist/bdi)
						-- 320 f/s is enough to cause damage
						-- 2 story fall (256 in) is enough to cause damage irl and ig, mp_falldamage 1, causes
						-- From EXACTLY 250in, 1 damage is endured
						-- 32.15 f/s
		--local aaa		= nil
		--self.AttackDamage
		local ans		=  flb * lbs
		MsgAll(tostring(ans))
		
		if not ans then
			ErrorNoHalt("Failed!!")
			-- fuck
			return self.AttackDamage
		end
		
		return ans
		
end

CreateConVar("swep_stock_damage", 1, true, true)


function ENT:GiveDamage(target)
local pos = self.Entity:GetPos()
local fx = EffectData()
	fx:SetOrigin(pos)
	
	util.BlastDamage(self.Entity, self:GetOwner(), pos, self.AttackRadius, self.AttackDamage)
	util.Effect("Explosion", fx) --Explode weakly into the world, no GCOMBAT damage
	
	if not target:IsWorld() then
		target:Ignite(6, 12) -- If we direct hit, it better hurt
	end
	
	self.Entity:Remove()
end



function ENT:Touch(ent)
	if not (ent:GetPhysicsObject():IsValid()) then return end

	if tobool(string.find( ent:GetModel(), "fence")) then
		ent:SetTrigger(false)
		-- Affect the fence, lol
		return
	end
	
	if not (ent:IsWorld() or ent:IsPlayer() or ent:IsNPC()) then return end

	--self.Entity:StopSound("weapons/rpg/rocket1.wav")	--handled in shared OnRemove
	self:GiveDamage(ent)
end

function ENT:GibSelf(mass)
	if not mass then mass = 1 end
			local vn = self.Entity:GetVelocity():GetNormal()
			local pos = self.Entity:GetPos()
			
			--Msg("Bazooka shell Deflected!\n")
					local gib = ents.Create( 	"prop_physics_override" )
						gib:SetModel( 			self.WorldModel )
						gib:SetModelScale( 		self:GetModelScale() * 1, 1 )
						gib:SetPos( 			pos - vn )
						gib:SetAngles( 			self.Entity:GetAngles() )
						gib:PhysicsInit( 		SOLID_VPHYSICS )
						gib:SetCollisionGroup( 	COLLISION_GROUP_WEAPON )
						gib:Spawn()
						gib:Activate()
						local gibphys = gib:GetPhysicsObject()
						if gibphys:IsValid() then
							gibphys:SetMass(mass)
							gibphys:SetVelocity(vn*10100)
						end
						--Set a delete timer for the gib prop
				timer.Simple(0.50, 
							function() 
								if gib:IsValid() then gib:Remove() end
					end )
	end
