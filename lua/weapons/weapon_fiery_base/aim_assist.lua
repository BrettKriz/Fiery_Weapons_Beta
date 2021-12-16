--[[--
	Fiery Weapons Base
	Made by: Nova Prospekt, CloudScript
	
	File: aim_assist
	Side: Shared? CL
	
	A Modifided weapon_cs_base
 --]]--

----------------------------------------------------------------------------------------------------
-- The rest of the code is sensitive aimbot code -- #DontCheat
----------------------------------------------------------------------------------------------------
MsgC( Color( 222, 111, 11 ), "<> aim_assist \n")

SWEP.Aimbot = {}
SWEP.Aimbot.Target = nil
SWEP.Aimbot.DeathSequences = {
	["models/barnacle.mdl"]			= {4,15},
	["models/antlion_guard.mdl"]	= {44},
	["models/hunter.mdl"]			= {124,125,126,127,128},
	["models/headcrabblack.mdl"]	= {12},
	["models/headcrab.mdl"]			= {12},
	["models/headcrabclassic.mdl"]	= {12}
} -- Need Adjustments

-- HEADCRABS - FIX THEM

function GiveMe3dDist(x1, y1, z1, x2, y2, z2)
	-- Get 3d Distance
	local A = (x2 - x1)^2
	local B = (y2 - y1)^2
	local C = (z2 - z1)^2
	
	local D = math.sqrt( math.abs(A+B+C) )
	
	return D
end

function SWEP:OnTarget( dist ) 
	-- Once you've aimed at a target
	-- Your code here
	local b1 = true;
	local tbl = 	{"Drop your weps 1.wav",
					"Drop your weps 2.wav",
					"Gimme Your Wallet!!.wav",
					"Shut your fucking face (punk)!.wav",
					"The one and only.wav"}
	if b1 then
		local str = "vo/"..(tbl[math.floor(math.Rand(1,5))])
		self.Owner:EmitSound(str)
		self:DebugTalk("Targeting Sound: "..tostring(str).." \n")
	end
	
	return true
end

function SWEP:GetHeadPos(ent)
	-- No longer will it nessicarly be head pos
	local model = ent:GetModel() or ""
	local t = ent:GetPos()
	local tx, ty, tz = t.x,t.y,t.x
	local p = self.Owner:GetShootPos()
	-- self.Owner:GetShootPos()-- self.Owner:GetPos()
	local px, py, pz = p.x,p.y,p.z
	
	--ErrorNoHalt("T: "..tx.." | "..ty.." | "..tz.."\n")
	
	local Target = ent:GetPos()
	local Holder = self.Owner:GetPos()
	
	local HowFar = 0.0
	local d			= Holder:Distance( Target )
	-- (tx ~= nil and ty ~= nil) and 
	if d and d <= self.Range	 then
		HowFar = d
		--HowFar = GiveMe3dDist(px, py, pz, tx, ty, tz)
	else
		HowFar = self.Range*1.1	
		-- FSS
		--local text = "The Fucking Vectors are 1nil:" .. tostring(ent:GetPos()) .. " " .. tostring(self.Owner:GetPos()) .. "\n"
		--Msg(text)
	end

	local b1 = (ent:GetAttachment(ent:LookupAttachment("eyes")) ~= nil)
	local b2 = (tx ~= nil and ty ~= nil)
	local b3 = HowFar < self.Range/3
	local b4 = b2 and b3
	
	if model:find("crow") or model:find("seagull") or model:find("pigeon") or model:find("manhack") then
		return ent:LocalToWorld(ent:OBBCenter() + Vector(0,0,-5))
	-- Get Normal Headpos
	elseif model:find("headcrab") then
		return ent:LocalToWorld(ent:OBBCenter() + Vector(0,0,-7))
	elseif b4 then
		--ErrorNoHalt("Using Eye pos\t|1 "..tostring(b1).." |2 "..tostring(b2).." |3 "..tostring(b3).." |4 "..tostring(b4).."\n")
		local e = ent:LookupAttachment("eyes")
		local ey = ent:GetAttachment(e)
		local eyy 
		
		--ErrorNoHalt(tostring(ey or nil).."<<<<<<<<<<<\n")
		if (ey == nil) then return ent:LocalToWorld(ent:OBBCenter() + Vector(0,0,11)) end
		eyy = ey["Pos"] or Vector(0,0,0)
		/*
		for k,v in pairs(ey) do
			Msg("\tK: "..tostring(k).." , V: "..tostring(v).."\n")
		end
		*/
		--ErrorNoHalt("EYY: "..tostring(e).." |EY "..tostring(ey).." |EYY "..tostring(eyy).."\n")
		return eyy
	else
		--ErrorNoHalt("Using body pos\t|1 "..tostring(b1).." |2 "..tostring(b2).." ~ "..tostring(tx).. ","..tostring(ty).." |3 "..tostring(b3).." |4 "..tostring(b4).."\n")
		return ent:LocalToWorld(ent:OBBCenter() + Vector(0,0,11))
		--ent:LocalToWorld(ent:OBBCenter() + Vector(0,0,11))
	end
