include("shared.lua")

	function ENT:Initialize()
		self.SmokeTimer = CurTime() + 0.1 --keeps the smoke out of your face when firing
	end

	function ENT:Draw()
		self.Entity:DrawModel()
	end
	--Smoke effect, shamelessly stolen from dear Garry: 
	--   <_<   >_>   :D   XD   :P   >:D
	function ENT:Think() 
		self.SmokeTimer = self.SmokeTimer or 0 
		if ( self.SmokeTimer > CurTime() ) then return end 
		self.SmokeTimer = CurTime() + 0.005 
		local vOffset = self.Entity:LocalToWorld( vector_origin ) + Vector( math.Rand( -3, 3 ), math.Rand( -3, 3 ), math.Rand( -3, 3 ) ) 
		local vNormal = (vOffset - self.Entity:GetPos()):GetNormalized() 
		local emitter = self:GetEmitter( vOffset, false ) 
		
	end 
	
	function ENT:GetEmitter( Pos, b3D ) 
		if ( self.Emitter ) then	 
			if ( self.EmitterIs3D == b3D && self.EmitterTime > CurTime() ) then 
				return self.Emitter 
			end 
		end 
		self.Emitter = ParticleEmitter( Pos, b3D ) 
		self.EmitterIs3D = b3D 
		self.EmitterTime = CurTime() + 2 
		return self.Emitter 
	end  