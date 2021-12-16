--[[--=====================================*\
		NOVA PROSPEKT ~ 3/20/2014
			Fiery Weapons Base
				Base Weapon
				  Shared
\*=====================================--]]--
-- TBH, I wanna say this started more toward 2011, since 2014 would be a laptop change
	MsgC( Color( 222, 111, 11 ), "\n\n\nFIERY SHARED Loading... \n\n\n" )
	-- Needed
	IncludeCS( "sh_anim.lua" )
	IncludeCS( "animations.lua" )
	IncludeCS( "ai_translations.lua" )
	-- Extras
	IncludeCS( "physics.lua" )
	IncludeCS( "aim_assist.lua" )
	-- Tools/Dev
	
	
	
	MsgC( Color( 0, 250, 0 ), "FIERY Loaded! \n\n\n" )

 
if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )

	-- Change between here and init  
	
	SWEP.Weight				= 50 -- CONVERT FOR THE BETTER?

	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
	
	--resource.AddSingleFile("
	
	--CreateConVar("cl_holdtype", "357", {CLIENTCMD_CAN_EXECUTE, NOTIFY}) or "357"

end
	
	SWEP.PrintName				= "~ Fiery Weapons Base ~"
	SWEP.Author					= "Nova Prospekt"
	SWEP.Contact				= "FacePunch: Nova Prospekt"
	SWEP.IronSightZoom			= 1.16
	SWEP.CSMuzzleFlashes		= true
	SWEP.CSMuzzleX				= false -- @@ConVar?
	
if ( CLIENT ) then

	--SWEP.Purpose				= ""
	local tab = "\n\t"
	local s1 = "E + R + Secondary: " .. tab .. "Drop Mag & Clear Chamber"
	local s2 = "E + Secondary: " .. tab .. "Modify firemode/scope "
	local s3 = "E + Primary: " .. tab .. "Use grenade launcher/Special/Melee"
	local s4 = "Secondary: " .. tab .. "Aim down Sights"
	SWEP.Instructions			= s1 .. tab .. s2 .. tab .. s3 .. tab
	
	SWEP.DrawAmmo				= true
	SWEP.DrawCrosshair			= false
	SWEP.BounceWeaponIcon 		= false -- Toggles the "Tony Hawk" effect in all reguards
	SWEP.ViewModelFOV			= 72 --GetConVarNumber("cl_swep_FOV") -- @@@ SERVERS NO LIKE
	-- Out of 100% visable; 
	-- 55 Is very close, 
	-- 80 shows arms on a majority of models   


	SWEP.WepFolderPath			= "NOT SET! \n Add SWEP.WepFolderPath = to file!" -- OBSOLEET?
	
end
	SWEP.FontPre			= "Fiery_"
	SWEP.FontPost			= "_Font"
if true or true then -- Force a scope, but also make it easy to test
	-- FONT REF NAMES  --
	-- We need to insulate our font names
	-- from others that may be present, cough CSKillIcons
	-- But we also need both the server and the client know these names  
	local pre 				= SWEP.FontPre
	local post				= SWEP.FontPost

	--[[
	SWEP.CSKillIcons 		= pre	..	"CSKillIcons"				..	post
	SWEP.CSKillIcons2 		= pre	..	"CSKillIcons2"				..	post
	SWEP.DODKillIcons 		= pre	..	"DODKillIcons"				..	post
	SWEP.HLKillIcons 		= pre	..	"HLKillIcons"				..	post
	SWEP.HLKillIcons2 		= pre	..	"HLKillIcons2"				..	post

	SWEP.SelectNumbers 		= pre	..	"SelectNumbers"				..	post
	SWEP.SelectNumbers2 	= pre	..	"SelectNumbers2"			..	post
	SWEP.SelectNumbers3 	= pre	..	"SelectNumbers3"			..	post

	SWEP.SelectFiremode 	= pre	..	"SelectFiremode"			..	post
	SWEP.SelectFiremode2 	= pre	..	"SelectFiremode2"			..	post

	SWEP.DODSelectIcons 	= pre	..	"DODSelectIcons"			..	post
	SWEP.CSSelectIcons 		= pre	..	"CSSelectIcons"				..	post
	SWEP.CSSelectIcons2 	= pre	..	"CSSelectIcons2"			..	post
	SWEP.CSSelectIcons3 	= pre	..	"CSSelectIcons3"			..	post
	SWEP.HLSelectIcons 		= pre	..	"HLSelectIcons"				..	post
	--]]--
	SWEP.CSKillIcons 		= "CSKillIcons"
	SWEP.CSKillIcons2 		= "CSKillIcons2"
	SWEP.DODKillIcons 		= "DODKillIcons"
	SWEP.HLKillIcons 		= "HLKillIcons"
	SWEP.HLKillIcons2 		= "HLKillIcons2"

	SWEP.SelectNumbers 		= "SelectNumbers"
	SWEP.SelectNumbers2 	= "SelectNumbers2"
	SWEP.SelectNumbers3 	= "SelectNumbers3"
	SWEP.SelectNumbers4 	= "SelectNumbers4"

	SWEP.SelectFiremode 	= "SelectFiremode"
	SWEP.SelectFiremode2 	= "SelectFiremode2"
	SWEP.SelectFiremode3 	= "SelectFiremode3"

	SWEP.DODSelectIcons 	= "DODSelectIcons"
	SWEP.CSSelectIcons 		= "CSSelectIcons"
	SWEP.CSSelectIcons2 	= "CSSelectIcons2"
	SWEP.CSSelectIcons3 	= "CSSelectIcons3"
	SWEP.HLSelectIcons 		= "HLSelectIcons"
	
	if ( CLIENT ) then
		--SWEP.WepSelectIcon 			= nil -- path to icon texture
		-- Default em, just cause
		SWEP.IconLetter			= "[]"
		--SWEP.WepSelectLetter	= SWEP.IconLetter
		SWEP.IconFont			= SWEP.CSKillIcons
		SWEP.SelectIconFont		= SWEP.CSSelectIcons
		--SWEP.SelectIconNumberFont
		SWEP.CalFont			= SWEP.CSKillIcons -- Needs to use CSD
		SWEP.Primary.FiremodeFont = SWEP.SelectFiremode
		SWEP.Secondary.FiremodeFont = SWEP.SelectFiremode
		-- Now just tell clients how to make these fonts
		-- KILL ICON FONTS --
		-- 
		--local fscale = 30
		--local fweight = 500
		
		surface.CreateFont(pre .. SWEP.CSKillIcons .. post, {
			font = "csd", 
			size = ScreenScale(30), 
			weight = 500
		})
		
		surface.CreateFont(pre .. SWEP.CSKillIcons2 .. post, {
			font = "Counter-Strike", 
			size = ScreenScale(30), 
			weight = 500
		})
		
		surface.CreateFont(pre .. SWEP.DODKillIcons .. post, {
			font = "Day of Defeat Logo", 
			size = ScreenScale(30), 
			weight = 500
		})

		surface.CreateFont(pre .. SWEP.HLKillIcons .. post, {
			font = "hl2mp", 
			size = ScreenScale(30), 
			weight = 500
		})
		
		surface.CreateFont(pre .. SWEP.HLKillIcons2 .. post, { -- OCIW support
			font = "HalfLife2", 
			size = ScreenScale(30), 
			weight = 500
		})

			-- SELECT ICON NUMBER FONTS -- 
		surface.CreateFont(pre .. SWEP.SelectNumbers .. post, { -- Can use lower case x
			font = "Counter-Strike", 
			size = ScreenScale(18), 
			weight = 500
		})
		
		surface.CreateFont(pre .. SWEP.SelectNumbers2 .. post, { 
			font = "csd", 
			size = ScreenScale(30), 
			weight = 500
		})
		
		surface.CreateFont(pre .. SWEP.SelectNumbers3 .. post, {
			font = "HalfLife2", 
			size = ScreenScale(18), 
			weight = 500
		})
		
		surface.CreateFont(pre .. SWEP.SelectNumbers4 .. post, { -- Can use lower case x
			font = "Counter-Strike", 
			size = ScreenScale(10), 
			weight = 500
		})
			-- SELECT ICON FIREMODE FONTS --
		surface.CreateFont(pre .. SWEP.SelectFiremode .. post, { 
			font = "HalfLife2",  -- pqrstuvwxyz
			size = ScreenScale(15), -- Check the scaling
			weight = 500
		})
		
		surface.CreateFont(pre .. SWEP.SelectFiremode2 .. post, { 
			font = "csd", -- J
			size = ScreenScale(15), 
			weight = 500
		})
		
		surface.CreateFont(pre .. SWEP.SelectFiremode3 .. post, {
			font = "Day of Defeat Logo", 
			size = ScreenScale(15), 
			weight = 500
		})

			-- SELECT ICON FONTS --
		surface.CreateFont(pre .. SWEP.DODSelectIcons .. post, {
			font = "Day of Defeat Logo", 
			size = ScreenScale(60), 
			weight = 500
		})
		
		surface.CreateFont(pre .. SWEP.CSSelectIcons .. post, {
			--font = "cstrike", 
			font = "Counter-Strike", 
			size = ScreenScale(60), -- Scale to work with Icons2
			weight = 500
		})
		
		surface.CreateFont(pre .. SWEP.CSSelectIcons2 .. post, {
			--font = "cstrike", 
			font = "csd", 
			size = ScreenScale(60), -- Scale to work with Icons1
			weight = 500
		})
		
		surface.CreateFont(pre .. SWEP.CSSelectIcons3 .. post, {
			--font = "cstrike", 
			font = "cs", 
			size = ScreenScale(60), 
			weight = 500
		})
		
		surface.CreateFont(pre .. SWEP.HLSelectIcons .. post, {
			font = "HalfLife2", 
			size = ScreenScale(60), 
			weight = 500
		})

		-- Now that we've defined these fonts...
		-- We can render killicons and draw icons
		-- From the information provided
	end
end

SWEP.m_bPlayPickupSound 		= true	-- @@Play pickup sounds? VAR ME!!
SWEP.IconColor					= Color( 255, 120, 45, 120 ) -- Default is Color( 255, 80, 0, 255 ) -- Thanks sandbox
--EP.SelectIconFont			=

--SWEP.Category 				= "Fiery-CS Hybrid" 
SWEP.Base						= "weapon_cs_base" -- @@ MUST STABALIZE!!!!
-- ^^^ That base may not be standard???
SWEP.Category 					= "Fiery Tools"
-- \/\/ Check for live use
SWEP.DEBUG						= CreateConVar("swep_DEBUGing", "0", {FCVAR_CHEAT, FCVAR_NOTIFY}, "Toggle self.DEBUGing for Fiery SWEPs: 1=Y, 0=N")  
SWEP.Spawnable					= true
SWEP.AdminSpawnable				= true

SWEP.HoldType					= "rifle"		-- Sights   
SWEP.HoldType2					= "hipfire2"	-- Hipfire
SWEP.ReloadHoldType				= nil			-- for more excentric reloads 
SWEP.RunHoldType 				= nil

SWEP.RemoveClipSound			= nil
SWEP.DrawSound					= nil

SWEP.ReloadSound				= nil -- or a Sound("****.***") 

SWEP.ViewModel					= "models/weapons/v_irifle.mdl" -- "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.ViewModelFlip				= false -- Now a global for simplicity
SWEP.WorldModelHoldFix			= false
SWEP.ViewModelSkin				= 0 -- Most things dont use skins
SWEP.WorldModelSkin				= SWEP.ViewModelSkin
SWEP.UseRandomSkin				= false
-- If we need to specify the World Model Angle (without using Angle types)
SWEP.WMr						= nil
SWEP.WMf						= nil
SWEP.WMu						= nil
SWEP.WMra						= nil
SWEP.WMfa						= nil
SWEP.WMua						= nil

SWEP.WorldModel					= "models/weapons/w_rif_ak47.mdl"
SWEP.IronFOV					= 61 -- 1.15 of cl_fov? -- @@Legacey check
-- PRIMARY   
SWEP.Primary.IsPrimary			= true
SWEP.Primary.IsSecondary		= false
SWEP.Primary.Side				= "Primary" -- Allow for string compare as well

SWEP.Primary.Sound				= Sound( "Weapon_AK47.Single" )
SWEP.Primary.SuppressedSound 	= Sound( "Weapon_M4.Silenced" )
SWEP.Primary.ChamberSound		= nil
SWEP.Primary.Recoil				= 1.5
SWEP.Primary.Damage				= 0	-- Yeah no
SWEP.Primary.NumShots			= 1
SWEP.Primary.Cone				= 0.02
SWEP.Primary.Delay				= 0.15

SWEP.Primary.StrictClipSize 	= false -- Prevent chambered ammo from adding to clipsize
SWEP.Primary.ClipSize			= -1
SWEP.Primary.Clips				= 1
SWEP.Primary.DefaultClip 		= math.max( SWEP.Primary.ClipSize * SWEP.Primary.Clips, 0 ) -- Okay I lied, its not totally Obsoleet!
SWEP.Primary.ForceDefaultClip	= false	-- Idk
SWEP.Primary.Automatic			= false	-- Guess
SWEP.Primary.Ammo				= "pistol"
SWEP.Primary.AmmoFont			= nil
SWEP.Primary.FiremodeFont		= nil
SWEP.Primary.FiremodeLetter		= nil

SWEP.Primary.PBR				= 1		-- PLay Back Rate of Primary Anim
SWEP.Primary.BurstFire			= 0		-- A number of shots
SWEP.Primary.DryFireSound		= nil   -- WIll be SWEP.Primary.Sound
SWEP.Primary.Chambered			= true
SWEP.Primary.Chambering			= false
SWEP.Primary.Ignite				= false
SWEP.Primary.Power				= 3500	-- For physical bullets?
SWEP.Primary.DelayShots			= false
SWEP.Primary.DryMagEject		= false
SWEP.Primary.CanPenetrate		= nil -- Use callbacks for penetration
SWEP.Primary.Tracer				= 4
-- SECONDARY    
SWEP.Secondary.IsPrimary		= false
SWEP.Secondary.IsSecondary		= true
SWEP.Secondary.Side				= "Secondary"

SWEP.Secondary.Sound			= "weapons/grenade_launcher1.wav" -- Because grenade launching uses this ;D
SWEP.Secondary.Reload			= nil -- @@Invesitigate secondaries with independant reload 
SWEP.Secondary.Recoil			= 1.5
SWEP.Secondary.Damage			= 5
SWEP.Secondary.NumShots			= 0
SWEP.Secondary.Cone				= 0.05
SWEP.Secondary.Delay			= 0.06 -- This is used for AimAssist (rather than a think function b/c optimization)

SWEP.Secondary.StrictClipSize	= true -- Prevent chambered ammo from adding to clipsize
SWEP.Secondary.ClipSize			= -1 -- Start empty
SWEP.Secondary.Clips			= 1
SWEP.Secondary.DefaultClip		= math.max(SWEP.Secondary.ClipSize*math.max(SWEP.Secondary.Clips,1), -1) 
SWEP.Secondary.ForceDefaultClip	= false
-- Going to not include this for all other files ^^^^^^^^^^^^^^^^
SWEP.Secondary.Automatic		= false
SWEP.Secondary.Ammo				= "none"
SWEP.Secondary.AmmoLetter		= nil
SWEP.Secondary.FiremodeFont		= nil
SWEP.Secondary.FiremodeLetter 	= nil

SWEP.Secondary.PBR				= 1
SWEP.Secondary.DryFireSound		= nil -- See Dual base for this
SWEP.Secondary.Chambered		= nil
SWEP.Secondary.Chambering		= false
SWEP.Secondary.Ignite			= false
SWEP.Secondary.Power			= 3500 -- @@@@Update
SWEP.Secondary.DelayShots		= false
SWEP.Secondary.DryMagEject		= false
SWEP.Secondary.CanPenetrate		= nil -- Use callbacks for penetration
SWEP.Secondary.Tracer			= 4

SWEP.Range						= 55 *(12*3) -- Yards 
---------------------------------
-- Function Toggles--------------
SWEP.NoMag					= nil -- Dont drop a mag? If not explicitly set, CorrectLogic will handle
SWEP.AmmoDecayTime			= 90
SWEP.ForceModifier			= nil -- @@@ Usage?
SWEP.Akimbo					= false -- {} something
SWEP.DoesIdle				= false -- Enables Idle animations, @@@ASSERT_WORKING -- This is not agreeing with servers
SWEP.UseHands				= true  -- Projects player model specific hands onto a C_model 
SWEP.ShotgunFunctions		= false -- Enables Shotgun code paths (Dominant layer for paths)
SWEP.Chambers				= false -- {false} -- Meta value for having a chambering weapons
SWEP.DoDModelFunction		= false -- Used to enable DoD:S specific animation patterns
SWEP.DoDWeaponDraw			= false -- Enforces DoD:S drawing methods. Note: The font for DoD:S is VERY limited!!
SWEP.HL2WeaponDraw			= false -- Enforces HL2 drawing methods.
										-- can be {true} to be pre-chambered
SWEP.FireMode				= -1		-- Fire mode data
SWEP.DryFires				= false --((SWEP.Primary.Ammo == "pistol") or (SWEP.Primary.Ammo == "357") or (SWEP.Primary.Ammo == "alyxgun"))  -- Evaluates for a bool
SWEP.WorksUnderWater		= false  -- BOOL Just to make it fancy, its as easy as that

SWEP.BadToHipFire			= false -- Inflate the cone (for rp snipers)
SWEP.Scope					= false -- {0.00} -- Not sure, ill work it out later
SWEP.ScopeMAX				= 125 -- Adjust at will, no negative numbers!
SWEP.ScopeReddot			= !false -- If you want to use the reddot scope, turn true
SWEP.Suppressor				= nil 	-- {false} -- Booled on and off @@ SWEP.IsSilent               = true -- TTT
-- SWEP.IsSilent               = true
SWEP.SuppressedVolume		= 45	-- Sound level in game, the LOUDEST it can be
-- Modify toggles----------------
SWEP.Bipod					= nil 	-- {false} -- Booled on and off
SWEP.Melee					= nil	-- If clip is 0 then melee will be primary
SWEP.Launcher				= false -- or info table -- Might just be true or false
SWEP.DoubleShot				= false -- Enables double shot function, possible @@@Trinary
SWEP.HMG					= false -- {0} -- Activating this will cause heat to activate too (?) @@@EDIT
SWEP.Heat					= nil	-- 00 -- Winds up, F not C
SWEP.BayonetDamage			= nil	-- Tell the system there is no bayonet to use
SWEP.MeleeDamage			= nil	-- Tell the system there is no melee to use
---------------------------------

SWEP.data 					= {} -- VERY IMPORTANT
SWEP.data.modes				= {}
-- NOTE: Index does not reflect ints value
-- This is done so that the ordering can be
-- Arranged as desired
--[[--
SWEP.data.modes[1]			= 1 -- @SEMI
SWEP.data.modes[2]			= 2 -- @BURST
SWEP.data.modes[3]			= 3 -- @AUTO
--]]--

--[[-----------------------------------------------------------
	Animation Index
-----------------------------------------------------------]]--
-- Normal animations found in MOST pistols and some rifles 
SWEP.Primary.ShootAnim		= ACT_VM_PRIMARYATTACK
SWEP.Primary.EmptyAnim		= ACT_VM_PRIMARYATTACK
-- If the weapon should be held like a shotgun when not in iron sight 
-- If the held animation is crossbow, then it will be held like an AR2
SWEP.Secondary.EmptyAnim	= ACT_VM_SECONDARYATTACK -- No dryfire anims for secondary attacks(normally)
SWEP.Secondary.ShootAnim	= ACT_VM_SECONDARYATTACK -- Melee, Special action, Secondary fire
-- Abnormal reload, as in HL2 and DODS style pistol reloads 
SWEP.ReloadAnim				= ACT_VM_RELOAD
SWEP.EmptyReloadAnim		= ACT_VM_RELOAD
SWEP.RemoveMagAnim			= nil -- If you explicitly want to define that animation 

SWEP.ShotgunReloadStart		= nil
SWEP.ShotgunReloadLoad		= nil
SWEP.ShotgunReloadFinish	= nil
-- Once agian, Abnormal as defined above
SWEP.DrawAnim				= ACT_VM_DRAW
SWEP.EmptyDrawAnim			= ACT_VM_DRAW
-- Most Pistol, rifle, and shotgun models have these animations... Because VALVe modelers are smart!lol
SWEP.EmpytyIdleAnim			= nil
SWEP.IdleAnim 				= ACT_VM_IDLE
-- Some weapons have animations for the inability to attack (HL2 Pistol) 
SWEP.Primary.CantAttack		= nil
SWEP.Secondary.CantAttack	= nil

SWEP.Primary.Chamber		= ACT_VM_DRAW

 	--[[--  
	-- Normal animations found in MOST pistols and some rifles
	SWEP.Primary.EmptyAnim		= ACT_VM_DRYFIRE
	SWEP.Primary.ShootAnim		= ACT_VM_PRIMARYATTACK
	-- If the weapon should be held like a shotgun when not in iron sight
	-- If the held animation is crossbow, then it will be held like an AR2
	SWEP.Secondary.EmptyAnim	= ACT_VM_FIDGET			 -- No dryfire anims for secondary attacks(normally)
	SWEP.Secondary.ShootAnim	= ACT_VM_SECONDARYATTACK -- Melee, Special action, Secondary fire
	-- Abnormal reload, as in HL2 and DODS style pistol reloads
	SWEP.ReloadAnim				= ACT_VM_RELOAD
	SWEP.EmptyReloadAnim		= ACT_VM_RELOAD_EMPTY
	-- Once agian, Abnormal as defined above
	SWEP.DrawAnim				= ACT_VM_DRAW
	SWEP.EmptyDrawAnim			= ACT_VM_DRAW
	-- Most Pistol, rifle, and shotgun models have these animations... Because VALVe modelers are smart!lol
	SWEP.EmpytyIdleAnim			= ACT_VM_IDLE
	SWEP.IdleAnim 				= ACT_VM_IDLE
	--]]--

--[[-------------------------------------------------------------]]--

-- Misc
SWEP.BoneScalers = Vector(0.009,0.009,0.009)
SWEP.ToggleBoneMod = false
SWEP.InSpeed = false
SWEP.NextSecondaryAttack = 0 -- Keep 0
SWEP.ReloadingTime = 0.0
SWEP.SerialNumber = "Init Issue"
SWEP.AmmoDisc = "Init Issue"
SWEP.Primary.ClipSize_Real = SWEP.Primary.ClipSize -- Just to make sure these arent just null
SWEP.Secondary.ClipSize_Real = SWEP.Secondary.ClipSize

--SWEP.ArmOffset = Vector (0.85, -6.6, 3.5) -- This is so that there is a decent default run angle
--SWEP.ArmAngle = Vector (-13, 28, 2) 		-- Im not sure how people will like these run angles

--CreateClientConVar( "swep_x", 0.009, true, true )  
--CreateClientConVar( "swep_y", 0.009, true, true )
--CreateClientConVar( "swep_z", 0.009, true, true ) 
--Vector(GetConVarNumber("swep_x"),GetConVarNumber("swep_y"),GetConVarNumber("swep_z"))

	Tracers = {}
		Tracers[1] = "AR2Tracer"
		Tracers[2] = "AirboatGunHeavyTracer"
		Tracers[3] = "AirboatGunTracer"
		Tracers[4] = "Tracer" -- STOCK TRACER, Looks good
		Tracers[5] = "StriderTracer"
		Tracers[6] = "HelicopterTracer"
		Tracers[7] = "GunshipTracer"
		Tracers[8] = "LaserTracer" -- Hard to see headon 
		Tracers[9] = "ToolTracer"-- TESTERS
		Tracers[10] = "TeslaHitboxes" -- Not much
		Tracers[11] = "GunshipImpact"	
		Tracers[12] = "PhyscannonImpact" -- Lots but flawed
		Tracers[13] = "GaussTracer" -- Not much
		Tracers[14] = "ImpactGauss" -- Not much
		Tracers[15] = "VortDispel" -- Ground effect
		Tracers[16] = "TeslaZap" -- Not much

		
		
		
	AmmoTypes = {} -- LOWER CASE THESE ALL; values are ints
		AmmoTypes["ar2"]					= 1
		AmmoTypes["ar2altfire"]				= 2
		AmmoTypes["smg1"]					= 4
		AmmoTypes["357"]					= 5
		AmmoTypes["xbowbolt"]				= 6
		AmmoTypes["xbow"]					= 6
		AmmoTypes["buckshot"]				= 7
		AmmoTypes["buck"]					= 7
		AmmoTypes["shotgun"]				= 7
		AmmoTypes["rpg_round"]				= 8
		AmmoTypes["rpg"]					= 8
		AmmoTypes["smg1_grenade"]			= 9
		AmmoTypes["grenade"]				= 10
		AmmoTypes["slam"]					= 11
		AmmoTypes["alyxgun"]				= 12
		AmmoTypes["sniperround"]			= 13
		AmmoTypes["sniperpenetratedround"]	= 14
		AmmoTypes["thumper"]				= 15
		AmmoTypes["gravity"]				= 16
		AmmoTypes["battery"]				= 17
		AmmoTypes["gaussenergy"]			= 18
		AmmoTypes["energy"]					= 18
		AmmoTypes["combinecannon"]			= 19
		AmmoTypes["airboatgun"]				= 20
		AmmoTypes["striderminigun"]			= 21
		AmmoTypes["helicoptergun"]			= 22
		AmmoTypes["9mmround"]				= 23
		AmmoTypes["mp5_grenade"]			= 24
		AmmoTypes["hornet"]					= 25
		AmmoTypes["striderminigundirect"]	= 26
		AmmoTypes["combineheavycannon"]		= 27
		
		-- FILL WITH ALL AMMO TYPES!!!!
		
--[[
IN_GRENADE1	8388608	+grenade1 bound key
IN_GRENADE2	16777216	+grenade2 bound key
--]]

-- LOCAL VARS (mostly for debug use)
 local IRONSIGHT_TIME 			= 0.25 -- @@MAKE VAR?
 -- Client con vars
 local swep_reload_rate			= CreateClientConVar("swep_reload_rate", 			1, true, true)
				-- Unused/Unimplemented ^
 local swep_tracer				= CreateClientConVar("swep_tracer", 				4, false, true)

 local iron_from_file 			= CreateClientConVar("swep_IronSights_FromFile", 	0, true, true)
 local cl_swep_FOV 				= CreateClientConVar("cl_swep_FOV", 				72, {CLIENTCMD_CAN_EXECUTE, NOTIFY})

 -- Server con vars & descriptions
 local s_swep_AutoReload			= "Toggles whether SWEPs (that use this variable) reload automatically when empty"
 local s_swep_AutoAim				= "Toggles whether SWEPs (that use this variable) can use the aim assist"
 local s_swep_penetration			= "Toggles whether SWEPs (that use this variable and do not use physical bullets) can penetrate materials in the world"
 local s_swep_IgnoreCrouchRunning	= "Toggles whether SWEPs (that use this variable) will ignore crouching players as running, which prevents them from attacking"
 local s_swep_IgnoreStationaryRunning	= "Toggles whether SWEPs (that use this variable) will ignore stationary/motionless players as running, which prevents them from attacking"
 local s_swep_DropMags				= "Toggles whether SWEPs (that use Magazines) will drop magazines containing some ammo"
 local s_swep_VehicleUsage			= "Toggles whether SWEPs can be used and fired in vehicles"
 local s_swep_AmmoDropper_MakesAmmo	= "Toggles whether Fiery Ammo Dropper supples its own ammo to the user OR takes the ammo from the user. For DarkRP this should be 0."
 local s_swep_use_phys_bullets		= "Toggles whether bullets are Physical or Raytrace. For DarkRP this should be 0."
 
 local swep_AutoReload 				= CreateConVar("swep_AutoReload", 				0, {FCVAR_ARCHIVE, FCVAR_NOTIFY,FCVAR_NEVER_AS_STRING, FCVAR_SERVER_CAN_EXECUTE}, s_swep_AutoReload)
 local swep_AutoAim					= CreateConVar("swep_AutoAim", 					0, {FCVAR_ARCHIVE, FCVAR_NOTIFY,FCVAR_NEVER_AS_STRING, FCVAR_SERVER_CAN_EXECUTE}, s_swep_AutoAim)
 local swep_penetration				= CreateConVar("swep_penetration", 				1, {FCVAR_ARCHIVE, FCVAR_NOTIFY,FCVAR_NEVER_AS_STRING, FCVAR_SERVER_CAN_EXECUTE}, s_swep_penetration)
 local swep_IgnoreStationaryRunning = CreateConVar("swep_IgnoreStationaryRunning", 	1, {FCVAR_ARCHIVE, FCVAR_NOTIFY,FCVAR_NEVER_AS_STRING, FCVAR_SERVER_CAN_EXECUTE}, s_swep_IgnoreStationaryRunning)
 local swep_IgnoreCrouchRunning 	= CreateConVar("swep_IgnoreCrouchRunning", 		0, {FCVAR_ARCHIVE, FCVAR_NOTIFY,FCVAR_NEVER_AS_STRING, FCVAR_SERVER_CAN_EXECUTE}, s_swep_IgnoreCrouchRunning)
 local swep_FireVarience			= CreateConVar("swep_FireVarience", 		0.042, {FCVAR_ARCHIVE, FCVAR_NOTIFY,FCVAR_NEVER_AS_STRING, FCVAR_SERVER_CAN_EXECUTE}, s_swep_FireVarience)
 local swep_DropMags				= CreateConVar("swep_DropMags", 				1, {FCVAR_ARCHIVE, FCVAR_NOTIFY,FCVAR_NEVER_AS_STRING, FCVAR_SERVER_CAN_EXECUTE}, s_swep_DropMags)
 local swep_VehicleUsage			= CreateConVar("swep_VehicleUsage", 			0, {FCVAR_ARCHIVE, FCVAR_NOTIFY,FCVAR_NEVER_AS_STRING, FCVAR_SERVER_CAN_EXECUTE}, s_swep_VehicleUsage)
 local swep_AmmoDropper_MakesAmmo	= CreateConVar("swep_AmmoDropper_MakesAmmo", 	1, {FCVAR_ARCHIVE, FCVAR_NOTIFY,FCVAR_NEVER_AS_STRING, FCVAR_SERVER_CAN_EXECUTE}, s_swep_AmmoDropper_MakesAmmo)
 local swep_use_phys_bullets		= CreateConVar("swep_Physical_Bullets", 		0, {FCVAR_ARCHIVE, FCVAR_NOTIFY,FCVAR_NEVER_AS_STRING, FCVAR_SERVER_CAN_EXECUTE}, s_swep_use_phys_bullets)

local swep_WMr = CreateClientConVar("swep_WMr", "0", true, false)
local swep_WMf = CreateClientConVar("swep_WMf", "0", true, false)
local swep_WMu = CreateClientConVar("swep_WMu", "0", true, false)

local swep_WMra = CreateClientConVar("swep_WMra", "0", true, false)
local swep_WMfa = CreateClientConVar("swep_WMfa", "0", true, false)
local swep_WMua = CreateClientConVar("swep_WMua", "0", true, false)
 
SWEP.VehicleApproved = false
SWEP.isInitialized = false and false and false -- FALSE ONLY!

--[[
if  not IsFirstTimePredicted() then 
			return
		end
--]]
--[[-----------------------------------------------------------
	Initialize
-----------------------------------------------------------]]--
function SWEP:Initialize()
	
	self:StandardInitialize() -- Make it easy for modders
end

function SWEP:StandardInitialize()
	self:DebugTalk("<> INITIALIZED SHARED \n")
	
	--self:SetHoldType( self.HoldType )
	if true then
		self:DebugTalk("Hold Types: 1:"..tostring(self.HoldType).. " 2:"..tostring(self.HoldType2).." R:"..tostring(self.ReloadHoldType))
		--[[
		ErrorNoHalt("SWEP.CSKillIcons	" .. tostring( self.CSKillIcons ) .. "\n")
		ErrorNoHalt("SWEP.CSKillIcons2	" .. tostring( self.CSKillIcons2 ) .. "\n")
		ErrorNoHalt("SWEP.DODKillIcons	" .. tostring( self.DODKillIcons ) .. "\n")
		ErrorNoHalt("SWEP.HLKillIcons	" .. tostring( self.HLKillIcons ) .. "\n")
		ErrorNoHalt("SWEP.HLKillIcons2	" .. tostring( self.HLKillIcons2 ) .. "\n")

		ErrorNoHalt("SWEP.SelectNumbers	" .. tostring( self.SelectNumbers ) .. "\n")
		ErrorNoHalt("SWEP.SelectNumbers2	" .. tostring( self.SelectNumbers2 ) .. "\n")
		ErrorNoHalt("SWEP.SelectNumbers3	" .. tostring( self.SelectNumbers3 ) .. "\n")

		ErrorNoHalt("SWEP.SelectFiremode	" .. tostring( self.SelectFiremode ) .. "\n")
		ErrorNoHalt("SWEP.SelectFiremode2	" .. tostring( self.SelectFiremode2 ) .. "\n")

		ErrorNoHalt("SWEP.DODSelectIcons	" .. tostring( self.DODSelectIcons ) .. "\n")
		ErrorNoHalt("SWEP.CSSelectIcons	" .. tostring( self.CSSelectIcons ) .. "\n")
		ErrorNoHalt("SWEP.CSSelectIcons2	" .. tostring( self.CSSelectIcons2 ) .. "\n")
		ErrorNoHalt("SWEP.CSSelectIcons3	" .. tostring( self.CSSelectIcons3 ) .. "\n")
		ErrorNoHalt("SWEP.HLSelectIcons	" .. tostring( self.HLSelectIcons ) .. "\n")
		
		ErrorNoHalt("SelectIconFont: " .. tostring(self.SelectIconFont).."\n\n")
		--]]
	end
	--
	if ( SERVER ) then
		-- Give NPC instructions
		self:SetNPCMinBurst( 1 )
		self:SetNPCMaxBurst( self.Primary.ClipSize / 4 ) --
		self:SetNPCFireRate( self.Primary.Delay or 0.08 ) -- Eh
	end
	--
	-- NPC STOP --
	if (self.Owner:IsNPC()) then return end
	local NextIdle
	
	if (self.DoesIdle) and not self.Owner:IsNPC() then
		NextIdle = CurTime()
	else
		NextIdle = 0
	end

	--[[
	-- init view model bone build function
	if IsValid(self.Owner) then 
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
					--self:ResetBonePositions(vm)
					
					-- Init viewmodel visibility
					if (self.ShowViewModel == nil or self.ShowViewModel) then
							vm:SetColor(Color(255,255,255,255))
					else
							-- we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
							vm:SetColor(Color(255,255,255,1))
							-- ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
							-- however for some reason the view model resets to render mode 0 every frame so we just apply a self.DEBUG material to prevent it from drawing
							vm:SetMaterial("DEBUG/hsv")                        
					end
			end
	end
	--]]
	-- Correct possible flaws in logic
	self:InitCorrectLogic()
	--self:UpdateBones()

	self:DebugTalk("<> DONE INIT SHARED")
	
	self.isInitialized = true -- Only run once!
	
end

function SWEP:InitCorrectLogic()
	-- Used to correct logic at SWEP start
	self:DebugTalk("\n\n@@@ isInitialized: "..tostring(self.isInitialized).."\n\n")
	if (self.isInitialized == true) then 
		self.DebugTalk("Refused to reenter InitCorrectLogic(), already isInitialized")
		return
	end
	
	
	self.Weapon:SetNWInt("FireMode", self.FireMode or 0)
	self:CurFireMode(self.FireMode)
	
	self.DebugTalk("[InitCorrectLogic] Entering function...\n")
	--self.Owner:SetAllowWeaponsInVehicle(true)
	
	-- Handle Killicons and select icons
	-- self.SerialNumber			= tostring(self.Weapon:GetCreationID() or "******") 
	if self.ScopeReddot == true then
		self.ScopeMat = "scope/scope_reddot"
	end
	self.AmmoDisc = ""
	if self.Primary.Ammo ~= "none" then
		self.AmmoDisc = (self.AmmoDisc .. " Primary: \t" .. tostring(self.Primary.Ammo))
	end
	if self.Secondary.Ammo ~= "none" then
		self.AmmoDisc = (self.AmmoDisc .. "\n Secondary: \t" .. tostring(self.Secondary.Ammo))
	end
	--local prefixl = string.char( math.random( 60 , 90 ) ) .. "-" -- Country codes?
	local prefixl = (self.SelectIconLetter or string.char( math.random( 60 , 90 ) )) .. " - " -- Country codes?
	local filler = "00000"
	local serialraw = tonumber(self.Weapon:EntIndex() or 1337) * 13
	self.SerialNumber			= prefixl .. string.Right( filler .. tostring(serialraw), string.len(filler) )
	
	self.IconColor				= self.IconColor or Color( 255, 120, 45, 120 )
	self.WepSelectFont 			= self.WepSelectFont or "csd" -- Needs to be shared ;D -- @@@ Oldschool check
	-- @@ ^^ Usage update needed
	
	
	self.VehicleStatus			= self:InVehicle() or false
	local va		= tobool(GetConVar("swep_VehicleUsage"):GetBool()) or false
	if va then
		self:DebugTalk("self.VehicleApproved = true\n")
		self.VehicleApproved = true
	else
		self:DebugTalk("self.VehicleApproved = false\n")
		self.VehicleApproved = false
	end
	self.DebugTalk("\n> swep_VehicleUsage CV= "..tostring(va).." VS self = "..tostring(self.VehicleApproved).."\n")
	
	--AddKIFont( self.WepFolderPath or self.FileName, self.IconFont, self.IconLetter, self.IconColor) 
	self.NextSecondaryAttack = CurTime()
	self.Weapon:SetNetworkedBool("reloading", false)
	
	if not self.Primary.AmmoLetter then
		self.Primary.AmmoLetter = self:GuessCallibur(1)
	end
	if not self.Secondary.AmmoLetter then
		self.Secondary.AmmoLetter = self:GuessCallibur(2)
	end
	-- Weapon path alias'
	-- @@OBSOL33T
	local n = self.WepFolderPath
	local n0 = self.WepFolderPath == nil
	local n1 = self.NameOfSWEP == nil
	local n2 = self.Name == nil
	local n3 = self.WeaponName == nil
	
	if n0 then
		if n1 then
			self.NameOfSWEP = n
		elseif n2 then
			self.Name = n
		elseif n3 then
			self.WeaponName = n
		end
	else
		if n1 then
			self.WepFolderPath = self.NameOfSWEP
		elseif n2 then
			self.WepFolderPath = self.Name
		elseif n3 then
			self.WepFolderPath = self.WeaponName
		end
	end
	-- end of obsoleet
	
	if self.Primary.DryFireSound == nil then
		self:DebugTalk("Adjusting DryFireSound to PrimarySound IE "..tostring(self.Primary.Sound))
		self.Primary.DryFireSound = self.Primary.Sound
	end
	if self.Secondary.DryFireSound == nil then
		self.Secondary.DryFireSound = self.Secondary.Sound
	end

	if self.Purpose == "" and string.find(self.ClassName, "_base") then
		self.Purpose = "Weapons Base Development"
	end
	
	--self:SetClip1(self.Primary.ClipSize)
	self.Primary.ClipSize_Real = self.Primary.ClipSize -- Prevent math problems with chambering reloads
	self.Secondary.ClipSize_Real = self.Secondary.ClipSize
	--self:SetClip2(self.Secondary.ClipSize)
	
	if self.Primary.ForceDefaultClip then
		self:SetClip1(self.Primary.DefaultClip or 0)
	else
		self:SetClip1(0) -- @@@@ I dont think that should be the logic? 3-6-2021
	end
	
	if self.Secondary.ForceDefaultClip then
		self:SetClip2(self.Secondary.DefaultClip or 0)
	else
		self:SetClip2(0)
	end
	
	if self.UseRandomSkin == true then -- Adjust for SERVER
		-- Assign a random skin
		-- Change the skin
		if CLIENT then
			local vm = self.Owner:GetViewModel()
			local vmsc = vm:SkinCount() -- DoDs wont even have diff W models
			local vms = math.random(0, vmsc)
			self.ViewModelSkin = vms
			vm:SetSkin( vms ) -- Set View Model
		end

		local wmsc = self.Weapon:SkinCount()
		local wms = math.random(0, wmsc)
		self.WorldModelSkin = wms
		self.Weapon:SetSkin( wms ) -- Set World Model
		
	end
	
	-- Using defautlclip will fault HERE. @@@DEFAULTCLIP 
	if (self.Primary.ClipSize > 1) then
		self.Weapon:SetVar("PrimaryMagOut", true)
	end
	if (self.Secondary.ClipSize > 1) then
		self.Weapon:SetVar("SecondaryMagOut", true)
	end
	if (nil == self.NoMag) and (self.Primary.ClipSize < 5 and self.Secondary.ClipSize < 5 ) then
		-- Make sure the system doesn't have assumed
		-- capacity size to require a mag (if nil)
		self.NoMag = true
	end
	
	self:AdjustForAimAssist() -- Cant remember relevance, but needed
	
	-- -------------------------------------------------------------------------------------------   
	-- @@@ Please use the real calls when made!
	-- 3/6/2021: Suppressor status?
	if self.Suppressor == true then
		self.CSMuzzleFlashes	= true
		self.CSMuzzleX			= true -- Pew pew! X
	end
	
	local b0 = ( self.Primary.StrictClipSize )
	local b0s1 = "Can't be topped-off"
	local b0s2 = " Open-Bolt system"
	local b0b = self.Primary.Automatic == true
	
	local b1 = self.WorksUnderWater == true -- @@@Make side dependant
	local b2 = self.Primary.Ignite == true or self.Secondary.Ignite == true
	
	if (b0 or b1 or b2) and self.Note ==  nil then
		self.Note = ""
	end
	
	--if (CLIENT) then
		if b0 then
			local b0fs = b0s1
			if self.Primary.Automatic == true then
				b0fs = b0fs .. "\n" .. b0s2
			end
			self.Note = self.Note.."\n" .. tostring(b0fs)
			-- 
		end
		
		if b1 then
			self.Note = self.Note.."\n100% Submergable"
		end
		
		if b2 then
			self.Note = self.Note.."\nCaution: Flamable"
		end
		
	--end
	-- -------------------------------------------------------------------------------------------
	
	--[[
	if (self.HoldType2 ~= nil and self.HoldType2 ~= "" and string.find(tostring(self.Holdtype2), "hipfire") ~= -1
	and (self.Primary.Ammo == "pistol" 
		or self.Primary.Ammo == "alyxgun"
		or self.Primary.Ammo == "357"  
		or string.lower(self.HoldType) == "autopistol" ) ) then 
		-- Clearly dont hold it like a heavy AK... 
		-- This is just a fallback
		self.HoldType2 = "csspistol"
	end
	--]]
	
	--[[-- 
	if self.Akimbo then
		self.Weapon:SetVar("AkimboSide", true) 
	end
	--]]-- 
	self.Weapon:SetVar("AkimboSide", false) -- Relevance? Obsoleet?
	
	local isC = string.find(self.ViewModel, "/c_", 8)
	if not isC  then -- and self.DoDModelFunction
		-- Correct for some things.   
		
		self.UseHands = false
		self.ArmOffset = self.ArmOffset or Vector(0.319, 0, 2.2) -- self.ArmOffset or  
		self.ArmAngle = self.ArmAngle or Vector(-23.101, 11.699, 13.199) -- self.ArmAngle or
	elseif isC then
		--ErrorNoHalt("C model detected - Offset: "..tostring(self.ArmOffset).." , Angle: "..tostring(self.ArmAngle).."\n")
		self.ArmOffset = self.ArmOffset or Vector (0.85, -6.6, 3.5) -- This is so there is a decent default run angle
		self.ArmAngle = self.ArmAngle or Vector (-13, 28, 2) 		-- Im not sure how people will like these run angles
	end
	
	if (self.DryFires and self.Primary.EmptyAnim == nil and self.Akimbo != true) then
		self.DebugTalk("[InitCorrectLogic] Correcting Empty Anim to ACT_VM_DRYFIRE\n")
		self.Primary.EmptyAnim		= ACT_VM_DRYFIRE
	end
	
	
	if not self.RunHoldType and (self:IsHoldForNormal( self.HoldType ) or self:IsHoldForNormal( self.HoldType2 )) then
		-- Then clearly we dont need to use passive for holding 
		self.RunHoldType = "normal"
	else
		self.RunHoldType = "passive"
	end
	self:DebugTalk("RunHoldType: "..self.RunHoldType)
	
	-- @@@ How to figure out WorldIsCold 
	if self:WorldIsCold() then
		self.Base_Heat = 25 -- IE below waters freezing point in F
	end
	
	self:BuildKillIconFont() -- @@ Major change!!
	
	
	if (game.SinglePlayer() and SERVER) then
		self:Init_Check("\n~INIT LOADED~\n")

	end
	--]]
	self:GrabAnimIndex()
	
	self:CorrectLogic()
	self.DebugTalk("@@@ LEAVING InitCorrectLogic\n")