end

function SWEP:Visible(ent)
	local trace = {}
	trace.start = self.Owner:GetShootPos()
	--Msg(tostring(self.Owner:GetShootPos()-self:GetHeadPos(ent)))
	trace.endpos = self:GetHeadPos(ent)
	trace.filter = {self.Owner,ent}
	trace.mask = MASK_SHOT
	local tr = util.TraceLine(trace)
	return tr.Fraction >= 0.99 and true or false
end

function SWEP:CheckTarget(ent, range) -- Used to screen other characters
	if ent == nil then return false end
	if self.Owner:GetPos():Distance(ent:GetPos()) > (range or self.Range or 50) then return false end
	if not self:Visible(ent) then return false end
	if ent:IsPlayer() then
		if !ent:IsValid() then return false end
		if ent:Health() < 1 then return false end
		if ent == self.Owner then return false end	
		
		return true
	end
	if ent:IsNPC() then
		if ent:GetMoveType() == 0 then return false end
		if table.HasValue(self.Aimbot.DeathSequences[string.lower(ent:GetModel() or "")] or {},ent:GetSequence()) then return false end
		return true
	end
	return false
end

function SWEP:GetTargets()
	local tbl = {}
	for k,ent in pairs(ents.FindInCone(self.Owner:GetShootPos(),self.Owner:GetAimVector(), (self.Range/math.sin(math.pi/6))*math.sin(math.pi/3), 30)) do
		if ent ~= nil and self:CheckTarget(ent) == true then
			table.insert(tbl,ent)
			
		end
	end
	return tbl
end

function SWEP:GetClosestTarget()
	local pos = self.Owner:GetPos()
	local ang = self.Owner:GetAimVector()
	local closest = {0,0}
	
	if not pos or not ang then
		ErrorNoHalt("[!] MISSING INFO! @@@MEOW")
		return
	end
	
	for k,ent in pairs(self:GetTargets()) do

		local diff = (ent:GetPos()-pos):GetNormalized()
--		ErrorNoHalt(" ENT: "..tostring(ent).." \n\t|ANG "..tostring(ang).." \n\t\t|POS ".. tostring(pos).." \n\t\t\t|V "..tostring(v).." \n\t\t\t|P "..tostring(p).." \n\t\t\t|DIFF "..tostring(diff).."\n")
		diff = diff - ang
		diff = diff:Length()
		diff = math.abs(diff)
--		ErrorNoHalt("DIFF: "..tostring(diff).."\n")
		if (diff < closest[2]) or (closest[1] == 0) then
			closest = {ent,diff}
		end
		
		
	end
	
	return closest[1]
end

function SWEP:AimAssistThink()
	-- self.Owner:KeyDown(IN_ATTACK2)
	if not self:CheckCanPrimaryAttack() then 
		return
	else
		--self:DebugTalk("AAT: Check Primary WORKED!\n")
	end
	local ent = self:GetClosestTarget()
	self.Aimbot.Target = (ent ~= 0) and ent or nil
	return ent
end

function SWEP:CheckCanPrimaryAttack()
	-- I know what your thinking, but yes, it needed to be seperate
	
	if (self.Primary.ClipSize < 0) then -- and (self:Ammo1() > 0)
		return true -- MELEE
	end
	
	if self.Weapon:GetVar("PrimaryMagOut") or self:IsFlooded() then return false end

	if self.Weapon:Clip1() <= 0 and self.Primary.ClipSize > 0 and (self:Ammo1() >= 0) then return false end

	
	return true
end

