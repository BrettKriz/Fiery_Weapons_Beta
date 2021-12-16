--[[--
	Fiery Weapons Base
	Made by: Nova Prospekt
	
	File: animations
	Side: Shared
	
	A Modifided weapon_cs_base 
	Started on 06/28/2011
 --]]--
 
MsgC( Color( 222, 111, 11 ), "<> ANIMATIONS \n")
--AddCSLuaFile( "cl_init.lua" ) 

function SWEP:TestAnims()
	
	self:Talk("Is it cold outside? " .. tostring(self:WoldIsCold()))
	
	-- Check usage & Update Rate outside of DEV
	local arod = {self.Primary.EmptyAnim,
					self.Primary.ShootAnim,
					self.Secondary.EmptyAnim,
					self.Secondary.ShootAnim,
					self.ReloadAnim,
					self.EmptyReloadAnim,
					self.DrawAnim,
					self.EmptyDrawAnim,
					self.EmpytyIdleAnim,
					self.IdleAnim}

	self:Talk("TESTING ANIMATIONS!")
	
	self:Snowball( function() self:VMact("primary") end)
	self:Snowball( function() self:VMact("dryfire",1,nil,true) end)
	self:Snowball( function() self:VMact("reload",.5,nil,true,true) end)
	self:Snowball( function() self:VMact(ACT_VM_DRAW,0.25,nil,false,true) end)
	self:Snowball( function() self:Beep("Almost done") end)
	self:Snowball( function() self:VMact("idle") end)
	self:Snowball( function() self:VMact("primary") end)
	self:Snowball( function() self:VMact("reload",.6) end)
	
	for x = 1, #arod do
		self:Snowball( function()
			self:VMact(arod[x])
			end)
	end
	--local ls = model:LookupSequence(anim_name)
			--ErrorNoHalt("\nLS: "..tostring(ls).."\n")
			--model:SendViewModelMatchingSequence(ls)
	self:Snowball( function() self:Talk("TESTING ALL ANIMATIONS!") end)
	
	for k,v in pairs(ACTs) do
		self:Snowball( function()
						--self:VMact(v)
						if not isTbl(self) or not isTbl(self.Weapon) then return end
						self.Weapon:SendWeaponAnim(v)
						print(k .. " - " ..  tostring(v))
						self:Talk(k .. " - " ..  tostring(v))
					end)
	end
	
	self:Talk("DONE!")
	self:MeltSnowball()
end

NextTime = 0
function SWEP:Snowball(func, time)
	if not time then time = 2.5 end
	timer.Simple(NextTime + time, func)
	print(" ~ " .. tostring(time))
	NextTime = NextTime + time
end

function SWEP:MeltSnowball()
	NexTime = 0
	self:Beep()
end

function SWEP:GetTracerOrigin(arg) -- arg a boolean
	
	local vm 	= self.Owner:GetViewModel()
	local at 	= nil
	local obj 	= nil
	
	-- Akimbo only seems to exist
	-- Inside of CS:S and CS:GO, so...
	if ( self.Akimbo ) then
		if ( arg == true ) then
			-- Left
			at 	= "2"
		else
			-- Right
			at 	= "1"
			
		end
	elseif ( self.PreferedAttachment == nil ) then
		-- Figure out what it should be then
		local temp
		if ( self.DoDModelFunction ) then
			-- Check this part@@@
			temp = vm:LookupAttachment( "muzzle" )
		else
			temp = vm:LookupAttachment( "muzzle" )
		end
		 
		if ( temp == nil ) then
			-- CS:S or poor quality model
			temp = vm:LookupAttachment( "1" )
		end
		
		obj 		= temp
	elseif ( self.PreferedAttachment ~= nil ) then
		-- Use it, easy!
		obj 	= self.PreferedAttachment
	end
	
	
	if (obj == nil) then
		obj 		= vm:LookupAttachment( "1" )
	end

	return vm:GetAttachment( obj ) -- vector
end

/*---------------------------------------------------------
   Name: ACT to STR
   Desc: Translates ACT enum's into Strings of the enums
---------------------------------------------------------*/
function SWEP:ACTtoSTR(arg)
	if not arg then return -1 end
	if arg == nil or not (type(arg) == "number") then return end
	
	if tonumber(arg) != nil then
		arg = tonumber(arg)
	end
	
	local ans = table.KeyFromValue(ACTs, arg)
	if ans == nil then
		Error("Failed to find KEY from the VALUE: " .. tostring(arg).."\n")
		return
	end
	return ans
end

function SWEP:STRtoACT(arg)
	if not arg or not (type(arg) == "number" or type(arg) == "string") then
		self:Beep(":D")
	end
	ans = ""
	
	
	if tonumber(arg) != nil then
		arg = tonumber(arg)
		
	end
	
	--self:Talk(type(arg))
	
	if type(arg) == "string" then
		ans = ACTs[arg]
		
		if not(ans == nil or ans == "") then
			return tonumber(ans)
		else
			--ErrorNoHalt("\n [!] Failed to find ACT based on STRING: " .. arg .. " !~ " .. tostring(ans) .. "~~~~~\n")
			--self:Talk(tostring(arg))
			return "ACT_VM_PRIMARYATTACK"
		end
		
	elseif type(arg) == "number" then
		local ans = table.KeyFromValue(ACTs, arg)-- Eval once
		
		if not(ans == nil or ans == "") then
			return tostring(ans)
		else
			ErrorNoHalt("\n [!] Failed to find STRING based on ACT: " .. arg .. " !~~~~~~\n")
			--self:Talk(tostring(arg))
			return "ACT_VM_DRAW"
		end
	else
		return nil
	end