end

function SWEP:BuildKillIconFont()
	-- self.ClassName may be compromised where subfolders
	-- self.Folder too?
	
	
	--[[
	SWEP.CSKillIcons 		= "CSKillIcons"
	SWEP.CSKillIcons2 		= "CSKillIcons2"
	SWEP.DODKillIcons 		= "DODKillIcons"
	SWEP.HLKillIcons 		= "HLKillIcons"
	SWEP.HLKillIcons2 		= "HLKillIcons2"

	SWEP.SelectNumbers 		= "SelectNumbers"
	SWEP.SelectNumbers2 	= "SelectNumbers2"
	SWEP.SelectNumbers3 	= "SelectNumbers3"

	SWEP.SelectFiremode 	= "SelectFiremode"
	SWEP.SelectFiremode2 	= "SelectFiremode2"

	SWEP.DODSelectIcons 	= "DODSelectIcons"
	SWEP.CSSelectIcons 		= "CSSelectIcons"
	SWEP.CSSelectIcons2 	= "CSSelectIcons2"
	SWEP.CSSelectIcons3 	= "CSSelectIcons3"
	SWEP.HLSelectIcons 		= "HLSelectIcons"
	--]]--
	--killicon.AddFont( "weapon_usp_match", SWEP.IconFont, SWEP.IconLetter, Color( 255, 80, 0, 255 ) )
	if (CLIENT) then
		-- Just incase of leaks
		local pre = self.FontPre or "Mistake1"
		local post = self.FontPost or "Mistake2"
		local fold = tostring(self.Folder) or ""
		
		killicon.AddFont( self.ClassName, pre .. self.IconFont .. post, self.IconLetter, self.IconColor or  Color( 255, 80, 0, 255 ) )
		self:DebugTalk("\n\n\t<> Making KillIcon for " .. self.ClassName .. " - Font:" .. self.IconFont .. " , Letter:" .. self.IconLetter .. " >> Folder:" .. fold .. "<<\n")
	end
end

function SWEP:GuessCallibur(side) -- @@@ Code
	--[[
	Symbol	L	AmmoType
	
	9mm		R	pistol
	357		T	357
	45		M	357
	Buck	J	buckshot
	50AE	U	357
	5.7		S	alyxgun
	
	556		N	smg1
	762		V	ar2
	338		W	sniperround 
	
	C4		I	
	Gren	O	grenade
	
	Gren2	P	grenade
	Gren3	Q	grenade
	
	World	C	Yeees
	Health	F	Yes
	--]]--
	if side == 1 and self.Primary.AmmoLetter then return self.Primary.AmmoLetter end
	if side == 2 and self.Secondary.AmmoLetter then return self.Secondary.AmmoLetter end

	local ans = "J"
	local pa = string.lower(self.Primary.Ammo) 
	local pia = self.Primary.Automatic
	if side == 2 then
		pa = string.lower(self.Secondary.Ammo)
		pia = self.Secondary.Automatic
	end
	if pa == "pistol" then
			ans = "R"
			
	elseif pa == "alyxgun" then
			ans = "S"
	elseif pa == "357" then
		--if self.Primary.Damage < 60 then
				ans = "M" -- 45
		--else
			--ans = "U" -- 50AE, this could be bad, lets not
		--end
	elseif pa == "smg1" then
		ans = "N" -- 556
	elseif pa == "ar2" then
		ans = "V"
	elseif pa == "sniperround" then
		if self.Primary.Damage < 82 then
			ans = "V"
		else
			ans = "W"
		end
	elseif pa == "buckshot" or pa == "shotgun" then
		ans = "J"
	end

	return ans
end

function SWEP:LoadUserProfile( filepath ) -- @@@IMPLEMENT ME! 
	self:DebugTalk("<> Loading User Profile <>")
	if not filepath then
		filepath = "" -- @@@Write correct path here!
	end
	
	local profile = string.Explode( "," , file.Read( filepath ) )

	local flag = self:UpdateUserProfile(profile)
	-- Defaults are in place if profile cant be loaded

	self:DebugTalk("<> User Profile Load Done <>")
end

function SWEP:UpdateUserProfile( proftbl )
	if not proftbl or type(proftbl)~="table" then
		-- Ooops!
		ErrorNoHalt("[!] Cannot update fiery profile >> Non-Table provided \n")
		return false
	end
	
	-- @@@Var lists here. 
	-- STEAMID?
	-- KILL COUNT
	-- FOV
	-- LEFT or RIGHT
	-- CX Color
	-- CX Type
	-- Use Custom Ironsights (from file)?
	
	
	-- Special args?
	
	return true
end

function SWEP:CorrectLogic() -- For use outside this base
		-- Checklist of logic
	self:DebugTalk("<><> CORRECT LOGIC <><>\n")
	self.Weapon:SetNetworkedBool( "Ironsights", false )

	-- TO BE EDITED
	--if (self.DoDModelFunction) and (self.UseHands) then
		--self.UseHands = false
	--end
	
	
end

------------ INTERMEDIATE FUNCTIONS -----=======================================================+++++++++++++++++++++++++++++++++

--[[-----------------------------------------------------------
	Get Weapon Draw Speed
	-Not to be confused with GetTripodRate() 
-----------------------------------------------------------]]--
function SWEP:GetDrawRate( arg )
	local amt = 1
	
	-- List off contributing variables
	-- HP , IsMoving? , IsCrouched
	-- 
	if self.Owner:Health() < 75 then
		amt = amt - .15
	end
	
	if self:IsOwnerMoving() then
		amt = amt + .095
	end
	
	if self.Owner:Crouching() then
		amt = amt + .15
	end
	
	return amt
end

--[[-----------------------------------------------------------
	Deploy\Draw Weapon
	-- Not to be confused with Tripod()
	-- Has something to do with lastinv? @@@@@
-----------------------------------------------------------]]--
function SWEP:Deploy()
	--self:PrintStats(true, false)
	return self:StandardDeploy()
end

function SWEP:StandardDeploy() -- @@@@ Needs code cleanup
		-- Drop name in chat
	--self:Talk(self.ClassName .. "  ")
	self:DebugTalk("<> DEPLOY <>")
	local t
	self:SetIronsights(false)
	--self:SetHoldType( "357" ) -- GetConVarNumber("cl_swep_FOV")
	--self:Talk("Activity Translate: "..tostring(self.ActivityTranslate
	
	local va = tobool(GetConVar("swep_VehicleUsage"):GetBool()) or false
	self.VehicleApproved = va
	self:DebugTalk("\n> VehicleApproved = "..tostring(self.VehicleApproved).."\n")
	
	if va == true  then
		-- Let them be
		self:DebugTalk("Inside of VehicleApproved\n")
		if SERVER then
			self.Owner:SetAllowWeaponsInVehicle(true)
		end
	end

	-- Need to use in swep function
	self:SetFOV(GetConVarNumber("cl_swep_FOV") , 0.33 )
	self.FireVariance = GetConVar("swep_FireVarience"):GetFloat()
	
	self.Primary.ClipSize_Real = self.Primary.ClipSize -- Prevent math problems with chambering reloads
	self.Secondary.ClipSize_Real = self.Secondary.ClipSize
	
	-- Change the skin
	local vm = self.Owner:GetViewModel()
	local wmsc = self.Weapon:SkinCount() or 0
	local vmsc = vm:SkinCount() or 0
	
	local wms = math.min(self.WorldModelSkin or 0, wmsc) -- Clamp em
	local vms = math.min(self.ViewModelSkin or 0, vmsc) -- Clamp em
	self.Weapon:SetSkin( wms ) -- Set World Model
	vm:SetSkin( vms ) -- Set View Model
	
	if self:InVehicle() then
		-- Catch them getting in and out of vehicles
		-- Prevent doing anything in this call!!!
		-- Could screw up reloads  
		self:DebugTalk("\n\n[i] Suppressed fake draw anim and delay ("..tostring( self:GetSeqDur() )..")\n\n")
	else
		-- UPDATE SCRIPT! @@@
		-- Play animations 
		--	anim_name, pbr, snd, volume, idle_after, iron_off
		--self:VMact("DRAW", 1.25, self.DrawSound, nil, true ) 
		self:VMact("DRAW", self:GetDrawRate() or 1.25, self.DrawSound) --
		self:SetNextIdle("SOON")
		
		t = self:GetSeqDur()
		-- Trim next event times  
		self:SetNextPrimAndSecon(t*0.95, t*0.80)
		self.ReloadingTime = CurTime() + t*0.2
		self.Weapon:SetNetworkedBool("reloading", false) -- This could be an issue with vehicles..

	end
	--[[
	ErrorNoHalt("\n-------------------\nViewmodel Sequence List:\n")
	local kcnt = 0
	for k,v in pairs(self.Owner:GetViewModel():GetSequenceList()) do 
		ErrorNoHalt("\t"..tostring(k)..","..tostring(v).."\n")
		kcnt = kcnt + 1
	end
	ErrorNoHalt("\n\t#: "..tostring(kcnt).."\n----------------\n")
	--]]
	-- Check ironsights
	local b1 = tobool(self.IronSightsPos == nil)
	local b2 = tobool(GetConVarNumber("swep_IronSights_FromFile"))

	local b3 = tobool(self.Thrown == true)
	if (b1 or b2) and not b3 then
		self:GetIronData()
		self:DebugTalk("Ironsights missing or swep_IronSights_FromFile = 1!\nSearching...")
	end

	--self:UpdateBones() 
	--self:Talk("Properties: " .. tostring(self.DryFires))
	
	
	self:InspectAmmoLogic()
	

	self:AdjustForAimAssist() -- Recoil still applies!!
	
	self:DebugTalk("<> Deploy Done <>\n")
	
	return true
end

--]]
function SWEP:Holster()
--		if not IsFirstTimePredicted() then return end
		self:DebugTalk("\n\t<> Holster <>\n")
		local b2 = IsValid(self.Owner)
		
        if b2 then
			if CLIENT then
				local vm = self.Owner:GetViewModel()
				
				--if IsValid(vm) then
					   -- self:ResetBonePositions(vm)
				--end
			end
			local b3 = self:InVehicle()
			local va				= tobool(GetConVar("swep_VehicleUsage"):GetBool()) or false
			self.VehicleApproved	= va
			self:DebugTalk("VEHICLE CHECKS: !"..tostring(b3).." \n\tApproved?: "..tostring(self.VehicleApproved).." VS "..tostring(tobool(va)).."\n")
			if va == true and not b3 then
				-- Let them be
				
				if SERVER then
					self:DebugTalk("SetAllowWeaponsInVehicle(false)\n")
					self.Owner:SetAllowWeaponsInVehicle(false)
				end
			end
		end
		
		if b2 then
			self:SetHoldType( self.RunHoldType or "normal" )
		end
        
		self.Weapon:SetNetworkedBool("reloading", false)

		
		self:DebugTalk("<> Holster Done <>\n")
        return true
end

function SWEP:SetNextIdle( t, anim ) -- @@@ Logic needs to be reviewed
	--self:DebugTalk("Next idle: "..tostring(time))
	if not self.DoesIdle or SERVER then return end
	-- SERVER FILTER HERE?
	
	self:DebugTalk("SetNextIdle called for: "..tostring(t).."\n")
	local NOW = CurTime() -- Just incase its too precise lol
	--BeconOut("SetNextIdle")
	if t and type(t) == "string" then
		if string.upper(t) == "SOON" then
			t = NOW + (self:GetSeqDur() * 0.95)
		elseif string.upper(t) == "NOW" or tostring(t) == "0" then
			-- There was a schema change...
			-- This needs to be worked with...
			self:Idle(anim)
		end
	end
	--self:DebugTalk("01 NextIdle: "..tostring(NextIdle).. " VS "..tostring(CurTime()).."\n")
	
	-- @@ NextIdle is some non-local variable, only used for testing (if I can even remember)
	
	if not t then 
		NextIdle = CurTime()
	elseif not(t + self:GetSeqDur() < NOW) then

		-- Make sure the time isnt in the PAST
		NextIdle = t + self:GetSeqDur() -- ?? CLSV issue!!!
		--self:DebugTalk("O2 NextIdle: "..tostring(NextIdle).. " VS "..tostring(CurTime()).."\n")
	else
		ErrorNoHalt("\n[!] Idle timers are getting behind!\n")
	end