function SWEP:AimAssist(ent)
	-- Toggle the auto aim
	--ErrorNoHalt("AAT: "..tostring(t).."\n")
	if not ent then
		local t = self:AimAssistThink()
		self:DebugTalk("AAT2: "..tostring(t).."\n")
	elseif not (ent:IsNPC() or ent:IsPlayer())  then
		-- Make sure this is a valid enemy
		--self:AimAssistThink()
		self:DebugTalk("AimAssist target not valid! Returning...\n")
		return false
	else
		self.Aimbot.Target = ent
	end
	
	local flag = self:DoAimAssist()
	if (flag == true) then
		self:OnTarget()
		self:DebugTalk("Target Aquired! "..tostring(ent).."\n")
		return true
		else
		self:DebugTalk("Target Not Found!\n")
	end
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Secondary.Delay) -- @@@ NEW VAR FOR THIS!
	return false
end

function SWEP:DoAimAssist()
	if self.Aimbot.Target ~= nil then
	
		local ang = (self:GetHeadPos(self.Aimbot.Target) - self.Owner:GetShootPos()):Angle()
		self.Owner:SetEyeAngles(ang)
		return true
	else
		return false
	end
end

function SWEP:DrawRotatingCrosshair(x,y,time,length,gap)
	surface.DrawLine(
		x + (math.sin(math.rad(time)) * length),
		y + (math.cos(math.rad(time)) * length),
		x + (math.sin(math.rad(time)) * gap),
		y + (math.cos(math.rad(time)) * gap)
	)
end

function SWEP:GetCoordiantes(ent)
	local min,max = ent:OBBMins(),ent:OBBMaxs()
	local corners = {
		Vector(min.x,min.y,min.z),
		Vector(min.x,min.y,max.z),
		Vector(min.x,max.y,min.z),
		Vector(min.x,max.y,max.z),
		Vector(max.x,min.y,min.z),
		Vector(max.x,min.y,max.z),
		Vector(max.x,max.y,min.z),
		Vector(max.x,max.y,max.z)
	}

	local minx,miny,maxx,maxy = ScrW() * 2,ScrH() * 2,0,0
	for _,corner in pairs(corners) do
		local screen = ent:LocalToWorld(corner):ToScreen()
		minx,miny = math.min(minx,screen.x),math.min(miny,screen.y)
		maxx,maxy = math.max(maxx,screen.x),math.max(maxy,screen.y)
	end
	return minx,miny,maxx,maxy
end

function SWEP:FixName(ent)
	if not ent:IsValid() then return "A Ghost!" end
	if ent:IsPlayer() then return ent:Name() end
	if ent:IsNPC() then return ent:GetClass():sub(5,-1) end
	return ""
end

--self:DrawAimRectangle(x,y)

function SWEP:DrawAimRectangle(x, y)
	-- GTA 3
	if (self.Aimbot.Target ~= nil) and ((self.Owner:KeyDown( IN_ATTACK2  )) or (self.Owner:KeyDown( IN_USE ))) then
		local text = "Aiming for "..self:FixName(self.Aimbot.Target).."..."
		surface.SetFont("Default")
		local size = surface.GetTextSize(text)
		draw.RoundedBox(4,36,y-135,size+10,20,Color(0,0,0,100))
		draw.DrawText(text,"Default",40,y-132,Color(255,255,255,200),TEXT_ALIGN_LEFT)
		local x1,y1,x2,y2 = self:GetCoordiantes(self.Aimbot.Target)
		local edgesize = 8
		surface.SetDrawColor(Color(255,10,0,200))
		
		-- Top left.
		surface.DrawLine(x1,y1,math.min(x1 + edgesize,x2),y1)
		surface.DrawLine(x1,y1,x1,math.min(y1 + edgesize,y2))

		-- Top right.
		surface.DrawLine(x2,y1,math.max(x2 - edgesize,x1),y1)
		surface.DrawLine(x2,y1,x2,math.min(y1 + edgesize,y2))

		-- Bottom left.
		surface.DrawLine(x1,y2,math.min(x1 + edgesize,x2),y2)
		surface.DrawLine(x1,y2,x1,math.max(y2 - edgesize,y1))

		-- Bottom right.
		surface.DrawLine(x2,y2,math.max(x2 - edgesize,x1),y2)
		surface.DrawLine(x2,y2,x2,math.max(y2 - edgesize,y1))
	end
end