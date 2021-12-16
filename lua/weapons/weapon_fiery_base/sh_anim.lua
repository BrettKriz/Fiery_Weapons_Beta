--[[--
	Fiery Weapons Base
	Made by: Nova Prospekt
	
	File: sh_anim
	Side: SV?
	
	A Modifided weapon_cs_base
 --]]--
 
 	MsgC( Color( 222, 111, 11 ), " <> sh_anim \n")
	--SWEP.ActivityTranslate = {}
	--SWEP.HoldIndex
	ActIndex = {
		[ "onehand" ] 					= ACT_HL2MP_IDLE_PISTOL 	, -- PURE HL2/DOD PISTOL
		[ "twohand" ]					= ACT_HL2MP_IDLE_REVOLVER	, --
		-- STANDARD ANIMATIONS
		
		-- TEST COMMENT BREAKS TABLE??
		[ "physgun" ] 					= ACT_HL2MP_IDLE_PHYSGUN	, --
		[ "camera" ]					= ACT_HL2MP_IDLE_CAMERA		, --
		[ "magic" ]						= ACT_HL2MP_IDLE_MAGIC		, --
		[ "package" ]					= ACT_IDLE_PACKAGE			, -- An odd anim
		
		[ "pistol" ] 					= ACT_HL2MP_IDLE_PISTOL 	, --
		[ "357" ]						= ACT_HL2MP_IDLE_REVOLVER	, --
		[ "smg" ] 						= ACT_HL2MP_IDLE_SMG1		, --
		[ "ar2" ] 						= ACT_HL2MP_IDLE_AR2		, --
		[ "rifle" ]						= ACT_HL2MP_IDLE_AR2		, --
		[ "sniper" ]					= ACT_HL2MP_IDLE_AR2		, -- SNIPER ;D
		[ "shotgun" ] 					= ACT_HL2MP_IDLE_SHOTGUN	, --
		[ "crossbow" ] 					= ACT_HL2MP_IDLE_CROSSBOW	, --
		[ "grenade" ] 					= ACT_HL2MP_IDLE_GRENADE	, --
		[ "rpg" ]	 					= ACT_HL2MP_IDLE_RPG		, --
		[ "slam" ] 						= ACT_HL2MP_IDLE_SLAM		, --

		[ "fist" ]						= ACT_HL2MP_IDLE_FIST		, --
		[ "normal" ]					= ACT_HL2MP_IDLE			, --
		[ "passive" ]					= ACT_HL2MP_IDLE_PASSIVE	, --
		[ "melee" ] 					= ACT_HL2MP_IDLE_MELEE		, --
		[ "melee2" ]					= ACT_HL2MP_IDLE_MELEE2		, --
		[ "katana" ]					= ACT_HL2MP_IDLE_KNIFE		, --
		[ "knife" ]						= ACT_HL2MP_IDLE_KNIFE		, --
		
		-- Add aliass
		[ "magnum" ] 					= ACT_HL2MP_IDLE_REVOLVER	, --
		[ "revolver" ]					= ACT_HL2MP_IDLE_REVOLVER	, --
		[ "handgun" ]					= ACT_HL2MP_IDLE_REVOLVER	, --
		[ "autoshotgun" ] 				= ACT_HL2MP_IDLE_SHOTGUN	, --
		[ "shotgun aim" ] 				= ACT_HL2MP_IDLE_AR2		, -- Use rifle posture
		[ "grip" ] 						= ACT_HL2MP_IDLE_SMG1		, --
		[ "mg" ]	 					= ACT_HL2MP_IDLE_RPG		, --
		[ "hipfire1" ] 					= ACT_HL2MP_IDLE_SHOTGUN	, --
		[ "hipfire2" ] 					= ACT_HL2MP_IDLE_CROSSBOW	, --
		[ "hipfire3" ] 					= ACT_HL2MP_IDLE_SLAM		, --
		[ "duel" ]						= ACT_HL2MP_IDLE_DUEL		, --
		[ "dual" ]						= ACT_HL2MP_IDLE_DUEL		, --	
		[ "xbow" ] 						= ACT_HL2MP_IDLE_CROSSBOW	, --
		
		["pistol police"]				= ACT_HL2MP_IDLE_REVOLVER	, -- Add Special Dynamic Holdtype
		["csspistol"]					= ACT_HL2MP_IDLE_REVOLVER	, --
		["autopistol"] 					= ACT_HL2MP_IDLE_REVOLVER	, --

		[ "grenade_idle" ] 				= ACT_HL2MP_IDLE_SLAM
	}

	
