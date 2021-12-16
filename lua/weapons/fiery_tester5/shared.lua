
if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if ( CLIENT ) then

	SWEP.PrintName			= "TESTER 5 - SafeTimer VS ThinkTimer"			
	SWEP.Author				= "Nova Prospekt"
	SWEP.Slot				= 4
	SWEP.SlotPos			= 20
	SWEP.IconLetter			= "t"
	SWEP.WepSelectLetter	= "t"
	
	killicon.AddFont( "fiery_tester5", "CSKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ) )
	
end


SWEP.Base					= "weapon_fiery_base"
SWEP.Category				= "Fiery Dev"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.HoldType				= "357"
SWEP.HoldType2				= "pistol"

SWEP.HoldType3				= "smg"
SWEP.HoldType4				= "hipfire1"

SWEP.HoldType5				= "ar2"
SWEP.HoldType6				= "hipfire1"

SWEP.ViewModel				= "models/weapons/v_pistol.mdl"
--SWEP.ViewModel				= "models/weapons/v_pistol.mdl"
SWEP.WorldModel				= "models/weapons/w_pistol.mdl"

SWEP.Mag					= "models/weapons/w_pist_elite_mag.mdl" -- "models/props_c17/TrapPropeller_Lever.mdl" 
SWEP.ViewModelFlip			= false

SWEP.Weight					= 1
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound			= Sound( "Weapon_Glock.Single" )
SWEP.Primary.Recoil			= 0.9
SWEP.Primary.Damage			= 36
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 25
SWEP.Primary.Delay			= 1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357"

SWEP.DryFires				= true -- Unlock Dry Fire

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos = Vector(-6.281, -2, 1.32)
SWEP.IronSightsAng = Vector(0.2, -0.201, -2.5)

/*---------------------------------------------------------
	Animation Index
---------------------------------------------------------*/

SWEP.Primary.EmptyAnim		= ACT_VM_DRYFIRE
SWEP.Primary.ShootAnim		= ACT_VM_PRIMARYATTACK

SWEP.Secondary.EmptyAnim	= ACT_VM_FIDGET
SWEP.Secondary.ShootAnim	= ACT_VM_SECONDARYATTACK

SWEP.ReloadAnim				= ACT_VM_RELOAD
SWEP.EmptyReloadAnim		= ACT_VM_RELOAD

SWEP.DrawAnim				= ACT_VM_DRAW
SWEP.EmptyDrawAnim			= ACT_VM_DRAW

SWEP.EmpytyIdleAnim			= ACT_VM_IDLE
SWEP.IdleAnim 				= ACT_VM_IDLE
/*---------------------------------------------------------*/

local wait_time = 5
local THE_NAME = "Tester5_Var"
local THE_VALID = "_Valid"

SWEP.sl	= {}
function SWEP:Initialize()

	self:StandardInitialize() -- Make it easy for moders

	self:ResetTimers(true) -- Initialize
	
end

function SWEP:Deploy()
	self:StandardDeploy()
	self.Weapon:SetHoldType(self.HoldType)
	
	self:ThinkResetTestAndSet()
	self:ResetTimers()
end

function SWEP:ResetTimers(doAll)
	
	self:ResetTimer(THE_NAME)
	
	if doAll then
		-- Initialize all Timers to 0.0
		self:Talk("Initialize doAll zone")
	end
end

function SWEP:ResetTimer(TName)
	-- Trust that the client doesnt make a bunch of new NW vars
	self.Weapon:SetNWBool( (TName) .. THE_VALID, false )
	self.Weapon:SetNWFloat( (TName) , 0 )
	
end

function SWEP:SetTimer(TName, TAdd)
	if TAdd <= 0.0 then
		self:DebugTalk("Cant SetTimer() with TAdd = " .. tostring(TAdd))
		self.Weapon:SetNWBool( tostring(TName) .. THE_VALID, false )
		return
	end
	
	self.Weapon:SetNWFloat( tostring(TName) , CurTime() + TAdd )
	self.Weapon:SetNWBool( tostring(TName) .. THE_VALID, true )
end

function SWEP:PrimaryAttack()
	self:Talk("SAFE TIMER START: " .. tostring(CurTime()) .. " Expected at: " .. (CurTime()+wait_time) )
	self:Talk(" . . .")
	self:SafeTimer( wait_time , function()
		self:Talk("SAFE TIMER END: " .. tostring(CurTime()) )
	end)
end

function SWEP:SecondaryAttack()
		self:Talk("THINK TIMER START: " .. tostring(CurTime()) .. " Expected at: " .. (CurTime()+wait_time) )
		self:Talk(" . . .")
		self:SetTimer( THE_NAME, wait_time )
end

function SWEP:EndGoalFunc()
	if SERVER then
		self:Talk("THINK TIMER SV END: " .. tostring(CurTime()) )
		EmitSound( Sound( "vo/the one and only.wav" ), self.Weapon:GetPos(), 1, CHAN_AUTO, 1, 75, 0, 100 )
	elseif CLIENT then
		self:Talk("THINK TIMER CL END: " .. tostring(CurTime()) )
		self:VMact( "PRIMARY" ) 
	else
		ErrorNoHalt("Something went wrong at EndGoalFunc()? \n")
	end

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
	local cur = THE_NAME

	if self.Weapon:GetNWBool( cur..THE_VALID, false ) == true then
		-- Now that we know the signal is valid, bring in the float
		local a1, a2
		a1 = ( self.Weapon:GetNWFloat( cur , 0 ) ) -- math.floor
		a2 = CurTime()
		
		-- self.Weapon:GetNetworkedInt( cur ) < CurTime()
		if a1 < a2 then
			-- Do the thing
			
			if self.Weapon:GetNWBool( cur..THE_VALID, false ) ~= true then return end
			self:ResetTimer(cur)
			ErrorNoHalt("->  Status: " .. tostring(self.ThinkLockout) .. " Diff: " .. tostring(a2 - a1) .. " VALID? " ..tostring( self.Weapon:GetNWBool( (THE_NAME) .. THE_VALID, false ) ).. " Float? " ..tostring( self.Weapon:GetNWFloat( (THE_NAME) , -1 ) ).. "\n")

			self:EndGoalFunc()
		end
		
	end
end
