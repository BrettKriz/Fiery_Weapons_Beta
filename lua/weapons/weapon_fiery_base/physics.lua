--[[-- 	Fiery Weapons Base
	Made by: Nova Prospekt,
	* The credits for the top section on this file are below*
	
	~  Credits / References ~
	SeveredSkullz:		Writing the code
	Wikipedia : 		Information regarding recoil
	hodgdon.com: 		Reloading tables
	kwk.us: 			Cartridge information 
	~		Face Punch 		~
	
	To be used as a shared file
 --]]--
 
MsgC( Color( 222, 111, 11 ), "<> Physics (Need to implement)\n")

--[[
Get yours loading info at [url]http://data.hodgdon.com/cartridge_load.asp[/url]
    Universal powder used for Grains on majority.
    If you do not have Universal, use one that has a similar velocity

Case Max Capacities: [url]http://kwk.us/cases.html[/url]
]]

local mathE = 2.71828 -- the mathmatical constant e.
local CompensateTime = 5 -- How many seconds does it take for the player to control the recoil

--[[
These are the physical properties required for the algorithms
BWeight = Weight of projectile in grains NOT GRAMS (This is JUST the projectile, not the casing and powder as well)
Velocity = The projectiles (average) velocity that it travels down the barrel (Not after exititng!)
CGrains = This the weight of powder inside the casing in grains
CaseCap = This is the cartridge's capacity in grains
Diam = This is the diameter in inches of the projectile , not the casings.
]]
local Bullets = {}
Bullets["pistol"] = {BWeight = 115, Velocity = 1300, CGrains = 5, CaseCap = 13.3, Diam = .354330}         // 9MM
Bullets["alyxgun"] = {BWeight = 45, Velocity = 2800, CGrains = 5.5, CaseCap = 14, Diam = .224}        // 5.7x28 = 5.0
Bullets["357"] = {BWeight = 125, Velocity = 1600, CGrains = 5.7, CaseCap = 27, Diam = .357}            // .357
Bullets["helicoptergun"] = {BWeight = 165, Velocity = 1060, CGrains = 6.4, CaseCap = 42, Diam = .452} // .45 ACP
Bullets["combinecannon"] = {BWeight = 300, Velocity = 1550, CGrains = 70.5, CaseCap = 110, Diam = .5} // .50 S&W Magnum
Bullets["airboatgun"] = {BWeight = 62, Velocity = 3100, CGrains = 62, CaseCap = 28.5, Diam = .354330}    // 5.56x45 M4 M16
Bullets["striderminigun"] = {BWeight = 123, Velocity = 2400, CGrains = 28.5, CaseCap = 35.6, Diam = .310}// 7.62x39 (AK)
Bullets["sniperpenetratedround"] = {BWeight = 150, Velocity = 2800, CGrains = 50.5, CaseCap = 54, Diam = .308}// 7.62x51 (M249saw)

SWEP.GWeight = 0    -- How many pounds does the gun weigh? This must be included in your SWEP!!!
-- DO NOT SET THIS. It will get overwritten anyway...                
SWEP.isFiring = false
SWEP.RecoilDelta = 0