/*---------------------------------------------------------
   Name: SWEP:SetHoldType()
   Desc: Sets up the translation table, to translate from normal 
	   standing idle pose, to holding weapon pose.
---------------------------------------------------------*/
function SWEP:SetHoldType( t )
	self:Talk("SWHT : " .. t .. "\n")

	if not t then 
		local def = "magic"
		self:Talk("? Wheres the Key?  <<<<<<<<<<<<< Defaulting to "..tostring(def))
		t = def
	end
	
	--local ActIndex = self.HoldIndex
	local size = table.Count(ActIndex)
	local str1 = "HoldType Index Size: " .. tostring(size)
	local str2 = ActIndex[3]
	self:DebugTalk( "SetHoldType "..str1 .. "\n" .. str2 .. "\n" )

	--[[
	for i = 0, size, 1 do
		if not (SERVER) then
				str2 = "#" .. i .. " = " .. tostring(ActIndex[i])
		
			self:Talk(str2)
		end
	end
	--]]
	--self:CheckActIndex(t)
	--self:GenerateTranslationTbl(t)
	--self:Talk("HOLD TYPE: "..tostring(t))
	
	t = string.lower( t )
	local keyt = table.GetKeys(ActIndex)
	local index = nil
	-- self:CheckActIndex(keyt) -- 
	index = ActIndex[ t ]
	
	if (index == nil) then
		Msg("SWEP:SetHoldType ~~ ActIndex[ \""..t.."\" ] isn't set! ActIndex has a dim of" .. tostring(#ActIndex) .."\n")
		--PrintTable( table.GetKeys( ActIndex ) )
		--PrintTable( ActIndex )
		self:Beep("BAD INDEX @ SH_ANIM ~ " .. tostring(t))
		if ( t == "csspistol" ) then
			index = 1663
		elseif ( t == "test1" ) then
			index = 1653 
		else
			index = ActIndex[tostring(t)] or 1663
			self:DebugTalk("Attempting to find animation based on t arg @@@sh_anim")
		end
	end

--	index = ACT_HL2MP_IDLE_DUEL
-- ACT_HL2MP_IDLE_SUITCASE 	1713 
	self.ActivityTranslate = {}
	 -- FILL IT
	self.ActivityTranslate [ ACT_MP_STAND_IDLE 					] = index
	self.ActivityTranslate [ ACT_MP_WALK 						] = index+1
	self.ActivityTranslate [ ACT_MP_RUN 						] = index+2
	self.ActivityTranslate [ ACT_MP_CROUCH_IDLE 				] = index+3
	self.ActivityTranslate [ ACT_MP_CROUCHWALK 					] = index+4
	self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE 	] = index+5
	self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE 	] = index+5
	self.ActivityTranslate [ ACT_MP_RELOAD_STAND 				] = index+6
	self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH 				] = index+6
	self.ActivityTranslate [ ACT_MP_JUMP 						] = index+7
	self.ActivityTranslate [ ACT_RANGE_ATTACK1 					] = index+8
	self.ActivityTranslate [ ACT_MP_SWIM 						] = index+9
	
	self:Talk("\nself.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] = "..tostring(self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ]).."\n")
	-- Add convar for using paassive or normal while taking cover. for rp 
	
	-- Create schemes --
	local pistol 	= ACT_HL2MP_IDLE_PISTOL
	local norm   	= ACT_HL2MP_IDLE
	local slam		= ACT_HL2MP_IDLE_SLAM
		-- "normal" jump animation doesn't exist -- 
	if t == "normal" then
		--if self.Thrown then
			
		--else
			self.ActivityTranslate [ ACT_MP_JUMP ] 					= ACT_HL2MP_JUMP_SLAM
		--end
		self:DebugTalk("Debug Point1")
	elseif t == "test1" then
		self.ActivityTranslate [ ACT_MP_STAND_IDLE 					] = index
		self.ActivityTranslate [ ACT_MP_WALK 						] = index+1
		self.ActivityTranslate [ ACT_MP_RUN 						] = index+2
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE 				] = index+3
		self.ActivityTranslate [ ACT_MP_CROUCHWALK 					] = index+4
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE 	] = index+5
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE 	] = index+5
		self.ActivityTranslate [ ACT_MP_RELOAD_STAND 				] = index+6
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH 				] = index+6
		self.ActivityTranslate [ ACT_MP_JUMP 						] = index+7
		self.ActivityTranslate [ ACT_RANGE_ATTACK1 					] = index+8
		self.ActivityTranslate [ ACT_MP_SWIM 						] = index+9
	elseif t == "passive" then
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= norm+3
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= norm+4
		self.ActivityTranslate [ ACT_MP_SWIM ] 						= norm+9
		self:DebugTalk("Debug Point2")
	elseif t == "pistol_police" or t == "csspistol" then
		
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= pistol+4
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= pistol+3
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = pistol+5
		self.ActivityTranslate [ ACT_MP_JUMP ] 						= pistol+7
	elseif t == "autopistol" then
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= pistol+4
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= pistol+3
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER 
		self.ActivityTranslate [ ACT_MP_JUMP ] 						= pistol+7
		self.ActivityTranslate [ ACT_HL2MP_GESTURE_RELOAD ] 		= ACT_HL2MP_GESTURE_RELOAD_SMG1
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= ACT_HL2MP_GESTURE_RELOAD_SMG1
	elseif t == "pistol" then
		-- For irong sight stuff
		self.ActivityTranslate [ ACT_HL2MP_GESTURE_RELOAD ] 		= ACT_HL2MP_GESTURE_RELOAD_REVOLVER 
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= ACT_HL2MP_GESTURE_RELOAD_REVOLVER 
	elseif t == "grip" then
		self.ActivityTranslate [ ACT_HL2MP_GESTURE_RELOAD ] 		= ACT_HL2MP_GESTURE_RELOAD_SMG1
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= ACT_HL2MP_GESTURE_RELOAD_SMG1
	elseif t == "hipfire1" or t == "hipfire2" then
		self.ActivityTranslate [ ACT_HL2MP_GESTURE_RELOAD ] 		= ACT_HL2MP_GESTURE_RELOAD_AR2
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= ACT_HL2MP_GESTURE_RELOAD_AR2
	elseif t == "sniper" then
		self.ActivityTranslate [ ACT_HL2MP_GESTURE_RELOAD ] 		= ACT_HL2MP_GESTURE_RELOAD_AR2
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= ACT_HL2MP_GESTURE_RELOAD_AR2
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 
	elseif t == "twohand" then -- @@@Add documentation, Should be applied for all 357 Hold types, for ironsights
		-- Ironshight hold type specific?
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = pistol+5
	elseif t == "grenade" then
		self.ActivityTranslate [ ACT_MP_STAND_IDLE ] 				= slam
		self.ActivityTranslate [ ACT_MP_WALK ] 						= slam+1
		self.ActivityTranslate [ ACT_MP_RUN ] 						= slam+2
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= slam+3
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= slam+4
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= index+5
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = index+5
		--self.ActivityTranslate [ ACT_MP_RELOAD_STAND ]		 		= index+6
		--self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= index+6
		--self.ActivityTranslate [ ACT_MP_JUMP ] 						= index+7
		--self.ActivityTranslate [ ACT_RANGE_ATTACK1 ] 				= index+8
		self.ActivityTranslate [ ACT_MP_SWIM ] 						= slam+9
	end
	
	self:DebugTalk("Debug Point 3 - "..tostring(t))
	-- NPC SHIT
	if self.Owner:IsNPC() then
		self:SetupWeaponHoldTypeForAI(t)
		self:DebugTalk("Setting NPC Hold Type to:" .. t)
	end
	