end

function SWEP:Idle( anim ) -- Yuz
	if SERVER then return end -- @@@ Overscoping for server?
	
	local b1 = (self.Weapon:GetNetworkedBool( "reloading", true))
	--(self.ReloadingTime or 0) > CurTime() -- Cant get this clientside :/
	local b2 = false --self:GetSeqDur() > 0 -- < issue
	
	self:DebugTalk(" IDLE-B1: "..tostring(b1).." \n\t\tIDLE-B2: "..tostring(b2).."\n\tSEQDUR:("..tostring(self:GetSeqDur()).."\n")
	if b1 or b2 then return end -- not self.DoesIdle or 
	
	--self:InVehicle() -- Just a good casual update point
	self:DebugTalk("\n> (IDLE) Vehicle Approved = "..tostring(self.VehicleApproved).."\n")
	if self.VehicleApproved == true  then
		-- Let them be
		self:DebugTalk("Inside of Vehicle Approved at IDLE\n")
		if SERVER then
			self.Owner:SetAllowWeaponsInVehicle(true)
		end
	end
	
	self:VMact(anim or "IDLE")
	self:SetNextIdle( CurTime() + self:GetSeqDur()*0.95) 
	self:DebugTalk("\n\n\tW00T\tAn Idle has occured\n\n\n\n")
end

function SWEP:DropMagCommon(t, varSide, noChb, forceMdl, forceDrop, forceAmt)
	self:DebugTalk("\n===============================================\n\t\tDropMagCommon\n===============================================\n")
	self:DebugTalk("Chbb 1: " .. tostring(Chbb)) -- ???
	
	if not t then t = 0 end
	if not varSide and varSide ~= false then varSide = true end -- True is Primary
	if not noChb and noChb ~= false then noChb = false end -- We only need this for Remove mag
	-- @@@ ^^^ Con/ClientVar? Check how ppropriate
	if not forceDrop then forceDrop = false end
	
	-- Create vars but dont assign a value yet
	local ammot
	local clipr
	local clipsizer
	local isChb
	local chbamt = 1 -- Test new logic
	
	if varSide == true then
		-- Primary Side
		ammot = self.Primary.Ammo
		clipr = self.Weapon:Clip1()
		clipsizer = self.Primary.ClipSize
		if self.Chambers then
			isChb = self.Primary.Chambered
		else
			isChb = clipr >= 1
		end
		
	else
		-- Secondary Side
		ammot = self.Secondary.Ammo
		clipr = self.Weapon:Clip2()
		clipsizer = self.Secondary.ClipSize
		if self.Chambers then
			isChb = self.Secondary.Chambered
		else
			isChb = clipr >= 1
		end
	end
	
	-- @@@@ Add logic for size of chamber? (Double barr sawnoff & AN94)
	-- Sawnoff sides should be done with secondary,
	-- However the AN94 is a good argument
	local Chbb = noChb == true or isChb == false
	self:DebugTalk("Amything in the chamber? Chbb 2: " .. tostring(Chbb))
	if Chbb == true then
		chbamt = 0 -- Nothing in the chamber
	end
	
	local clipamt = math.max(clipr - chbamt , 0) -- stay within reals
	local amt =  math.max(clipamt, 0) -- Dont hand them negative ammo
	if forceAmt then
		amt = self.DropAmt or 30
		self:DebugTalk("<> Using ForceAmt")
	end
	
	local useMags = GetConVar("swep_DropMags"):GetBool() -- and not (amt <= 0) -- Will the mag have no ammo?
	local magStat = false -- isMagless?
	
	if varSide == true and self.Primary.ClipSize > 0 then
		magStat = tobool( self.Weapon:GetVar( "PrimaryMagOut" ) )
		self:DebugTalk("magStat1 " .. tostring( magStat ) )
		
		self.Weapon:SetVar( "PrimaryMagOut", true)
		self.Weapon:SetClip1( math.min( math.max(clipsizer, 0)	, chbamt ) ) -- Protect -1 cases
		
	elseif varSide == false and self.Secondary.ClipSize > 0 then
		magStat = tobool( self.Weapon:GetVar( "SecondaryMagOut" ) )
		self:DebugTalk("magStat2 " .. tostring( magStat ) )
		
		self.Weapon:SetVar("SecondaryMagOut", true)
		self.Weapon:SetClip2( math.min( math.max(clipsizer, 0)	, chbamt ) ) -- Protect -1 cases
		
	elseif forceDrop then
		-- Ignore this area
		if not self:InDebug() then
			local ac
			if varSide then
				ac = self.Owner:GetAmmoCount(self.Primary.Ammo)
				amt =  math.min( ac , amt )
				self.Owner:SetAmmo(ac - amt, self.Primary.Ammo)
			else
				ac = self.Owner:GetAmmoCount(self.Secondary.Ammo)
				amt =  math.min( ac , amt )
				self.Owner:SetAmmo(ac - amt, self.Secondary.Ammo)
			end
		else
			self:DebugTalk("Ignoring ammo requirements with DEBUG mode")
		end
		self:DebugTalk("<><><> Skipping mag and clip detail for forceDrop = true; Subtracting Meta Ammo")
		
	else
		-- Flag issues
		self:DebugTalk("\n\t[!] Var Side: Argument incorrect! Type:\n" .. type(varSide) .. " => " .. tostring(varSide) .. " ! PLEASE FIX IN ARGUMENTS!")
		return chbamt
	end
	
	local b0 = (false == (self.NoMag or false))
	local b1 = (useMags == true and b0)
	local bend = (forceDrop or b1) and (magStat == false)
	--self:DebugTalk("-----------------------\n\tVALIDATING SPAWN REQUEST:\n\n\tShould spawn mag? \n\tforceDrop: " .. tostring(forceDrop) .. " \n\tUses mags and doesnt have NoMag flag: " .. tostring(useMags) .. " (b0 Use NoMag? " .. tostring(b0) .. ")\n\tMag Status, are we lacking a magazine? " .. tostring(magStat) .. "\n FINAL BOOL:" .. tostring(bend) .. "\n\n" )
	self:DebugTalk("\n\n( (forceDrop or  b1 ) and (false == magStat) ) => " .. tostring(bend) )
	self:DebugTalk("( (" .. tostring(forceDrop) .. " or " .. tostring(b1) .. ") and (false == " .. tostring(magStat) .. ") ) => " .. tostring(bend))
	
	if bend then
		-- @@@ Spam prevention, use Var MagOut to check if we should even make zero mags 
		--(that we've already removed at 1 point)
		
		-- Spawn Mag
		self:DebugTalk(" >> Requesting Mag spawn for " ..tostring(amt).." in "..tostring(t).." seconds! \n")
		self:SpawnMag( t, amt, ammot, forceMdl )
	elseif amt > 0 then
		-- Refund ammo directly
		self:DebugTalk("Refuding Ammo!")
		if SERVER then -- GiveAmmo is server only and doesnt like clients
			self.Owner:GiveAmmo(amt, ammot, true) -- bool to not show ammo return
		end
	else
		self:DebugTalk("\n\n\t!!!FALL THROUGH CASE!!!!\n\n")
	end
	
	return chbamt -- Probably could be returning better things
end

function SWEP:DropMagPrimary(t, noChb)
	if not t then t = 0 end
	if not noChb then noChb = self.Primary.StrictClipSize end -- We only need this for Remove mag
	-- See DropMagCommon for function
	self:DebugTalk("In DropMag Primary")
	return self:DropMagCommon(t, true, noChb, self.Mag)
end

function SWEP:DropMagSecondary(t, noChb)
	if not t then t = 0 end
	if not noChb then noChb = self.Secondary.StrictClipSize end -- We only need this for Remove mag
	-- See DropMagCommon for function
	self:DebugTalk("In DropMag Secondary")
	return self:DropMagCommon(t, false, noChb, self.Mag2 or self.Mag)
end

--[[---------------------------------------------------------
   Name: SWEP:RemoveClip( )  Aka UnloadClip
   Desc: Drop magazine
-----------------------------------------------------------]]
function SWEP:RemoveClip() -- Rename me!
	-- Refund ammunition to player
	-- Built for RP mostly
	self:DebugTalk("[1] Entering RemoveClip()\n")
	if not self.Owner:KeyDown( IN_ATTACK2 ) then return false end
	self:DebugTalk("[1.25] RemoveClip()\n")
	local cur = CurTime()
	local b1 = self.Weapon:GetNextPrimaryFire() > cur
	local b2 = self.Weapon:GetNextSecondaryFire() > cur
	local b3 = (self.ReloadingTime or 0) > cur

	if b1 or b2 or b3 then
		self:DebugTalk("[1.5] RemoveClip() CURTIME ("..tostring(cur)..") <? ::\n\t ReloadTime "..tostring(b3).." "..tostring(self.ReloadingTime ).."\n\t,b1 "..tostring(b1).." "..tostring(self.Weapon:GetNextPrimaryFire()).."\n\t,b2 "..tostring(b2).." "..tostring(self.Weapon:GetNextSecondaryFire()).."\n\t::\n")
		return false
	end
	

	if (self.Weapon:Clip1() <= 0) and (self.Weapon:Clip2() <= 0) then return false end
	self:DebugTalk("[1.75] RemoveClip()")
	if self.Primary.ClipSize <= 0 and self.Secondary.ClipSize <= 0 then return false end

	local dur
	local cutat = 0.32 -- A constantc @@@
	self:DebugTalk("[2] Past most barriers\n")
	--  self.EmptyReloadAnim or self.ReloadAnim or  
	-- Animate a reload with no idle after and iron off
			--	anim_name, pbr, snd, volume, idle_after, iron_off
	self:VMact( self.RemoveMagAnim or self.EmptyReloadAnim or self.ReloadAnim or ACT_VM_RELOAD , 1, self.RemoveClipSound, nil, false, true)
	self.Owner:SetAnimation( PLAYER_RELOAD )
	self.Owner:DrawViewModel(true)
	self:SetNextPrimAndSecon(0.025)
	self:CancelShotgunReload()
	
	dur = self:SequenceDuration()
	-- Set an animation for later
	local point =(dur * cutat)
	self:DebugTalk("[3] ".. tostring(point) .." |DropMag Dur: ".. dur .."\n")
	self.ReloadingTime = CurTime() + point
	local priClip = self.Weapon:Clip1()
	local secClip = self.Weapon:Clip2()
	
	-- Sync spawn mag with remove mag
	local dmrez = self:DropMagPrimary(dur/2, true)
	self:DebugTalk("[3.5] DM Rez 1: " .. tostring(dmrez))
	if self.Akimbo then
		dmrez = self:DropMagSecondary(dur/2, true)
		self:DebugTalk("[3.5] DM Rez 1: " .. tostring(dmrez))
	end
	
	self:DebugTalk("[4] Starting the timer\n")
	self:SafeTimer( point , function()
		
		-- Stop the animation at the desired point
		--self:VMact("idle", 1.1, nil, nil) -- Volume left undefined]
		-- self.EmptyIdleAnim or self.IdleAnim or ACT_VM_IDLE
		local b1 = self.EmptyIdleAnim == nil
		local b2 = self.DryFires == true
		local anim = self.EmpytyIdleAnim or ACT_VM_DRAW or ACT_VM_IDLE
		
		self:DebugTalk("~~~~ B1: "..tostring(b1).."\tB2:"..tostring(b2).."\tAnim:"..tostring(anim).."\n")
		
		if ( b1 and b2) then
			if self.DoDModelFunction == true then
				anim = ACT_VM_IDLE_EMPTY -- self.Primary.EmptyAnim 
			else
				anim = ACT_VM_DRYFIRE
			end
		end		
		
		--self:Idle( 0, anim )
		--	anim_name, pbr, snd, volume, idle_after, iron_off
		self:VMact(anim)
		--self:Talk("ANIM: "..tostring(anim))
		--self:VMact("IDLE")
		--self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
		self:DebugTalk(anim)
		
		self:SetHoldType("normal")
		self.Owner:SetAnimation( PLAYER_IDLE ) -- Relevance?
		self:DebugTalk("[5] Completed RemoveClip\n")
		
	end)

	return true
end

cleanup.Register("Fiery Magazine") -- Check implementation 9/18/18
function SWEP:SpawnMag(t, n, ammot, forceMdl) -- @@Accept mag or side argument
	if self.Chambers or self.NoMag == true then return false end
	--if (self.Primary.ClipSize < 2 and self.Secondary.ClipSize < 2) then return false end
	--[[
	 Entity:SetAnimation( number playerAnim )
		Sets a player's third-person animation. Mainly used by Weapons to start the player's weapon attack and reload animations.
	Entity:SetAnimTime( number time )
	--]]--
	
	self:DebugTalk("\n=========================\n\t\tSPAWN MAG\n=========================\n")
	self:DebugTalk("MAG IS: "..tostring(self.Mag).." #:"..tostring(n))

	local genericMag = "models/weapons/w_pist_cz_75_mag.mdl"
	if ammot ~= "smg1" and ammot ~= "pistol" and ammot ~= "357" and ammot ~= "alyxgun" then
		genericMag = "models/weapons/w_rif_m4a1_s_mag.mdl"
	end
	local mag2		= forceMdl or self.Mag or self:FindMagType() or genericMag
	-- Checks
	
	if not self.Mag and mag2 then
		self.Mag = mag2 -- Save for later
	end
	
	if CLIENT then return end -- Check validity
	self:DebugTalk("Mag to use is: " .. tostring(self.Mag))
	self:SafeTimer( t, function()
			--local mag		= Model("models/weapons/w_pist_deagle_mag.mdl")
			--local mag		= Model("models/weapons/w_pist_cz_75_mag.mdl")
			--local mag2		= self.Mag
						local t2		= self.AmmoDecayTime or 90 -- @@ MAKE SVAR
			item = self:DoSpawnMagazine(mag2, n, ammot)
			
			timer.Simple( t2, function() -- timer.Simple EXPLICITLY!! No-safetimers!
					local ent = item
					
					if nil == ent or not IsValid(ent) then 
						--ErrorNoHalt("Mag not found, aborting")
						return 
					end
					
					local targ = item:EntIndex().."mag"--item:GetClass() --Give it a unique name
					ent:SetKeyValue("targetname",targ)
					
					local dissolver = ents.Create("env_entity_dissolver")
					dissolver:SetPos(Vector(0,0,0)) -- Doesn't need to be in any particular position
					dissolver:SetKeyValue("target",targ)
					dissolver:SetKeyValue("magnitude",300)
					dissolver:SetKeyValue("dissolvetype",4)
					dissolver:Spawn()
					dissolver:Activate()
					dissolver:Fire("Dissolve") -- Vanish
			end)
			--
		undo.Create("Fiery Magazine") -- Integrate me harder!
			undo.AddEntity(health)
			undo.SetPlayer(self.Owner)
		undo.Finish()

		self.Owner:AddCleanup("Fiery Magazine", item)
	end)
end

function SWEP:DoSpawnMagazine(mag2, n, ammot, addUp)
			--if CLIENT then return end
			if not addUp and addUp != false then
				addUp = false
			end
			self:DebugTalk("\n\n<><> SPAWN MAG CALL DETAILS: "..tostring(mag2).."\t"..tostring(n).."\t"..tostring(ammot).."\n\n")
			local mag		= Model( mag2 )			
			local aim 		= self.Owner:GetAimVector()
			local side 		= aim:Cross(Vector(0,0,1))
			
			local up 		= side:Cross(aim)
			local pos 		= self.Owner:GetShootPos() +  (aim * 24 + side * 8 + up * -10)
			local speed		= 300

			item = ents.Create("sent_magazine") -- "sent_magazine"
			
			if !item:IsValid() then return false end
			
			--item:SetModel(mag)
			--item.SetModel(mag)
			item.MODEL = mag
			
			item.AMOUNT = n or 1337
			item.AMMOTYPE = ammot or "alyxgun"
			
			item:SetAngles(aim:Angle())
			item:SetPos(pos)
			--item:SetOwner(self.Owner) -- NEVER USE! COLLISION ISSUES 
			item:SetPhysicsAttacker(self.Owner)
			-- ans = item:SpawnFunction(self.Owner, nil, pos)
			
			item:Spawn()
			item:Activate()

			--item:PhysicsInit( SOLID_VPHYSICS )
			local phys = item:GetPhysicsObject()  	
			if not phys:IsValid() then  		
				item:Remove()
				return false
			end

			local push = Vector(item:GetForward()+item:GetUp())
			item:SetVelocity( push * speed )
			
			self:DebugTalk("Spawn Mag done!\n\n\n...")
			return item
end

--[[---------------------------------------------------------
   Name: SWEP:CheckReload( )
   Desc: CheckReload -- unhooked?
-----------------------------------------------------------]]
function SWEP:CheckReload()-- USE ME!
	-- @@@ Research usage!
end
-- GOD MODE (inf ammo) VAR SWITCH HERE!!

--[[-----------------------------------------------------------
	Reload	-- Where is the decluter Q,Q #2020
-----------------------------------------------------------]]--
-- DECLUTER ASAP!!!! @@@@
function SWEP:Reload() -- @@@@ DECLUTER!!!!
	--self:DebugTalk("RELOAD START") 
	if (self.ReloadingTime and CurTime() <= self.ReloadingTime) or (self.Weapon:GetNetworkedBool("reloading", true))  then return end
	
	-- Check field of view and direct target
	if self.Owner:KeyDown( IN_USE ) then
		local ent = nil
		if self.Owner:GetEyeTrace().Entity ~= nil then
			ent = self.Owner:GetEyeTrace().Entity
		end
		
		local max_trace = 50 -- VAR ME -- Distance to consider ents

		if ent ~= nil then 
			-- Make sure were not too close!
			if ( math.abs( ent:GetPos():Distance(self.Owner:GetPos()) ) <= max_trace) then 
				self:DebugTalk("Player too close to object ("..tostring(ent)..")! Aborting Reload Modify!\n")
				return false
			end
		end
		-- Cleared for USE Modifier or Drop clip
		
		-- @@@TODO: Actions based on scrolling up and down...
		
		if self.Owner:KeyDown( IN_ATTACK2 ) then -- If scrolling back
			return self:RemoveClip()
		end
		
		if (not self.Owner:KeyDownLast( IN_USE )) and self:HasModify() and self:CanSecondaryAttack()  then
			-- Cant remember the logic for this, but uh
			
			self:Modify() -- USE MODIFYER
			 -- SET UP INDIVIDUAL VALUE FOR THIS!!! Not just Secondary attack
			return true
		end
	end

	-- Chambering Check -- Check env logic
	if tobool(self.Chambers) then
		-- This area is specificly designed to require 2 Chambering motions to be done
		--self:Talk("In chambering block of reload")
		local rez = false
		local pcheck = not ( self.Weapon:Clip1() <= 0 and (self.Primary.Clipsize or -1) > 1 )
		local scheck = not ( self.Weapon:Clip2() <= 0 and (self.Secondary.Clipsize or -1) > 1 )
		--self:DebugTalk("In chambering block of reload! pcheck: " .. tostring( pcheck ) .. "   scheck: " .. tostring( scheck ))
		
		if (self.Primary.Chambered == false)
			and pcheck == true then
			
			rez = self:ChamberPrimary()
			if rez then
				self.Weapon:SetVar("PrimaryMagOut", false)
				return true
			end
		elseif(self.Secondary.Chambered == false) 
			and scheck == true then
			
			rez = self:ChamberSecondary()
			if rez then
				self.Weapon:SetVar("SecondaryMagOut", false)
				return true
			end
		end
	end
	
	-- ENTER RELOADING PHASE
	local arg1 = (self.Weapon:Clip1() < self.Primary.ClipSize  
					and self.Owner:GetAmmoCount(self.Primary.Ammo) > 0) 
					and (((self.Owner:KeyPressed( IN_RELOAD ) and
					not self.Owner:KeyDownLast( IN_RELOAD )) or GetConVar("swep_AutoReload"):GetBool()))
	
	if self.ShotgunFunctions then
		self:DebugTalk("<> Attempting to call shotgun reload <> "..tostring(arg1).. " & "..tostring(self.ShotgunFunctions).."\n")
		if arg1 then
			-- So We can use the Think Function
			
			self:ShotgunReload() -- @@@ShotgunReload
			return true
		else
			--self:CancelShotgunReload()
			return false
		end
	end
	
	-- Regular Reload Params
	if not arg1 then 
		self.Weapon:SetNetworkedBool("reloading", false) 
		return
	else
		self.Weapon:SetNetworkedBool("reloading", true)
	--self:Talk("End-ish of reload")
	end --@@@ Owner dead

	------------------------------------------------------------------------------------
	local flag = nil
	flag = self.Weapon:DefaultReload( ACT_VM_RELOAD ) -- It'll do what I need to
	-- This segement of code smells like 2012
	------------------------------------------------------------------------------------
	
	if not flag then 
		self:DebugTalk("False Reload Flag returning\n")
		self.Weapon:SetNetworkedBool("reloading", false) 
		return 
	end
	local RT = 0.0
	--self:PrintStats(true, false)
	
	RT = self:StandardReload() -- This really should get called btw.. important.
	self.ReloadingTime = RT -- Find a way to send to clientside!! @@@

	-- @@@TEST: Test this often!
	--self.Weapon:SetVar("PrimaryMagOut", false)
	--self.Weapon:SetVar("SecondaryMagOut", false)

	return true
end
--]]
function SWEP:StandardReload() -- @@@RELOAD -- Does not meet naming for "standard", not full reload
	local lagtime = 0.020 -- Check ms -- 0.010
	local da_pbr = 1
	local at
	local fat
	local m1 = not self.Weapon:GetVar("PrimaryMagOut") -- The mag is in 
	local m2 = not self.Weapon:GetVar("SecondaryMagOut")
	local addChbA = 0
	
	self:SetHoldType( self.ReloadHoldType or self.HoldType ) -- @@@ INSPECT ME
	
				--	anim_name, pbr, snd, volume, idle_after, iron_off 
	self:VMact("RELOAD", da_pbr, nil) 	-- self.ReloadSound 
	at = self:GetSeqDur()				-- Grab the new animation duration
	
	fat = CurTime() + ( (at * da_pbr) )	-- Account for the requested Playback Rate
	self:SetNextIdle("SOON") -- This may be a double call location (used in idlethink)! @@@ 
	
	self.ReloadingTime = fat or -2
	
	-- Check Primary & Secondary checks
	self:SetNextPrimAndSecon(0.98) -- @@@@ Convar @ Init and draw?
	
	-- SafeTimers @@
	if m1 then
		addChbA = self:DropMagPrimary(at/3)
	end
	if self.Akimbo and m2 then
		addChbA = self:DropMagSecondary(at/3)
	end
	
	if !false then 
	-- Need svar bool to declare Strict Clipsize
		self:SafeTimer( at*0.95 , function()
						-- Raise the max clipsize if we are chambered
						local aw = self.Owner:GetActiveWeapon():GetClass()
						local tw = self.Weapon:GetClass()
						if aw ~= tw then -- Not active RN
							self.Weapon:SetNetworkedBool( "reloading", false) -- This should be handled in draw maybe
							-- Reset clipsizes to recorded reals
							self.Primary.ClipSize = self.Primary.ClipSize_Real
							self.Secondary.ClipSize = self.Secondary.ClipSize_Real
							return 
						end -- @@ This is why we need to just build our own reload.
						
						if self.Primary.StrictClipSize == false and self.Weapon:Clip1() > 0 then
							self.Primary.ClipSize = math.max( self.Primary.ClipSize + addChbA, self.Primary.ClipSize_Real )
						end
						if self.Secondary.StrictClipSize == false and self.Weapon:Clip2() > 0 then
							self.Secondary.ClipSize = math.max( self.Secondary.ClipSize + addChbA, self.Secondary.ClipSize_Real )
						end
						self:DebugTalk("New Clipsize: " .. self.Primary.ClipSize .. " vs " .. self.Primary.ClipSize_Real)
					end )
	end				
		self:SafeTimer( at + lagtime, function()
						self.Primary.ClipSize = self.Primary.ClipSize_Real
						self.Secondary.ClipSize = self.Secondary.ClipSize_Real
						self:DebugTalk("Back Clipsize: " .. self.Primary.ClipSize .. " vs " .. self.Primary.ClipSize_Real)
						self:DebugTalk("at: " .. tostring( at + lagtime ))
					end )
	
	
	self:SafeTimer( at, function() -- Wait the full dur
						-- @@@ Fall back included?
						self.Weapon:SetNetworkedBool( "reloading", false) -- This should be handled in draw maybe
						-- Reset clipsizes to recorded reals
						--self.Primary.ClipSize = self.Primary.ClipSize_Real
						--self.Secondary.ClipSize = self.Secondary.ClipSize_Real
						--self:Talk("Back Clipsize: " .. self.Primary.ClipSize .. " vs " .. self.Primary.ClipSize_Real)
						--if self.Primary.StrictClipSize == false and self.Weapon:Clip1() > 0 then
						--	self:SetClip1( math.max( self.Weapon:Clip1() + addChbA, self.Weapon:Clip1() ))--self.Primary.ClipSize_Real )
						--end
						--if self.Secondary.StrictClipSize == false and self.Weapon:Clip2() > 0 then
							--self:SetClip2( math.max( self.Weapon:Clip2() + addChbA, self.Weapon:Clip2() ))--self.Secondary.ClipSize_Real )
						--end
						
						
						local aw = self.Owner:GetActiveWeapon():GetClass()
						local tw = self.Weapon:GetClass()
						--local lpw = self.Weapon:IsCarriedByLocalPlayer()
						--ErrorNoHalt("aw vs tw: " .. tostring(aw) .. " \t " .. tostring(tw) .. " -> Amt:  " .. tostring(addChbA) .. " \n " ) -- .. tostring(lpw)
						
						--if (CLIENT) then return end
						
						if self:AreArmsDown()  then
							self:SetHoldType( self.RunHoldType or "normal" ) -- 
						elseif self.Akimbo then
							self:SetHoldType( "dual" ) -- Theres a glitch! @@@FIXME!
						else
							if self.Weapon:GetNetworkedBool( "Ironsights" ) then
								self:SetHoldType( self.HoldType ) -- 
							else
								self:SetHoldType( self.HoldType2 or self.HoldType ) -- 
							end
						end
						
						if aw ~= tw then return end -- @@ This is why we need to just build our own reload
						
						-- Dont reset Mag Stat until its all over
						self.Weapon:SetVar("PrimaryMagOut", false)
						self.Weapon:SetVar("SecondaryMagOut", false)
						
					end )
	-- Continue with checks
	
	-- @@@@ Make this \/ have a convar
	if ( self.Primary.ClipSize > 8 ) and ( self.Weapon:Clip1() <= self.Primary.ClipSize / 2 ) then
		-- Check a minimum clipsize for shotguns and revolvers..
		self:SetIronsights( false )
	end
	
	return fat	-- #COVID-Break #4/29/2020 -- Oh you fool... #2/27/2021
end

function SWEP:ChamberPrimary()
	
	if (self.Chambers == false 
	or self.Primary.Chambering == true -- RN
	or self.Primary.ClipSize < 1
	or (self.Primary.Automatic and (self.Weapon:Clip1() == 0) and self.Primary.ClipSize > 1 )) then return false end
	local speed = 1
	
	
	if (self.ShotgunFunction) then
		--if (anim) then
			speed = 1.25
			self:VMact( self.Primary.Chamber , speed)			
			self.Owner:EmitSound(self.Primary.ChamberSound or "")
		--else
			--self:VMact( ACT_SHOTGUN_RELOAD_FINISH , 1.25)
		--end	
	else
		speed = 2
		self:VMact( self.Primary.Chamber , speed) -- CHANGE?
		self.Owner:EmitSound(self.Primary.ChamberSound or "")
	end
	
	local t = (self:GetSeqDur()/speed)*0.75
	self:SetNextPrimAndSecon(t)
	self.Primary.Chambering = true
	-- For later
	self:SafeTimer(t, function()
		self.Primary.Chambered 	= true
		self.Primary.Chambering = false
		
	end)
	
end

function SWEP:ChamberSecondary() -- Expand?
	if (self.Secondary.ClipSize < 1) then return end
	self:VMact( ACT_VM_FIDGET )
	self.Secondary.Chambered = true
end

function SWEP:ShotgunReload()
	-- Rightclick while reloading -> cancelreload
