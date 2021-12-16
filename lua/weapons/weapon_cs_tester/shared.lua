/*=====================================*\
		NOVA PROSPEKT ~ 3/20/2014
\*=====================================*/

if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
	-- CreateClientConVar("cl_fiery_holdtype", "357", true, false)
end

if ( CLIENT ) then

	SWEP.PrintName			= "Fiery/CS Tester"			
	SWEP.Author				= "Nova Prospekt"
	
	SWEP.Slot				= 1
	SWEP.SlotPos			= 5
	SWEP.IconLetter			= "fire"
	
	SWEP.DrawAmmo			= true
	SWEP.DrawCrosshair		= false
	SWEP.CSMuzzleFlashes	= true
	SWEP.IconColor			= Color( 255, 120, 45, 255 )
	
	killicon.AddFont( "weapon_cs_tester", "CSKillIcons", SWEP.IconLetter, SWEP.IconColor )
	
end


SWEP.Base				= "weapon_fiery_base"
SWEP.Category			= "Fiery Dev"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.HoldType			= "smg"
SWEP.ViewModel			= "models/weapons/v_pist_deagle.mdl"
SWEP.ViewModelFlip		= false
SWEP.ViewModelFOV		= 100
SWEP.WorldModel			= "models/weapons/w_pist_usp_silencer.mdl"

SWEP.Weight				= 2
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound( "Weapon_usp.Single" )
SWEP.Primary.Recoil			= 2.1
SWEP.Primary.Damage			= 20
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.035
SWEP.Primary.ClipSize		= 12
SWEP.Primary.Delay			= 0.05
-- SWEP.Primary. DefaultClip -- OBSOLEET!	= 24
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"

SWEP.Primary.Chambered		= nil 


SWEP.Secondary.Sound		= nil
SWEP.Secondary.Reload		= nil
SWEP.Secondary.Recoil		= 1.5
SWEP.Secondary.Damage		= 5
SWEP.Secondary.NumShots		= 0
SWEP.Secondary.Cone			= 0.02
SWEP.Secondary.Delay		= 0.15
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Chambered	= nil 


SWEP.IronSightsPos = Vector(-5.845, 0, 2.64)
SWEP.IronSightsAng = Vector(0, 0.125, 0)

// Function Toggles
SWEP.DoesIdle				= true
SWEP.DoDModelFunction		= false
SWEP.ShotgunFunctions		= false
--SWEP.DryFires				= (SWEP.Primary.Ammo == "pistol") or (SWEP.Primary.Ammo == "357") or (SWEP.Primary.Ammo == "alyxgun") ; -- Evaluates for a bool
SWEP.DryFires				= true
-- Modify toggles
SWEP.Silencer				= nil 	--{false} -- Booled on and off
SWEP.FireModes				= nil 	--{1,1,2,3} -- As in, ON 1 of options 1,2,3; 1 and 1 will just be whatever; 3 and 1 will initially have it on that setting
SWEP.Bipod					= nil 	--{false} -- Booled on and off
SWEP.Melee					= nil	-- If clip is 0 then melee will be primary
SWEP.Launcher				= nil 	-- or info table
SWEP.DoubleShot				= false -- Just a bool
SWEP.HMG					= nil	--{0} -- Might be used to show heat?
SWEP.Heat					= 60	--{0.000} -- Winds up

