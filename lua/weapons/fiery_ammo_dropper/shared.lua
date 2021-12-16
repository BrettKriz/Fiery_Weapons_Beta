/*=====================================*\
		NOVA PROSPEKT ~ 9/5/2020
\*=====================================*/

if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if ( CLIENT ) then

	SWEP.PrintName			= "Handout Ammo"
	SWEP.Author				= "Nova Prospekt"
	SWEP.Note				= "Because ammo transfer shouldn't be hard!\n By default Reload will give you the current ammo type!\nOtherwise it will come from your ammo!"
	
	SWEP.Slot				= 5 -- last col
	SWEP.SlotPos			= 10
	SWEP.IconLetter			= "v" -- v CounterStrike 
	SWEP.SelectIconLetter	= "v"
	SWEP.SelectIconLetter2	= "_" -- p csd
	SWEP.ViewModelFOV		= 90
	

end

SWEP.Base					= "weapon_fiery_base"
SWEP.Category				= "Fiery Tools"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.HoldType2				= "slam"
SWEP.HoldType				= "slam"
SWEP.ReloadHoldType			= "pistol" -- idk lol

SWEP.ViewModel				= "models/weapons/c_grenade.mdl" -- Grenade, but with only throw anims?
--SWEP.WorldModel				= "models/weapons/w_suitcase_passenger.mdl"
--SWEP.WorldModel				= "models/weapons/w_package.mdl"
SWEP.WorldModel				= "models/weapons/w_defuser.mdl"
SWEP.DropModel				= "models/weapons/w_defuser.mdl"
--SWEP.WorldModel				= ""
SWEP.WorldModelHoldFix		= !false
SWEP.WMr					= 0 -- x
SWEP.WMf					= 5 -- y?
SWEP.WMu					= 1 -- z?
SWEP.WMra					= 0 -- r
SWEP.WMfa					= 1 -- f
SWEP.WMua					= 1 -- u


SWEP.ViewModelFlip			= false
SWEP.ViewModelFOV			= 72

SWEP.Weight					= 1 -- Dont suggest this weapon lol

SWEP.Primary.Sound			= Sound( "weapons/slam/throw.wav" )
SWEP.Primary.Recoil			= 5
SWEP.Primary.Damage			= 0
SWEP.Primary.NumShots		= 0
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= -1 -- 30
SWEP.Primary.Delay			= 2
SWEP.Primary.Automatic		= false

SWEP.AmmoDecayTime			= 240 -- How long till ammo despawns
SWEP.DropAmt				= 30 -- How much to drop
SWEP.WorksUnderWater		= true -- lol

SWEP.IronSightsPos = Vector(-5.881, 0, 2.64)
SWEP.IronSightsAng = Vector(-0.101, 0.045, 0)	

--[[-----------------------------------------------------------
	Animation Index
-----------------------------------------------------------]]--
-- Normal animations found in MOST pistols and some rifles
SWEP.Primary.ShootAnim		= ACT_VM_SECONDARYATTACK
SWEP.Primary.EmptyAnim		= ACT_VM_SECONDARYATTACK
-- If the weapon should be held like a shotgun when not in iron sight
-- If the held animation is crossbow, then it will be held like an AR2
SWEP.Secondary.EmptyAnim	= ACT_VM_PULLBACK_HIGH			 -- No dryfire anims for secondary attacks(normally)
SWEP.Secondary.ShootAnim	= ACT_VM_PULLBACK_HIGH -- Melee, Special action, Secondary fire
-- Abnormal reload, as in HL2 and DODS style pistol reloads
SWEP.ReloadAnim				= ACT_VM_PULLBACK_HIGH
SWEP.EmptyReloadAnim		= ACT_VM_PULLBACK_HIGH
SWEP.RemoveMagAnim			= ACT_VM_PULLBACK_HIGH
-- Once agian, Abnormal as defined above
SWEP.DrawAnim				= ACT_VM_PULLBACK_HIGH
SWEP.EmptyDrawAnim			= ACT_VM_PULLBACK_HIGH
-- Most Pistol, rifle, and shotgun models have these animations... Because VALVe modelers are smart!lol
SWEP.EmpytyIdleAnim			= ACT_VM_PULLBACK_HIGH
SWEP.IdleAnim 				= ACT_VM_PULLBACK_HIGH
-- Some weapons have animations which can accomidate the inability to attack
SWEP.Primary.CantAttack		= ACT_VM_PULLBACK_HIGH
SWEP.Secondary.CantAttack	= ACT_VM_PULLBACK_HIGH

SWEP.Primary.Chamber		= ACT_VM_DRAW


--[[-------------------------------------------------------------]]--


	AmmoTypes = {} -- LOWER CASE THESE ALL
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

		-- self.Owner:GetAmmo() -> Returns table with ammo and amount!!

local ItemList = {
					"models/Items/item_item_crate.mdl", -- Def
					"models/Items/AR2_Grenade.mdl", -- SMG1 Nade
					"models/Items/battery.mdl", 
					"models/Items/BoxBuckshot.mdl", 
					"models/Items/BoxMRounds.mdl", 
					"models/Items/BoxSRounds.mdl", 
					"models/Items/car_battery01.mdl", 
					"models/Items/combine_rifle_ammo01.mdl",  -- COmbineball
					"models/Items/combine_rifle_cartridge01.mdl", -- AR2
					"models/Items/CrossbowRounds.mdl", -- Rebar... dont use?
					"models/Items/357ammo.mdl", 
					"models/weapons/w_eq_fraggrenade_thrown.mdl" -- Gren
				}