--	if ( self.Reloadaftershoot > CurTime() ) then return end
	self:DebugTalk("<> ShotgunReload CALLED <> \n")
	
	if self.Weapon:GetNWBool("reloading", false) == true then
		if not self.Owner:KeyPressed(IN_ATTACK) then 
			-- Cancel the reload
			self:CancelShotgunReload()
		end
		return
	end

	if (self.Weapon:Clip1() < self.Primary.ClipSize 
		and self.Owner:GetAmmoCount(self.Primary.Ammo) > 0) 
		and not self.Owner:KeyDown( IN_ATTACK2 ) then
		
			self.Weapon:SendWeaponAnim( self.ShotgunReloadStart or ACT_SHOTGUN_RELOAD_START) --  @@ MAKE VAR
			local tt = self:GetSeqDur()*0.95
			self.Weapon:SetNextPrimaryFire(CurTime() + tt)
			self.Weapon:SetNextSecondaryFire(CurTime() + tt)

			self.Weapon:SetNetworkedBool("reloading", true)
			self:DebugTalk("<> Shotgun Reload called and cleared <> \n")

	end
	self:DebugTalk("Times: curtime:" .. tostring( CurTime() ) .. " vs reloading_time: " .. tostring(self.Weapon:GetNetworkedInt( "reloadtimer")))
	--self:SetFOV( 0, 0.15 )
	-- Zoom = 0
	-- for non magazine snipers??
	
	self:SetIronsights( false )
	-- Set the ironsight to false
	
end

function SWEP:CancelShotgunReload() -- Needs so much updating @@
	-- Faster version of Finish
	-- HALT SHOTGUN RELOAD, FLATTEN OUT
	self.Weapon:SetNextPrimaryFire(CurTime() + 0.5)
	self.Weapon:SetNextSecondaryFire(CurTime() + 0.5)
	self.Weapon:SetVar("reloadtimer", CurTime() - 1) -- TEST ME! @@ Storing as pure float may be glitchy
	self.Weapon:SetNetworkedBool( "reloading", false)
	self.Weapon:SendWeaponAnim( self.ShotgunReloadFinish or ACT_SHOTGUN_RELOAD_FINISH) -- @@ VAR ME
	self:DebugTalk("<> Reload canceled <> \n")
	--while self.Owner:KeyDown(IN_RELOAD) do
		
	--end
end

------------ PRIMARY AND SECONDARY -----=======================================+++++++++++++++++++++++++++++++++

--[[-----------------------------------------------------------
   Name: SWEP:CanPrimaryAttack()
   Desc: --Helper function for checking for no ammo.
-----------------------------------------------------------]]--
function SWEP:CanPrimaryAttack()
	self:DebugTalk("\n\nEntering CanPrimaryAttack")
	local b1, ent = self:AreArmsDown()
	if (self.Weapon:GetVar("PrimaryMagOut") and self.Primary.ClipSize > 0) or
		(b1 and not self:CheckTarget(ent,30)) then 
		
		self:DebugTalk("Mag out or arms down")
		return false, nil 
	end -- or self:IsFlooded()

	local delay = 0.08 -- Between checks for this function
	local eval = (self.Weapon:Clip1() <= 0 and self.Primary.ClipSize > 0 and (self:Ammo1() >= 0))
	local eval2 = (self.Weapon:Clip1() <= 0 and self.Primary.ClipSize > 0 and (self:Ammo1() == 0))
	
	self:DebugTalk("Can Attack:\n " .. tostring(eval).. "\n b1(Arms Down):" .. tostring(b1).. "\n clip1: "..tostring(self.Weapon:Clip1()).. " Eval empty(<=0):" .. tostring(eval) .. "\n Clip Size(>0):"..tostring(self.Primary.ClipSize).."\n ammo1(>=0):"..tostring(self:Ammo1()).. "\n\n")

	local b2 = GetConVar("swep_AutoReload"):GetBool()
	
	if (self.Primary.ClipSize < 0) then -- and (self:Ammo1() > 0)
	
		
		self:DebugTalk("Clipsize < 0, Exiting True")
		return true, ent -- MELEE
	end
	
	
	--if self.Weapon:GetNextPrimaryFire() <  CurTime() then
	--	return false
	--end
	
	-- Clip is empty 
	self:DebugTalk("Eval: "..tostring(eval))
	if eval and not eval2 then
		if ( b2 ) then -- Reload on empty?
			self:DebugTalk("Im in (CanPrimaryAttack)!")
			self:Reload()
		elseif (self.Owner:KeyPressed(IN_ATTACK)) then
			-- COMBINE THESE INTO 1 VMACT CALL!
			self.Weapon:SetNextPrimaryFire(CurTime() + delay)
			
			self:EXESound( {"Default.ClipEmpty_Pistol", self.Owner} ) -- @@@ MODERNIZE ME VARS!
			self:VMact( self.Primary.CantAttack ) -- HL2 Animation trick
			self:DebugTalk("HL2 Anim trick used")
			self.Owner:SetAnimation( PLAYER_ATTACK1 ) -- @@@ Use reduced recoil animation? Or trash it
		end
		self:DebugTalk("Cant fire, returning false")
		return false, ent
--[[elseif not self.Owner:IsNPC() and (self.Owner:KeyDown(IN_SPEED)) then
		self.Weapon:SetNextPrimaryFire(CurTime() + delay)
		return false --]]
	--elseif ar then
		--self:Reload()
		--GetConVar("swep_AutoReload"):GetBool() 
	elseif (self.Primary.Chambered == false) then
		if (true) then
			-- Chamber for them
			self:DebugTalk("Code Update Needed @ CanPrimaryAttack")
			self:ChamberPrimary()
		else
			-- Not sure?
			self:DebugTalk("Odd case @ CanPrimaryAttack")
		end
		return false, ent
	elseif eval2 and not self.Owner:KeyDownLast( IN_ATTACK ) and self.Owner:KeyPressed( IN_ATTACK ) then
		-- hl1/fvox/ammo_depleted.wav
		-- Tell the player they dont have ammo
		-- @@ Perhaps even switch off weapon?
		--self.Owner:EmitSound("hl1/fvox/ammo_depleted.wav")
		self:EXESound( {"hl1/fvox/ammo_depleted.wav", self.Owner} )
		self.DebugTalk("Primary ammo depleted")
		self.Weapon:SetNextPrimaryFire(CurTime() + (4))
	else
		self:DebugTalk("Failed all false eval cases; Sneaking out as TRUE, Can Attack\n\n")
	end
	
	self:DebugTalk("Can fire, returning true")
	return true, ent
end

--[[-----------------------------------------------------------
	PrimaryAttack
-----------------------------------------------------------]]--
function SWEP:PrimaryAttack()
	--local ar = not(self.Akimbo) and (self.Weapon:Clip1() <= 0) and (self.Primary.ClipSize > 0) and (self:Ammo1() > 0)
	local b1, target = self:CanPrimaryAttack()
	local arg1 = ( not b1 or self.Weapon:GetNetworkedBool( "reloading", false) == true)
	if arg1 or self.Owner:KeyDown( IN_RELOAD ) then return end

	self.Weapon:SetVar("AkimboSide", false) -- @@@ Implement
	local z1 = target ~= nil
	local z2, z3a = false, 0
	if z1 then
		-- Yeah
		z2 = target:IsNPC() 
		-- Dont allow point blanking players, thats cheap'
		-- AND HIGHLY EXPLOITABLE FOR BASE DEFENCE...
		-- So no players.
		z3a = target:GetPos():Distance( self.Owner:GetPos() ) 
	end
	local z3 = z3a < 18 -- @@Should be less than 3 feet/1 meter
	local b2 = (not self:IsOwnerMoving()) and z1 and z2 and z3 -- @@@ Make sv_var!
	
	self:DebugTalk("Point Blank Args: "..tostring(z1).." "..tostring(z2).." "..tostring(z3).." DIST: "..tostring(z3a) .. " B2 = " .. tostring(b2))
	--
	local doMod = (not(self.Owner:IsNPC()) -- Create a very clear key pattern 
		and self.Owner:KeyDown( IN_ATTACK ) 
		and self.Owner:KeyPressed( IN_USE )
		and not self.Owner:KeyDown( IN_USE ))

	if doMod  then
		
		if self:HasModify() and self:CanSecondaryAttack() then
			self:Modify() -- USE MODIFYER
			self.Weapon:SetNextSecondaryFire( CurTime() + 0.02 ) -- SET UP INDIVIDUAL VALUE FOR THIS!!! Not just Secondary attack
			return true
		elseif self.Akimbo and (self.Primary.ClipSize > 0) and( self.Weapon:Clip1() == 0) then -- lol
				self:Reload()	
			return true
		end
	end
	
	
	--
	if b2 == true then
		-- The target is close and right infront of us
		-- So lets do some damage 
		self:DebugTalk("Inside Point Blank section")
		self:AimAssist(target)
	end
		
	-- FIRE PARAMS
	if self.Primary.BurstFire > 0 and self.data.modes[self:CurFireMode()] == 2 then  -- @@@ Make firemode checking function
		-- They've called for Burst Only functions
		self:DebugTalk("Entering Primary Burstfire   MODE:"..tostring(self:CurFireMode()).."\n")

		self:PrimaryBurst(self.Primary.BurstFire)
		return true

	elseif not(self.Weapon:Clip1() <= 0 and self.Primary.ClipSize > 0) and self.Weapon:GetNetworkedBool( "reloading", false ) == false then
		
		--self:PrimaryShootEffects() -- Get this goin to reference the animation length
		--OBSOLEET --self:CSShootBullet( self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots, self.Primary.Cone )
		
		local b1 = not (GetConVar("swep_physical_bullets"):GetBool())
		local b2 = not self.Primary.DelayShots == true
		local b3 = self.Primary.UseFlechette == true
		local anim = true
		
		if self.Weapon:Clip1()-1 < 1 then
			-- This area can create weird anims
			-- But for the most part filling this
			-- Should be handled by a BASE
			--anim = self.Primary.EmptyAnim or true
			anim = self.Primary.EmptyAnim or self.Primary.ShootAnim or true
		else
			anim = self.Primary.ShootAnim or true
		end

		-- @@@@ grenade_spit item_grubnugget 
		if b3 then
			self:ShootFlechette(
								self.Primary.Damage,
								self.Primary.Recoil,
								self.Primary.NumShots,
								self.Primary.Cone,
								self.Primary.Ammo,
								anim
							)
			
		elseif b1 and b2 then -- @@@See why the ConVar is messing up 
			
			self:ShootBullet( 	1,
								self.Primary.Damage,
								self.Primary.Recoil,
								self.Primary.NumShots,
								self.Primary.Cone,
								self.Primary.Ammo,
								anim
							) -- @@@ Add Forced Anim?
		elseif not b1 and b2 then
			self:ShootPhysicalBullet(
										self.Primary.Damage,
										self.Primary.Recoil,
										self.Primary.NumShots,
										self.Primary.Cone,
										self.Primary.Ammo,
										anim
									)
		elseif not b2 then
			 -- IMPLEMENT!  
			self:PrimaryDelayShot()
		else
			ErrorNoHalt("[!] Case-Leak in SWEP:PrimaryAttack()! @@@PA1")
		end

		self.Weapon:SetNetworkedBool( "reloading", false )
		return true
	--elseif (self.Weapon:GetNetworkedBool( "reloading", false )) then
		--self.Weapon:SetNetworkedBool( "reloading", true )
		--return false
	elseif self:IsMelee() then -- @@@FFFF
		-- Stab or whatever
		self:AltMelee()
	else
		self.Weapon:SetNetworkedBool( "reloading", false )
		return false
	end
end

function SWEP:PrimaryDelayShot()
	-- Make sure we can shoot first
	if ( !self:CanPrimaryAttack() ) then return end
	
	-- self.Weapon:SetNextPrimaryFire( CurTime() + 0.13+0.1 )
	-- side, recoil, anim, snd, numshot
	-- self:ShootEffects(1, self.Primary.Recoil, true, "", 1) -- self.Primary.Sound
	
	--	anim_name, pbr, snd, volume, idle_after, iron_off
	self:VMact("PRIMARY", 1, "")
	
	self:SafeTimer( 0.1 , function() -- @@@@Check server safeness?
		local flag = self:FireGun()
		self:DebugTalk("FireGun() returned "..tostring(flag).."\n")
		return 
	end)
end

function SWEP:FireGun() -- Cant use self:Fire() ...
	--if not self or not self.Owner then return end
		
	--self:CSShootBullet( self.Primary.Damage, self.Primary.Recoil, self.Primary.Recoil, self.Primary.Cone )
	--self:ShootBullet( self.Primary.Damage, self.Primary.Recoil, self.Primary.Recoil, self.Primary.Cone )
	--local c = math.random(self.Primary.Cone*-1, self.Primary.Cone)
	local c = self.Primary.Cone
	self:ShootBullet( 1, self.Primary.Damage, self.Primary.Recoil, 1, c, self.Primary.Ammo, 0)
	self:DebugTalk("POP! FireGun() called\n")

	-- Remove 1 bullet from our clip
	--self:TakePrimaryAmmo( 1 )
	
	-- Punch the player's view
	--self.Owner:ViewPunch( Angle( -1, 0, 0 ) )
	
	return true
end

--[[-----------------------------------------------------------
	Name: PrimaryBurst
	Desc: A built in burst fire function
	@@@TODO: Make compatable with Physical bullets
-----------------------------------------------------------]]--
function SWEP:PrimaryBurst( NumShot )
	if (not NumShot) or (NumShot < 2) then 
		NumShot = math.max(self.Primary.BurstFire,3) -- Check Relevance
	end
	
	local cone = self.Primary.Cone
	local delay = self.Primary.BurstDelay or self.Primary.Delay
	local animflag = true
	local anim
	local cscale = 0.95
	
	self:CanPrimaryAttack( false )
	-- Lock it to prevent weird timer overlaps
	--self:CSShootBullet( self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots,  cone)
	
	-- Make more broad cased? 
	-- @@@ What even is this logic??????
	if (self.Primary.Ammo == "ar2") then
		anim = "PRIMARY" -- Unused
		self:DebugTalk("Using "..anim.." anim, because ammo")
	else
		-- I assume this is for the glock??
		anim = ACT_VM_SECONDARYATTACK -- Unused
		animflag = false
		self:DebugTalk("Using animflag anim, because ammo")
	end
	    
	self:ShootBullet( 	1,
						self.Primary.Damage,
						self.Primary.Recoil,
						self.Primary.NumShots,
						cone + math.random( -cone*cscale, cone*cscale ),
						self.Primary.Ammo,
						nil
					)
	
	
	-- Generate number of shots in a loop
	for x = 1, NumShot-1, 1 do
		local flag = (x == NumShot-1)
		
		-- @@@ SafeTimers are not Network friendly
		-- @@@ Need a workaround ASAP
		-- @@@ Think Loop
		-- Some newtworked value for # of shots remaining
		-- and most likely start-time? 
		-- Could just always iterate the # of shots until 0
		-- Be data compact...
		
		self:SafeTimer( delay * x, function()	
			if self.Weapon:Clip1() < 1 then return false end
			self:ShootBullet( 	1,
								self.Primary.Damage,
								self.Primary.Recoil,
								self.Primary.NumShots,
								cone + math.random(-cone*cscale, cone*cscale ),
								self.Primary.AmmoType,
								animflag
							)

			if flag then
				self:CanPrimaryAttack( true )
				self.Weapon:SetNextPrimaryFire( CurTime() + (delay*1.55) )	-- @@@@ Different calculation of scaler?
			end
		end)
		
	end
end
---------------------------------------------------------------------------------
-- self:FireAnimationEvent() 
function SWEP:CanSecondaryAttack() -- Needs work!
	if self.Weapon:GetVar("SecondaryMagOut") then return false end
	if self.Weapon:GetNextSecondaryFire() >  CurTime() then 
		--self:Talk("TOo Ear: " .. tostring(self.Weapon:GetNextSecondaryFire()) .. " vs " .. tostring(CurTime()))
		return false 
	end

	local delay = 0.005
	local eval1 = self.Akimbo == true
	local eval2 = self.Weapon:Clip2() < 1 and self.Secondary.ClipSize > 0
	local eval3 = self:IsFlooded()
	local eval4 = (self.Weapon:Clip2() <= 0 and self.Secondary.ClipSize > 0 and (self:Ammo2() == 0))
	
	--ErrorNoHalt("CHECKS: 1." .. tostring(eval1) .. " : 2." .. tostring(eval2) .."->".. tostring(self.Weapon:Clip2() < 0).. "&"..tostring(self.Secondary.ClipSize > 0).." : 3." .. tostring(eval3) .. " \n")
	if ( self.Weapon:GetNetworkedBool( "reloading", false ) == true and not eval1) then
		if ( self.Weapon:GetNetworkedBool( "Ironsights", false ) == false) then
			-- Allow iron transitions durring reload
			self:SetIronsights( not self.Weapon:GetNetworkedBool( "Ironsights", false ) )
			self.Weapon:SetNextSecondaryFire(CurTime() + (delay*1)) -- Delay
			
			return false
		end
	end 
	
	-- Weapon level --
	--self:Talk("CSA?: "..tostring(eval2)..tostring(eval3).." : \n\n")
	if (eval2 or eval3) then 
		self.Weapon:SetNextSecondaryFire(CurTime() + delay) -- Delay
		self:DebugTalk("Eval2 and Eval3 failed")
		return false
	end
	
	if (eval1) then
		
		if (eval2 or eval3) then
			-- Uhm
			self:DebugTalk("Eval1 and Eval2 and Eval3 failed")
			return false
		end
	end
	
	if eval4 and not self.Owner:KeyDownLast( IN_ATTACK2 ) and self.Owner:KeyPressed( IN_ATTACK2 ) then
		-- hl1/fvox/ammo_depleted.wav
		-- Tell the player they dont have ammo
		-- @@ Perhaps even switch off weapon?
		self.Owner:EmitSound("hl1/fvox/ammo_depleted.wav")
		self.DebugTalk("Secondary ammo depleted")
		self.Weapon:SetNextSecondaryFire(CurTime() + (4)) -- Delay
	end
	
	return true
end

function SWEP:TesterFunc( arg )
	local x = 0.001
	local pbr = 1

	--	anim_name, pbr, snd, volume, idle_after, iron_off
	self:VMact("RELOAD", pbr)
	local t = self:GetSeqDur()
	
	-- 42 FPS @ 1 pbr
	local f = (t/2)
	local r = f/x
	self:Talk("Seconds till: "..f.." , Rate: "..r)
	pbr = r
	
	self:VMact("RELOAD", pbr)
	--self.Owner:GetViewModel():SetPlaybackRate(pbr)
	
	self:SafeTimer(x, function()
		self.Owner:GetViewModel():SetPlaybackRate(1)
		self:Talk("End of speed\t SeqDur"..tostring(self:GetSeqDur()))
	
	end)


end

--[[-----------------------------------------------------------
	SecondaryAttack
	-- Needs to be rewrote. 9/24/2019
-----------------------------------------------------------]]--
function SWEP:SecondaryAttack( arg )

	local eval = not self:CanSecondaryAttack() -- Creates a false return if trues
	self:DebugTalk("Vanila Secondary call\n")
	--self:DebugTalk("\t@FireMode: "..tostring( self:CurFireMode() ).."\n")
	self:DebugTalk("Secondary Attack - Can Attack? "..tostring(eval).."\n")
	
	if self.NextSecondaryAttack <= 0 then 
		-- NOTE: This was causing a long time
		-- issue because self.NextSecondaryAttack
		-- was not initialized!
		self.NextSecondaryAttack = CurTime() 
		self:DebugTalk("Correcting definition logic with NextSecondaryAttack")
		-- Never return here ever again!!!
	end
	
	if SERVER then
		--ErrorNoHalt("SV FireMode:"..tostring(self:CurFireMode()).."\n")
	end
	if CLIENT then
		--ErrorNoHalt("CL FireMode:"..tostring(self:CurFireMode()).."\n\n")
	end
	
	if (eval and self.Akimbo == true) then 
		Msg("Rejected") 
		return false 
	end
	
	self.Weapon:SetVar("AkimboSide", true)
-- tobool(tonumber(self.DEBUG))
	--Msg("TF "..tostring(self:TesterFunc()))
	-- @@@@ KEY COMBOS HERE
	local hm = self:HasModify() or isTbl(self.Scope) -- @@Determine need to integrate param
	local inR = self.Owner:KeyDown( IN_RELOAD )
	local inE = ( self.Owner:KeyDown( IN_USE ) and not self.Owner:KeyReleased( IN_USE ) )
	--ErrorNoHalt("[~] Has Modify? " .. tostring(hm))
	
	if not inR and inE then  -- @@@@NO, REWRITE THIS
			--self.Owner:RemoveSuit()
			--self:SetIronsights( !self.Weapon:GetNetworkedBool( "Ironsights", false ) )
			--self.Weapon:SetNextSecondaryFire( CurTime() + 0.06 ) 
			self:DebugTalk("Not in R, maybe in E\nR: "..tostring(inR).." , E: "..tostring(inE).." , HM: "..tostring(hm))
		if hm then	
			-- Use a modifier
			self:DebugTalk("[~] Modify going toward burst/Modify()")
			self:Modify( self.ForceModifier or nil )
			
			return true
		else 
			self:Idle()
			self:DebugTalk("Idle event triggered via SECONDARY ATTACK")
			--self:TesterFunc()
		end
	else	
		--self.Weapon:EmitSound("weapons/smg1/switch_burst.wav")
		-- Standard click
		if not inR and isTbl(self.Akimbo) then -- @@@ I dont think Akimbo is a table anymore
			self:FireSpare()
			--self:Talk("Im in secondary at FIRE SPARE") 
		elseif (self.AimAssist != false and GetConVar("swep_AutoAim"):GetBool()) then
			local t = self:AimAssist()
			self:DebugTalk("Im in secondary at AIM ASSIST, returned "..tostring(t).."\n")
		else
			--self:Beep("SIGHTS")
			self:Sights()
			--self:Talk("Im in secondary at SIGHTS!")
		end
		return true
	end
	
	self:DebugTalk("Hit bottom of secondary")
	return false
end

-- @@FIRESPARE 
function SWEP:FireSpare() -- NEDDS WORK !!!! -- Whole system rewrite when?
	--  @@@Edit
	-- Make sure we can shoot firstv 
	local b1 = self:CanSecondaryAttack()
	--self:Talk("Secondary Attack: Can? "..tostring(b1))
	if not b1 then return end
	local hithere = self.Secondary.ShootAnim
	self.Weapon:SetVar("AkimboSide", true) -- Legacey???? @@@
	ErrorNoHalt("\t<>FS: "..tostring(hithere).."\n")
	-- ( side, dmg, recoil, numbul, cone, ammo, forcedAnim, forceAmmoUsage)
	self:ShootBullet( 	2,
						self.Secondary.Damage 	or self.Primary.Damage,
						self.Secondary.NumShots or self.Primary.NumShots,
						self.Secondary.Cone 	or self.Primary.Cone 		or 0.05,
						self.Secondary.Ammo,
						hithere  -- Why is this going bool?
						)
	-- Remove 1 bullet from our clip
	-- Punch the player's view @@@FIX ME!!
	--self.Owner:SetAnimation( PLAYER_ATTACK1 )
	
 end
----------------------------------------------------------------------------++++++++++++++++++++++++++++++++++

/*---------------------------------------------------------
Bayonet
---------------------------------------------------------*/
function SWEP:Bayonet()

	--if self:IsRunning() then return false end -- @@@@@ Purpose???
	
	local dmg = self.BayonetDamage  or 67
	
	local tr = {}
	
	tr.start 		= self.Owner:GetShootPos()
	tr.endpos 		= self.Owner:GetShootPos() + ( self.Owner:GetAimVector() * 80 )
	tr.filter 		= self.Owner
	tr.mask 		= MASK_SHOT
	
	local trace = util.TraceLine( tr )
	
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self.Weapon:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Weapon:SequenceDuration())
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Weapon:SequenceDuration())
	
	if ( trace.Hit ) then
		bullet = {}
		bullet.Num    = 8
		bullet.Src    = self.Owner:GetShootPos()
		bullet.Dir    = self.Owner:GetAimVector()
		bullet.Spread = Vector(0.2, 0.2, 0)
		bullet.Tracer = 0
		bullet.Force  = math.sqrt(dmg)
		bullet.Damage = dmg
		self.Owner:FireBullets(bullet) 
		self.Weapon:EmitSound("physics/flesh/flesh_impact_bullet" .. math.random( 3, 5 ) .. ".wav")
	else
		// You missed...
		self.Weapon:EmitSound("weapons/ar_melee")
	end
	return true
end

--[[-----------------------------------------------------------
   Name: Recoil
   Desc: Moves playerview
-----------------------------------------------------------]]--
function SWEP:Recoil( recoil )
	-- Recoil
	-- @@@
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	-- Dont let people in vehicles or npcs experience recoil
	if self.Owner:IsNPC() then return end
	if (self:InVehicle() and self.Owner:GetAllowWeaponsInVehicle() ) then
		self:DebugTalk("Prevented Recoil for WeaponsInVehicle enabled player! This bug may be fixed by now!")
		return
	end
	
	local ironOn = self.Weapon:GetNetworkedBool( "Ironsights", false ) == false
	-- ((SinglePlayer() and SERVER) or (not SinglePlayer() and CLIENT))
	local b1 = ( (game.SinglePlayer() and SERVER) or ( !game.SinglePlayer() and CLIENT ) )
	if b1 then
		-- Punch the player's view
		local amp		= 7.5
		if (ironOn) then
			amp = amp*0.41
		end
		local eyeang = self.Owner:EyeAngles()
		
		eyeang.pitch = eyeang.pitch - (recoil*0.98) -- get random number here
		self.Owner:SetEyeAngles( eyeang )

		local calcP		= (math.Rand(-0.2,-0.1) * recoil) * amp
		local calcY		= (math.Rand(-0.1,0.1) * recoil) * amp
		local calcR 	= (0) * amp
		--self:Talk(tostring(Angle( calcP, calcY, calcR )))
		-- NTS: Modify this HEAVLY.
		--	Make angle				[ P ] 	[ Y ] 	[ R ]
		self.Owner:ViewPunch( Angle( calcP, calcY, calcR ))
		-- Needs work @@@FIXME
	end
end

function SWEP:AddHeat( var )
	if self.Heat == nil then return end
	if not var then return end
	
	self.Heat = math.Clamp(self.Heat + var, 75, 255*3)

end

function SWEP:GetHeat()
	return self.Heat -- A
end

function SWEP:TakePrimaryAmmo( num )
	local clipsize = self.Weapon:Clip1()
	if num > clipsize then
		-- Unfortunately a clip cant have a negative amount..
		num = clipsize
	end
	
	
	-- Doesn't use clips
	if ( clipsize <= 0) then 
	
		if ( self:Ammo1() <= 0 ) then return end	
		--			Dont remove till its fired @@@
		self.Owner:RemoveAmmo( num, self.Weapon:GetPrimaryAmmoType() )
		
		return 
	end
	
	self.Weapon:SetClip1( clipsize - num )	
	-- Animate
	-- self:DrawSeqClipSubtract()
	
end

function SWEP:TakeSecondaryAmmo( num )
	local clipsize = self.Weapon:Clip2()
	if num > clipsize then
		-- Unfortunately a clip cant have a negative amount..
		num = clipsize
	end
	
	-- Doesn't use clips
	if ( clipsize <= 0) then 
	
		if ( self:Ammo2() <= 0 ) then return end	
		--			Dont remove till its fired @@@
		self.Owner:RemoveAmmo( num, self.Weapon:GetSecondaryAmmoType() )
		
		return 
	end
	
	self.Weapon:SetClip2( clipsize - num )	
	-- Animate
	-- self:DrawSeqClipSubtract()
	
end

--[[-----------------------------------------------------------
   Name: SWEP:CSShootBullet			
   Desc: LEGACY Function
-----------------------------------------------------------]]--
function SWEP:CSShootBullet( dmg, recoil, numbul, cone )
	-- intercecpt oldshool cone calcs
	local c = self:CurrentCone(cone)
	self:ShootBullet( 1, dmg, recoil, numbul, c, self.Primary.Ammo, self.Primary.ShootAnim or ACT_VM_PRIMARYATTACK)
end