-- This is what actually generates our recoil.
function SWEP:UpdateRecoil()
    -- Written by: SeveredSkullz
    -- E = MC^2, mother fuckers.
    local WAmmoType = Bullets[string.lower(self.Primary.Ammo)]
    
    local BulletWeight = WAmmoType.BWeight
    local MuzzleVelocity = WAmmoType.Velocity + math.Rand(-WAmmoType.Velocity * .15,WAmmoType.Velocity * .15) -- Simulated Variance in powder burn, resulting in varied velocity
    local ChargeGrains = WAmmoType.CGrains
    local BulletDiameter = WAmmoType.Diam
    local CaseCapacity = WAmmoType.CaseCap        
    local GassesChange = 4000
    
    --[[
    There is a factor directly related to the type of firearms.
    BulletVelocityFPS = Velocity of projectile and Gas
    Ve = Velocity of projectile
    High powered rifles         BulletVelocityFPS = Ve x 1.75
    Shotguns( averagele ngth)     BulletVelocityFPS = Ve x 1.50
    Shotguns (long barrel)         BulletVelocityFPS = Ve x 1.25
    Pistol & revolvers             BulletVelocityFPS = Ve x 1.50
    ]]
    
	-- @@@ Needs edit here, will have physics table for most of the guns function
    if ( self.HoldType == "pistol") then
        GassesChange = 1.50 * MuzzleVelocity
    elseif ( self.HoldType == "shotgun") then
        GassesChange = 1.25 * MuzzleVelocity
    elseif ( self.HoldType == "ar2" ) then
        GassesChange = 1.75 * MuzzleVelocity
    end
    
    --Recoil (Before the Barsness index formula) = ( BulletWeight * MuzzleVelocity + ChargeGrains * (GassesChange) ) / 7000 / self.GWeight
    --KineticEnergy = self.GWeight / 32.2 * Recoil * Recoil / 2
    
    --Barsness' index     
    local rfx = 7854 * BulletDiameter * BulletDiameter / CaseCapacity    
    local rf = 1.4
    -- Barsness offered a look-up table
    if ( rfx <= 7.5 ) then        
        rf = 2.4
    elseif ( rfx <= 8.5 ) then
        rf = 2.2
    elseif ( rfx <= 9.5 ) then
        rf = 2
    elseif ( rfx <= 10.5 ) then
        rf = 1.9
    elseif ( rfx <= 11.5 ) then
        rf = 1.8
    elseif ( rfx <= 12.5 ) then
        rf = 1.7
    elseif ( rfx <= 13.5 ) then
        rf = 1.6
    elseif ( rfx <= 14.5 ) then
        rf = 1.5
    end

    -- This is the amount of Kinetic energy in LBS that is applied backwards from the muzzle
    local GunRecoilLBS = (BulletWeight / 7000 / 32.2 / 2) * MuzzleVelocity * MuzzleVelocity  *  (BulletWeight + ChargeGrains) / (self.GWeight * 7000)  *  rf
    
    -- This simulates the players controll of the weapon while firing fully automatic.
    -- The longer the burst, the more the player is used to the recoil and can compensate for it.
    
    -- Exponential Decay of recoil, where GunRecoilLBS is the recoil
    local x = CurTime() - self.RecoilDelta
    local RecoilMod = mathE^(-x*GunRecoilLBS / CompensateTime)
    local result = GunRecoilLBS - math.Min(GunRecoilLBS * .75, ((1- RecoilMod) * GunRecoilLBS)) -- Stored in a var for testing purposes. You can delete and simply return
    return result

end

--[[
This adds recoil to the players Eye position to simulate Muzzle climb and control over time.
In order to add my system to your bases, All you have to do is add this function somewhere
in your primary fire hook.
]]
function SWEP:AddRecoil()
    local recoil = self:UpdateRecoil()
    -- Add our recoil to the player.
    if ( (SinglePlayer() && SERVER) || ( !SinglePlayer() && CLIENT && IsFirstTimePredicted() ) ) then
        local eyeang = self.Owner:EyeAngles()
        eyeang.pitch = eyeang.pitch - (recoil * math.Rand(.5 , 1)) -- Up
        eyeang.yaw = eyeang.yaw - ((recoil/2) * math.Rand(-1,1)) -- Go left and right a bit too
        self.Owner:SetEyeAngles( eyeang )
    end
end

--[[
 We need to keep track on when the burst started in order to compensate for longer bursts
 This is a very crude method, but it works. Pretty much, just set RecoilDelta when you press
 the attack button, and set isFiring to true. When you stop, set isFiring to false. Its that
 simple.
 
 See function SWEP:RecoilThink()
]]

-- End of credited code --

SWEP.Base_Heat	= 74 -- DONT TOUCH! 
function SWEP:WorldIsCold()
	local b, w, x
	ents.GetByIndex(0) 
	for k,v in pairs(ents.GetAll()) do
		if v:IsWorld() then
			w = v
			break
		end
	end
	-- Get me, *dramatic zoom*
	-- *Whispers* The World!
	--[[
	self:Talk(tostring( w:IsValid() ) .. " | " .. tostring(w:IsWorld()))
	
	local t = w:GetTable()
	self:Talk(tostring(table.Count(t)))
	
	x=1
	for k, v in pairs( t ) do
		self:Talk("#"..tostring(x).." K:" .. tostring(k) .. " |V:"..tostring(v).." ("..type(v)..")")
		
		x = x+1
	end
	
	
	b = false or "Was Null :("
	--coldworld
	--]]
	
	return b
end