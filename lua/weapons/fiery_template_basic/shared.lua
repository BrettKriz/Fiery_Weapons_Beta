/*=====================================*\
		Fiery Template - Basic Weapon
		
	This template is useful for
	creating absolutely ANY weapon
	
	For Dual weilded weapons (akimbo)
	Please use the AKIMBO template!
	
	For weapons that MUST have 
	features or systems not ALREADY
	included, please use a more 
	advanced template!
		
		Nova Prospekt - Fiery Weapons
\*=====================================*/

if ( SERVER ) then
	AddCSLuaFile( "shared.lua" ) -- Don't Touch!
	
	
	-- Uncomment and duplicate this line to include models and mats
	-- in server downloads!
	-- resource.AddFile("models/weapons/v_.mdl")
	-- resource.AddFile("models/weapons/w_.mdl")
end
-- Edit ALL of these values!  Otherwise there will be kill icon or display errors!
	SWEP.PrintName			= "WEAPON NAME"			
	SWEP.Author				= "Nova Prospekt" -- Wait a minute, whooo areee youuuu?
	SWEP.Slot				= 0 -- Position on Keyboard, 1 - 6
	SWEP.SlotPos			= 10 -- An anchoring number in a slot
	SWEP.IconLetter			= "CHANGE ME" -- Kill icon letter in KillIcon Font
	SWEP.WepSelectLetter	= "CHANGE ME" -- Select icon letter in KillIocn Font (Might be the same)
	SWEP.WepFolderPath		= "weapon_ CHANGE ME!" -- What's the name of the folder this shared.lua is in?
	-- No need to add a KillIcon here, its auto

-- SWEP META Settings --
SWEP.Base					= "weapon_fiery_base_templated"
SWEP.Category				= "Fiery"
SWEP.Spawnable				= true -- Restrict User Access?
SWEP.AdminSpawnable			= true -- false for Super Admin only 

-- SWEP Model & Animation Settings --
SWEP.ViewModel				= "models/weapons/v_pist_deagle.mdl"
SWEP.ViewModelFlip			= true -- Left handed or Right?
SWEP.UseHands				= false -- Are we using a C model? (As apposed to a V model)

SWEP.WorldModel				= "models/weapons/w_alyxgun.mdl"
SWEP.Weight					= 5 -- How much does this weapon weigh? (Measured in LBs)

SWEP.HoldType				= "magic" -- The hold type used while in Sights/Scope
SWEP.HoldType2				= "hipfire2" -- The hold type used during hipfire
SWEP.ReloadHoldType			= "smg" -- The hold type used during reloads

-- SWEP Misc Functionalities
-- Reload Settings --
SWEP.ReloadSound			= Sound( "" ) -- SOME weapons need to play sounds for reloads (list path from sound/ and include .wav)

-- Primary Attack Settings --
SWEP.Primary.Sound			= Sound( "Weapon_pistol.Single" )
SWEP.Primary.Recoil			= 5.05		-- CHANGE ME!
SWEP.Primary.Damage			= 2   		-- CHANGE ME!
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.05 		-- CHANGE ME!
SWEP.Primary.ClipSize		= 15		-- CHANGE ME!
SWEP.Primary.Delay			= 0.08		-- CHANGE ME!
SWEP.Primary.Automatic		= false		
SWEP.Primary.Ammo			= "XBowBolt"	-- CHANGE ME!

--							YOUR VALUES HERE!		
SWEP.IronSightsPos 			= Vector(4.517, 0, 3.319)
SWEP.IronSightsAng 			= Vector(-0.101, 0.1, 0)

SWEP.DoesIdle				= true -- Does this view model have an Idle animation?
SWEP.DryFires				= false -- Does this view model have a "Dryfire" animation? (CS:S viewmodels mostly)
SWEP.WorksUnderWater		= false

-- If you dont know what "DoD:S" is, just delete the code below --

SWEP.DoDModelFunction		= false -- Are you using a DoD:S view model?

SWEP.DoDWeaponDraw			= false -- Do you want to draw a DOD icon instead of CS:S?
SWEP.HL2WeaponDraw			= false -- Do you want to draw a HL2 icon instead of CS:S?