end

/*---------------------------------------------------------
	Animation Index 1
---------------------------------------------------------*/
function SWEP:GrabAnimIndex()
	-- This function needs so much work.
	local badstrs = {"/weapons/c_","/weapons/cstrike/c_", 
										"/v_rif_",
										"/v_pist_",
										"/v_smg_",
										"/v_shot_",
										"/v_snip_",
										"/v_pist_",
										"BUGS"}
	
	HasBadSTRs = false
	
	for k,v in pairs(badstrs) do
		HasBadSTRs = string.find(string.lower(self.ViewModel), badstrs[k])
	end

	-- @@@ Consider usefullness of scrpt below
	if true then return end
	-- Not very usefull..

	if (self:IsScripted() and (self.DoDModelFunction == true) and string.find(self.ViewModel, "/weapons/v_") and not HasBadSTRs) then
		self:Talk("Setting to DoD:S anims @animations")
		// Normal animations found in MOST pistols and some rifles
		self.Primary.EmptyAnim		= ACT_VM_PRIMARYATTACK_EMPTY
		self.Primary.ShootAnim		= ACT_VM_PRIMARYATTACK
		// If the weapon should be held like a shotgun when not in iron sight
		// If the held animation is crossbow, then it will be held like an AR2
		self.Secondary.EmptyAnim	= ACT_VM_DRAW		 // No dryfire anims for secondary attacks(normally)
		self.Secondary.ShootAnim	= ACT_VM_SECONDARYATTACK // Melee, Special action, Secondary fire
		// Abnormal reload, as in HL2 and DODS style pistol reloads
		self.ReloadAnim				= ACT_VM_RELOAD
		self.EmptyReloadAnim		= ACT_VM_RELOAD_EMPTY
		// Once agian, Abnormal as defined above
		self.DrawAnim				= ACT_VM_DRAW
		self.EmptyDrawAnim			= ACT_VM_DRAW_EMPTY
		// Most Pistol, rifle, and shotgun models have these animations... Because VALVe modelers are smart!
		self.EmpytyIdleAnim			= ACT_VM_IDLE_EMPTY
		self.IdleAnim 				= ACT_VM_IDLE
		
			-- Good bye arm, MAKING V models to C models, HOPEFULLY @@@
			--
		self.ViewModelBoneMods = {
			["ValveBiped.Bip01"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
								}
								--[[
								self.ViewModelBoneMods = {
			["ValveBiped.Bip01"] = { scale = self.BoneScaler, pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
								}--]]
	else
		self:Talk("Setting to CS:S anims @animations")
			// Normal animations found in MOST pistols and some rifles
		self.Primary.EmptyAnim		= ACT_VM_DRYFIRE
		self.Primary.ShootAnim		= ACT_VM_PRIMARYATTACK
		// If the weapon should be held like a shotgun when not in iron sight
		// If the held animation is crossbow, then it will be held like an AR2
		self.Secondary.EmptyAnim	= ACT_VM_FIDGET			 // No dryfire anims for secondary attacks(normally)
		self.Secondary.ShootAnim	= ACT_VM_SECONDARYATTACK // Melee, Special action, Secondary fire
		// Abnormal reload, as in HL2 and DODS style pistol reloads
		self.ReloadAnim				= ACT_VM_RELOAD
		self.EmptyReloadAnim		= ACT_VM_RELOAD_EMPTY
		// Once agian, Abnormal as defined above
		self.DrawAnim				= ACT_VM_DRAW
		self.EmptyDrawAnim			= ACT_VM_DRAW
		// Most Pistol, rifle, and shotgun models have these animations... Because VALVe modelers are smart!lol
		self.EmpytyIdleAnim			= ACT_VM_IDLE
		self.IdleAnim 				= ACT_VM_IDLE
		
		self.ViewModelBoneMods = {
			["ValveBiped.Bip01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
								}
	end
end

function SWEP:PreDrawViewModel( vm, wep, ply ) -- @@@

	--vm:SetMaterial( "engine/occlusionproxy" ) -- Hide that view model with hacky material
	
end
-- SelectWeightedSequence
/*---------------------------------------------------------
   Name: VeiwModel Action Engine
   Author: Nova Prospekt [6/28/11]
   Desc: Funnel func for animations. 
---------------------------------------------------------*/
				--	anim_name, pbr, snd, volume, idle_after, iron_off
function SWEP:VMact(anim_name, pbr, snd, volume, idle_after, iron_off)
	-- Just to note, sound can be a table -> {sound, dmg, origin}
	if (anim_name==nil and pbr==nil and snd==nil and idle_after==nil and iron_off==nil ) then return end
	
	-- Welcome to the Animation Engine.
	if not pbr 			then pbr 			= 1.0		end
	if not type(volume) == "number" then	volume = tonumber(volume) or nil end
	if not idle_after 	then idle_after 	= false 	end
	if not iron_off 	then iron_off 		= false 	end -- lol loopback
	
	self:DebugTalk("n\n\tSWEP:VMact args\n\tanim_name: "..tostring(anim_name).."\n\tPBR: "..tostring(pbr).."\n\tSND: "..tostring(snd).."\n\tVolume: "..tostring(volume).."\n\tIdleAfter: "..tostring(idle_after).."\n\tIronOff: "..tostring(iron_off).."\n")
	local doCLOnly = false
	
	if nil == anim_name then
		self:DebugTalk("   ANIM NAME IS NULL, FIX THE STUFF\n\n")
	elseif anim_name != "" then
		self:DebugTalk("\n ENTERING EXE ANIM\n\n")
		
		if type(anim_name) == "string" then
			self:DebugTalk("\n< ANIMATION IS STRING "..tostring(anim_name).." \n")
			local options = {"PRIMARY", "SECONDARY", "DRYFIRE", "RELOAD", "DRAW", "IDLE"}
			local case1 = string.find( anim_name, "ACT_VM_" ) ~= nil
			local case2 = table.HasValue(options, string.upper(anim_name))
			
			-- Filter out SV from some types of sounds
			doCLOnly = string.upper(anim_name) == "RELOAD" -- @@@
			
			if case1 or case2 then
				self:DebugTalk(" COME BACK AND HELP ME!")
				s_arg = self:VMEXEAnim( anim_name ) or snd  -- THIS EXECUTES THE ANIMATIONS 
			else
				self:DebugTalk("\n\nAttempting to SetSequence with arg: "..tostring(anim_name).." a type: " ..type(anim_name).."\n\n")
				local vm = self.Owner:GetViewModel()
				-- Accepts strings and ints
				vm:SetSequence( anim_name ) -- Must be a sequence then
				s_arg = snd  -- THIS EXECUTES THE ANIMATIONS 
			end
		elseif type(anim_name) == "number" then
		self:DebugTalk("\n< ANIMATION IS ENUM\n")
			-- @@ Add logic to check the numbers (for setsequence)
			s_arg = self:VMEXEAnim( anim_name ) or snd
			--s_arg = self:VMEXEAnim( self:ACTtoSTR(anim_name) ) or snd
		end
	end
	local player_anim_time 	= self.Owner:SequenceDuration()
	local VM_anim_time		= self:SequenceDuration()
	
	-- Funnel functionalities for veiw model animations
	if not snd and anim_name and not anim_name ~= "" and s_arg ~= nil then
		snd = s_arg
	end
	-- EVERYTHING ELSE
	-- SOUNDS
	self:DebugTalk("[~] Sound : "..tostring(snd))
	if snd then -- Debuging
		self:EXESound(snd, volume, doCLOnly)
	end
	
	-- NPC STOP
	if (self.Owner:IsNPC()) then return end
		
		
	-- PLAY BACK RATE/ANIM SPEED
	local adjustVMActNotPlayerAct = true
			
	if adjustVMActNotPlayerAct then
		self.Owner:GetViewModel():SetPlaybackRate(pbr)
	else
		--self.Owner:SetPlaybackRate()
		self:AdjustOwnerPBR()
	end
	-- SIGHTS OFF?
	if iron_off == true then
		self:SetIronsights( false )
	end
	if idle_after == true and self.DoesIdle == true then
		self:SetNextIdle("SOON")
	end
	self:DebugTalk("\n BOTTOM of VMAct! Done!\n\n")
end

function SWEP:AdjustOwnerPBR()
		local player_anim_time = self.Owner:SequenceDuration()
		local VM_anim_time = self:SequenceDuration()
		local ratio = (VM_anim_time / player_anim_time) or 1
		
		self.Owner:SetPlaybackRate(ratio)
end

function SWEP:EXESound(snd, vol, CL_only) -- Can receive either just a sound or a table
	if snd == nil and not isTbl(snd) then return end
	-- @@TWEEK ME

	--self:Beep()
	if isTbl(snd) and not(#snd == 1) then -- Sound with a specified Origin (NOT from the weapon neccisarly
			local x = 2
	
			snd1 		= snd[1] or nil
			arg			= snd[2] or nil
			addvol		= snd[3] or nil
			
			if (snd["channel"] == nil) then
				if (string.find(tostring(snd["channel"]),"weapon") == true) then
					channel = CHAN_WEAPON
				else
					channel = CHAN_STATIC
				end
			else
				channel		= snd["channel"]
			end
			
			local t		= type(arg)
			if t == "string" then
					local arg = string.lower(snd[2])
					
					--		MAKE ENUMERATIONS FOR THESE!!!
				if arg == "shot" then
						local argz = string_split(arg)
						
					if (#argz > 1) then
							addvol = tonumber(argz[2])
						
					end
						
						chan = channel
						vol =  math.random(85,115)
						des_ent = self.Weapon
						sndlvl = SNDLVL_GUNFIRE
						pos = self.Owner:GetShootPos()
					if string.find(arg, "quiet_shot") then
							vol = self.SuppressedVolume or 50 -- Meh
					end
				elseif arg == "suit" then
						-- HEV sounds lol
						chan = CHAN_BODY -- Not sure if correct or not
						des_ent = self.Owner
				end
					x = 3
			elseif t == "vector" then
					pos = arg
					x = 2
					pos = self.Owner:GetLocation()
			else
					
			end
				-- Its not? oh well
			
			des_ent		= snd[x+0] or des_ent or self.Owner
			chan 		= snd[x+1] or chan or CHAN_STATIC
			vol			= snd[x+2] or vol or 75
			pitch		= snd[x+3] or pitch or 100 or math.random(100-z,100+z)			
			
			pos 		= snd[x+4] or pos or self.Owner:GetShootPos()
			sndlvl		= snd[x+5] or sndlvl or SNDLVL_NORM
			
			-- Run client side to be heard only by client
			self:DebugTalk(snd1 .. " @ ".. tostring(pos) .." from ".. tostring(des_ent) .." on CHANNEL: ".. tostring(chan) .." ~VOL~ ".. tostring(vol) .." ~SND LVL~ ".. tostring(sndlvl) .." ~PITCH~ ".. tostring(pitch) .. "\n")
			--des_ent:EmitSound( snd1, pos, des_ent, chan, vol, sndlvl, pitch )
			
			if CL_only then
				if (CLIENT) then
					des_ent:EmitSound( snd1, sndlvl, pitch )
				end
			else
				des_ent:EmitSound( snd1, sndlvl, pitch )
			end
			
				
		else -- if not table
	
			if CL_only then
				if (CLIENT) then
					self.Owner:EmitSound( snd )
				end
			else
				self.Owner:EmitSound( snd )
			end
			
		--print(sound)
		end
	end

	--[Created by Nova Prospekt 	06/28/2011]
	-- May need a revision soon, 	08/29/2015
	-- Yeah I wish I had more time 	04/05/2016
	-- Maybe time soon?				11/03/2016
	-- Soo might have to map it out and rebuild
	-- When I get the time			09/16/2019
	-- Mid-Corona Virus, I found a
	-- Small amount of time...
	-- Hope my steam lasts			04/29/2020
	-- Yeah no steam lasted			06/11/2020
	-- Def found this again, heck	10/01/2020
	-- I just keep looking at it	10/16/2020
	
function SWEP:VMEXEAnim(anim_name, dmg) 
	-- GOALS:
	-- Define needed variables in each option block
	-- Create a standard format for func args
	-- Modularize the option blocks (via functions)
	-- [i] Arguments list as last option #MaxModular
	
	if (anim_name == nil) or (self.Owner:IsNPC()) then return end
	
	local NOW = CurTime() -- Snapshot the time.
	local options = {"PRIMARY", "SECONDARY", "DRYFIRE", "RELOAD", "DRAW", "IDLE"}
	local model = self.Owner:GetViewModel()
	local snd = nil
	local stbl_tag = nil -- used to determine sound tags; See return statment
	local answer = nil

	local ANIM = "ACT_VM_" .. string.upper(anim_name) -- Keep it this way
	local addin = ""
	local addaft = ""
	-- Start
	self:DebugTalk("ANIM as a string: " .. tostring(anim_name).."\n")

	if type(anim_name) == "string" and table.HasValue(options, string.upper(anim_name)) then
		
		--ErrorNoHalt("\n\t~~~~~~~~~~~~~~ Yeah so im in this area?\n")
		an = string.upper(anim_name)
		ANIM = "ACT_VM_" .. an -- Keep it this way
		isempty = false
		--ErrorNoHalt("\nANIM: " ..tostring(ANIM).. " an: "..tostring(an).."\n")
		-- and not self.Weapon:GetNWBool("reloading", false)
		-- @@@Primary/Secondary COnsideration!!
		if self.Weapon:Clip1() < 1 then -- 0 and below
			isempty = true
			addaft = "_EMPTY" -- @@@ Reconsider useage cases!
		elseif (self.DoDModelFunction) and isTbl(self.HMG) then
			local clip = self.Weapon:Clip1()
			if (clip < 9) and (clip > 0) then -- To show the magazine accurately
				addaft = "_" .. tostring(clip)
			end
		end
		
		
		if isTbl(self.FireModes) then
			if (self.DoDModelFunction) and ((self.FireModes[0] == 1) or (self.Primary.Automatic == false)) then
				addin = "_DEPLOYED"
			end
		end
		if isTbl(self.Biipod) then
			if (self.DoDModelFunction) and (self.Biipod[0] == true) then
				self:Tripod()
				-- Biipod, Tripod, whatever...
			end	
		end

		if (self.Silencer == true) then
			addin = "_SILENCED"
		end

-- PRIMARY	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		if an == "PRIMARY" or an == "DRYFIRE" then -- SHOOT
			--self:Talk("Prim "..tostring(true).."\n")
			
			
			if addin == "_SILENCED" then
				self:AddHeat(0.80)
				stbl_tag = "quiet_shot"
				snd = self.Primary.SuppressedSound
			else
				self.Owner:MuzzleFlash() -- Send muzzle flash to entities weapon -- @@@@ CLSV issue unchecked?
				stbl_tag = "shot"
				snd = self.Primary.Sound
			end
			
			ANIM = self.Primary.ShootAnim or "ACT_VM_PRIMARYATTACK"
											-- Akimbo has keys
			if self.Akimbo and (self.Weapon:GetVar("AkimboSide") == false) then
				if (self.DryFires) and isempty then
					ANIM = "ACT_VM_DRYFIRE_LEFT"
					-- The other side will be taken care of later
				end
			elseif isTbl(self.FireModes) then
				if (self.DoDModelFunction) and ((self.FireModes(0) == 1) or (self.Primary.Automatic == true)) then
					addin = "_DEPLOYED"
				end	
			end
				
			-- ADD CODE FOR AKIMBO @@@AKIMBO
			if (self.DryFires == true) and isempty then -- self.VMact("primary") is called before the bullet is used?
				self.DebugTalk("\n\tVMEXECAnim - DoDModelFunction = "..tostring(self.DoDModelFunction).."\n")
				if (self.DoDModelFunction)  then
					ANIM = self.Primary.EmptyAnim or ACT_VM_PRIMARYATTACK_EMPTY
				else
					ANIM = self.Primary.EmptyAnim or ACT_VM_DRYFIRE
				end
				self:AddHeat(-0.15) -- Let some extra heat escape
			else
				-- Nothing New
				self.DebugTalk("\n\tVMEXECAnim - Missed Dryfire Section\n")
			end
				
			if (ANIM == "ACT_VM_PRIMARY") then
				-- Just to make sure
				ANIM = "ACT_VM_PRIMARYATTACK" -- @@@USE ENUM-int instead
			end
		--end
			
		--self.Owner:PrintMessage(HUD_PRINTTALK,"Skooks, Were in primary! ANIM is: " .. ANIM)
-- SECONDARY ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		elseif an == "SECONDARY" then
			-- Insert code 
			-- @@@ADD CODE FOR AKIMBO
			-- stbl_tag = shot
			ANIM = "ACT_VM_SECONDARYATTACK"


-- RELOAD	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		elseif an == "RELOAD" then -- RELOAD
		
			ANIM = "ACT_VM_RELOAD"
			if (self.DryFires) and isempty then
				ANIM = self.EmptyReloadAnim or ANIM -- Just keep it ANIM
				if (self.DoDModelFunction) then
					addaft = "_EMPTY"
				end
				self:AddHeat(-0.50)
			else
				ANIM = self.ReloadAnim or ANIM
				self:AddHeat(-0.25)
			end

			-- PBR = (PlayerAnim/VMAnim)
			self.Owner:SetAnimation( PLAYER_RELOAD ) -- @@@@ CLSV case unchecked
			
			--snd = self.ReloadSound or nil -- @@ Code update needed here
			snd = self.ReloadSound or self.Primary.ReloadSound or self.Secondary.ReloadSound or nil -- @@ Code update needed here
			
		--self.Owner:PrintMessage(HUD_PRINTTALK,"Skooks: " .. ANIM)
-- DRAW
		elseif an == "DRAW" then
			ANIM = "ACT_VM_DRAW"
			--if ( self.Primary.EmptyReloadAnim != "" or not self.Primary.EmptyReloadAnim == nil ) 
			if ( self.EmptyDrawAnim != "" or not self.EmptyDrawAnim == nil ) 
				and (self.CanBeEmpty or self.DoDModelFunction) 
				and isempty then
				
				self:DebugTalk("Using Empty")
				ANIM = self.EmptyDrawAnim or ANIM.."_EMPTY" -- Just keep it ANIM
			else
				self:DebugTalk("Using nonEmpty")
				ANIM = self.DrawAnim or ANIM
			end
			self:doDrawTrans() -- @@@@ CLSV case unchecked
			
-- IDLE		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 	
		elseif an == "IDLE" then -- IDLE
			ANIM = "ACT_VM_IDLE"
			
			if ( self.Primary.EmptyIdleAnim != "" or not self.Primary.EmptyIdleAnim == nil ) and (self.CanBeEmpty or self.DryFires) and isempty then
				ANIM = self.EmptyIdleAnim or ANIM
			else
				ANIM = self.IdleAnim or ANIM
				--self.Weapon:SendWeaponAnim( self.IdleAnim )
			end
			
		end 	

		local alreadyint = isint(ANIM) -- Also the result for the NEXT if-then
		-- Work with results
		if alreadyint then
			self:DebugTalk("Using ACTtoSTR")
			ANIM = self:ACTtoSTR(ANIM)
		end
		
		--print("Currently ANIM has these values - Type: " .. type(ANIM) .. " \nToString: " .. tostring(ANIM))
		-- @@@ RE  - WRITE ME!
		if (ANIM == "ACT_VM_PRIMARYATTACK" or ANIM == "ACT_VM_PRIMARY" or ANIM == "ACT_VM_DRYFIRE") and addaft == "_EMPTY" and not self.DoDModelFunction then
			if (self.DryFires) then
				ANIM = "ACT_VM_DRYFIRE"
			end
			addaft = ""
		end
		
		
		--if not (an == "RELOAD") or (false) then -- Because we already sent the anim?
		if not (alreadyint) and not(ANIM == ACT_VM_PRIMARYATTACK) then
			ANIM = tostring(ANIM) .. addin .. addaft .. ""
		end

		answer = self:STRtoACT(ANIM) -- o(1)

		if nil == answer then
			self:DebugTalk("[!] This isnt in the STRtoACT")
			return false
		elseif type(answer) == "string" then
			answer = self:STRtoACT(answer)
			ErrorNoHalt("[!] Rare error: Double ACT look up!\tResult: "..tostring(answer).."\n")
		end
		--		if not isint(ANIM) then
		self:DebugTalk("\n\tVMEXECAnim Result: " .. tostring(answer) .. " Type: " .. type(answer) .. "\n")
		self.Weapon:SendWeaponAnim( answer ) -- NUMBER
		
	elseif isint(anim_name) then 
		--ErrorNoHalt(" INT AREA <><><><><><>\n")
		local toint = tonumber(anim_name)
		local ls
		
		self.DebugTalk("\n\tVMEXECAnim Sending an Int:  "..anim_name.."\n")
		if toint > 64 then -- These are already sequences
			self.Weapon:SendWeaponAnim(anim_name) -- Just yeah, do it, no help, they sent a number
		else
			ls = toint
			if self.Akimbo then
				--[[
					0,idle
					1,idle_leftempty -- Left goes empty first
					2,shoot_left1 -- "First" in sequence
					3,shoot_left2 -- Even shots left, on last 2nd bullet
					4,shoot_leftlast -- Will show right non-empty
					5,shoot_right1
					6,shoot_right2-- Odd shots right, to last 1 bullet
					7,shoot_rightlast -- Will show left empty too
					8,reload
					9,draw
					10,adjustment -- lmao some weird stuff
				]]--
				local pst, sst, hhhh
				hhhh = 0.65
				pst = (self.Weapon:GetNWFloat( "LastPrimaryShootTime") + (self:GetSeqDur())*hhhh)
				sst = (self.Weapon:GetNWFloat( "LastSecondaryShootTime") + (self:GetSeqDur())*hhhh)
				local isPK, isSK
				isPM = NOW < pst
				isSM = NOW < sst
				
				-- Primary and SECONDARY
				if ls == 2 then
					if self.Weapon:Clip1() < 1 then
						ls = 4
						
					elseif isSM then
						ls = 3
						self:DebugTalk("VMExecAnim: Left 2")
					end
				elseif ls == 5 then
					if self.Weapon:Clip1() < 1 then
						ls = 7
						
					elseif isPM then
						ls = 6
						self:DebugTalk("VMExecAnim: Right 2")
					end
				end
			end
			
			model:SendViewModelMatchingSequence( ls )
		end
	-- Catch the non-native strings
	elseif type(anim_name) == "string" then
		--ErrorNoHalt("\n NON-OPTION STRING AREA <><><>"..tostring(anim_name).."<><><>\n")
		--model:SetSequence(model:LookupSequence(anim_name)) 
		--local stbl = {"RELOAD", "DRAW", "IDLE"}
		local filterstr = string.upper(anim_name) or "PRIMARY"
		local nah = false
		-- Look for markers
		if string.find(filterstr, "RELOAD") or false then
			self.Owner:SetAnimation( PLAYER_RELOAD )
		elseif string.find(filterstr, "DRAW") or false then
			self:doDrawTrans()
		elseif string.find(filterstr, "IDLE") or false then
			self.Owner:SetAnimation( PLAYER_IDLE )
		else
			local toint = tonumber(anim_name)
			local ls
			if nil == toint then
				-- Hmmm
				--ErrorNoHalt("WHY IS MY STRING NOT AN INT Q,Q")
			else
				if toint > 50 then -- These are already sequences
					ls = model:LookupSequence(anim_name) -- (model:SelectWeightedSequence())
				else
					ls = toint
				end
			end
			
			--ErrorNoHalt("\nLS: "..tostring(ls).."\n")
			-- SelectWeightedSequence
			model:SendViewModelMatchingSequence( ls )
			nah = true
			--model:SetAnimation(  )
		end
		
		if nah == false then
			self.Weapon:SendWeaponAnim( self:STRtoACT(filterstr) )
		end
		-- for strings of the enumerations
	end
-- END		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	if stbl_tag then
		return {snd,stbl_tag}
	else
		return snd
	end
end

function SWEP:doDrawTrans() -- @@@@ CLSV cases unchecked
	-- Send 3rd person anims 
	--ErrorNoHalt("Start do Draw Trans")
	local b1 = self.Weapon:GetNWBool("Ironsights")
	--[[
	if self:AreArmsDown() then
			self:SetHoldType( self.RunHoldType or "normal" )
		else
			if b1 then
				--self:SafeTimer(IRONSIGHT_TIME/4, function()
					self:SetHoldType( self.HoldType )
					--ErrorNoHalt("HoldType Time" .. tostring(self.Owner:SequenceDuration()) .. "\n")
				--end)
			else
				--self:SafeTimer(IRONSIGHT_TIME/4, function()
				-- This could probably be made into a nice function
				if (SERVER) then -- The stuff the client doesnt need to care about
					local mp = self.Weapon:GetVar("PrimaryMagOut")		--, false)
					local ms = self.Weapon:GetVar("SecondaryMagOut")	--, false)
					local b3 = tobool( mp ) or tobool( ms )
					
					if b3 == true then
						self:SetHoldType( self.RunHoldType or "normal" )
						ErrorNoHalt("<> <> Entered B3 True")
					else
						self:SetHoldType( self.HoldType2 )
						ErrorNoHalt("<> <> Entered B3 False")
					end
				end
					--ErrorNoHalt("HoldType Time" .. tostring(self.Owner:SequenceDuration()) .. "\n")
				--end)
			end
		end
		--]]
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self:SetHoldType("normal")
	--ErrorNoHalt("HoldType Time " .. tostring(self.Owner:SequenceDuration()) .. " VS " .. tostring(self:GetSeqDur()).."\n")
	-- Send 3rd person anims for later
	self:SafeTimer(self.Owner:SequenceDuration() * 0.54, function() 
		-- This transition shouldn't have ironsights enabled
		-- In time to catch this block, but we cant assume
		
		if self:AreArmsDown() then
			self:SetHoldType( self.RunHoldType or "normal" )
		else
			self.Owner:SetAnimation( PLAYER_ATTACK1 )
			if b1 then
				--self:SafeTimer(IRONSIGHT_TIME/4, function()
					self:SetHoldType( self.HoldType )
					--ErrorNoHalt("HoldType Time" .. tostring(self.Owner:SequenceDuration()) .. "\n")
				--end)
			else
				--self:SafeTimer(IRONSIGHT_TIME/4, function()
					-- This could probably be made into a nice function
					if (SERVER) then -- The stuff the client doesnt need to care about
						local mp = self.Weapon:GetVar("PrimaryMagOut")		--, false)
						local ms = self.Weapon:GetVar("SecondaryMagOut")	--, false)
						local b3 = tobool( mp ) or tobool( ms )
						
						if b3 == true then
							self:SetHoldType( self.RunHoldType or "normal" )
							--ErrorNoHalt("<> <> Entered B3 True")
						else
							self:SetHoldType( self.HoldType2 )
							--ErrorNoHalt("<> <> Entered B3 False")
						end
					end
					--ErrorNoHalt("HoldType Time" .. tostring(self.Owner:SequenceDuration()) .. "\n")
				--end)
			end
		end
	end)
end

	ACTs = {}
ACTs["ACT_VM_ATTACH_SILENCER"]			=	211  -- CSS M4/USP
ACTs["ACT_VM_DETACH_SILENCER"]			=	212  -- CSS M4/USP

ACTs["ACT_VM_DEPLOY"]					=	553  -- DoD MG/Rifle
ACTs["ACT_VM_DEPLOY_1"]					=	561  -- 
ACTs["ACT_VM_DEPLOY_2"]					=	560  
ACTs["ACT_VM_DEPLOY_3"]					=	559  
ACTs["ACT_VM_DEPLOY_4"]					=	558  
ACTs["ACT_VM_DEPLOY_5"]					=	557  
ACTs["ACT_VM_DEPLOY_6"]					=	556  
ACTs["ACT_VM_DEPLOY_7"]					=	555  
ACTs["ACT_VM_DEPLOY_8"]					=	554  
ACTs["ACT_VM_DEPLOY_EMPTY"]				=	562  -- DoD MG/Rifle still

ACTs["ACT_VM_DRAW"]						=	172   -- CSS, HL2
ACTs["ACT_VM_DRAW_DEPLOYED"]			=	520  
ACTs["ACT_VM_DRAW_EMPTY"]				=	521  
ACTs["ACT_VM_DRAW_SILENCED_EMPTY"]		= 	497  -- wink
ACTs["ACT_VM_DRAW_SILENCED"]			=	497  
ACTs["ACT_VM_DRYFIRE"]					=	186  
ACTs["ACT_VM_DRYFIRE_LEFT"]				=	499  -- CSS Elites
ACTs["ACT_VM_DRYFIRE_SILENCED"]			=	495  -- CSS USP
ACTs["ACT_VM_FIDGET"]					=	175  -- HL2 AR2 ball
ACTs["ACT_VM_FIZZLE"]					=	989  -- HL2 gravgun?
ACTs["ACT_VM_HAULBACK"]					=	199  
ACTs["ACT_VM_HITCENTER"]				=	191  -- Melee
ACTs["ACT_VM_HITCENTER2"]				=	192  
ACTs["ACT_VM_HITLEFT"]					=	187  
ACTs["ACT_VM_HITLEFT2"]					=	188  
ACTs["ACT_VM_HITRIGHT"]					=	189  
ACTs["ACT_VM_HITRIGHT2"]				=	190  
ACTs["ACT_VM_HOLSTER"]					=	173  -- Insurgency and HL2
ACTs["ACT_VM_IDLE"]						=	174  -- IDLE, EVERYTHING HAS THIS!
ACTs["ACT_VM_IDLE_1"]					=	533  -- DoD MG/Rifle
ACTs["ACT_VM_IDLE_2"]					=	532  
ACTs["ACT_VM_IDLE_3"]					=	531  
ACTs["ACT_VM_IDLE_4"]					=	530  
ACTs["ACT_VM_IDLE_5"]					=	529  
ACTs["ACT_VM_IDLE_6"]					=	528  
ACTs["ACT_VM_IDLE_7"]					=	527  
ACTs["ACT_VM_IDLE_8"]					=	526 -- DoD MG/Rifle 
ACTs["ACT_VM_IDLE_DEPLOYED"]			=	534  -- DoD MG/Rifle
ACTs["ACT_VM_IDLE_DEPLOYED_1"]			=	542  
ACTs["ACT_VM_IDLE_DEPLOYED_2"]			=	541  
ACTs["ACT_VM_IDLE_DEPLOYED_3"]			=	540  
ACTs["ACT_VM_IDLE_DEPLOYED_4"]			=	539  
ACTs["ACT_VM_IDLE_DEPLOYED_5"]			=	538  
ACTs["ACT_VM_IDLE_DEPLOYED_6"]			=	537  
ACTs["ACT_VM_IDLE_DEPLOYED_7"]			=	536  
ACTs["ACT_VM_IDLE_DEPLOYED_8"]			=	535  
ACTs["ACT_VM_IDLE_DEPLOYED_EMPTY"]		=	525  
ACTs["ACT_VM_IDLE_EMPTY"]				=	524  
ACTs["ACT_VM_IDLE_EMPTY_LEFT"]			=	498  
ACTs["ACT_VM_IDLE_LOWERED"]				=	204  
ACTs["ACT_VM_IDLE_SILENCED"]			=	496  
ACTs["ACT_VM_IDLE_TO_LOWERED"]			=	203  
ACTs["ACT_VM_LOWERED_TO_IDLE"]			=	205  
ACTs["ACT_VM_MISSCENTER"]				=	197  -- Melee
ACTs["ACT_VM_MISSCENTER2"]				=	198  
ACTs["ACT_VM_MISSLEFT"]					=	193  
ACTs["ACT_VM_MISSLEFT2"]				=	194  
ACTs["ACT_VM_MISSRIGHT"]				=	195  
ACTs["ACT_VM_MISSRIGHT2"]				=	196  
ACTs["ACT_VM_PICKUP"]					=	209  -- ??
ACTs["ACT_VM_PRIMARYATTACK"]			=	181  -- Everything
ACTs["ACT_VM_PRIMARYATTACK_1"]			=	570  -- DOD MG/Rifle
ACTs["ACT_VM_PRIMARYATTACK_2"]			=	569  
ACTs["ACT_VM_PRIMARYATTACK_3"]			=	568  
ACTs["ACT_VM_PRIMARYATTACK_4"]			=	567  
ACTs["ACT_VM_PRIMARYATTACK_5"]			=	566  
ACTs["ACT_VM_PRIMARYATTACK_6"]			=	565  
ACTs["ACT_VM_PRIMARYATTACK_7"]			=	564  
ACTs["ACT_VM_PRIMARYATTACK_8"]			=	563  
ACTs["ACT_VM_PRIMARYATTACK_DEPLOYED"]	=	571  
ACTs["ACT_VM_PRIMARYATTACK_DEPLOYED_1"]	=	579  
ACTs["ACT_VM_PRIMARYATTACK_DEPLOYED_2"]	=	578  
ACTs["ACT_VM_PRIMARYATTACK_DEPLOYED_3"]	=	577  
ACTs["ACT_VM_PRIMARYATTACK_DEPLOYED_4"]	=	576  
ACTs["ACT_VM_PRIMARYATTACK_DEPLOYED_5"]	=	575  
ACTs["ACT_VM_PRIMARYATTACK_DEPLOYED_6"]	=	574  
ACTs["ACT_VM_PRIMARYATTACK_DEPLOYED_7"]	=	573  
ACTs["ACT_VM_PRIMARYATTACK_DEPLOYED_8"]	=	572  
ACTs["ACT_VM_PRIMARYATTACK_DEPLOYED_EMPTY"]	=	580  
ACTs["ACT_VM_PRIMARYATTACK_EMPTY"]		=	522  -- DOD Dryfire
ACTs["ACT_VM_PRIMARYATTACK_SILENCED"]	=	493  -- CSS M4/USP
ACTs["ACT_VM_PULLBACK"]					=	176  -- HL2 Grenade
ACTs["ACT_VM_PULLBACK_HIGH"]			=	177  
ACTs["ACT_VM_PULLBACK_LOW"]				=	178  
ACTs["ACT_VM_PULLPIN"]					=	180  -- CSS/Insurgency
ACTs["ACT_VM_RECOIL1"]					=	206  
ACTs["ACT_VM_RECOIL2"]					=	207   
ACTs["ACT_VM_RECOIL3"]					=	208  
ACTs["ACT_VM_RELEASE"]					=	210  
ACTs["ACT_VM_RELOAD"]					=	183  -- ALL
ACTs["ACT_VM_RELOAD_DEPLOYED"]			=	518  -- DOD MG/Rifles
ACTs["ACT_VM_RELOAD_EMPTY"]				=	523   -- DOD 
ACTs["ACT_VM_RELOAD_IDLE"]				=	519  -- ????????
ACTs["ACT_VM_RELOAD_SILENCED"]			=	494  -- CSS M4/USP
ACTs["ACT_VM_SECONDARYATTACK"]			=	182  -- ALL HL2, DoD SMGs/Melee
ACTs["ACT_VM_SPRINT_ENTER"]				=	432  -- Some models, Insergency
ACTs["ACT_VM_SPRINT_IDLE"]				=	433  
ACTs["ACT_VM_SPRINT_LEAVE"]				=	434  
ACTs["ACT_VM_SWINGHARD"]				=	200  -- DoDs Melee CH
ACTs["ACT_VM_SWINGHIT"]					=	202  
ACTs["ACT_VM_SWINGMISS"]				=	201  -- SOURCE
ACTs["ACT_VM_THROW"]					=	179  -- All grenades
ACTs["ACT_VM_UNDEPLOY"]					=	543  -- DOD MG/Rifle
ACTs["ACT_VM_UNDEPLOY_1"]				=	551  
ACTs["ACT_VM_UNDEPLOY_2"]				=	550  
ACTs["ACT_VM_UNDEPLOY_3"]				=	549  
ACTs["ACT_VM_UNDEPLOY_4"]				=	548  
ACTs["ACT_VM_UNDEPLOY_5"]				=	547  
ACTs["ACT_VM_UNDEPLOY_6"]				=	546  
ACTs["ACT_VM_UNDEPLOY_7"]				=	545  
ACTs["ACT_VM_UNDEPLOY_8"]				=	544  
ACTs["ACT_VM_UNDEPLOY _EMPTY"]			=	552  
ACTs["ACT_VM_UNUSABLE"]					=	1428  -- Gravity gun
ACTs["ACT_VM_UNUSABLE_TO_USABLE"]		=	1429  
ACTs["ACT_VM_USABLE_TO_UNUSABLE"]		=	1430  
ACTs["ACT_SHOTGUN_PUMP"]				= ACT_SHOTGUN_PUMP
-- Expandable!