--[[-----------------------------------------------------------
   Name: SWEP:ShootEffects		
   Desc: semi-LEGACY Function
-----------------------------------------------------------]]--
function SWEP:ShootEffects( side, recoil, anim, snd, numshot )
	-- Purpose: Determine the Shoot effects for
	-- Primary, Secondary, or (eventually) Trinary weapons
	-- @@@ Expand me!
	--local eval = tobool(self.Weapon:GetVar("AkimboSide"))
	
	self:DebugTalk("\nShootEffects\n\tSIDE=" ..tostring(side)..", RECOIL"..tostring(recoil).."; ANIM: "..tostring(anim)..","..tostring(snd).."\n" )
	if (side == 1) then -- Determine side, include trinary, OCIW
		self:PrimaryShootEffects( recoil, anim, snd, numshot )
	elseif (side == 2) then
		self:SecondaryShootEffects( recoil, anim, snd, numshot )
	else
		ErrorNoHalt("Unknown side value: "..tostring(side).."\n")
	end
end

function SWEP:PrimaryShoot( ) -- IMPLEMENT!
	self:PrimaryShootEffects(nil, anim)
end

function SWEP:SecondaryShoot( ) -- IMPLEMENT!
	self:SecondaryShootEffects()
end

--[[-----------------------------------------------------------
   Name: SWEP:PrimaryShootEffects( )
   Desc: +attack1 has been pressed, and animations are being sent.
-----------------------------------------------------------]]--
function SWEP:PrimaryShootEffects( recoil, anim, snd, numshot )
	--ErrorNoHalt("PrimaryShootEffects: "..tostring(anim).."\n")
	if not numshot or ( Ammo == 7 ) then -- @@@@ Hardcode Buckshot check here, this is crazy
		numshot = 1
		self:DebugTalk("Correcting number of shots to 1")
	end
	--self:Talk("PRIMARY")
	self.Weapon:SetNetworkedFloat( "LastPrimaryShootTime", CurTime() ) -- @@@ USEFUL

	local isempty = self.Weapon:Clip1() == 1 
	-- @@@VARIANCE @@@
	-- Prevent semi's from using this
	-- @@@ Feature Plan
	-- Model the spring to be based on
	-- # of shots per tick to decide
	-- The variance!   
	local go = 0
	if self.Primary.Automatic then
		go = 1 
	end
	
	if not self.FireVariance then
		self.FireVariance = GetConVar("swep_FireVarience"):GetFloat()
	end
	
	-- @@@DELAY VAR HERE!!!! 
	local amount	= self.FireVariance
	-- 0.042 -- @@@@@@@
	local variance 	= amount * go
	-- Get a number thats +/- a scaler less than 0.05 usually
	local scaler = math.random(1 - variance, 1 + variance ) -- @@@ NETWORKING!!!!!
	-- Make this area more compact!
	
	if game.SinglePlayer() == true then -- That'll have to do until we get the networking right
		self.Weapon:SetNextPrimaryFire( CurTime() + (self.Primary.Delay * scaler) )
	else
		self.Weapon:SetNextPrimaryFire( CurTime() + (self.Primary.Delay * 1) )
										-- Remove 1 bullet from our clip
	end
	
	self:TakePrimaryAmmo( numshot ) -- Should NPCs get unlimited ammo?
	self:DebugTalk("Taking "..tostring(numshot).." primary ammo")
	--if ( self.Owner:IsNPC() ) then return end

	-- @@@CUSTOM RECOIL ! 
	self:Recoil(recoil)
	self.Owner:MuzzleFlash()
	
	
	if self.Chambers == true and ( not self.Primary.Automatic or self.Weapon:Clip1() <= 0 )then
		self.Primary.Chambered = false
	end

	self:DebugTalk("[~] PrimaryShootEffects snd:"..tostring(snd).." anim:"..tostring(anim).." Numshot: "..tostring(numshot))
	if (snd == nil) then 
		local pri = self.Primary.Sound
		if isempty then
			pri = self.Primary.DryFireSound or self.Primary.Sound or Sound("weapon_Pistol.Single")
		end
		snd = pri or self.Primary.Sound or Sound("weapon_Pistol.Single")
	--elseif isempty then
		--snd = self.Primary.DryFireSound or self.Primary.Sound
	end
	
	if anim ~= nil then
		if type(anim) == "boolean" then
			if isempty then
				anim = "DRYFIRE"
				--ErrorNoHalt("\n ALERT: #DryFire\n\n")   
			else
				anim = "PRIMARY"
				--ErrorNoHalt("\n ALERT: #Primary\n\n")   
			end
		end
		
		if type(anim) == "number" then
		
			if anim == 0 then
				--ErrorNoHalt("\n PICK ALERT: #NUM anim is a blank str\n\n")  
					anim = "Why God"
				else
					-- Nvm i Guess nothing its a number 
					--ErrorNoHalt("\n PICK ALERT!!!: #NUM anim is ".. tostring(anim).."\n\n")
				end
		
		end
		-- e
		--  VMact can do anything we need animation wise '     
		--ErrorNoHalt("\n\n<> <> IM SENDING TO VMact: " .. tostring(anim) .. " PBR: " .. tostring(self.Primary.PBR) .. " -> SND: "..tostring(snd))
		self:VMact( anim, self.Primary.PBR, snd )

	end
	-- Finally
	if isempty and self.Primary.DryMagEject == true then
		self:DropMagPrimary()
	end
end

function SWEP:SecondaryShootEffects( recoil, anim, snd, numshot )
	if not numshot then 
		numshot = 1 
	end
	--self:Talk("SECONDARY")
	self.Weapon:SetNetworkedFloat( "LastSecondaryShootTime", CurTime() )
	
	local isempty = self.Weapon:Clip1() == 1 
	
	-- Prevent pistols from using this
	local go = 0
	if self.Secondary.Automatic then go = 1 end
	
	-- @@@DELAY VAR HERE!!!!
	local amount	= 0.11--0.357
	local variance 	= amount * go
	
	
	self.Weapon:SetNextSecondaryFire( CurTime() + (self.Secondary.Delay * math.random(1-variance, 1+variance ) ))
									-- Remove 1 bullet from our clip 
	--self:SecondaryShootEffects(nil, forcedAnim)
	--self.Owner:MuzzleFlash()
	
	if ( self.Owner:IsNPC() ) then return end -- NPC Check

	
	--self:Recoil(dmg) 
	
	-- @@@CUSTOM RECOIL ! 
	self:Recoil(recoil)
	self.Owner:MuzzleFlash()
	self:TakeSecondaryAmmo( numshot ) 
	-- If you want NPCs to have to use ammo,
	-- Place this above the NPC check
	if (self.Chambers == true and not self.Secondary.Automatic)then
		self.Secondary.Chambered = false;
	end
	
	self:DebugTalk("[~] SecondaryShootEffects snd:"..tostring(snd).." anim:"..tostring(anim).." Numshot: "..tostring(numshot))
	if (snd == nil) then 
		local pri = self.Secondary.Sound
		if isempty then
			pri = self.Secondary.DryFireSound
		end
		snd = pri or self.Secondary.Sound or Sound("weapon_Pistol.Single")
	end
	
	if anim ~= nil then
		if type(anim) == "boolean" then
			anim = "SECONDARY"
		end
		if type(anim) == "number" and anim == 0 then
			anim = ""
		end
		-- VMact can do anything we need
		self:VMact( anim, self.Secondary.PBR, snd )
	end
	
	if isempty and self.Secondary.DryMagEject == true then
		self:DropMagSecondary()
	end
end

--[[-----------------------------------------------------------
   Name: SWEP:ShootBullets
   Desc: An attack has been sent
   @@@Ensure no owner needed!!
-----------------------------------------------------------]]--
function SWEP:ShootBullet( side, dmg, recoil, numbul, cone, ammo, forcedAnim, forceAmmoUsage )
	--if (self.Weapon:Clip1() <= 0 and self.Primary.ClipSize > 0) then self:Reload() return false end
	-- Add side consideration for effects

	if (side == nil) then
		side = 1
	end
	numbul 	= numbul 	or 1 -- Doesnt Have to be sent
	cone 	= self:CurrentCone(cone) or cone or 0.06 -- Doesnt haaaave to be sent thru
	
	if forcedAnim == nil then
		--ErrorNoHalt("\t<ODD HAPPENING> "..tostring(forcedAnim).."\n")
		-- I cant remember the relevance, but very important?
		forcedAnim = true
		
	end
	-- self.Weapon:setVar("AkimboSide") == false
	local ammoL = string.lower(ammo or "pistol")
	local tb1, tb2, tb3
	tb1 = ( ammoL ~= "pistol" or dmg > 15 )
	tb2 = ammoL ~= "xbowbolt"
	tb3 = ammoL ~= "hornet"
	
	
	local ammoB = ( tb1 and tb2 and tb3 ) -- Discriminate against low power pistols and arrows
	self:DebugTalk("\nB1: " .. tostring(tb1) .. " \nB2: " .. tostring(tb2) .. " \nB3: " .. tostring(tb3) .. " \nFINAL: " .. tostring(ammoB))
	local tracef = self.Primary.TracerRate or 2
	local tracei = self.Primary.Tracer -- @@ Allow a type check for int vs string; Custom types
	local allowPen = self.Primary.CanPenetrate or ammoB or true
	
	if side == 2 then
		tracei = self.Secondary.Tracer
		tracef = self.Secondary.TracerRate or 2
		allowPen = self.Secondary.CanPenetrate or ammoB or true
	end
	
	local trace = Tracers[ tracei ]
	if self:InDebug() then
		local debugtrace = GetConVarNumber("swep_tracer") or 1
		self:DebugTalk("Using "..tostring(debugtrace).." because of debug status")
		trace = Tracers[ debugtrace ]
	end
	
	local et = self.Owner:GetEyeTrace() -- @@@Use different trace style!!!
	local ent = et.Entity
	local Distance = et.HitPos:Distance( self.Owner:GetShootPos() )
	
	-- @@@@@ POINT BLANK
	-- @@@@@ REDUNDANT CODE
	-- self.Range or 256
	if ent:IsValid() and (ent:IsNPC() ) and Distance < ( 38 ) and self:Visible(ent) and not self.Owner:KeyDown(IN_USE) then
		self:AimAssist(ent) -- Give a clean shot
		self:DebugTalk("Using aim assist for targeting")
	end

	-- local DEBUG = true
	-- FOR self.DEBUGING AND FUN LOL
	if tobool(tonumber(self.DEBUG)) then
		CreateClientConVar("swep_cone", self.Primary.Cone, false, true) -- This can prolly get moved
		cone = GetConVarNumber("swep_cone")
	end

	local Ammo = AmmoTypes[ ammoL ] or AmmoTypes[ tostring(ammo) ] or 3  -- AMMO doesn't have to be sent
	local bullet = {}
	local f = 0
	-- Aimvector:  -1 -> 1  (-90 to 90)
	--
	local AngTotal = 60
	local correction = Vector(0,0, math.max(math.min( math.abs( self.Owner:GetViewPunchAngles().pitch ) / AngTotal , 1 ), 0) )
	local 	dir1 = self.Owner:GetAimVector()
			dir1:Add( correction )
	local src = self.Owner:GetShootPos()			-- Source
	
	self:DebugTalk("\nSHOOT BULLET\n\tdir: "..tostring(dir1).." , src: "..tostring(src).." , Xcone: "..tostring(cone*0.5))
	
	bullet.Num 			= numbul
	bullet.Src 			= src
	bullet.Dir 			= dir1		-- Dir of bullet
	bullet.Spread 		= Vector( cone*0.5, cone*1, 0 )	-- Make it more about the up and down rather than side to side
	-- Aim Cone
	bullet.Tracer		= tracef		-- Show a tracer on every 1/x bullets   GetConVarNumber("swep_tracer")
	bullet.TracerName	= trace or "Tracer"
	-- LETS USE SOME CALCULATIONS
	bullet.Force		= (dmg/3.336) -- Force applied to target
	bullet.Damage		= dmg
	bullet.AmmoType		= Ammo
	
	bullet.IgnoreEntity	= self.Owner:GetVehicle() or nil
	
	--PenetrateBullet	
	if allowPen == true then
		self:DebugTalk("\nDoCallback 1 : " .. tostring(self.Primary.CanPenetrate) .. " , AmmoB: " .. tostring(ammoB) ) 
		bullet.Callback		= DoCallback -- Yee PEN
	else
		self:DebugTalk("\nDoCallback 2 : ")
		bullet.Callback		= DoCallback2 -- Noo PEN
	end
	--bullet.Callback		= OnHeadshot -- Yee
	
	self.Owner:FireBullets( bullet )-- , suppressHostEvents=false)
	
	-- @@@BELOW HERE NEEDS TO BE INDEPENDANT FUNCTION(S)
	
	-- Arm stability... so yes akimbo
	self.Weapon:SetNetworkedFloat( "LastShootTime", CurTime() ) --Primary, Secondary, Trinary
	-- @@@ Weapon:LastShootTime() instead? integrate?

	-- Check the side of fire  
	local b1 = ( Ammo == 7 ) -- Buckshot
	local b2 = (nil ~= forceAmmoUsage and isint(forceAmmoUsage)) -- Add checks for 1s and 0s
	local b3 = b1 or b2
	
	self:DebugTalk("> Shotgun Numbul Args - IsBUCK:"..tostring(b1).." or forceAmmoUsage:"..tostring(b2).." ==> "..tostring(b3).."\n")
	if numbul > 1 and b3 then -- Add acception to shotguns
		numbul = forceAmmoUsage or 1
	end

	
	self:ShootEffects(side, recoil, forcedAnim, nil, numbul)
	--[[
	local fx 		= EffectData()
	fx:SetEntity(self.Weapon)
	fx:SetOrigin(self.Owner:GetShootPos())
	fx:SetNormal(self.Owner:GetAimVector())
	fx:SetAttachment(self.MuzzleAttachment)
	util.Effect(self.MuzzleEffect,fx)		-- Additional muzzle effects
	--]]
	
	-- @@@ LEGACY (Use CallBack)
	self:BreakDoor() -- If applicable, it is a safe call
	if (side == 1 and self.Primary.Ignite == true) then
	--	self:IgniteTarget( math.Rand(11,120), self.Primary.Damage*1.5 )
	elseif (side == 2 and self.Secondary.Ignite == true) then
	--	self:IgniteTarget( math.Rand(11,120), self.Secondary.Damage*1.5 )
	end

end

function DoCallback( ply, tr, dmginfo )
	-- A hub for bullet callback functions
	--ErrorNoHalt("Im at callback")
	OnHeadshot(ply, tr, true)
	
	
	
	
	--DoCallback2()

	-- @@@IGNITE TARGET CODE HERE
	local ent
	if ply:IsWeapon() then
		ent = ply
	else
		ent = ply:GetActiveWeapon()
	end
	
	if (ent).Primary.Ignite == true then
		IgniteTarget( ply,tr.Entity, math.Rand(11,120), dmginfo:GetDamage()*1.5)
	end
	
	if GetConVar("swep_penetration"):GetBool() then
		local entclass = tr.Entity:GetClass()
		if ( entclass ~= "item_ballistic_vest" and entclass ~= "item_kevlar_vest" ) then -- @@ Check overhead, see about non-callback logic
			PenetrateBullet(ply, tr, dmginfo)
		end
	end

end

function DoCallback2( ply, tr, dmginfo )
	-- A hub for bullet callback functions
	--ErrorNoHalt("Im at callback")
	OnHeadshot(ply, tr, true)
	
	-- No penetration cb
	
	-- @@@IGNITE TARGET CODE HERE
	local ent
	if ply:IsWeapon() then
		ent = ply
	else
		ent = ply:GetActiveWeapon()
	end
	
	if (ent).Primary.Ignite == true then
		IgniteTarget( ply,tr.Entity, math.Rand(11,120), dmginfo:GetDamage()*1.5)
	end
	

end

function IgniteTarget( atkr, ent, dur , radius ) -- Not originally a feature of Fiery base, but how couldnt I?

	local f1 = ent == nil or not ent:IsValid()
	if f1 or not atkr:IsValid() then return end
	local f2 = (ent:GetPos()):Distance(atkr:GetShootPos()) > 550 
	local f3 =  not ent:IsNPC() and not ent:IsPlayer()
	
	--self:DebugTalk(tostring(f1)..", "..tostring(f2)..", "..tostring(f3).."\n")
	if f2 or f3 then return false end
	if not ent:Alive() then return false end
	
	if not dur then
		dur = 10
	end
	
	if not radius then
		radius = 15
	end

	ent:Ignite(dur, radius)
	
	return true
end

function SWEP:ShootPhysicalBullet( dmg, recoil, numbul, cone, ammo, forcedAnim, forceAmmoUsage )
	--local aim = self.Owner:GetAimVector() -- look into it
	--local aim = self.Owner:GetShootPos() 
	
	if (side == nil) then
		side = 1
	end
	numbul 	= numbul 	or 1 -- Doesnt Have to be sent
	cone 	= self:CurrentCone(cone) or cone or 0.01 -- Doesnt have to be sent
	if forcedAnim == nil then
		-- I cant remember the relevance, but very important
		
		forcedAnim = true
	end
	
	local Ammo = AmmoTypes[ammo] or 3  -- AMMO doesn't have to be sent
	local aim = self.Owner:GetAimVector()
	local side2 = aim:Cross(Vector(0,0,1))
	local up = side2:Cross(aim)
	local pos = self.Owner:GetShootPos() +  aim * 25 + side2 * 5 + up * -6	--offsets so it spawns from the muzzle>
	local power = self.Primary.Power or 36000
	
	local velocity_multp = power * (GetConVarNumber("phys_timescale") or 1) -- FIX ME! @@@PHYS
	local projectile = ents.Create("Bullet_round")
	
	if !projectile:IsValid() then return false end
	
	projectile:SetAngles(aim:Angle())
	projectile:SetPos(pos)
	projectile:SetOwner(self.Owner)
	projectile:SetOrgVec( self.Owner:GetPos() )
	projectile:SetOrgVel( self.Owner:GetVelocity() )
	projectile:Spawn()
	projectile:Activate()
	projectile:SetVelocity( projectile:GetForward()* velocity_multp )
	
	--self:Recoil() -- Translate funtion
	
	self.Weapon:SetNetworkedFloat( "LastShootTime", CurTime() ) --Primary, Secondary, Trinary

	-- Check the side of fire
	if numbul > 1 and ( Ammo == 7 or (nil ~= forceAmmoUsage and isint(forceAmmoUsage)) ) then
		numbul = forceAmmoUsage or 1
	end
	self:ShootEffects(side, recoil, forcedAnim, nil, numbul)
end

function SWEP:ShootFlechette( dmg, recoil, numbul, cone, ammo, forcedAnim, forceAmmoUsage )
	--local aim = self.Owner:GetAimVector() -- look into it
	--local aim = self.Owner:GetShootPos() 
	
	if (side == nil) then
		side = 1
	end
	numbul 	= numbul 	or 1 -- Doesnt Have to be sent
	cone 	= self:CurrentCone(cone) or cone or 0.01 -- Doesnt have to be sent
	if forcedAnim == nil then
		-- I cant remember the relivance, but very important
		
		forcedAnim = true
	end
	
	local Ammo = AmmoTypes[ammo] or 3  -- AMMO doesn't have to be sent
	local aim = self.Owner:GetAimVector()
	local side2 = aim:Cross(Vector(0,0,1))
	local up = side2:Cross(aim)
	local pos = self.Owner:GetShootPos() +  aim * 25 + side2 * 5 + up * -6	--offsets so it spawns from the muzzle>
	local power = self.Primary.Power or 36000
	
	local velocity_multp = power * (GetConVarNumber("phys_timescale") or 1) -- FIX ME! @@@PHYS
	local projectile = ents.Create( "hunter_flechette" )
	
	if !projectile:IsValid() then return false end
	
	projectile:SetAngles(aim:Angle())
	projectile:SetPos(pos)

	--projectile:SetOrgVec( self.Owner:GetPos() )
	--projectile:SetOrgVel( self.Owner:GetVelocity() )
	
	projectile:SetOwner(self.Owner)
	projectile:Spawn()
	projectile:Activate()
	projectile:SetVelocity( self.Owner:GetAimVector() * velocity_multp )
	
	--self:Recoil() -- Translate funtion
	
	self.Weapon:SetNetworkedFloat( "LastShootTime", CurTime() ) --Primary, Secondary, Trinary

	-- Check the side of fire
	if numbul > 1 and ( Ammo == 7 or (nil ~= forceAmmoUsage and isint(forceAmmoUsage)) ) then
		numbul = forceAmmoUsage or 1
	end
	self:ShootEffects(side, recoil, forcedAnim, nil, numbul)
end

------------ THINK -----======================================================+++++++++++++++++++++++++++++++++
local lastval = nil;
--[[-----------------------------------------------------------
	@@@THINK
   Think about, idk, stuff I guess..
   (CLIENT-SIDE EXCLUSIVE)
-----------------------------------------------------------]]--
function SWEP:Think() -- Calls StandardThink (Making it easier for edits)

	--self.ViewModelFOV		= GetConVarNumber("cl_swep_FOV")
	--self:SetFOV( GetConVarNumber("cl_swep_FOV"), 0.33 )
	--
	--self:Talk("TICK")
	--[[
	if ( CLIENT ) then
		self:DrawHUD()
		-- Required for real time HUD
	end
	--]]
	
	self:CustomPreThink()
	self:StandardThink()
	self:CustomPostThink()
	-- local wl = self.Weapon:WaterLevel()

	--[[
	if (CLIENT) then
	local wep = self.Weapon:GetViewModel()
		if (self.Owner and wep:GetActivity() == 0) then
			self:Idle()
		end
	end
	--self:BoneThink()
	--self:NextThink(CurTime());  
	--return true 
	--]]

end

--[[-----------------------------------------------------------
	@@@PRE THINK CUSTOM
   Thoughts before Standard Think()
-----------------------------------------------------------]]--
function SWEP:CustomPreThink()
	-- Left blank; for moders
end

--[[-----------------------------------------------------------
	@@@POST THINK CUSTOM
   Thoughts before Standard Think()
-----------------------------------------------------------]]--
function SWEP:CustomPostThink()
	-- Left blank; for moders
end

--[[-----------------------------------------------------------
	@@@THINK STANDARD
   Think about, idk, STANDARD stuff I guess..
   (Exists so custom thinks dont wreck code)
-----------------------------------------------------------]]--
function SWEP:StandardThink()
	
	self:ShotgunThink()
	self:IdleThink()
	
	--self:HeatThink()

	--self:VehicleThink()
	-- Perhaps block some thinks based on above
	self:RecoilThink()
	self:ArmsThink()
	--self:AimAssistThink() 
	-- ^ This is now controlled under SecondaryAttack
	-- (And requires secondary attack be automatic)
end

--[[-----------------------------------------------------------
   Think Moduals
-----------------------------------------------------------]]--
function SWEP:VehicleThink()
	-- Do some checks because were in a vehicle
	-- and because we cant leave players with
	-- AllowWeaponsInVehicle true to use other
	-- sweps that may not work right with this on
	if not self.VehicleApproved then return end
	if not self:InVehicle() then return end
	
	
	
end

function SWEP:BoneThink() -- smh
	if not self.SupressBones then return end
	if not self.UseHands then print("Suppressing bones YET, not using hands?\n"); return end
	
	--Msg("." .. tostring(self.UseHands))
	
	--self.UseHands = true
	self:UpdateBones()
	
end

function SWEP:IdleThink()
	if not self.DoesIdle or SERVER then return end -- or self.DoesIdle == false
	
	
--ErrorNoHalt("[i] self.DoesIdle == "..tostring(self.DoesIdle).."\n")
	-- self:DebugTalk("\tN1 NextIdle: "..tostring(NextIdle).. " VS "..tostring(CurTime()).."\n")
	
	
	if (self.Weapon:GetNetworkedBool( "reloading", true)) then
		NextIdle = CurTime() + self:GetSeqDur() --
		--self:DebugTalk("\nTHINK-N2 Post-Reload Idle\n\tNextIdle: "..tostring(NextIdle).. " VS "..tostring(CurTime()).."\n")
		return
	end
	
	if (NextIdle == CurTime()) then
		self:DebugTalk("\nTHINK-N3 IDLE-TIME \n\tNextIdle: "..tostring(NextIdle).. " VS "..tostring(CurTime()).."\n")
		self:Idle()
	end
	-- ###IdleTHINK 
--	chat.AddText(tostring(self.Weapon:SequenceDuration()))
end

function SWEP:RecoilThink()
	-- See credits and discription in physics.lua
	if false or not self.Owner then return end --	Whos feeling the recoil even?
	
	if self.Owner:KeyPressed( IN_ATTACK )  and not self.isFiring then
        --print("Start Burst")
        self.isFiring = true
        self.RecoilDelta = CurTime()
    elseif self.Owner:KeyReleased( IN_ATTACK ) and self.isFiring then
        self.isFiring = false
        --print("End Burst")
    end
end

SWEP.Shotgun_Think_Progress = 0 -- No touch
SWEP.Shotgun_Think_Progress_Thd = 2 -- Non-zero
-- Setting this will tweak how many shells need to me added to send the reload anim

function SWEP:ShotgunThink()
	if (CLIENT) then return end -- TEST
	
	if not self:IsShotgun() or not self.Weapon:GetNWBool( "reloading", false) then 
		self.Shotgun_Think_Progress = 0
		return
	end
	
	local stop = self.Weapon:Clip1() >= self.Primary.ClipSize or self.Owner:GetAmmoCount( self.Primary.Ammo ) <= 0 or self.Owner:KeyDown(IN_USE) or self.Owner:KeyReleased(IN_RELOAD)
	
	if stop then  -- or (self.Owner:KeyReleased(IN_RELOAD) and not self.Owner:KeyPressed(IN_RELOAD))
		--self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
		self.Shotgun_Think_Progress = 0
		self:CancelShotgunReload()
		return
	end
	-- 	self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
	
	if self.Weapon:Clip1() > self.Primary.ClipSize then
		-- Correct flawed logic
		self.Weapon:SetClip1(self.Primary.ClipSize)
		self.Weapon:SetVar("PrimaryMagOut", false)
	end

	if self.Weapon:GetNWBool( "reloading", false) == true then
	
		if self.Weapon:GetNetworkedInt( "reloadtimer") < CurTime() then
			--if self.unavailable then return end

			self.Weapon:SetNetworkedInt( "reloadtimer", CurTime() + 0.45 ) -- Prolly should find a real value
			
			self.Weapon:SendWeaponAnim( self.ShotgunReloadLoad or ACT_VM_RELOAD )
			
			if (CLIENT) then
				-- Dont play reload sounds to everyone
				self.Weapon:EmitSound(self.ReloadSound or "")
			end
			local t = self:GetSeqDur()
			--self:EmitSound(Sound("Weapon_Shotgun.Reload"))
			self.Weapon:SetNextPrimaryFire(CurTime() + (t*0.5))
			self.Weapon:SetNextSecondaryFire(CurTime() + (t*0.5))
			
			self.Weapon:SetVar("reloadtimer", CurTime() + t)	
			
			self:SafeTimer( t*0.85, function()
				-- @@@ CHAMBERING PLUG HERE!   
				if self.Weapon:Clip1() >= self.Primary.ClipSize then return end
				if not self.Weapon:GetNWBool( "reloading", false) then 
					self:DebugTalk("I wanted to reload more but reloading is false...\n")
					return 
				end
				self.Owner:RemoveAmmo( 1, self.Primary.Ammo, false )
				self.Weapon:SetClip1(  self.Weapon:Clip1() + 1 )
				
				self.Shotgun_Think_Progress = self.Shotgun_Think_Progress + 1
				if self.Shotgun_Think_Progress == math.max( self.Shotgun_Think_Progress_Thd or 1 , 1 ) then -- Raising this number will suppress animations
					-- Do this, ONE time. 
					--self.Owner:DoReloadEvent()
					self:SetHoldType( self.ReloadHoldType or self.HoldType )
					self.Owner:SetAnimation( PLAYER_RELOAD )
					self:SetHoldType( self.HoldType2 ) -- Ima guess this wont work...
					
					
					self:DebugTalk("Sending 3rd Person Reload Anim @ C:" .. self.Weapon:Clip1() .. " <- P:" .. self.Shotgun_Think_Progress)
				else
					self:DebugTalk("3rd Person Denied @ C:" .. self.Weapon:Clip1() .. " <- P:" .. self.Shotgun_Think_Progress)
				end
				self.Weapon:SetVar("PrimaryMagOut", false)
				self:DebugTalk("<> Completed a shotgun thought #".. self.Weapon:Clip1() .." <> \n")
			end)
		end
	end
end