end

-- OBSOL33T! Do not use! 
--
function SWEP:SetWeaponHoldType( t )
	--self:DebugTalk("[!]  SetWEAPONHoldType called instead!????")
	return self:SetHoldType(t) -- FOR LEGACY PURPOSES, #HOTFIX
end
--]]

function SWEP:CheckActIndex(arg)
	if not arg then arg = self.HoldIndex end

	for k,v in pairs(arg) do
		self:DebugTalk("Key: " .. k .. " |V: " .. tostring(v).."\n")
	end
end	
--CreateConVar("swep_holdtype"

/*---------------------------------------------------------
   Name: SWEP:TranslateActivity()
   Desc: Translate a player's activity into a weapon's activity.
	   So for example, ACT_HL2MP_RUN becomes ACT_HL2MP_RUN_PISTOL
	   depending on how you want the player to be holding the weapon.
---------------------------------------------------------*/
function SWEP:TranslateActivity(act)
	--self:Talk("TA: "..tostring(act))
	local fresh = self:GenerateTranslationTbl()
	if self.Owner:IsNPC() then
		if self.ActivityTranslateAI ~= nil and self.ActivityTranslateAI[act] ~= nil then
			return self.ActivityTranslateAI[act]
		end
		
		ErrorNoHalt("[Fiery] self.ActivityTranslateAI table is either null or doesn't contain the index: "..tostring(act).." !")
		return -1
	end

	local b1 = (self.ActivityTranslate != nil)
	local b2 = false
	if (b1 == true) then
		b2 = (self.ActivityTranslate[act] != nil)
		--Msg("b2 : " .. tostring(b2) .. " " .. tostring(act))
	end
	
	if b1 and b2 then
		local ans = fresh[act]
	--	self:Talk("TA: "..tostring(act).." -> "..tostring(ans))
		return ans
	else
		--self:DebugTalk("\n[!] ERROR @ TRANSLATE ACTIVITY " .. tostring(act) .. "| B1:" .. tostring(b1) .. " , B2:" .. tostring(b2))
	end
	
	return -1
end

function SWEP:AbstractHoldType(arg)
	local ht = self:GiveHoldTable()
	--ErrorNoHalt("Is table valid? " ..tostring(self.HoldTable).." VS "..tostring(ht).." <>\n")
	
	return ht[arg] -- Return the ENUM value of the hold type

end

function SWEP:IsHoldForNormal(arg)
	--return (self.NormalHoldTable[arg]) ~= nil
	local e = self:AbstractHoldType(arg)
	--self:Talk("hold table: "..tostring(self.HoldTable))
	return table.HasValue(self.NormalHoldTable, e)
end

function SWEP:IsHoldForPassive(arg)
	--return (self.PassiveHoldTable[arg]) ~= nil
	local e = self:AbstractHoldType(arg)
	return table.HasValue(self.PassiveHoldTable, e)
end

function SWEP:GiveHoldTable()
	if self.HoldTable ~= nil and #self.HoldTable > 5 then
		-- Thats odd
		ErrorNoHalt("[!] Rare point detected! Hold Table is already full? Printing...")
		PrintTable(self.HoldTable)
	end
	
	self.NormalHoldTable = {
		[ "onehand" ] 					= ACT_HL2MP_IDLE_PISTOL 	, -- PURE HL2/DOD PISTOL
		[ "twohand" ]					= ACT_HL2MP_IDLE_REVOLVER	, --
		-- STANDARD ANIMATIONS
		
		-- TEST COMMENT BREAKS TABLE??
		[ "physgun" ] 					= ACT_HL2MP_IDLE_PHYSGUN	, --
		[ "camera" ]					= ACT_HL2MP_IDLE_CAMERA		, --
		[ "magic" ]						= ACT_HL2MP_IDLE_MAGIC		, --
		[ "package" ]					= ACT_IDLE_PACKAGE			, -- An odd anim
		
		[ "pistol" ] 					= ACT_HL2MP_IDLE_PISTOL 	, --
		[ "357" ]						= ACT_HL2MP_IDLE_REVOLVER	, --
		[ "smg" ] 						= ACT_HL2MP_IDLE_SMG1		, --
		[ "ar2" ] 						= ACT_HL2MP_IDLE_AR2		, --
		[ "rifle" ]						= ACT_HL2MP_IDLE_AR2		, --
		[ "sniper" ]					= ACT_HL2MP_IDLE_AR2		, -- SNIPER ;D
		[ "shotgun" ] 					= ACT_HL2MP_IDLE_SHOTGUN	, --
		[ "crossbow" ] 					= ACT_HL2MP_IDLE_CROSSBOW	, --
		[ "grenade" ] 					= ACT_HL2MP_IDLE_GRENADE	, --
		[ "rpg" ]	 					= ACT_HL2MP_IDLE_RPG		, --
		[ "slam" ] 						= ACT_HL2MP_IDLE_SLAM		, --

		[ "fist" ]						= ACT_HL2MP_IDLE_FIST		, --
		[ "normal" ]					= ACT_HL2MP_IDLE			, --
		[ "passive" ]					= ACT_HL2MP_IDLE_PASSIVE	, --
		[ "melee" ] 					= ACT_HL2MP_IDLE_MELEE		, --
		[ "melee2" ]					= ACT_HL2MP_IDLE_MELEE2		, --
		[ "katana" ]					= ACT_HL2MP_IDLE_KNIFE		, --
		[ "knife" ]						= ACT_HL2MP_IDLE_KNIFE		, --
		
		-- Add aliass
		[ "magnum" ] 					= ACT_HL2MP_IDLE_REVOLVER	, --
		[ "revolver" ]					= ACT_HL2MP_IDLE_REVOLVER	, --
		[ "handgun" ]					= ACT_HL2MP_IDLE_REVOLVER	, --
		[ "autoshotgun" ] 				= ACT_HL2MP_IDLE_SHOTGUN	, --
		[ "shotgun aim" ] 				= ACT_HL2MP_IDLE_AR2		, -- Use rifle posture
		[ "grip" ] 						= ACT_HL2MP_IDLE_SMG1		, --
		[ "mg" ]	 					= ACT_HL2MP_IDLE_RPG		, --
		[ "hipfire1" ] 					= ACT_HL2MP_IDLE_SHOTGUN	, --
		[ "hipfire2" ] 					= ACT_HL2MP_IDLE_CROSSBOW	, --
		[ "hipfire3" ] 					= ACT_HL2MP_IDLE_SLAM		, --
		[ "duel" ]						= ACT_HL2MP_IDLE_DUEL		, --
		[ "dual" ]						= ACT_HL2MP_IDLE_DUEL		, --	
		[ "xbow" ] 						= ACT_HL2MP_IDLE_CROSSBOW	, --
		
		["pistol police"]				= ACT_HL2MP_IDLE_REVOLVER	, -- Add Special Dynamic Holdtype
		["csspistol"]					= ACT_HL2MP_IDLE_REVOLVER	, --
		["autopistol"] 					= ACT_HL2MP_IDLE_REVOLVER	, --

		[ "grenade_idle" ] 				= ACT_HL2MP_IDLE_SLAM
	}
	self.PassiveHoldTable = {
		[ "smg" ] 						= ACT_HL2MP_IDLE_SMG1		, --
		[ "ar2" ] 						= ACT_HL2MP_IDLE_AR2		, --
		[ "rifle" ]						= ACT_HL2MP_IDLE_AR2		, --
		[ "sniper" ]					= ACT_HL2MP_IDLE_AR2		, -- SNIPER ;D
		[ "shotgun" ] 					= ACT_HL2MP_IDLE_SHOTGUN	, --
		[ "autoshotgun" ] 				= ACT_HL2MP_IDLE_SHOTGUN	, --
		[ "crossbow" ] 					= ACT_HL2MP_IDLE_CROSSBOW	, --
		[ "rpg" ]	 					= ACT_HL2MP_IDLE_RPG		, --
		[ "grip" ] 						= ACT_HL2MP_IDLE_SMG1		, --
		[ "hipfire1" ] 					= ACT_HL2MP_IDLE_CROSSBOW	, -- Holds lower on rifle body
		[ "hipfire2" ] 					= ACT_HL2MP_IDLE_SHOTGUN	, -- Holds higher on rifle body, more recoil
		[ "hipfire3" ] 					= ACT_HL2MP_IDLE_SLAM		, -- 2 hands,
		[ "mg" ]	 					= ACT_HL2MP_IDLE_RPG
	}
	

	self.HoldTable = {		
		[ "camera" ]					= ACT_HL2MP_IDLE_CAMERA		, -- Animation isnt implied for this
	}
	
	table.Merge( self.HoldTable, self.NormalHoldTable )
	table.Merge( self.HoldTable, self.PassiveHoldTable )
	
	
	
	return self.HoldTable
end

function SWEP:GenerateTranslationTbl()
		--self:Talk("GTT")
		if arg == nil then arg = false end
	-- I cant renforce this list well enough
	local t = tostring(self:GetHoldType())
	local acts = {
		[ "onehand" ] 					= ACT_HL2MP_IDLE_PISTOL 	, -- PURE HL2/DOD PISTOL
		[ "twohand" ]					= ACT_HL2MP_IDLE_REVOLVER	, --
		-- STANDARD ANIMATIONS
		
		-- TEST COMMENT BREAKS TABLE??
		[ "physgun" ] 					= ACT_HL2MP_IDLE_PHYSGUN	, --
		[ "camera" ]					= ACT_HL2MP_IDLE_CAMERA		, --
		[ "magic" ]						= ACT_HL2MP_IDLE_MAGIC		, --
		[ "package" ]					= ACT_IDLE_PACKAGE			, -- An odd anim
		
		[ "pistol" ] 					= ACT_HL2MP_IDLE_PISTOL 	, --
		[ "357" ]						= ACT_HL2MP_IDLE_REVOLVER	, --
		[ "smg" ] 						= ACT_HL2MP_IDLE_SMG1		, --
		[ "ar2" ] 						= ACT_HL2MP_IDLE_AR2		, --
		[ "rifle" ]						= ACT_HL2MP_IDLE_AR2		, --
		[ "sniper" ]					= ACT_HL2MP_IDLE_AR2		, -- SNIPER ;D
		[ "shotgun" ] 					= ACT_HL2MP_IDLE_SHOTGUN	, --
		[ "crossbow" ] 					= ACT_HL2MP_IDLE_CROSSBOW	, --
		[ "grenade" ] 					= ACT_HL2MP_IDLE_GRENADE	, --
		[ "rpg" ]	 					= ACT_HL2MP_IDLE_RPG		, --
		[ "slam" ] 						= ACT_HL2MP_IDLE_SLAM		, --

		[ "fist" ]						= ACT_HL2MP_IDLE_FIST		, --
		[ "normal" ]					= ACT_HL2MP_IDLE			, --
		[ "passive" ]					= ACT_HL2MP_IDLE_PASSIVE	, --
		[ "melee" ] 					= ACT_HL2MP_IDLE_MELEE		, --
		[ "melee2" ]					= ACT_HL2MP_IDLE_MELEE2		, --
		[ "katana" ]					= ACT_HL2MP_IDLE_MELEE2		, --
		[ "knife" ]						= ACT_HL2MP_IDLE_KNIFE		, --
		
		-- Add aliass
		[ "magnum" ] 					= ACT_HL2MP_IDLE_REVOLVER	, --
		[ "revolver" ]					= ACT_HL2MP_IDLE_REVOLVER	, --
		[ "handgun" ]					= ACT_HL2MP_IDLE_REVOLVER	, --
		[ "autoshotgun" ] 				= ACT_HL2MP_IDLE_SHOTGUN	, --
		[ "shotgun aim" ] 				= ACT_HL2MP_IDLE_AR2		, -- Use rifle posture
		[ "grip" ] 						= ACT_HL2MP_IDLE_SMG1		, --
		[ "mg" ]	 					= ACT_HL2MP_IDLE_RPG		, --
		[ "hipfire1" ] 					= ACT_HL2MP_IDLE_CROSSBOW	, --
		[ "hipfire2" ] 					= ACT_HL2MP_IDLE_SHOTGUN	, --
		[ "hipfire3" ] 					= ACT_HL2MP_IDLE_SLAM		, --
		[ "duel" ]						= ACT_HL2MP_IDLE_DUEL		, --
		[ "dual" ]						= ACT_HL2MP_IDLE_DUEL		, --	
		[ "xbow" ] 						= ACT_HL2MP_IDLE_CROSSBOW	, --
		
		["pistol police"]				= ACT_HL2MP_IDLE_REVOLVER	, -- Add Special Dynamic Holdtype
		["csspistol"]					= ACT_HL2MP_IDLE_REVOLVER	, --
		["autopistol"] 					= ACT_HL2MP_IDLE_REVOLVER	, --

		[ "grenade_idle" ] 				= ACT_HL2MP_IDLE_SLAM
	}
	--	index = ACT_HL2MP_IDLE_DUEL
	--[[
	if ( tonumber(ht) ~= nil and not tonumber(ht) == 357 ) then
		-- We somehow have a number
		ErrorNoHalt("[!] Abnormal HT value!  Number found? "..tostring(ht))
		return
	end
	--]]
	
	local index = acts[ string.lower(t) ] or ACT_HL2MP_IDLE
	
	if (index == nil) or not isint(index) then
		-- cry
		ErrorNoHalt("unable to find T : " .. tostring(t) .. " | ACTS : \n" .. tostring(acts))
	end

	local pistol 	= ACT_HL2MP_IDLE_PISTOL
	local rev 		= ACT_HL2MP_IDLE_REVOLVER
	local norm   	= ACT_HL2MP_IDLE
	local ar 		= ACT_HL2MP_IDLE_AR2
	local smg		= ACT_HL2MP_IDLE_SMG1
	local knife		= ACT_HL2MP_IDLE_KNIFE
	local pass		= ACT_HL2MP_IDLE_PASSIVE
	local shot		= ACT_HL2MP_IDLE_SHOTGUN
	local xbow		= ACT_HL2MP_IDLE_CROSSBOW
	
	self.ActivityTranslate = {} -- Index Enums \/					\/ ACT_MP_IDLE + StateIndex
		self.ActivityTranslate [ ACT_MP_STAND_IDLE ] 				= index
		self.ActivityTranslate [ ACT_MP_WALK ] 						= index+1
		self.ActivityTranslate [ ACT_MP_RUN ] 						= index+2
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= index+3
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= index+4
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= index+5 -- The jitter from the shot
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = index+5
		self.ActivityTranslate [ ACT_MP_RELOAD_STAND ]		 		= index+6
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= index+6
		self.ActivityTranslate [ ACT_MP_JUMP ] 						= index+7
		self.ActivityTranslate [ ACT_RANGE_ATTACK1 ] 				= index+8
		self.ActivityTranslate [ ACT_MP_SWIM ] 						= index+9
	
		-- "normal" jump animation doesn't exist -- 
	if t == "normal" then
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= acts[self.HoldType2 or self.HoldType]+5 -- The jitter from the shot
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = acts[self.HoldType2 or self.HoldType]+5
		self.ActivityTranslate [ ACT_MP_JUMP ] 						= ACT_HL2MP_JUMP_SLAM
		self.ActivityTranslate [ ACT_MP_RELOAD_STAND ]		 		= acts[self.ReloadHoldType or self.HoldType]+6
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= acts[self.ReloadHoldType or self.HoldType]+6
		--self:Talk("DEBUG POINT1")
	elseif t == "passive" then
		
		self.ActivityTranslate [ ACT_MP_STAND_IDLE ] 				= pass+3 -- @@@ check for heady sticking out?
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= ACT_HL2MP_IDLE_PHYSGUN+3
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= norm+4
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= acts[self.HoldType2 or self.HoldType]+5 -- The jitter from the shot
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = acts[self.HoldType2 or self.HoldType]+5
		self.ActivityTranslate [ ACT_MP_RELOAD_STAND ]		 		= acts[self.ReloadHoldType or self.HoldType]+6
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= acts[self.ReloadHoldType or self.HoldType]+6
		self.ActivityTranslate [ ACT_MP_SWIM ] 						= acts[self.HoldType2 or self.HoldType]+9
		--self:Talk("DEBUG POINT2")
	elseif t == "pistol police" or t == "csspistol" then
		
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= pistol+4
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= pistol+3
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = pistol+5
		self.ActivityTranslate [ ACT_MP_JUMP ] 						= pistol+7
	elseif t == "autopistol" then
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= pistol+4
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= pistol+3
		self.ActivityTranslate [ ACT_MP_JUMP ] 						= pistol+7
		--self.ActivityTranslate [ ACT_HL2MP_GESTURE_RELOAD ] 		= ACT_HL2MP_GESTURE_RELOAD_SMG1
		self.ActivityTranslate [ ACT_MP_RELOAD_STAND ]		 		= smg+6
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= smg+6
		
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= smg+5 -- The jitter from the shot
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = smg+5
	elseif t == "pistol" then
		--self.ActivityTranslate [ ACT_HL2MP_GESTURE_RELOAD ] 		= ACT_HL2MP_GESTURE_RELOAD_REVOLVER 
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= rev+6 
	elseif t == "autoshotgun" then
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= xbow+5 -- The jitter from the shot
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = xbow+5
	elseif t == "shotgun aim" then
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= shot+5 -- The jitter from the shot
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = shot+5
	elseif t == "grip" then
		--self.ActivityTranslate [ ACT_HL2MP_GESTURE_RELOAD ] 		= ACT_HL2MP_GESTURE_RELOAD_SMG1
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= smg+6
	elseif t == "hipfire3" then
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= rev+4
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= rev+3
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = rev+5
		self.ActivityTranslate [ ACT_MP_JUMP ] 						= pistol+7
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= pistol+5
	elseif t == "hipfire1" or t == "hipfire2" then
		--self.ActivityTranslate [ ACT_HL2MP_GESTURE_RELOAD ] 		= ACT_HL2MP_GESTURE_RELOAD_AR2
		self.ActivityTranslate [ ACT_MP_RELOAD_STAND ]		 		= smg+6
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= ar+6
		--[[
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= smg+5 -- The jitter from the shot
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = smg+5
		--]]
		--[
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= ar+5 -- The jitter from the shot
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = ar+5
		--]]
		
		if t == "hipfire1" then
			-- Make like xbow
			--self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= xbow+5 -- The jitter from the shot
			--self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = xbow+5
		end
		
	elseif t == "mg" then
		self.ActivityTranslate [ ACT_MP_STAND_IDLE ] 				= ar
		self.ActivityTranslate [ ACT_MP_WALK ] 						= ar+1
		self.ActivityTranslate [ ACT_MP_RUN ] 						= ar+2
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= ar+4
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= ar+5 -- The jitter from the shot
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = ar+5
	elseif t == "sniper" then
		--self.ActivityTranslate [ ACT_HL2MP_GESTURE_RELOAD ] 		= ACT_HL2MP_GESTURE_RELOAD_AR2
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= ACT_HL2MP_GESTURE_RELOAD_AR2
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= shot+4
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= smg+6
	elseif t == "katana" then
		self.ActivityTranslate [ ACT_MP_STAND_IDLE ] 				= ACT_HL2MP_IDLE_MELEE2
		self.ActivityTranslate [ ACT_MP_WALK ] 						= ACT_HL2MP_IDLE_MELEE2+1
		
		self.ActivityTranslate [ ACT_MP_RUN ] 						= knife+2
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= knife+3
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ]				= knife+4
		
		
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= ACT_HL2MP_IDLE_MELEE2+5 -- The jitter from the shot
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = ACT_HL2MP_IDLE_MELEE2+5
		--self.ActivityTranslate [ ACT_MP_RUN ] 						= ACT_HL2MP_IDLE_MELEE2+2
	else
		--self:Talk("Fall through\t"..tostring(b1)..",\t"..tostring(t))
	end
	-- FRESH
	--self:Talk("DEBUG POINT 3\t"..tostring(b1))
	
	return self.ActivityTranslate

end


/*
	self.ActivityTranslate = {}
	self.ActivityTranslate [ ACT_HL2MP_IDLE ] 					= index
	self.ActivityTranslate [ ACT_HL2MP_WALK ] 					= index+1
	self.ActivityTranslate [ ACT_HL2MP_RUN ] 					= index+2
	self.ActivityTranslate [ ACT_HL2MP_IDLE_CROUCH ] 			= index+3
	self.ActivityTranslate [ ACT_HL2MP_WALK_CROUCH ] 			= index+4
	self.ActivityTranslate [ ACT_HL2MP_GESTURE_RANGE_ATTACK ] 	= index+5
	self.ActivityTranslate [ ACT_HL2MP_GESTURE_RELOAD ] 		= index+6
	self.ActivityTranslate [ ACT_HL2MP_JUMP ] 					= index+7
	self.ActivityTranslate [ ACT_RANGE_ATTACK1 ] 				= index+8
*/