SWEP.IronSightsPos = Vector(0, 0, 0)
SWEP.IronSightsAng = Vector(10, 0, 0)
/*---------------------------------------------------------
	Animation Index
---------------------------------------------------------*/
// Normal animations found in MOST pistols and some rifles
	SWEP.Primary.EmptyAnim		= ACT_VM_DRYFIRE
	SWEP.Primary.ShootAnim		= ACT_VM_PRIMARYATTACK

	// If the weapon should be held like a shotgun when not in iron sight
	// If the held animation is crossbow, then it will be held like an AR2


	SWEP.Secondary.EmptyAnim	= ACT_VM_FIDGET			 // No dryfire anims for secondary attacks(normally)
	SWEP.Secondary.ShootAnim	= ACT_VM_SECONDARYATTACK // Melee, Special action, Secondary fire
	// Abnormal reload, as in HL2 and DODS style pistol reloads
	SWEP.ReloadAnim				= ACT_VM_RELOAD
	SWEP.EmptyReloadAnim		= ACT_VM_RELOAD_EMPTY
	// Once agian, Abnormal as defined above
	SWEP.DrawAnim				= ACT_VM_DRAW
	SWEP.EmptyDrawAnim			= ACT_VM_DRAW_EMPTY
	// Most Pistol, rifle, and shotgun models have these animations... Because VALVe modelers are smart!lol
	SWEP.EmpytyIdleAnim			= ACT_VM_IDLE_EMPTY
	SWEP.IdleAnim 				= ACT_VM_IDLE



	-- STANDARD ANIMATIONS
	ActIndex = {
	[ "pistol" ] 		= ACT_HL2MP_IDLE_PISTOL, -- NOT PURE PISTOL
	[ "onehand" ] 		= ACT_HL2MP_IDLE_PISTOL, -- PURE HL2/DOD PISTOL
	[ "smg" ] 			= ACT_HL2MP_IDLE_SMG1,
	[ "grenade" ] 		= ACT_HL2MP_IDLE_GRENADE,
	[ "ar2" ] 			= ACT_HL2MP_IDLE_AR2,
	[ "shotgun" ] 		= ACT_HL2MP_IDLE_SHOTGUN,
	[ "rpg" ]	 		= ACT_HL2MP_IDLE_RPG,
	[ "physgun" ] 		= ACT_HL2MP_IDLE_PHYSGUN,
	[ "crossbow" ] 		= ACT_HL2MP_IDLE_CROSSBOW,
	[ "melee" ] 		= ACT_HL2MP_IDLE_MELEE,
	[ "slam" ] 			= ACT_HL2MP_IDLE_SLAM,
	[ "normal" ]		= ACT_HL2MP_IDLE,
	[ "fist" ]			= ACT_HL2MP_IDLE_FIST,
	[ "melee2" ]		= ACT_HL2MP_IDLE_MELEE2,
	[ "passive" ]		= ACT_HL2MP_IDLE_PASSIVE,
	[ "knife" ]			= ACT_HL2MP_IDLE_KNIFE,
	[ "duel" ]			= ACT_HL2MP_IDLE_DUEL,
	[ "dual" ]			= ACT_HL2MP_IDLE_DUEL,
	[ "camera" ]		= ACT_HL2MP_IDLE_CAMERA,
	[ "magic" ]			= ACT_HL2MP_IDLE_MAGIC,
	[ "revolver" ]		= ACT_HL2MP_IDLE_REVOLVER,	
	[ "357" ]			= ACT_HL2MP_IDLE_REVOLVER,	
	

	-- Add alias
	["rifle"] 						= ACT_HL2MP_IDLE_AR2,
	["grip"] 						= ACT_HL2MP_IDLE_SMG1,
	["mg"]	 						= ACT_HL2MP_IDLE_RPG,
	["hipfire1"] 					= ACT_HL2MP_IDLE_CROSSBOW,
	["hipfire2"] 					= ACT_HL2MP_IDLE_SHOTGUN,
	["magnum"] 						= ACT_HL2MP_IDLE_REVOLVER,
	["revolver"] 					= ACT_HL2MP_IDLE_REVOLVER,
	
	-- Add Special Dynamic Holdtype
	[ "pistol_police" ]				= ACT_HL2MP_IDLE_REVOLVER,	
	
	-- Add Keys for Automation
	["ducking_rifle_aim"] 			= ACT_HL2MP_IDLE_AR2,
	["ducking_rifle_hipfire"] 		= ACT_HL2MP_IDLE_CROSSBOW,
	["ducking_handgun_hipfire"] 	= ACT_HL2MP_IDLE_REVOLVER,
	[ "ducking_handgun_aim" ] 		= ACT_HL2MP_IDLE_PISTOL,
	[ "jumping_handgun_hipfire" ] 			= ACT_HL2MP_IDLE_PISTOL,
	["jumping_handgun_aim"] 	= ACT_HL2MP_IDLE_REVOLVER,
	[ "grenade_idle" ] 				= ACT_HL2MP_IDLE_SLAM
} -- END LIST

CreateConVar("swep_X","0",FCVAR_NEVER_AS_STRING,"Just for iteration man, thats it and thats all man")
function SWEP:SecondaryAttack()
	--self:TestAnims()
	--self:CycleHolds()
	self:TestFunc2()
--	self:SetIronsights( !self.Weapon:GetNetworkedBool( "Ironsights", false ) )
end	
function SWEP:TestFunc1()
	local x = self:WorldIsCold()
	self:Talk("World is Cold? " .. tostring(x))
end
function SWEP:TestFunc2()
	self:Talk("Testing Func2")
	self:VMact(ACT_VM_RELOAD)
	--if self.Weapon:Clip1() < 1 then
		
		local spd = 0.001
		local time = self:GetSeqDur()
		local ratio = 0.2
		local frames		= time * 30
		local framess		= math.ceil(frames*ratio)/spd	-- sectional FPS
		local a = time* ratio
		local c = (frames*ratio)
		
		local adjust = frames / spd
		
	
		self.Owner:GetViewModel():SetPlaybackRate( 433 ) -- framess
		local b =(self.Owner:GetPlaybackRate() * 30) * c 
		
		self:Talk("VALUES: "..tostring(adjust).." | "..tostring(spd).. " |Total Frames "..tostring(frames))
		self:Talk("b: "..tostring(b).." |Time: "..tostring(time).." ~+~+~ "..tostring(framess))
		self:Talk("Curtime: "..tostring(CurTime()).." ~~~ ".." |PBR "..tostring(self.Owner:GetPlaybackRate()).." |\n~~~~~~~~~~~~~~~~~~~~~~~~")
		timer.Simple(0.0001,function()
			self:Talk("Meow "..tostring(CurTime()).." | "..tostring(self:GetSeqDur()).." |PBR "..tostring(self.Owner:GetPlaybackRate()))
			self.Owner:GetViewModel():SetPlaybackRate(1)
			
		end)
	--end
end
function SWEP:CycleHolds()
		local X = GetConVarNumber("swep_X")
	
	if (X >= #ActIndex) then X = 0 end
	local arg = ActIndex[X]
	self:Talk(tostring(arg) .. " #" .. X)
	self:SetWeaponHoldType(arg)
	X = X+1
	-- @@@ jesus christ...
	
end
function SWEP:Sights()
	
	
	
	
end

function SWEP:Deploy() -- <<<<<<<
	--self:Beep()
	self:Talk(self.HoldType)
end