--SWEP:CustomAmmoDisplay()
function SWEP:PrimaryAttack()
	-- Make sure we should be here
	if not self:CanPrimaryAttack() then return end
	self:DebugTalk("Past can prim")
	local ammoi = self.Weapon:GetNWInt("AmmoIndex" , 1)
	local ammot = game.GetAmmoName(ammoi)
	
	self:DebugTalk("Past var def")
	if self.Owner:GetAmmoCount( ammoi ) > 0 or self:InDebug() then
		-- Drop some ammo 
		local amt = 30
		local t = 0.25
		local mdl = self.DropModel or "models/Items/item_item_crate.mdl" -- models/Items/BoxMRounds.mdl
		--function SWEP:DropMagCommon(t, varSide, noChb, forceMdl)
		self:DropMagCommon(t, true, true, mdl, true, true)
		-- SWEP:ShootEffects( side, recoil, anim, snd, numshot )
		self:ShootEffects(1, self.Primary.Recoil, self.Primary.ShootAnim, self.Primary.Sound, 1)
		self:DebugTalk("\n\n<><> Past DROP MAG COMMON: "..tostring(t).." , "..tostring(mdl))
	else
		self:DebugTalk("\n\n<> Not enough ammo")
	end
	self:DebugTalk("End of Primary")
end

function SWEP:SecondaryAttack()
	
	if not self:CanSecondaryAttack() then return end
	local ammoi = self.Weapon:GetNWInt("AmmoIndex" , 1)
	ammoi = ammoi + 1
	
	if ammoi > 27 then
		ammoi = 1
	end
	self.Weapon:SetNWInt("AmmoIndex" , ammoi)
	
	local rez = game.GetAmmoName(ammoi)
	self.Primary.Ammo = tostring(rez)
	self:Talk("~\t Handout Ammo: (#"..tostring(ammoi).."/27)  "..tostring(rez).." \t~")
	
end

function SWEP:Initialize()
	
	self.Weapon:SetNWInt("AmmoIndex" , 1)
	self:StandardInitialize() -- Call for standard init
end

function SWEP:DrawHUD()
	local x, y 			= ScrW() / 2.0, ScrH() / 2.0 -- Never Touch
	local alpha = 255
	local black = Color(0,0,0,alpha)
	local white = Color(255,255,255,alpha)
	local fiery = Color(255,140,45,alpha)
	local scale =  math.max( GetConVarNumber("cl_crosshair_scale"), (self.Primary.Cone * 50) )
	
	local delta =  math.Clamp(CurTime() - (LastShootTime or 0), 0, 1 ) -- Adjust for recoil	
	local ratio = math.Clamp( 2-delta, 1.00, 2.00 ) 
	
	local scaler = scale * ratio
	local gap 	= math.Clamp( 40*scaler, 1.00, (ScrH() / 2)-100 )--  For close -- @@ Change to use curcone	
	local ammoi	= self.Weapon:GetNWInt("AmmoIndex" , 1) or 1
	local ammot = game.GetAmmoName(ammoi)
	local ammoa = self.Owner:GetAmmoCount( ammoi )
	
	surface.DrawCircle( x, y, gap*scaler, fiery ) -- Double Cone Circle
	
	surface.SetFont( "Default" )
	surface.SetTextColor( 255, 140, 45 )
	surface.SetTextPos( x-((gap*scaler)*1.75)-5, y+(gap*scaler)+5 ) 
	-- Prolly should make this future proof by using a count not just static 27
	surface.DrawText( "(#"..tostring(ammoi).."/27) Ammo: " ..tostring(ammot).."  x "..tostring(ammoa)  )
	
	
	-- Now draw the Ammo Table
	--[[
	local total = 27
	for i=1, total,1 do
		-- Iterate over the items
		local aname = AmmoTypes[i]
		
	end
	--]]--
	
	
end

function SWEP:Reload()
	-- Reset the index
	-- OR
	-- If a convar is set
	-- Give the owner MagSize
	-- of current ammo type
	
	if not self.Owner:KeyPressed( IN_RELOAD ) then return end -- Dont spam this call
	
	local b1 = tobool(GetConVar("swep_AmmoDropper_MakesAmmo"):GetBool()) or true
	
	if b1 == true then
		-- The ammo will be supplied
		local ammoi = self.Weapon:GetNWInt("AmmoIndex" , 1)
		local amt = self.DropAmt or 32
		local ammot = game.GetAmmoName(ammoi) or self.Primary.Ammo

		if SERVER then
			self.Owner:GiveAmmo(amt, ammot, true) -- bool to not show ammo return
		end
		self:Talk("~\t Ammo Type Supplied x"..tostring(amt).." \t~")
	else
		-- No ammo supplied, reset the index
		self.Weapon:SetNWInt("AmmoIndex" , 1)
		self:Talk("~\t Ammo Type Reset \t~")
	end
end