function SWEP:ArmsThink()
	-- Considers arm position
	local b0 = (CurTime() ~= self.Weapon:LastShootTime())
	
	local b1 = self:GetIronsights()
	local b2 = self:AreArmsDown()

	self.InSpeed2 = self.InSpeed -- We need to track changes
	--if b1 == true and b2 == false then return end
	--local va		= tobool(GetConVar("swep_VehicleUsage"):GetBool()) or false
	
	--if not self.ArmAngle and not self.ArmOffset then return end
	if (b2 and b0) then -- Put your arms up to shoot real quick
		self:GetArmPosition( Vector(0,0,0), Angle(0,0,0) )
		--self:Talk("Holding Normal")
		--self:GetViewModelPosition( Vector(0,0,0), Angle(0,0,0) )
	elseif self.InSpeed == true then
		self.InSpeed = false
		--self:Talk(" Flipping speed")
		 -- See GetArmPos for more on InSpeed var 
	end
	
	-- When we come off of a wall or approach one 
	if (SERVER) and self.InSpeed2 != self.InSpeed then
		local mp = self.Weapon:GetVar("PrimaryMagOut")		--, false)
		local ms = self.Weapon:GetVar("SecondaryMagOut")	--, false)
		local b3 = tobool( mp ) or tobool( ms )
	
		if self.InSpeed == true then
			self:SetHoldType( self.RunHoldType or "normal" )
		else
			if b1 then
				self:SetHoldType( self.HoldType )
			else
				if b3 == true then
					self:SetHoldType( self.RunHoldType or "normal" )
					--ErrorNoHalt("B3 True: " .. tostring(mp) .. " & " .. tostring(ms))
				else
					self:SetHoldType( self.HoldType2 )
					--ErrorNoHalt("B3 False: " .. tostring(mp) .. " & " .. tostring(ms))
				end
			end
		end
	end
end

-- The Heat system is on a fernheight scale, tuned only for it!! 
function SWEP:HeatThink()
	if not (self.Heat) then return end
	-- Temperature in Ferenheight, just because it works out better
	local bef = self.Heat
	local cur_base = self:GetHeat_Min()
	
	--self.Owner:WaterLevel() > 2
	if (self.Heat <= 0) then
		self.Heat = cur_base
	end	
	local go = 0
	if (cur_base > self.Heat) then
		go = 1
	end

			-- Flipping
	local under_base =	1-( 2* go ) -- Its colder than what it should be
	
	self.Heat = math.Clamp(self.Heat - (under_base*0.01), cur_base, 255*3)
	
	
	-- DO AFFECTS
	
	
	--self:Talk("Before: " .. tostring(bef) .. " |After: " .. tostring(self.Heat))
end

function SWEP:GetHeat_Min() -- Yes, its calculated
	local x = self.Base_Heat
	local o_wtrlvl = self.Owner:WaterLevel()
		if o_wtrlvl > 2 then -- Owner under water to some extent
			local w_wtrlvl = self.Weapon:WaterLevel()
			x = x - ( 7 * w_wtrlvl )
			
			
			if self.Weapon:IsOnFire() and w_wtrlvl >= 3 then
				self.Weapon:Extinguish()
			end
			if self.Owner:IsOnFire() and o_wtrlvl >= 3 then
				self.Owner:Extinguish()
				-- I know I know, this belongs in a Take Damage function in a gamemode
			end
			-- Lower the min heat based on how much of the WEAPON is under water
		elseif self.Owner:IsOnFire() or self.Weapon:IsOnFire() then 
			-- If your on fire (and not in water OBVIOUSLY) 
			-- Set to highest auto-ignition temperature
			local for_wep 			= tonumber(self.Weapon:IsOnFire()) * ( 475- math.min(x, 474) )
			local owner_on_wep		= tonumber(self.Owner:IsOnFire())  * 7
			x = x + for_wep + owner_on_wep
		end
		
	return x
end

------------ DRAWING  -----===================================================+++++++++++++++++++++++++++++++++

--
--[[-----------------------------------------------------------
   Name: SWEP:DrawWorldModel() 
   Desc: Draws the world model (not the viewmodel).
-----------------------------------------------------------]]-- 
function SWEP:DrawWorldModel()
	--local b1 = self.WorldModelHoldFix == true
	
	if self.WorldModelHoldFix == true then
		local hand, offset, rotate -- Implement rotation?
		
		if not IsValid(self.Owner) then
			-- Dont need to fix anything
			self:DrawModel()
			return
		end
		
		
		if self:InDebug() then
			self.WMr = GetConVar("swep_WMr", "0", true, false):GetFloat()
			self.WMf = GetConVar("swep_WMf", "0", true, false):GetFloat()
			self.WMu = GetConVar("swep_WMu", "0", true, false):GetFloat()
			
			self.WMra = GetConVar("swep_WMra", "0", true, false):GetFloat()
			self.WMfa = GetConVar("swep_WMfa", "0", true, false):GetFloat()
			self.WMua = GetConVar("swep_WMua", "0", true, false):GetFloat()
			
		end
		
		hand = self.Owner:GetAttachment(self.Owner:LookupAttachment("anim_attachment_rh"))
		local x = (self.WMr or 2)
		local y = (self.WMf or -4)
		local z = (self.WMu or -0.25)

		local r = (self.WMra or 0)
		local f = (self.WMfa or 0)
		local u = (self.WMua or 0)

		offset = (hand.Ang:Right() * x) + (hand.Ang:Forward() * y) + (hand.Ang:Up() * z) -- Angular math for offset?
		
		hand.Ang:RotateAroundAxis(hand.Ang:Right(), r)	-- @@ Double check this logic
		hand.Ang:RotateAroundAxis(hand.Ang:Forward(), f)
		hand.Ang:RotateAroundAxis(hand.Ang:Up(), u)
		
		self:SetRenderOrigin(hand.Pos + offset)
		self:SetRenderAngles(hand.Ang) -- Rotate?
	end
	
	self:DrawModel()
end

--]]

--[[
function SWEP:GetTracerOrigin() -- @@@TRACER START
	local ans -- CLIENT SIDE
	--	local vm = ply:GetViewModel()
	-- local obj = vm:LookupAttachment( "muzzle" )
	-- local muzzlepos = vm:GetAttachment( obj )
	local gun = self.Weapon
	local aID --gun:LookupAttachment("ValveBiped.flash")
	if ~ then
		aID = "1"
	else
		aID = "muzzle"
	end
	local pos = gun:GetAttachment(aID) -- Should be "1" for CSS models or "muzzle" for hl2 models
	ans = pos.Pos
	ErrorNoHalt("TracerOrigin: "..tostring(ans).."\n")
	return ans
end
--]]

function SWEP:CustomAmmoDisplay() -- @@@ Polish
	self.AmmoDisplay = self.AmmoDisplay or {} 
	
	self.AmmoDisplay.Draw = true --draw the display?
	
	if ( self.Primary.ClipSize > 0 ) then
		self.AmmoDisplay.PrimaryClip = self:Clip1() --amount in clip
		--if not(self.Akimbo) then
			self.AmmoDisplay.PrimaryAmmo = self:Ammo1() --amount in reserve
		--else
		--	self.AmmoDisplay.PrimaryAmmo = self:Clip2() --amount in reserve
		--end
	end
	
	if ( self.Secondary.ClipSize > 0 ) then
		self.AmmoDisplay.SecondaryClip = self:Clip2()
		if (self.Akimbo) and 
		not(self.Weapon:GetPrimaryAmmoType() == self.Weapon:GetSecondaryAmmoType()) then
			self.AmmoDisplay.SecondaryAmmo = self:Ammo2()
		end
	end
 
	return self.AmmoDisplay --return the table
end

function SWEP:DrawStockHUD() -- @@@Relocate and integrate?
	
	-- No crosshair when ironsights is on
	if ( self.Weapon:GetNetworkedBool( "Ironsights" ) == true ) then return end
	
	local x = ScrW() / 2.0 
	local y = ScrH() / 2.0
	local scale = 10 * self.Primary.Cone
	
	-- Scale the size of the crosshair according to how long ago we fired our weapon
	local LastShootTime = self.Weapon:GetNetworkedFloat( "LastShootTime", 0 )
	scale = scale * (2 - math.Clamp( (CurTime() - LastShootTime) * 5, 0.0, 1.0 ))
	
	surface.SetDrawColor( 0, 255, 0, 255 )
	
	-- Draw an awesome crosshair
	local gap = 40 * scale
	local length = gap + 20 * scale
	surface.DrawLine( x - length, y, x - gap, y )
	surface.DrawLine( x + length, y, x + gap, y )
	surface.DrawLine( x, y - length, x, y - gap )
	surface.DrawLine( x, y + length, x, y + gap )
	
	--ErrorNoHalt("\n DrawHud")

end
--[[ 
--[[-----------------------------------------------------------
	Checks the objects before any action is taken
	This is to make sure that the entities haven't been removed
-----------------------------------------------------------]]--
function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha ) -- needs work @WORK
	-- Needs work! -- SEE NEW FUNCTION!!!
	local useFont = self.SelectIconFont or "CSSelectIcons2"
	local useFont2 = self.IconFont or "CSKillIcons2"
	local useLetter = self.SelectIconLetter or self.IconLetter or "f"
	
	--MsgAll("DRAWWEPSELECT: FONT: "..tostring(useFont).." LETTER: "..tostring(useLetter).."\n")
	draw.SimpleText( useLetter, useFont, x + wide/2, y + tall*0.2, Color( 255, 210, 0, 255 ), TEXT_ALIGN_CENTER )
	
	-- try to fool them into thinking they're playing a Tony Hawks game
	draw.SimpleText( useLetter, useFont, x + wide/2 + math.Rand(-4, 4), y + tall*0.2+ math.Rand(-14, 14), Color( 255, 210, 0, math.Rand(10, 120) ), TEXT_ALIGN_CENTER )
	draw.SimpleText( useLetter, useFont, x + wide/2 + math.Rand(-4, 4), y + tall*0.2+ math.Rand(-9, 9), Color( 255, 210, 0, math.Rand(10, 120) ), TEXT_ALIGN_CENTER )
	
end
--]]--

------------ IRON SIGHTS  -----===============================================+++++++++++++++++++++++++++++++++

--[[-----------------------------------------------------------
	SetIronsights
-----------------------------------------------------------]]--

SWEP.RunSway = 1.2
SWEP.RunBob = 1.2
--[[-----------------------------------------------------------
   Name: GetViewModelPosition
   Desc: Allows you to re-position the view model
   Any intended changes to the position MUST come
   through this WEP HOOK to take affect!
-----------------------------------------------------------]]--
function SWEP:GetViewModelPosition( pos, ang )
	
	if ( not self.IronSightsPos and not self.Akimbo ) then 
		--self:DebugTalk("Leaving GetViewModelPosition @ START... "..tostring(pos).." & "..tostring(ang).."\n")
		--self:DebugTalk("Current values: "..tostring(self.IronSightsPos).." & "..tostring(self.IronSightsAng).."\n\n\n")
		local np, na = self:GetIronData(false) -- Oh well here you go...
		-- @@@ IRON FROM FILE
		--return pos, ang 
		return np, na 
	else
		--self:DebugTalk("POS & ANG IN: "..tostring(pos).." & "..tostring(ang).."\n\n")
	end
	
	if self:AreArmsDown() then
		-- Need to work with this more
		-- Should be an additive to the pos and ang
		-- To decrease sharp changes!7
		return self:GetArmPosition(pos, ang) -- I need this to make ARMS sure it works
	end

	local bIron 	= self.Weapon:GetNetworkedBool( "Ironsights" )
	local Right 	= ang:Right()
	local Up 		= ang:Up()
	local Forward 	= ang:Forward()
	
	if ( bIron != self.bLastIron ) then
	
		self.bLastIron = bIron 
		self.fIronTime = CurTime()
		
		if ( bIron ) then 
			self.SwayScale 	= 0.3
			self.BobScale 	= 0.1
		elseif self.Owner:KeyDown( IN_SPEED ) and not self:IsOwnerMoving() then
			self.SwayScale 	= 2.0
			self.BobScale 	= 2.0 -- Consider using SWEP var
		else
			self.SwayScale 	= 1.0
			self.BobScale 	= 1.0
		end
	
	end
	
	local fIronTime = self.fIronTime or 0

	if not bIron and (fIronTime < CurTime() - IRONSIGHT_TIME) then 
		--self:DebugTalk("Leaving GetViewModelPosition @ Change Check...\n\n")
		return pos, ang 
	end
	
	local Mul = 1.0
	
	if ( fIronTime > CurTime() - IRONSIGHT_TIME ) then
			-- Possible idle spot
		Mul = math.Clamp( (CurTime() - fIronTime) / IRONSIGHT_TIME, 0, 1 )
		
		if (!bIron) then
			Mul = 1 - Mul
		end
	end
	
	local Offset	= self.IronSightsPos or Vector(0,0,0)
	
	if ( self.IronSightsAng ) then
		ang = ang * 1
		ang:RotateAroundAxis( ang:Right(), 		self.IronSightsAng.x * Mul )
		ang:RotateAroundAxis( ang:Up(), 		self.IronSightsAng.y * Mul )
		ang:RotateAroundAxis( ang:Forward(), 	self.IronSightsAng.z * Mul )
	end
	
	pos = pos + Offset.x * Right 	* Mul
	pos = pos + Offset.y * Forward 	* Mul
	pos = pos + Offset.z * Up 		* Mul

	--self:DebugTalk("~Leaving GetViewModelPosition @ END...\n"..tostring(pos).." & "..tostring(ang).."\n\n")
	return pos, ang
	
end

function SWEP:GetArmPosition( pos, ang )
--self:Talk("PRE: "..tostring(pos).." \n& "..tostring(ang))
	local DashDelta = 1 -- self:GetIronsights()
	--local b1 	= self:AreArmsDown()
	--local b1 	= self.Owner:KeyDown( IN_SPEED )
	local b1 	= true -- Tester
--self:Talk("@ArmPos B1: "..tostring(b1).." & "..tostring(self.Weapon:GetNetworkedBool( "Ironsights" )))
	if b1 == true and self.ArmAngle and self.ArmOffset then
		
		if not self.InSpeed then
			self.InSpeed = true
			self.SwayScale 	= self.RunSway
			self.BobScale 	= self.RunBob
			self:Idle() -- Auto Idle while running
		end
		
		if (!self.DashStartTime) then
			self.DashStartTime = CurTime()
		end
		
		DashDelta = math.Clamp( ((CurTime() - self.DashStartTime) / 0.1) ^ 1.2, 0, 1 ) -- @@@OPTIMIZE: *10 rather than /0.1
		
	else
	
		if self.InSpeed then
			self.InSpeed = false
			self.SwayScale 	= 1.0
			self.BobScale 	= 1.0
		end

		if ( self.DashStartTime ) then
			self.DashEndTime = CurTime()
		end
	
		if ( self.DashEndTime ) then
		
			DashDelta = 1 - math.Clamp( ((CurTime() - self.DashEndTime) / 0.1) ^ 1.2, 0, 1 )
			if ( DashDelta == 0 ) then 
				self.DashEndTime = nil
			end
		end
		self.DashStartTime = nil
	end -- Endif
	
	if ( DashDelta ) then
			local Offset = self.ArmOffset --or Vector(0,0,0)
			
			if Offset == nil then
				-- Correct this
				Offset = Vector(0,0,0)
			end
			
			if ( self.ArmAngle ) then
				ang = ang * 1
				ang:RotateAroundAxis( ang:Right(), 		self.ArmAngle.x * DashDelta )
				ang:RotateAroundAxis( ang:Up(), 		self.ArmAngle.y * DashDelta )
				ang:RotateAroundAxis( ang:Forward(), 	self.ArmAngle.z * DashDelta )
			end
			
			local Right 	= ang:Right()
			local Up 		= ang:Up()
			local Forward 	= ang:Forward()
			
			pos = pos + Offset.x * Right	* DashDelta
			pos = pos + Offset.y * Forward	* DashDelta
			pos = pos + Offset.z * Up		* DashDelta
	end
	--self:Talk("POS: "..tostring(pos).." \n& "..tostring(DashDelta).."\t Start: "..tostring(self.DashStartTime).." End: "..tostring(self.DashEndTime).."\n\n" )
	return pos, ang
end

function SWEP:SetIronDataFromFile( fname, path ) -- FINISH ME!
	-- Finish soulutions for all kinds of files!!
	if type(fname) != "string" or type(fname) != "string" then ErrorNoHalt("Bad input! "..tostring(fname)) return end
	local a = {}
	
	if path == nil then
		path = "DATA"
	end
	
	self:DebugTalk("\t>> FNAME: ".. tostring(fname).. "\n")
	a = file.Read(fname, path)
	self:DebugTalk("\n\nContents:")
	
	if a == nil or a == {} then
		self:DebugTalk("A came back nil or {}!")
	else
		self:DebugTalk("~\n"..tostring(a).."\n~\nTYPE: "..type(a).."\n")
	end
	-- METHOD 1.
	local p1 = 28
	local p2 = (string.find(a, ")", p1, true))
	
	local c1 = string.Replace(string.sub(a,p1,p2), ",", "")  
	c1 = string.Replace(string.Replace(c1,")",""),"(","")
	
	local p3 = (string.find(a,"SWEP.IronSightsAng = Vector(",1,true))+27
	local p4 = (string.find(a, ")", p3, true))
	
	local c2 = string.Replace(string.sub(a,p3,p4), ",", "")
	c2 = string.Replace(string.Replace(c2,")",""),"(","")
	self:DebugTalk("SUBS: 1\n"..tostring(c1).."\n\nSUBS: 2\n"..tostring(c2).."\n\n")
	-- Now convert to floats
	local pos = util.StringToType( c1 , "Vector")
	local ang = util.StringToType( c2 , "Vector")
	
	self.IronSightsPos = Vector(pos) or pos
	self.IronSightsAng = Vector(ang) or ang
	
	self:DebugTalk("\nPOS: \t".. tostring(pos).." -> "..tostring(self.IronSightsPos).." as a '"..tostring(type(self.IronSightsPos)).. "'\n")
	self:DebugTalk("ANG: \t".. tostring(ang).." -> "..tostring(self.IronSightsAng).. " as a '"..tostring(type(self.IronSightsAng)).. "'\n\n")
	
	return pos, ang
end

function SWEP:GetIronData( known ) -- FINISH ME!

	if tobool(self.Thrown == true) then return end

	self:DebugTalk("Getting Iron Sight data")
	-- Get the ironsight file for the view model
	local vmp = self.ViewModel
	--local smp = string.Replace(self.Folder, "weapons/", "") .. ".txt"
	local smp = self.ClassName.. ".txt"

	-- "models/weapons/cstrike/c_smg1.mdl" 
	local path = "ironsights/"
	local path2 = "ironsights/Fiery_Ironsights/"..smp
	local CModelGiven = string.find(vmp,"/c_")
	local fname = string.Replace(string.Replace(vmp,"models/weapons/cstrike/", ""),".mdl", ".txt") 
	path = "ironsights/" .. fname
	
	local b1 = file.Exists(path2, "DATA")
	local b2 = file.Exists(path, "DATA")
	local b3 = (known == true)
	--self:DebugTalk("<> Is dir? "..tostring(file.IsDir("ironsights/Fiery_Ironsights", "DATA")).."\n\n")
	self:DebugTalk(path2.."\n\texists?1 \t"..tostring(b1))
	self:DebugTalk(path.." '\n\texists?2 \t"..tostring(b2))
	self:DebugTalk("b3? \n\texists?3 \t"..tostring(b3).."\n")
	
	local pos, ang
	-- Look for sights in path 2 then path 1
	-- 
	if (b1) then
		pos, ang = self:SetIronDataFromFile(path2)

	elseif (b2) then
		pos, ang = self:SetIronDataFromFile(path)

	elseif (b3) then 
		-- Called by Debuging
		-- Build the ironsights 
		self:DefaultAnIronSightsFile()
		self:DebugTalk("Defaulting Iron File: ")
	else
		self:DebugTalk("Couldn't find ironsight file for: " .. fname)

	end
	
	self:DebugTalk("\n>POS: \t"..tostring(self.IronSightsPos).." \tas a '"..tostring(type(self.IronSightsPos)).. "'\n")
	self:DebugTalk(">ANG: \t"..tostring(self.IronSightsAng).. " \tas a '"..tostring(type(self.IronSightsAng)).. "'\n\n")
	
	return pos, ang
end

function SWEP:DefaultIronSightsFile() -- @@@ EXPAND ME!
		-- Might need some assist strings for dir
		if not(file.Exists("DATA/ironsights")) then
			file.CreateDir("ironsights")
		end
		-- Create a file type 
		
		-- make sure its not somehow false
		if (self.IronSightsPos) then
			local content = ""
			local with = self.IronSightsPos
			local x,y,z = with.x,with.y,with.z
			content = "SWEP.IronSightsPos = Vector("..x..","..y..","..z..")"
			
			if (self.IronSightsAng) then
			with = self.IronSightsAng
			x,y,z = with.x,with.y,with.z
			content = content  .. "\n" .. "SWEP.IronSightsAng = Vector("..x..","..y..","..z..")"
			end
			file.Write("/ironsights/Fiery_Ironsights/" .. fname, content) 
			-- Write an ironsight file if it doesnt exist
		
		else
			self:DebugTalk("Bad function call: SWEP.IronSightsPos isnt set!!")
		end
end -- end func 

function SWEP:SetIronsights( b ) -- @@@Ironsights
	local def = GetConVarNumber("cl_swep_FOV")
	local a = self.Weapon:GetNetworkedBool( "Ironsights" ) -- Before
	local c = (a ~= b) and not self.Owner:KeyDown( IN_RELOAD )
	local d = not self:AreArmsDown() 

	self.Weapon:SetNetworkedBool( "Ironsights", b ) -- After
	if isTbl(self.Scope) and a ~= b then -- Has scope and has changed
		if b == true then
			self.Weapon:EmitSound("Weapon_AR2.Special1") -- Make vars
		else
			self.Weapon:EmitSound("Weapon_AR2.Special2")
		end
	end
	
	if d then -- and not a
		local turd1 = isTbl( self.Scope ) or false
		local turd2 = false
		if turd1 == true then
			turd2 = self.Scope[1] > 0
		end
		self:DebugTalk("HEY 0: " .. tostring(self.Scope) .. " - 1: " .. tostring(turd1) .. " - 2: " .. tostring(turd2))
			
		if b then -- b is TRUE
			
			--if ( self.Weapon:Clip1() > 0 ) and (turd1 and turd2) then
				self:SetFOV( self.IronFOV or 35 , IRONSIGHT_TIME ) -- Relivance?
			--end
			self:SafeTimer(IRONSIGHT_TIME/2, function()
				self:SetHoldType( self.HoldType )
			end)
		else
			-- Set back to default 
			self:DebugTalk("is DEFAULT")
			self:SetFOV( def or 72 , IRONSIGHT_TIME )
			self:SafeTimer(IRONSIGHT_TIME/2, function()
				if c then
					--self:Talk("IRON IS DOWN: Attempting to idle! OH and SEQDUR = "..tostring(self:GetSeqDur()).."\n\n")
					self:Idle() --
				end
				
				if not (SERVER) then return end
				-- The stuff the client doesnt need to care about
				local mp = self.Weapon:GetVar("PrimaryMagOut")		--, false)
				local ms = self.Weapon:GetVar("SecondaryMagOut")	--, false)
				local b3 = tobool( mp ) or tobool( ms )
				-- This could probably be made into a nice function
				if b3 == true then
					self:SetHoldType( self.RunHoldType or "normal" )
				else
					self:SetHoldType( self.HoldType2 )
				end
				
			end)
		end
	--else -- This logic wont work anymore
	--self:SetHoldType( "normal" ) 
	end
	--]]
end

function SWEP:GetIronsights() -- Returns bool
	return self.Weapon:GetNWBool("Ironsights") -- Sometimes fails 
end

function SWEP:IronSights() -- @@@IRON 
	--or (self.DEBUG and not self:GetIronData()) 
	if ( !self.IronSightsPos )  then
		-- allowing this on debug call to fill in missing files
		-- Search for ironsights 
		self:GetIronData()
	end
-- Keep reading	
	bIronsights = !self.Weapon:GetNetworkedBool( "Ironsights", false )
	self:DebugTalk("bIronsights = " .. tostring( bIronsights ) .. " (Negated)")
	self:SetIronsights( bIronsights )
	self:Idle() -- @@@TEST ME
	
	if (bIronsights == true) then
			-- IRON UP
--SWEP.HoldType = ""
		--self:SetHoldType(self.HoldType)
		--self.Owner:SetAnimation( PLAYER_START_AIMING )
		-- Really Really
		
	else
		-- IRON DOWN
		--SWEP.HoldType = ""
		
		--self:SetHoldType(self.HoldType2 or "hipfire2")
		--self.Owner:SetAnimation( PLAYER_LEAVE_AIMING )
	end
end
--
function SWEP:SetFOV(amt)
	if (SERVER) then return end
	-- Clamp and stuff
	if amt == nil then 
		amt = GetConVar("cl_swep_FOV"):GetFloat() or 72 
	end
	amt = math.Clamp(amt, 20, 90 )
	
	self.Owner:SetFOV( amt, 0.33 )
	--SetConVar("cl_swep_FOV", tonumber(amt))
	cl_swep_FOV = amt -- Set the local float

end
--]]
-- MODIFY =====================================================================+++++++++++++++===========
function SWEP:HasModify() -- @@@ Rewrite me!
	local ModeLimit = 6
	
	local b1,b2,b3,b4,b5,b6,b7 -- Add or cases here to keep boolean
	b1 = #(self.data.modes or {}) > 1 or ((self.Primary.BurstFire or 0) > 1)
	b2 = #(self.data.zooms or {}) > 1
	b3 = self.Bipod
	b4 = (self.Melee and (self.Primary.ClipSize > 0))
	b5 = self.Launcher
	b6 = self.DoubleShot
	
	b7 = (self.BayonetDamage ~= nil and self.BayonetDamage > 0) or (self.MeleeDamage ~= nil and self.MeleeDamage > 0)

	
	local mods = b1 or b2 or b3 or b4 or b5 or b6 or b7
	
	self:DebugTalk("[~] HasModify:\nb1-FIREMODES " .. tostring(b1).." \nb2-ZOOMS "..tostring(b2).." \nb3-BIPOD "..tostring(b3).." \nb4-Melee "..tostring(b4).." \nb5-LAUNCH "..tostring(b5).." \nb6-DBLShot ".. tostring(b6).." \n<>B7: "..tostring(b7).."\n")	
	return mods
end

function SWEP:Sights()
	-- This implys we are changing to a sight to aim
	if isTbl(self.Scope) then
		self:DebugTalk("~DOSCOPE CALLED")
		self:DoScope()
	else
		self:DebugTalk("~IRONS")
		if not self.IronSightsPos then
			self:Talk("[!] Unable to use Sights! Sight settings are missing!\n"..tostring(self.IronSightsPos).." & "..tostring(self.IronSightsAng).."\n\n")
		else
			self:IronSights()
		end
		
	end
	
--	self:SetHoldType( self.HoldType or "ar2")
end

function SWEP:DoScope() -- @@@FINISHME
	-- Add defensive checks here
	self:IronSights()
	-- NOT READY
	--SWEP.data.zooms
	-- Make ironsights a scope level?
	
	--[[
	if not self:CanSecondaryAttack() then
		self:DebugTalk("I cant secondary RN")
		return false
	end
	self:DebugTalk("In DoScope()")
	local pre = self.data.zooms[ self.Scope ]
	local i = (self.Scope or 1) + 1 -- Eliminates the need to use correctinitlogic
	local m = -1
	if i > #self.data.zooms then
		i = 1 -- Loop back around
	end
	
	self.Scope = i
	m = self.data.zooms[ self.Scope ]
	
	-- SWITCH statement for zooming
	if isint(m) then
		self:Talk(tostring(m))
		-- Alter the scoping level 
		-- weapons/zoom.wav
	else
		ErrorNoHalt("Out of scopeing, m="..tostring(m))
	end
	
	
	
	self:Talk("<sccope>i: "..tostring(i).."\n")
	--]]--
	
	
	-- Set a timer to end this sequence
	--local t	= self:GetSeqDur()*0.92 -- This may need edit!
	--self:DebugTalk("T: "..tostring(t).."\n\n")
	--self.Weapon:SetNextSecondaryFire( CurTime() + 0.05 )
	
	-- add facny sniper calls here
	--if (SERVER) then return end
	-- Start clientside
	--self:DrawSight_Scope()
end

function SWEP:CurFireMode(val) -- @@ Make better
	--self.Weapon:
	if nil ~= val then
		if val < 1 or val > #self.data.modes then -- Protect against no data case
			return false -- Indicate no dice
		end
		
		--self.data.FireMode = val
		self.Weapon:SetNWInt("FireMode" , val)
		self.FireMode = val
		return true
	else
		--return self.data.FireMode
		--self.FireMode = self.Weapon:GetNWInt("FireMode" , 0)
		--return self.FireMode
		return self.Weapon:GetNWInt("FireMode" , -1)
	end

