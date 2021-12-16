
if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if ( CLIENT ) then

	SWEP.PrintName			= "TESTER 4\nV&W Anim Sync"			
	SWEP.Author				= "Nova Prospekt"
	SWEP.Slot				= 4
	SWEP.SlotPos			= 20
	SWEP.IconLetter			= "t"
	SWEP.WepSelectLetter	= "t"
	
	killicon.AddFont( "fiery_tester4", "CSKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ) )
	
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

SWEP.ViewModel				= "models/ctf_weapons/v_alyx_gun.mdl"
--SWEP.ViewModel				= "models/weapons/v_pistol.mdl"
SWEP.WorldModel				= "models/weapons/w_alyx_gun.mdl"

SWEP.Mag					= "models/weapons/w_pist_elite_mag.mdl" -- "models/props_c17/TrapPropeller_Lever.mdl" 
SWEP.ViewModelFlip			= false

SWEP.Weight					= 1
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound			= Sound( "weapons/alyxgun/alyx_gun_fire"..tostring(math.floor(math.random(4,6)+0.5))..".wav" )
SWEP.Primary.Recoil			= 0.9
SWEP.Primary.Damage			= 36
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 25
SWEP.Primary.Delay			= 0.092
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos = Vector(-6.281, -2, 1.32)
SWEP.IronSightsAng = Vector(0.2, -0.201, -2.5)

/*---------------------------------------------------------
	Animation Index
---------------------------------------------------------*/

SWEP.Primary.EmptyAnim		= "fire3"
SWEP.Primary.ShootAnim		= "fire1"

SWEP.Secondary.EmptyAnim	= ACT_VM_FIDGET
SWEP.Secondary.ShootAnim	= ACT_VM_SECONDARYATTACK

SWEP.ReloadAnim				= ACT_VM_RELOAD
SWEP.EmptyReloadAnim		= ACT_VM_RELOAD

SWEP.DrawAnim				= ACT_VM_DRAW
SWEP.EmptyDrawAnim			= ACT_VM_DRAW

SWEP.EmpytyIdleAnim			= ACT_VM_IDLE
SWEP.IdleAnim 				= ACT_VM_IDLE
/*---------------------------------------------------------*/


SWEP.sl	= {}
function SWEP:Initialize()
	self.Weapon:SetNWInt("test4_index", 1)
	self.Weapon:SetNWInt("test4_index2", 1)
	self:StandardInitialize() -- Make it easy for modders
end

function SWEP:Deploy()
	--self:StandrdDeploy()
	self.Weapon:SetHoldType(self.HoldType)
	
	local b = true
	local a = !false
	
	if b then -- Adjust for SERVER
		--if CLIENT and a then
			ErrorNoHalt( "\n\nVIEW MODEL Sequence List:\n" )
			local vm = self.Owner:GetViewModel()
			
			--vm:SetSkin( vms ) -- Set View Model
			local vsl = vm:GetSequenceList()
			for x=1, #vsl, 1 do
				ErrorNoHalt( "#"..x.." \t "..tostring(vsl[x]).."\n")
			end
		--end
		self.sl = self.Weapon:GetSequenceList() -- 3 - 8
		ErrorNoHalt( "\n\nSequence List:\n" )
		for x=1, #self.sl, 1 do
			ErrorNoHalt( "#"..x.." \t "..tostring(self.sl[x]).."\n")
		end
		--self.Weapon:SetSkin( wms ) -- Set World Model 
		--self.Weapon:SetAnimation( sl[4] or 1 )
		local i = self.Weapon:GetNWInt("test4_index", 1)
		local animtbl = { "fire2", "fire1", "fireempty" }
		
		self.Weapon:SetSequence( animtbl[i] or "fire2" )
	end
end

function SWEP:SecondaryAttack()
	local i = self.Weapon:GetNWInt("test4_index", 1)
	local animtbl = { "fire2", "fire1", "fireempty" }
	--local s = #self.sl
	local s = #animtbl
	
	local i2 = self.Weapon:GetNWInt("test4_index2", 1)
	local vm = self.Owner:GetViewModel()
	local vmsl = vm:GetSequenceList()
	local s2 = #vmsl
	
	if i >= math.min(s, 6) then
		i = 1
		self:DebugTalk("\n~~~~~~~~~~~~~~~~~")
	else
		i = i +1
		self:DebugTalk("\n\n")
	end
	self.Weapon:SetNWInt("test4_index", i)
	
	if i2 >= s2 then
		i2 = 1
		self:DebugTalk("\n2~~~~~~~~~~~~~~~~~")
	else
		i2 = i2 +1
		self:DebugTalk("\n2\n")
	end
	self.Weapon:SetNWInt("test4_index2", i2)
	
	local arg = tostring( animtbl[i] )
	local arg2 = tostring( vmsl[i2] )
	
	if arg == "fire1" then
		-- SMG
		--fire3
		self:DebugTalk("SMG Mode")
		self.Weapon:SetHoldType( self.HoldType3 ) -- Add code to arms down 
		self.Primary.Automatic		= true
	elseif arg == "fire2" then
		-- PISTOL
		--fire2
		self:DebugTalk("PISTOL MODE")
		self.Weapon:SetHoldType( self.HoldType )
		self.Primary.Automatic		= not true
	elseif arg == "fireempty" then
		--fireempty
		self:DebugTalk("RIFLE MODE")
		self.Primary.Automatic		= true
		self.Weapon:SetHoldType( self.HoldType5 )
	else
		ErrorNoHalt("[!] Out of boumnds detected")
	end
	
	self.Weapon:SetSequence( arg or "smg_idle01" )
	self:DebugTalk("Now playing #"..tostring(i).." : " .. tostring(self.sl[i]) .. "\n")
	
	-- Deal with VMar arg2
	--if CLIENT then
		vm:SetSequence( arg2 )
		--ErrorNoHalt("ARG2: "..tostring(arg2).."\n")
	--end
	self:Talk("ARG2: "..tostring(arg2).."\n")
end

--[[--
VMacts

draw
drawempty
fire
fire1
fire2
fire3
fireempty
holster
holsterempty
idle01
idle01empty
idletolow
lowidle
pistol2SMG
reload
SMG2pistol
smg_draw
smg_drawempty
smg_fire
smg_fire1
smg_fire2
smg_fire3
smg_fireempty
smg_holster
smg_holsterempty
smg_idle01
smg_idleo1empty
smg_idletolow
smg_lowidle
smg_lowtoidle
smg_reload

Sequence List:
#1 	 	idle01empty
#2 		 fire
#3 	 	fire1
#4 	 	fire2
#5 	 	fire3
#6 	 	fireempty
#7 	 	draw
#8 	 	drawempty
#9 	 	reload
#10 	 holster
#11 	 holsterempty
#12 	 idletolow
#13 	 lowtoidle
#14 	 lowidle
#15 	 pistol2SMG
#16 	 SMG2pistol
#17 	 smg_idle01
#18 	 smg_idle01empty
#19 	 smg_fire
#20 	 smg_fire1
#21 	 smg_fire2
#22 	 smg_fire3
#23 	 smg_fireempty
#24 	 smg_draw
#25 	 smg_drawempty
#26 	 smg_reload
#27 	 smg_holster
#28 	 smg_holsterempty
#29 	 smg_idletolow
#30 	 smg_lowtoidle
#31 	 smg_lowidle

--]]--