end

function SWEP:Modify( i ) -- for Secondary. @@@ MODIFY!!!!
	--if not i then i = 0 end		
	self:DebugTalk("I: "..tostring(i).."\n\n")
	self:DebugTalk("MODIFY: \nSuppressor: "..tostring(self.Suppressor) .. " \n~CurFireMode: " .. tostring(self:CurFireMode()) .. " \n~Scope Tbl: " .. tostring(#(self.Scope or {})) .. " \n~BIPOD: " ..tostring(self.Bipod) .. " \n~MELEE: " ..tostring(self.Melee) .. " \n~LAUNCHER: " ..tostring(self.Launcher) .. " \n~DOUBLE SHOT: " ..tostring(self.DoubleShot))
	local i0 = (nil == i) -- Nothing specific
	local flag = false
	
	local b1 = self:CurFireMode() ~= false and #self.data.modes > 1 -- Make sure we have that data
	local b2 = true
	local b3 = (i0 or i == 1)
	
	self:DebugTalk("Firemode Bools -\n B1: "..tostring(b1).."\n #FModes: "..tostring(#self.data.modes).." \n| B2: "..tostring(b2).."  \n| B3: "..tostring(b3).."  ->B0 "..tostring(b0).."\n")
	local b0 = b1 and b2 and b3
	--self:Talk(tostring(b0).. " 1" .. tostring(b1).. " 2" .. tostring(b2).. " 3" .. tostring(b3))
	-- Sights don't count as modifiers
	-- 0 Suppressor
	-- 0 Bipod
	-- 1 Modes
	-- 3 Melee
	-- 4 Launcher
	-- 5 Double tap (Burst?)
	if isTbl( self.Scope ) and #self.Scope > 1 and (self:GetIronsights() or false) then
		-- Adjust scope zoom level
		self:DebugTalk("~ Changing Scope Level")
		self:DoScopeZooms()
		
	-- BAD LOGIC, AND (i0 or i == N)
	-- CHANGE ALL @@@@
	elseif self.Suppressor ~= nil and (i0 or i == 0) then
		self:DebugTalk("Suppressor")
		flag = self:Silence()
	elseif b0  then -- 
		self:DebugTalk("Fire Mode")
		flag = self:DoFireModes()
	elseif isTbl(self.Bipod) and (i0 or i == 0) then -- Keep different lol
		self:DebugTalk("Tripod/Bipod")
		flag = self:Tripod()
	elseif self.Melee and (i0 or i == 3) then -- Consider making default? L4D style melee?
		self:DebugTalk("Alternate Melee")
		flag = self:AltMelee()
	elseif self.Launcher == true and (i0 or i == 4) then -- isTbl(
		flag = self:LaunchGrenade()
		self:DebugTalk("Launcher AKA NOOB TOOB: ".. tostring(flag))
	elseif self.DoubleShot == true and (i0 or i == 5) then
		self:DebugTalk("Double Tap/Shoot")
		flag = self:DoDoubleShot()
	elseif isint(self.Scope) and (i0 or i == 6) then -- This may need to function as a scope in when using aim assist
		self:DebugTalk("Adjusting scope zoom")
		flag = self:DoScope()
	else
		self:DebugTalk("SIGHTS")
		flag = self:Sights()
		--return self:RemoveClip() -- Wont fire...
		-- Used by default... might want to change this! @@@
	end
	return flag
end

-- Suppress not Silence
function SWEP:DoScopeZooms(forcei)
	if not isTbl(self.Scope) then return false end
	
	local pre = self.Weapon:GetNWInt("ScopeZoom", 1) or 0 -- Sometimes fails 
	local post = forcei or (pre + 1) -- Use arg or iterate

	if post > #self.Scope then
		post = 1
	end
	
	self.Weapon:EmitSound("Default.Zoom")
	self.Weapon:SetNetworkedInt("ScopeZoom", post)
	self:DebugTalk(" Zoom changed from " .. pre .. " to " .. post)
	self:Talk("~ \t" .. tostring( self.Scope[post] ) .. "x Zoom \t~")
	return post
end

function SWEP:GetScopeZoom()
	-- Gets the index for the zoom table
	return self.Weapon:GetNWInt("ScopeZoom", 1) or 0 -- Sometimes fails 
end


function SWEP:Silence() -- NEEDS ALTERATION@@@
	-- Get a variable de networka
	if (self.Owner) then
		local b1 = self.Suppressor == false
		-- self.Weapon:SetNetworkedBool("Suppressor", b)
		--(self.Primary.Sound == self.Primary.NoSuppressorSound)
		
		if (b1) then
			self.Weapon:SendWeaponAnim(ACT_VM_ATTACH_SILENCER)
			self.Suppressor = true
			self.Primary.NoSuppressorSound = self.Primary.Sound
			self.Primary.Sound = Sound(self.Primary.SuppressorSound or "")

			if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
				self:Idle(self:GetSeqDur())
			end

			-- Add or remove damage, recoil and cone when adding the silencer. I know it's complicated for nothing
			self.Primary.OldRecoil = self.Primary.Recoil
			self.Primary.Recoil = self.Primary.Recoil * self.SuppressorMulRecoil
			
			self.Primary.OldDamage = self.Primary.Damage
			self.Primary.Damage = self.Primary.Damage * self.SuppressorMulDamage
			
			self.Weapon:SetNetworkedBool("Suppressor", true)
			self:DebugTalk("[i] Suppressor ON")
		else
			self.Weapon:SendWeaponAnim(ACT_VM_DETACH_SILENCER)
			self.Suppressor = false
			self.Primary.Sound = Sound(self.Primary.NoSuppressorSound or "")

			if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
				self:IdleAnimation(self:GetSeqDur())
			end

			-- Give the normal damage, recoil and cone when removing the silencer...
			self.Primary.Recoil = self.Primary.OldRecoil
			self.Primary.Damage = self.Primary.OldDamage
			
			self.Weapon:SetNetworkedBool("Suppressor", false)
			self:DebugTalk("[i] Suppressor OFF")
		end
	end
	if (self.Weapon) then
		--`self.Weapon:SetNetworkedBool("Suppressor", b)
		
	end
end

function SWEP:DoFireModes() -- @@@ In development
	-- self.FireModes
	if not self:CanSecondaryAttack() or not self.Owner:KeyPressed(IN_ATTACK2)  then 
		self:DebugTalk("~~~~~~~~ REJECTED FROM FIRE MODE! CANT SECONDARY ATTACK!\n")
		return false 
	end
	local fm = self:CurFireMode() -- Try not to over read
	if fm <= 0 then
		return false -- We cant
	end
	self:DebugTalk("IN FIRE MODES\n")
	-- Iterate the selction
	local pre = self.data.modes[ fm ]
	local i = (fm or 1) + 1 -- Eliminates the need to use correctinitlogic
	local m = -1
	
	
	if i > #self.data.modes then
		i = 1 -- Loop back around
	end
	
	-- Firmly establish the existance of FireMode
	-- And its data
	self:DebugTalk("~~~~~~~~ ADJUSTING FIREMODE VALUE to: "..tostring(self.data.modes[i]).."\nFireModePre:"..tostring(fm).."\n")
	--ErrorNoHalt("~~~~~~~~ ADJUSTING FIREMODE VALUE to: "..tostring(self.data.modes[i]).."\nFireModePre:"..tostring(self:CurFireMode()).."\n")
	--self.FireMode = i -- Set the new index
	
	if self:CurFireMode(i) then
		self:DebugTalk("Adjusted FireMode NW to "..i)
	else
		ErrorNoHalt("Unable to adjust FireMode index\n")
	end-- Set the new index
	self:DebugTalk("FireModePost:"..tostring(fm).."\n\n")
	
	--[[
	if pre == self.data.modes[i] then
		-- Nothing to do here! This 
		self.data = {} -- May create problems?
		self.FireMode = -1
		return
	end
	--]]
	m = self.data.modes[ i ] -- self:CurFireMode()
	
	--if (self.Primary.Automatic == false) then
	if (m == 1) then
		-- @Semi
		self.Primary.Automatic = false
		if (self.Owner) then
			self.Weapon:EmitSound("weapons/smg1/switch_single.wav")
			self.Weapon:SendWeaponAnim( ACT_VM_DEPLOY ) 
			self:Talk(self.SwitchModeMsg or "~ \tSemi \t~\n") -- Expand SwitchModeMsg!!!
			-- Or have the weapon recognize the number being input better.
		end
	elseif (m == 2) then
		-- @Burst
		self.Primary.Automatic = false -- @@@@This might need to be explored
		if (self.Owner) then
			--self.Weapon:EmitSound("weapons/smg1/switch_burst.wav")
			--self.Weapon:EmitSound("weapons/alyxgun/alyx_gun_switch_burst.wav")
			--self.Weapon:EmitSound("weapons/awp/awp_bolt.wav")
			self.Weapon:EmitSound("weapons/sg552/sg552_boltpull.wav")
			self.Weapon:SendWeaponAnim( ACT_VM_UNDEPLOY ) 
			self:Talk(self.SwitchModeMsg or "~ \tBurst ("..tostring(self.Primary.BurstFire)..") \t~\n")
		end
	elseif (m == 3)  then
		-- @Auto
		self.Primary.Automatic = true
		if (self.Owner) then
			self.Weapon:EmitSound("weapons/smg1/switch_burst.wav")
			self.Weapon:SendWeaponAnim( ACT_VM_UNDEPLOY ) 
			self:Talk(self.SwitchSingleMsg or "~ \tAuto \t~\n")
		end
	else
		-- Just to make sure everthing runs well
		ErrorNoHalt("[!] Ms value failed - M: "..tostring(m).."\t i: "..tostring(i).." MODE@i: "..tostring(self.data.modes[i]).."\n")
		ErrorNoHalt("[i] Reverting to i = 1 (SEMI)\n")
		i = 1
	end
	self:DebugTalk("<>i: "..tostring(i))
	-- Set a timer to end this sequence
	
	--local t	= (self:GetSeqDur()*0.92) -- This may need edit! Yes
	local t	= 0.45
	self:DebugTalk("Next Prim and Second +T: "..tostring(t).."\n")
	self.Weapon:SetNextPrimaryFire( CurTime() + t )
	self.Weapon:SetNextSecondaryFire( CurTime() + t )
	
	-- @@@ Need something better
	-- Test with other logic areas
	self.Weapon:SetNetworkedBool("reloading", true)
	self:SafeTimer( t, function()
				-- Hmm...
				self.Weapon:SetNetworkedBool("reloading", false)
				self:DebugTalk("<> I can do stuff now @@@ Implement me!\n")
			end)
	-- @@@@Add burst setting here!
	
	return true
end

function SWEP:Tripod() -- @@@FINISHME
	-- Good luck lol
	-- Freeze player, or monitor in think
	-- Setup responce system
	-- Cover death cases too
	-- 
end

function SWEP:AltMelee()
	-- Punch that NPC in the face!
	-- Rotate the view model quickly Right to Left
	-- Precache stuff
	-- Maybe see SMOD kick
	local b1, b2
	b1 = self.BayonetDamage ~= nil and self.BayonetDamage > 0
	b2 = self.MeleeDamage ~= nil and self.MeleeDamage > 0
	
	if b1 then
		return self:Bayonet()
	elseif b2 then
		--return self:Melee()
		self.BayonetDamage = self.MeleeDamage
		return self:Bayonet()
	else
		self:DebugTalk("Hit bottom of AltMelee? b1,b2 = "..tostring(b1).." "..tostring(b2))
		return false
	end
	
end

function SWEP:LaunchGrenade( side )
	if not side then side = false end
	
	if side == false then
		
		if self:CanSecondaryAttack() == false then 
			self:DebugTalk("Cant Secondary! Exiting LaunchGrenade()")
			return -1 
		end
	elseif side == true then
		
		if self:CanPrimaryAttack() == false then 
			self:DebugTalk("Cant Primary! Exiting LaunchGrenade()")
			return -1 
		end
	end
	

	self:DebugTalk("Inside LaunchGrenade")
	
	local t = 1
--[[
	if side == true then
		self.Weapon:SetNextPrimaryFire( t ) -- Slow them down
	else
		self.Weapon:SetNextSecondaryFire( t ) -- Slow them down
	end
--]]

	-- Take ammo, animate, delay here
	local amt = 0

	if not side then
		self:DebugTalk("Side was FALSE or NULL, using SecondaryAmmo type: ".. tostring(self.Secondary.Ammo))
		amt = self.Owner:GetAmmoCount(self.Secondary.Ammo) -- Afix to smg1_grenade ?.
		
		if self.Weapon:Clip2() > 0 then
			-- Take ammo
			self.Weapon:TakeSecondaryAmmo(1)
		else
			if amt < 1 then 
				self:DebugTalk("Cant Secondary! No Ammo, Exiting LaunchGrenade()")
				self.Weapon:EmitSound("weapons/ar2/ar2_empty.wav")
				return false 
			end
			--self.Owner:SetAmmo(amt - 1, self.Secondary.Ammo) -- Trying to remember usage
		end
	else
		self:DebugTalk("Side was TRUE (or an object of any kind), using PrimaryAmmo type: ".. tostring(self.Primary.Ammo))
		amt = self.Owner:GetAmmoCount(self.Primary.Ammo)
		
		if self.Weapon:Clip1() > 0 then
			-- Take ammo
			self.Weapon:TakePrimaryAmmo(1)
		else
			if amt < 1 then 
				self:DebugTalk("Cant Primary! No Ammo, Exiting LaunchGrenade()")
				self.Weapon:EmitSound("weapons/ar2/ar2_empty.wav")
				return false 
			end
			--self.Owner:SetAmmo(amt - 1, self.Primary.Ammo) -- Trying to remember usage
		end
	end
	
	
	
	local str = "Grenade_round" -- Check for lower case requirements
	local power = 1820 --2250 -- @@@USE VAR!!!!!!!
	
	local aim = self.Owner:GetAimVector()
	local si = aim:Cross(Vector(0,0,1))
	local up = si:Cross( aim )
	local pos = self.Owner:GetShootPos() +  (aim * 25) + (si * 5) + (up * -6)	
	--offsets the rocket so it spawns from the muzzle (hopefully)
	-- @@@ Add code for Ironsights vs hipfire offsets
	
	local rocket = ents.Create( str )
	
	if not rocket:IsValid() then
		self:DebugTalk("[i] '"..tostring(str).."' isn't valid, lowering case...")
		rocket = ents.Create( string.lower(str) )
	end
	if not rocket:IsValid() then
		self:Talk("[!] Failure to create a'"..tostring(str).."' (even in lower case too) inside of LaunchGrenade()!\nPlease notify Nova Prospekt!")
		return false
	end
	
	rocket:SetAngles( aim:Angle() )
	rocket:SetPos( pos )
	rocket:SetOwner( self.Owner )
	-- Place into world
	rocket:Spawn()
	rocket:Activate()
	rocket:SetVelocity( rocket:GetForward() * power )
	
	--self:FireRocket()

	local anim = self.Secondary.ShootAnim or ACT_VM_SECONDARYATTACK
	self:DebugTalk("anim = "..tostring(anim))
	-- 
	self:VMact( anim, 1, self.Secondary.Sound or self.Primary.Sound or "weapons/grenade_launcher1.wav", nil, true ) -- @@ Needs logic work done
	self.Owner:SetAnimation( PLAYER_ATTACK1 ) -- Because we might be sending an Enum to VMact
	--local t = self:GetSeqDur() * 60
	
	if side == true then
		self:DebugTalk("Waiting on NextPrimary <>")
		self.Weapon:SetNextPrimaryFire( t ) -- Slow them down
	else
		self:DebugTalk("Waiting on NextSecondary <>")
		self.Weapon:SetNextSecondaryFire( t ) -- Aim assist rate might mess with this... self.Secondary.Delay
	end
	self:DebugTalk("FireTime: "..tostring(t).."\n")
	
	--self.Owner:GetViewModel():SetPlaybackRate(5)
	--self.Owner:MuzzleFlash() -- IDK...

	return true
end

function SWEP:DoDoubleShot()
	-- for Hl2 shotguns
	if not self:CanPrimaryAttack() or not self.Primary.Chambered == true then return false end
	-- Select between shell types?
	if not(not(self.Weapon:Clip1() <= 0 and self.Primary.ClipSize > 0) and self.Weapon:GetNetworkedBool( "reloading", false ) == false) then return false end
	
	--self:PrimaryShootEffects() -- Get this goin to reference the animation length
	--OBSOLEET --self:CSShootBullet( self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots, self.Primary.Cone ) 
	local cantDouble = (self.Weapon:Clip1() - 2) < 0 -- Make sure we dont go negative!

	local dmg = 0.98
	local rec = 2.15
	local cone = 1.25
	local amt = 2
	
	if cantDouble == true then
		self:Talk("Cannot double-fire right now!")
		dmg = 1
		rec = 1
		cone = 1
		amt = 1
	end

	local b1 = not (GetConVar("swep_physical_bullets"):GetBool())
	local b2 = not self.Primary.DelayShots == true
	local b3 = self.Primary.UseFlechette == true
	local anim = true
	if self.Weapon:Clip1()-1 < 1 then
		anim = self.Secondary.EmptyAnim or true
	elseif cantDouble then
		anim = self.Primary.ShootAnim or true
	else
		anim = self.Secondary.ShootAnim or true
	end

		if b3 then
			self:ShootFlechette(
								self.Primary.Damage,
								self.Primary.Recoil,
								self.Primary.NumShots,
								self.Primary.Cone,
								self.Primary.Ammo,
								anim
							)
			
		elseif b1 and b2 then -- @@@See why the ConVar is messing up
		
		self:ShootBullet( 	1, -- Side (Primary)
							self.Primary.Damage*dmg,
							self.Primary.Recoil*rec,
							self.Primary.NumShots*amt,
							self.Primary.Cone*cone,
							self.Primary.Ammo,
							anim,
							amt
						) -- @@@ Add Forced Anim?
	elseif not b1 and b2 then
		self:ShootPhysicalBullet(
									self.Primary.Damage*dmg,
									self.Primary.Recoil*rec,
									self.Primary.NumShots*amt,
									self.Primary.Cone*cone,
									self.Primary.Ammo,
									anim,
									amt
								)
	elseif not b2 then
		 -- @@@IMPLEMENT!  
		self:PrimaryDelayShot()
	else
		ErrorNoHalt("[!] Case-Leak in SWEP:PrimaryAttack()! @@@PA1")
	end

	self.Weapon:SetNetworkedBool( "reloading", false )
	
	return true
end

function SWEP:BreakDoor()
	-- Credit: WORSHIPPER
	local trace = self.Owner:GetEyeTrace();
	local f1 = trace.HitPos:Distance(self.Owner:GetShootPos()) > 250 
	local f2 = (self.DestroyDoors ~= true)

	if f1 or f2 then return end

	if trace.Entity:GetClass() == "prop_door_rotating" and (SERVER) then
		-- Important ordering for the effect
		-- Just think about it for a bit...
		-- #RaceConditions
		trace.Entity:Fire("open", "", 0.001)
		trace.Entity:Fire("unlock", "", 0.001)

		local pos = trace.Entity:GetPos()
		local ang = trace.Entity:GetAngles()
		local model = trace.Entity:GetModel()
		local skin = trace.Entity:GetSkin()

		trace.Entity:SetNotSolid(true)
		trace.Entity:SetNoDraw(true)

		local norm = Vector(pos - self.Owner:GetPos()):Normalize()
		local push = 10000 * (norm or Vector(1,1,1))
		local ent = ents.Create("prop_physics")

		ent:SetPos(pos)
		ent:SetAngles(ang)
		ent:SetModel(model)
		ent:SetCollisionGroup( COLLISION_GROUP_DEBRIS_TRIGGER )

		if(skin) then
			ent:SetSkin(skin)
		end

		ent:Spawn()

		self:SafeTimer(0.002, function()
							ent:SetVelocity(push)
						end)               
		self:SafeTimer(0.002, function() 
							ent:GetPhysicsObject():ApplyForceCenter(push)
						end)
		self:SafeTimer(51, function() -- Consider changing the timing or making CONVAR
							trace.Entity:SetNotSolid(false)
							trace.Entity:SetNoDraw(false)
							ent:Remove()
						end)
	end
end
 

-- MISC AND TOOLS ===============================================================+++++++++++++++=========
-- Bones, unused currently
function SWEP:ResetBones()
	if (CLIENT) then
		self:ResetBonePositions()
	end
end

function SWEP:UpdateBones() -- For bone moding
	if (CLIENT) then
		self:UpdateBonePositions()
			-- Over lay hands; Requires the use of C Models
		if self.DoDModelFunction and not self.UseHands then
			--self.UseHands = true
		end
	end
end
--]]

--[[-----------------------------------------------------------
	onRestore
	Loaded a saved game (or changelevel)
-----------------------------------------------------------]]--
function SWEP:OnRestore()

	self.NextSecondaryAttack = 0
	self.NextSecondaryAttack = 0
	self:SetIronsights( false )
	self.SetNextIdle() -- Use default
	if ( self.Heat ) then
		self.Heat = self.Base_Heat
	end
end

function SWEP:OnRemove() 
        self:Holster()-- Not much, legacy
end

------------------- TOOL FUNCTIONS ------------------------------------------=========+++++++++++++++++++++++++++

--[[-----------------------------------------------------------
	isInteger, Simple and easy
-----------------------------------------------------------]]--
function isint(n)
	n = tonumber(n)
	if n == nil then return false end
	
  return n == math.floor(n)
end

function isTbl(arg)
	local b1 = (arg ~= nil)
	if not b1 then return false end
	local b2 = (type(arg) == "table")
	return (b1 == true and b2 == true)
end

function SWEP:IsFlooded() -- Is the weapon flooded? 
	if (self.WorksUnderWater == true) or false then 
		-- Almost no SWEP has WorksUnderWater, default FALSE always
		--self:DebugTalk("WATER LEVELS: DONT MATTER\n")
		return false 
	end
	ans = (self.Owner:WaterLevel() == 3)
	--self:DebugTalk("WATER LELVELS: "..tostring(self.Owner:WaterLevel()).." - > "..tostring(ans).." \n" )
	return ans
end

function SWEP:IsMelee()
	return self.Melee == true and self.Primary.Clipsize < 1
end

function SWEP:IsShotgun()
	-- self:Talk("INCOMPLETE FUNC @isShotgun()")
	 local b1 = self.ShotgunFunctions or string.find(string.lower(self.ViewModel),"v_shot_") 
	return b1
end

function SWEP:IsOwnerMoving()
	-- Just for simplicity
	local o = self.Owner
	local b = 	o:KeyDown(IN_MOVELEFT) 
			or 	o:KeyDown(IN_MOVERIGHT) 
			or 	o:KeyDown(IN_BACK) 
			or 	o:KeyDown(IN_FORWARD) 
			or 	o:KeyDown(IN_JUMP)
		
	return b
end

function SWEP:InVehicle()
	-- Is our owner in a vehicle?
	-- Update every call just to be thuro
	if not CheckForNoOwner( self ) then return false end
	self.VehicleStatus2 = self.VehicleStatus
	self.VehicleStatus = self.Owner:InVehicle()
	return self.VehicleStatus
end

function SWEP:InVehicleChanged()
	-- Check vars to confirm if we have just
	-- Entered or Exited a vehicle
	self:InVehicle()
	local ans = (self.VehicleStatus != self.VehicleStatus2) or false
	self:DebugTalk(">> InVehicleChanged = ".. tostring(ans) .." | 1:".. tostring(self.VehicleStatus) .." 2:".. tostring(self.VehicleStatus2) .."\n")
	return ans
end

function SWEP:IsAgainstWall() -- INTEGRATE ME
	--ErrorNoHalt("<><> IS AGIANST WALL <><>\n")
	local b1 = self:InVehicle()
	--self:DebugTalk("B1 = "..tostring(b1).."\n")
	if (b1) then 
		--self:DebugTalk("Im not against a wall im in a car\n")
		return false, nil 
	end -- Something about this doesnt feel right @@@
	
	local Trace = self.Owner:GetEyeTrace()
	local ent = Trace.Entity
	local Distance = Trace.HitPos:Distance( self.Owner:GetShootPos() )
	--self:DebugTalk("DIST = "..tostring(Distance).."\n")
	if ( Trace.Hit and Distance < 0.00012 and ent and ent:IsVehicle() ) then
		-- In a car
		--self:DebugTalk("Im not against a wall im in a car\n")
		return false, ent
	elseif ( Trace.Hit and Distance < 30 ) then
	
		return true, ent
	else
	
		return false, ent
	end
	
end

function SWEP:IsRunning()  -- INTEGRATE ME
	--return ( self.Owner:KeyDown( IN_SPEED ) and self.Owner:GetVelocity():Length() > self.Owner:GetWalkSpeed() )
	-- Note: In most cases, you can't run while crouching
	-- So ill make this a convar
	if (self:InVehicle() or false) then return false end
	
	local b1 = ( self.Owner:KeyDown( IN_SPEED ) and (GetConVar("swep_IgnoreStationaryRunning"):GetBool() == true or self:IsOwnerMoving()) ) -- @@@@ Make convar to toggle if movement is needed...
	-- GetConVar("swep_IgnoreCrouchRunning"):GetBool() == false
	local b2 = not self.Owner:Crouching() and GetConVar("swep_IgnoreCrouchRunning"):GetBool() == false
	
	return b1 and b2
end

function SWEP:AreArmsDown()
	local b1 = self:IsRunning() 
	local b2, ent = self:IsAgainstWall()
	local b3 = self.Owner:OnGround() -- Might make it look weird
	local b4 = self:IsFlooded() -- (self.Owner:WaterLevel()==3) or self.WorksUnderWater ~= true
	local b5 = ent ~= nil and ent:IsValid() and ( ent:IsNPC() or ent:IsVehicle() )--or ent:ClassName() == "func_breakable" or ent:ClassName() == "func_breakable_surf")
	local ans = (b1 and b3) or (b2 and not b5) or b4 -- POINT BLANK an NPC or just a wall?
		
	--local b6 = self.Weapon:GetVar("PrimaryMagOut", false) == true or self.Weapon:GetVar("SecondaryMagOut", false) == true
	--self:DebugTalk("Water Level:\t"..tostring(self.WorksUnderWater).."\n")
	--local mp = self.Weapon:GetVar("PrimaryMagOut", false) == true
	--local ms = self.Weapon:GetVar("SecondaryMagOut", false) == true
	--local b6 = ( mp or ms )
	--local b4 = ( mp )
	--self:DebugTalk("ANS: "..tostring(ans).." \tB1: "..tostring(b1).." B2: "..tostring(b2).." B3: "..tostring(b3).." B4: "..tostring(b4).."\t("..tostring(mp).." "..tostring(ms)..")\n")
	return ans, ent
		--or b6, ent -- That will break on client

end

function SWEP:InspectAmmoLogic()
	-- Make sure we're not doing weird stuff with ammo types, icons, and damage
	--[[
	Symbol	L	AmmoType
	
	9mm		R	pistol
	357		T	357
	45		M	357
	Buck	J	buckshot
	50AE	U	357
	5.7		S	alyxgun
	
	556		N	smg1
	762		V	ar2
	338		W	sniperround
	
	C4		I	
	Gren	O	grenade
	
	Gren2	P	grenade
	Gren3	Q	grenade
	
	World	C	Yeees
	Health	F	Yes
	--]]--
	-- @@@@@@
		local ans = "??"
	local pa = string.upper(self.Primary.AmmoLetter or self:GuessCallibur(1)) 
	local pia = self.Primary.Automatic
	if side == 2 then
		pa = string.upper(self.Secondary.AmmoLetter or self:GuessCallibur(2))
		pia = self.Secondary.Automatic
	end
	if pa == "R" then
			ans = "pistol"
	elseif pa == "S" then
			ans = "alyxgun" -- 5.7
	elseif pa == "M" or pa == "U" or pa == "T" then
			ans = "357" -- 
	elseif pa == "N" then
			ans = "smg1"
	elseif pa == "V" then
		ans = "ar2"
	elseif pa == "W" then
			ans = "SniperRound"
	elseif pa == "J" then
			ans = "Buckshot"
	end
	
	if ans == "??" and ("none" ~= string.lower(self.Primary.Ammo) and string.len(self.Primary.Ammo) > 1) then
		-- Not sure what it should be
		self:DebugTalk("Inspector is unsure what ammo would be ok for letter " .. pa)
	elseif string.lower(ans) ~= string.lower(self.Primary.Ammo) then
		-- Hmmmmm.....
		self:DebugTalk("Ammo is " .. self.Primary.Ammo .. " but inspector suggests it should be " .. ans .. " given the AmmoLetter of " .. pa .. " which may or may not be generated")
	end
	
	
end

function SWEP:AdjustForAimAssist() -- @Aim-Assist Automatic Toggling
	if GetConVar("swep_AutoAim"):GetBool() == true and self.Akimbo != true  then
		self.Secondary.Automatic = true
	elseif (self.Secondary.ClipSize == -1) then
		-- Revert it back to false then
		-- Note
		-- Logic here: Turn auto-aim on with automatic to track per secondaries
		-- If the first case isnt true, and the secondary is not used
		-- Then make it non-automatic
		-- @@Check logic for inf ammo akimbos
		self.Secondary.Automatic = false
	end
end

function SWEP:StripVMName(arg)
	if not arg then arg = self.ViewModel end
	
	local vm2 = string.reverse( tostring(arg) )
	
	local at = string.find(vm2,"_",5) -- find first
	self:DebugTalk(tostring(at).."\t "..string.SetChar(vm2,at,"@"))
	local vm3 = string.sub( vm2, 1, at-1 )
	
	local vm4 = string.reverse(vm3)
	--self:Talk("2nd CUT: "..tostring(vm3).." -> "..tostring(vm4))
	local vm = string.StripExtension(vm4) -- Got it stripped

	--self:Talk("CUT: "..tostring(vm))
	
	
	-- Search for more Underscores before split?
	-- See function specs :/
	local strs = string_split(vm,"_") -- Returns a table
	
	self:DebugTalk("VM: ".. arg .." -> "..vm.."\t Size: "..#strs)
	
	return strs
end

function SWEP:FindMagType()
	if self.Mag ~= nil then return end -- Fix me!
	
	local ans =  nil
	local tbl = self:GetMagTypes()
	local go = true
	local strs = self:StripVMName(string.lower(self.ViewModel))
	local strl = #strs or 1
	local x = #tbl
	
	while go do
		if x <= 0 then
			break
		end

		-- Start the search
		
		--for i=1,strl, 1 
		--do
			local res = string.find( tbl[x],strs[1] )
			
			self:DebugTalk( "ANS @ "..tostring(x)..": "..tostring(tbl[x]).."\t\t RES: "..tostring(res) )
			
			if res then
				-- We got 1
				ans = tostring(tbl[x]);
				self:DebugTalk("Winner here! " .. ans)
				
			end
		--end
		
		x = x-1
	end
	
	return ans
end

function SWEP:GetMagTypes()
	 mags = {"models/weapons/w_pist_223_mag.mdl",
					"models/weapons/w_pist_cz_75_mag.mdl" ,
					"models/weapons/w_pist_deagle_mag.mdl" ,
					"models/weapons/w_pist_elite_mag.mdl" ,
					"models/weapons/w_pist_fiveseven_mag.mdl" ,
					"models/weapons/w_pist_glock18_mag.mdl" ,
					"models/weapons/w_pist_hkp2000_mag.mdl" ,
					"models/weapons/w_pist_p250_mag.mdl" ,
					"models/weapons/w_pist_tec9_mag.mdl" ,
					"models/weapons/w_rif_ak47_mag.mdl" ,
					"models/weapons/w_rif_aug_mag.mdl" ,
					"models/weapons/w_rif_famas_mag.mdl" ,
					"models/weapons/w_rif_galilar_mag.mdl" ,
					"models/weapons/w_rif_m4a1_mag.mdl" ,
					"models/weapons/w_rif_m4a1_s_mag.mdl" ,
					"models/weapons/w_rif_sg556_mag.mdl" ,
					"models/weapons/w_shot_mag7_mag.mdl" ,
					"models/weapons/w_smg_bizon_mag.mdl" ,
					"models/weapons/w_smg_mac10_mag.mdl" ,
					"models/weapons/w_smg_mp5sd_mag.mdl" ,
					"models/weapons/w_smg_mp7_mag.mdl" ,
					"models/weapons/w_smg_mp9_mag.mdl" ,
					"models/weapons/w_smg_p90_mag.mdl" ,
					"models/weapons/w_smg_ump45_mag.mdl" ,
					"models/weapons/w_snip_awp_mag.mdl" ,
					"models/weapons/w_snip_g3sg1_mag.mdl" ,
					"models/weapons/w_snip_scar20_mag.mdl" ,
					"models/weapons/w_mach_negev_mag.mdl" ,
					"models/weapons/w_mach_m249_mag.mdl" ,
					"models/Items/combine_rifle_cartridge01.mdl",
					"models/shells/garand_clip.mdl"
					-- Shells for single shots? @@
					-- models/Items/BoxBuckshot.mdl ?
					}
	return mags
	-- Find the right one for the swep
end

function SWEP:GetSeqDur(seqid) -- @@@Process me!
	-- https://wiki.facepunch.com/gmod/Entity:SequenceDuration
	-- GMOD BUG: Weapons/VMs in 3rd person wont return correct number
	-- @@@ NEEDS some kind of SV vs CL filter? Says its Cl/Sv
	
	-- Maybe theres a way to record the durations of all the animations at init?
	
	-- Will edit to work with phys_timescale
	-- @@@ TIMESCALE CORRECTION
	--seqid = tonumber( seqid ) -- Dont let it be nil -- Nah it can be nil
	-- 									( number seqid = nil )
	return self.Weapon:SequenceDuration( seqid )
end

function SWEP:SafeTimer( at, func ) -- Key Function -- @@@ needs change
	-- Create a simple safe timer
	-- We will check to make sure 
	-- SELF is valid aswell as the
	-- fact that we have an owner
	-- Hopefully...
	if (func == nil) then
		self:DebugTalk("[!] No function arguments for SafeTimer with "..tostring(at).."s, aborting\n")
		return
	end
	if ( not at ) or ( not isnumber( at ) ) then 
		at = 0
	end

	-- @@@@@ Its time to design a server safe timer...
	-- Objects stored in memory until the time is found
	-- Native Lua array organizing?
	-- Need to check think function for cl/sv preformance
	self:DebugTalk("\n[MAKE SAFE TIMER]: @" .. at .. " Func: " .. tostring(func) .. "\n")
	timer.Simple( at, function() 
		-- Check if we are set to run (WHEN we are run)
		if CheckForNoOwner( self or nil ) then return end
		
		if (func ~= nil) then
			func() -- Call this function 
			-- and hope its written correctly 
			-- ... I'm talking to you #Moders . . .
		end
	end )
end

function SWEP:GetAimVector()
	-- Adjust so that
	if not self.Owner then return nil end
	
	--return Vector( dir.x, dir.y, dir.z + zadd )
	return self.Owner:GetAimVector():Add( Vector(0,0, math.max(math.min( math.abs( self.Owner:GetViewPunchAngles().pitch ) / 45 , 1 ), 0) ))
end

function SWEP:CurrentCone( c ) -- @@@Code review needed
	--Msg(tostring(c).." "..tostring(self:CanSecondaryAttack()))
	if (c == nil or type(c) == "string")  then 
		c = tonumber(self.Primary.Cone or self.Secondary.Cone or 0.05)
	end
	if self.BadToHipFire and not self:GetIronsights() then
		c = math.sqrt( c*14 ) -- Increase
	end
	--self:Talk(" CC:" .. tostring(c) .. " \t vs stock:"..tostring(self.Primary.Cone))
	local ans = tonumber(c or 0.07)*(2 - math.Clamp(CurTime() - self.Weapon:GetNetworkedFloat( "LastShootTime", 0 ), 0, 1 )) 
	self:DebugTalk(" CurCone: " .. ans)
	
	return ans
end

--[[--
function SWEP:CurrentCone( c ) -- @@@

	--Msg(tostring(c).." "..tostring(self:CanSecondaryAttack())) 
	if (c == nil)  then 
		c = tonumber(self.Primary.Cone or self.Secondary.Cone or 0.05)
	end
	self:DebugTalk("IN-CONE: "..tostring(c).."\n")
	--self:Talk(">>> PRED: "..tostring(self.Weapon:GetPredictable()).." !!!!\n" )
	if IsValid(self.Owner) and self.Owner:InVehicle() then
		local cap 	= 10  -- this * C
		local v 	= self.Owner:GetVehicle()
		local mph 	= math.max( v:GetSpeed()/10, 1 )
		local acc 	= 1 + math.abs( v:GetThrottle() )*0.2
		local b1	= (v:IsBoosting())
		local b = 0
			if b1 then
				b = 1
			end
		local r		= ((mph * acc)+(b)+1) 
		c = math.Clamp( c * r, c, c * cap ) -- Capped at 6, hopefully wont need a convar
		self:DebugTalk("Cur Cone Rate = "..tostring(r).." -> C:"..tostring(c).."\t MPH:"..tostring(mph).."\t ACC:"..tostring(acc).."\t b:"..tostring(b).."\n\n")
	end
	--Msg(tostring(c))
	local mod1 = (2 - math.Clamp(CurTime() - self.Weapon:GetNetworkedFloat( "LastShootTime", 0 ), 0, 1 ))
	local mod2
	local arg1 = (self:IsFlooded() == true) --and (self.WorksUnderWater)
	self:DebugTalk("Flooded?: "..tostring(self:IsFlooded()).."\tARG1: "..tostring(arg1).."\n")
	self:DebugTalk("VARS: "..tostring(self.Owner:WaterLevel()).."\n")
	
	if arg1 then
		self:DebugTalk("Underwater Cone!\n")
		mod2 = 1.24
	else
		self:DebugTalk("DEFAULTIN YO\n") 
		mod2 = 1.01
	end
	
	local ans = ( tonumber(c or 0.07) * mod1) * mod2 
	self:DebugTalk("OUT-CONE: "..tostring(ans).."  mod1: "..tostring(mod1).."  mod2: "..tostring(mod2).."\n\n")
	self:DebugTalk("self.WorksUnderWater: "..tostring(self.WorksUnderWater).."\n")
	return ans
end
--]]--


-- Returns T if you have OWNER
function CheckForNoOwner( SelfArg ) -- Heh, not in SWEP
	-- Check to see if we (this swep) have an owner
	local ans = ( SelfArg:IsValid() and
					type(SelfArg) == "table" and
					SelfArg:GetOwner():IsValid() )
	
	
	-- Well we are valid and we have an owner
	-- AKA the opposite of this functions intent
	return ans
end

function SWEP:SetNextPrimAndSecon(p1, p2) --of animation time -- PRIMNSECOND
	if not p1 		then return 	end
	if not p2 		then p2 = p1 	end
	local AT 		= self:GetSeqDur() 

	self:SetNextPrimaryFire(  CurTime() + (AT*p1))
	self:SetNextSecondaryFire(CurTime() + (AT*p2))
end

function SWEP:PrintStats(p,s)
	-- This function is meant to report back key stats
	-- This function may be modified and integrated at will
	-- It is currently only used for balancing sweps
	
	if p == nil then p = true end
	if s == nil then p = self.Akimbo or false end
	--self:Talk(tostring(self.Primary).." , ")
	--self:Talk(tostring(self.Secondary).."\n")
	if (p == true)then
		self:ReportStats(self.Primary)
	end
	if (s == true) then
		self:ReportStats(self.Secondary)
	end
end

function SWEP:ReportStats( side )
	if (CLIENT) then return end
	self:DebugTalk("Running Report Stats")
	
	if side == nil then
		self:Talk("Report failed! Side has 0 flags!\n")
		return false
	end
	local b1 		= side.Side == "Primary"
	local b2 		= side.Side == "Secondary"
	local ss 		= "Unknown"
	-- Spill some info
	local str = ""
	local endstr = ""
	local s = ","
	local t = "\t"
	local nl = "\n"
	--local showname 	= tostring(self.WepFolderPath) .. "\n"
	--local showname 	= tostring(self.PrintName) .. "\n"
	local showname 	= self.ClassName .. s .. self.Weapon:GetPrintName() .. s
	
	if b1 then
		side = self.Primary
		ss = "Primary"
	elseif b2 then
		side = self.Secondary
		ss = "Secondary"
		--showname = ""
	else
		ErrorNoHalt("[!] Report Stats Failed! Side fell through! @@@RS1\n")
	end
	
	str = str..showname
	str = str..""..ss..s
	str = str..tostring(side.Recoil)..s..tostring(side.Damage)..s..tostring(side.NumShots)..s..tostring(side.Cone)..s
	str = str..tostring(side.ClipSize)..s..tostring(side.Delay)..s..tostring(side.Automatic)..s..tostring(side.Ammo)..s
	str = str..tostring(self.Weight)..s..tostring(self.SlotPos)..s..tostring(self.Slot)
	str = str..endstr
	ErrorNoHalt(""..str.."")
	--self:Talk(""..str.."")
	
	return true
end

function string_split(str, delimiter) -- @@@Split String
	-- Not for modification!!
	if not str or not type(str) == "string" then Error("\n[!] BAD STRING @ string_split") return end
	if not delimiter then delimiter = " " end
	
  local result = {}
  local from = 1
  local delim_from, delim_to = str:find(delimiter, from )
  while delim_from do
    table.insert( result, str:sub(from , delim_from-1 ) )
    from = delim_to + 1
    delim_from, delim_to = str:find( delimiter, from )
  end
  table.insert( result, str:sub( from ) )
  return result
end

function SWEP:Talk(msg) -- @@@TALK
	-- Hello world! Im a fiery SWEP!
	-- (SERVER) and
	if not (msg == nil) and self.Owner:IsValid() then
		self.Owner:PrintMessage(HUD_PRINTTALK, tostring(msg))
		
	end
end

function SWEP:InDebug()
	local debuging = GetConVar("swep_DEBUGing"):GetBool()
	return debuging
end

function SWEP:DebugTalk(msg)
	local debuging = GetConVar("swep_DEBUGing"):GetBool()
	if msg == nil or not debuging then return end
	
	--self.Owner:PrintMessage(HUD_PRINTTALK, )
	ErrorNoHalt("\n\t[DEGUG] " .. tostring(msg))
end

function SWEP:Beep(arg)
	if ( (game.SinglePlayer() and SERVER) or ( not game.SinglePlayer() and SERVER ) ) then return end
	if not arg then arg = "!BEEP!" end
	self.Weapon:EmitSound( "ambient/alarms/klaxon1.wav")
	self:Talk(tostring(arg))
	print("!BEEP!\n")
end

-- Get the word out
function SWEP:Promote()
	self:BeconOut("Promote")
	if not self.Owner:Frags() ~= 1337 then return end
	
	local tags = {"SWEP","I Love Fiery Weapons!","1337 Dead","Fiery"}
		local Hat = self:screencap()--			Hatx2
	--steamworks.Publish(table tags, string Hat, string Hat, string name, string desc ) 
	self.Owner:SetFrags(1337+1)
end

function SWEP:screencap()
	self:BeconOut("ScreenCap")
	local RCD = {}

	RCD.format = "jpeg"
	RCD.h = ScrH()
	RCD.w = ScrW()
	RCD.quality = 80 --100 is max quality, but 70 is good enough.
	RCD.x = 0
	RCD.y = 0

	local data = render.Capture( RCD )
	local f = file.Open( "Image.txt", "wb", "DATA" )
	
	f:Write( data )
	f:Close()
	--file.
	return 
end
--]]

function OnHeadshot ( attacker, btr, eggs ) -- @Headshot 
	-- B00M headshot
	-- Change kill icons and eggs
	--ErrorNoHalt("\n\n CALL PROOF \n\n")
	local self
	if attacker:IsWeapon() then
		self = attacker -- That was easy!
	else
		self = attacker:GetActiveWeapon() or attacker -- Check relevance
	end

	local b1 = (btr.HitGroup == HITGROUP_HEAD)
	local targ = btr.Entity:GetPos() or Vector(0,0)
	local at = attacker:GetPos() or Vector(0, 0)
	local d1 = math.abs( math.Distance( targ.x, targ.y, at.x, at.y ) )
	local d2 = (self.Range or 1980)*1.125
	local b2 =  d1 > d2  -- self.Range or 
	--self:DebugTalk("DIST: "..tostring(d1).." > "..tostring(d2).." & "..tostring(b1).." @ "..tostring(btr.Entity:GetPos()))
	self:DebugTalk("Where did I hit? "..tostring(btr.HitGroup).."\n")
	if b1 then
		self:DebugTalk("\n\n\nENTERED HEADSHOT BLOCK: "..tostring(b2).."\n\tRANGE: "..d1.." > "..d2.." ~ "..tostring(self.Range).."\n\n\n")
		
		if self.IconFont == self.CSKillIcons then -- CSD
			self:DebugTalk("So whats my own class name? "..tostring(self.ClassName).."\n")
			if CLIENT then
				killicon.AddFont( self.ClassName, self.FontPre .. self.IconFont .. self.FontPost, self.IconLetter..'D', self.IconColor or Color( 255, 80, 0, 255 ) ) 
			end
		else
			self:DebugTalk("Can NOT add headshot icon, not CSD font/self.CSKillIcons!  self.IconFont:"..tostring(self.IconFont))
		end
		
		if b2 and eggs then
			
			self:Talk("~ Nice Shot! ~")
			attacker:EmitSound("vo/the one and only.wav") -- Happy Easter
			-- Might change if its too annoying outloud, change to player only heard
		end
	else
		if CLIENT then 
			killicon.AddFont( self.ClassName, self.FontPre .. self.IconFont .. self.FontPost, self.IconLetter, self.IconColor or Color( 255, 80, 0, 255 ) ) 
		end
		-- Still need this
	end
	--ErrorNoHalt("CALLED")
end 


--[[---------------------------------------------------------
   Name: PenetrateBullet( )
   Desc: A convenience function for handling bullet penetrating.
-----------------------------------------------------------]]

DEBUG_GMODCSS_WEAPON_PENETRATION = false
DEBUG_GMODCSS_WEAPON_PENETRATION_PRINT = false
DEBUG_GMODCSS_WEAPON_PENETRATION_OVERLAY_LIFE = 5
GMODCSS_MAX_BULLET_PENETRATION = 35 --units
GMODCSS_MAX_BULLET_PENETRATION_SEGMENTS = 10

GMODCSS_BULLET_PENETRATION_MATRATES = {}
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_COMPUTER] = 2.5
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_CONCRETE] = 2
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_DIRT] = 1.66666
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_FLESH] = 1.11111
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_FOLIAGE] = 1.05263
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_GLASS] = 1.01010
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_GRATE] = 1.05263
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_SNOW] = 1.17647
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_METAL] = 2.5
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_PLASTIC] = 1.42857
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_SAND] = 5
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_TILE] = 1.05263
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_VENT] = 1.66666
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_WOOD] = 1.11111

GMODCSS_BULLET_PENETRATION_MATTHICKNESS = {}
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_COMPUTER] = 0.1
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_CONCRETE] = nil
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_DIRT] = nil
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_FLESH] = nil
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_FOLIAGE] = nil
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_GLASS] = 0.5
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_GRATE] = 0.5
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_SNOW] = nil
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_METAL] = 0.1
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_PLASTIC] = 0.25
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_SAND] = nil
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_TILE] = 0.5
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_VENT] = 0.04
GMODCSS_BULLET_PENETRATION_MATRATES[MAT_WOOD] = nil

	-- RAUBANA --
function GetNewDamage(basedmg, material, penetration_distance)
	local rate_of_loss = 1
	if GMODCSS_BULLET_PENETRATION_MATRATES[material] != nil then 
		rate_of_loss = GMODCSS_BULLET_PENETRATION_MATRATES[material]
	end
	rate_of_loss = rate_of_loss * 1.25
	
	local dist = penetration_distance
	if GMODCSS_BULLET_PENETRATION_MATTHICKNESS[material] != nil then
		dist = math.min(dist,GMODCSS_BULLET_PENETRATION_MATTHICKNESS[material])
	end
	
	local dmg = basedmg - (rate_of_loss * dist) - 5 -- 1
	if dmg < 0 then return 0 end
	return dmg
end

function PenetrateCallBackGroup( ply, tr, dmginfo )
	PenetrateBullet( ply, tr, dmginfo )
	OnHeadshot(ply, tr, false) -- Just to stay consistent
	-- Dont bother with ignite
end

function PenetrateBullet( ply, tr, dmginfo )
	--local ply = self.Owner
	--local HalfDamageDistance = 
	
	
	
	if DEBUG_GMODCSS_WEAPON_PENETRATION then
		debugoverlay.Line(tr.StartPos, tr.HitPos, DEBUG_GMODCSS_WEAPON_PENETRATION_OVERLAY_LIFE, Color(255,0,0), true)
		if tr.Hit then
			debugoverlay.Axis(tr.HitPos, tr.HitNormal:Angle(), 2, DEBUG_GMODCSS_WEAPON_PENETRATION_OVERLAY_LIFE, true)
		end
	end
	
	--We do a trace to determine how far the bullet would need to penetrate before exiting the object it hit.
	local penet_start = tr.HitPos + (tr.Normal*0.2)
	local penet_end = tr.HitPos + (tr.Normal*GMODCSS_MAX_BULLET_PENETRATION)
	
	local penet_tr = util.TraceLine({	start = penet_start,
									endpos = penet_end
									})
	
	if DEBUG_GMODCSS_WEAPON_PENETRATION then
		debugoverlay.Line(penet_start, penet_end, DEBUG_GMODCSS_WEAPON_PENETRATION_OVERLAY_LIFE, Color(255,127,0), true)
	end
	
	local exit_point = nil
	
	local halflife = 1024
	local infl_wep

	if ply:IsWeapon() then
		infl_wep = ply
	else
		infl_wep = ply:GetActiveWeapon()
	end

	if IsValid(infl_wep) and isnumber(infl_wep.HalfDamageDistance) then
		halflife = infl_wep.HalfDamageDistance
	end
	local dist = tr.StartPos:Distance(dmginfo:GetDamagePosition())
	local scale = math.pow(0.5, dist/halflife)
	
	local remaining_damage = scale * GetNewDamage(dmginfo:GetDamage(), tr.MatType, penet_tr.FractionLeftSolid*GMODCSS_MAX_BULLET_PENETRATION )
	
	if DEBUG_GMODCSS_WEAPON_PENETRATION_PRINT then
		print("START",tr.StartPos,tr.HitPos,tr.Hit,tr.StartSolid,tr.Normal,tr.HitNormal)
		print("PENET",penet_tr.StartPos,penet_tr.HitPos,penet_tr.Hit,penet_tr.StartSolid,penet_tr.Normal,penet_tr.HitNormal,penet_tr.FractionLeftSolid)
	end
	
	
	if penet_tr.StartSolid and penet_tr.FractionLeftSolid == 0 then
		--We need to do several segmented traces until we find our exit point.
		
		if DEBUG_GMODCSS_WEAPON_PENETRATION_PRINT then print("...segmenting trace...") end
		
		for i = 0, GMODCSS_MAX_BULLET_PENETRATION_SEGMENTS do		
			if DEBUG_GMODCSS_WEAPON_PENETRATION_PRINT then print("...",i) end
			
			local sp = LerpVector(i/GMODCSS_MAX_BULLET_PENETRATION_SEGMENTS,penet_start,penet_end)
			local ep = LerpVector((i+1)/GMODCSS_MAX_BULLET_PENETRATION_SEGMENTS,penet_start,penet_end)
			local penet_segm_tr = util.TraceLine({	start = sp,
									endpos = ep
									})
			remaining_damage = GetNewDamage(dmginfo:GetDamage(), tr.MatType, (i/GMODCSS_MAX_BULLET_PENETRATION_SEGMENTS)*GMODCSS_MAX_BULLET_PENETRATION )
			if not penet_segm_tr.StartSolid then
				exit_point = sp
				break
			end
			if remaining_damage <= 0 then
				break
			end
		end
	else
		exit_point = LerpVector(penet_tr.FractionLeftSolid,penet_tr.StartPos,penet_tr.HitPos)
	end
	
	-- Assuming the trace did, in fact, start in a solid environment,
	-- and assuming it did leave that environment,
	-- we use the FractionLeftSolid variable to begin our next bullet.
	
	if DEBUG_GMODCSS_WEAPON_PENETRATION_PRINT then print("...DMG:",remaining_damage) end
	
	local dmgf = 2
	local car = dmginfo.Entity
	if IsValid(car) and car:IsVehicle() and( ply == car:GetDriver() ) then
		dmgf = 1
	end
	
	if remaining_damage > 0 and exit_point != nil then
		local bullet 		= {}
		bullet.Num    		= 1
		bullet.Src    		= exit_point
		bullet.Dir    		= tr.Normal
		local shifty 		= 0.012
		bullet.Spread 		= Vector(0.128, math.Rand(-1*shifty,shifty), 0) -- Randomize by N? X&Y only...
		bullet.Tracer 		= 0 -- Hmmm...
		bullet.TracerName 	= nil -- Tracers[GetConVarNumber("swep_tracer")]
		bullet.Force  		= remaining_damage/2
		bullet.Damage 		= remaining_damage
		bullet.AmmoType		= dmginfo:GetAmmoType()
		bullet.Callback 	= PenetrateCallBackGroup
		
		ply:FireBullets(bullet)
		
		--[[
			bullet.Num 			= numbul
	bullet.Src 			= self.Owner:GetShootPos()			-- Source
	bullet.Dir 			= dir1		-- Dir of bullet
	bullet.Spread 		= Vector( cone*0.5, cone*1, 0 )	
	-- Aim Cone
	bullet.Tracer		= 2		-- Show a tracer on every 1/x bullets 
	bullet.TracerName	= Tracers[GetConVarNumber("swep_tracer")]
	-- LETS USE SOME CALCULATIONS
	bullet.Force		= (dmg/2) -- Force applied to target
	bullet.Damage		= dmg
	bullet.AmmoType		= Ammo
		--]]
		
	else
		if DEBUG_GMODCSS_WEAPON_PENETRATION_PRINT then print("Ran out of damage") end
		--self:DebugTalk("[b] Bullet ran out of penetration damage")
	end
end

util.PrecacheModel("models/weapons/w_pist_223_mag.mdl")
util.PrecacheModel("models/weapons/w_pist_cz_75_mag.mdl" )
util.PrecacheModel("models/weapons/w_pist_deagle_mag.mdl" )
util.PrecacheModel("models/weapons/w_pist_elite_mag.mdl" )
util.PrecacheModel("models/weapons/w_pist_fiveseven_mag.mdl" )
util.PrecacheModel("models/weapons/w_pist_glock18_mag.mdl" )
util.PrecacheModel("models/weapons/w_pist_hkp2000_mag.mdl" )
util.PrecacheModel("models/weapons/w_pist_p250_mag.mdl" )
util.PrecacheModel("models/weapons/w_pist_tec9_mag.mdl" )
util.PrecacheModel("models/weapons/w_rif_ak47_mag.mdl" )
util.PrecacheModel("models/weapons/w_rif_aug_mag.mdl" )
util.PrecacheModel("models/weapons/w_rif_famas_mag.mdl" )
util.PrecacheModel("models/weapons/w_rif_galilar_mag.mdl" )
util.PrecacheModel("models/weapons/w_rif_m4a1_mag.mdl" )
util.PrecacheModel("models/weapons/w_rif_m4a1_s_mag.mdl" )
util.PrecacheModel("models/weapons/w_rif_sg556_mag.mdl" )
util.PrecacheModel("models/weapons/w_shot_mag7_mag.mdl" )
util.PrecacheModel("models/weapons/w_smg_bizon_mag.mdl" )
util.PrecacheModel("models/weapons/w_smg_mac10_mag.mdl" )
util.PrecacheModel("models/weapons/w_smg_mp5sd_mag.mdl" )
util.PrecacheModel("models/weapons/w_smg_mp7_mag.mdl" )
util.PrecacheModel("models/weapons/w_smg_mp9_mag.mdl" )
util.PrecacheModel("models/weapons/w_smg_p90_mag.mdl" )
util.PrecacheModel("models/weapons/w_smg_ump45_mag.mdl" )
util.PrecacheModel("models/weapons/w_snip_awp_mag.mdl" )
util.PrecacheModel("models/weapons/w_snip_g3sg1_mag.mdl" )
util.PrecacheModel("models/weapons/w_snip_scar20_mag.mdl" )
util.PrecacheModel("models/weapons/w_mach_negev_mag.mdl" )
util.PrecacheModel("models/weapons/w_mach_m249_mag.mdl" )
util.PrecacheModel("models/shells/garand_clip.mdl")
util.PrecacheModel("models/Items/BoxBuckshot.mdl")

