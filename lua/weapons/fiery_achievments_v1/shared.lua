/*=====================================*\
		NOVA PROSPEKT ~ 9/5/2020
\*=====================================*/

if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if ( CLIENT ) then

	SWEP.PrintName			= "Fiery Achievements"
	SWEP.Author				= "Nova Prospekt"
	SWEP.Slot				= 5 -- last col
	SWEP.SlotPos			= 10
	SWEP.Info				= "Why try to do most of these achievements?"
	SWEP.IconLetter			= "c" -- v CounterStrike
	SWEP.SelectIconLetter	= "c"
	SWEP.SelectIconLetter2	= "D" -- p csd
	SWEP.ViewModelFOV		= 90

end

SWEP.Base					= "weapon_fiery_base"
SWEP.Category				= "Fiery Tools"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.HoldType2				= "normal"
SWEP.HoldType				= "magic"
SWEP.ReloadHoldType			= "dual" -- idk lol

SWEP.ViewModel				= "models/weapons/v_hands.mdl"
SWEP.WorldModel				= "models/weapons/w_suitcase_passenger.mdl"

SWEP.ViewModelFlip			= false
SWEP.ViewModelFOV			= 72

SWEP.Weight					= 7

SWEP.Primary.Sound			= Sound( "weapons/grenade_launcher1.wav" )
SWEP.Primary.Recoil			= 5
SWEP.Primary.Damage			= 0
SWEP.Primary.NumShots		= 0
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= -1
SWEP.Primary.Delay			= 5
SWEP.Primary.Automatic		= false
SWEP.Primary.BurstFire 		= 3

SWEP.SecretPhrase			= "bloxwich" -- This might change, so ill leave it here

SWEP.IronSightsPos = Vector(-5.881, 0, 2.64)
SWEP.IronSightsAng = Vector(-0.101, 0.045, 0)	

-- draw
-- self:Talk("You have " .. tostring(achievements.Count()) .. " achievements unlocked")

-- Secondary + (UI? IndexIteration?)
-- achievements.GetName( number achievementID )
-- ID to String 
-- achievements.GetCount( number achievementID )
-- Retrieves progress of given achievement 
-- achievements.GetDesc( number achievementID )
-- achievements.GetGoal( number achievementID )
-- How many till goal?
-- achievements.IsAchieved( number AchievementID )


SWEP.Complete = CreateClientConVar("cl_achiev_run_done", "0", false, true,"Prevents achievment unlocker from running too quickly, make 0 to run", 0, 1) 

function SWEP:Think() -- Need the clientside feature
	
	if not self:CanPrimaryAttack() then return end -- return true? 
	local cvv = GetConVar("cl_achiev_run_done")
	if cvv:GetBool() == true then
		-- Delete self
		-- todo
		return
	end
	
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self:SetNextPrimAndSecon(self.Primary.Delay or 5)
	
	if (CLIENT) then -- Something about singleplayer too?
		--ErrorNoHalt("Enter Check")
		ErrorNoHalt("\n\nClientside Enter Check!\n\n")
		self:DoAchievements()
	end
	if (SERVER) then
		self:DoSecretPhrase(self.SecretPhrase)
	end
	
	--self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	
	cvv:SetBool(true)
end

function SWEP:DoAchievements(index)
	-- Call on the achievments library
	local maxi = 11 -- U[date me too!
	
	local h = (nil == index) or index < 1 -- Was not sent/bad
	if h then
		index = 0
	end
	index = math.min( index, maxi ) -- No out of bounds
	
	local x = 1 -- Iterator
	local b1, b2, b3, b4, b5, b6, b7, b8, b9 , b10, b11, b12
	-- I did it this way because why make it hard?
	b1 = index == x or h
	x = 1+x
	b2 = index == x or h
	x = 1+x
	b3 = index == x or h
	x = 1+x
	b4 = index == x or h
	x = 1+x
	b5 = index == x or h
	x = 1+x
	b6 = index == x or h
	x = 1+x
	b7 = index == x or h
	x = 1+x
	b8 = index == x or h
	x = 1+x
	b9 = index == x or h
	x = 1+x -- maxi=10
	b10 = index == x or h
	x = 1+x -- maxi=11
	b11 = index == x or h
	x = 1+x 
	b12 = index == x or h
	
	local def = 1000
	if b1	then self:DoBalloonPopped(1001) 			end
	if b2	then self:DoEatBall(201) 					end
	if b3	then self:DoIncBaddies(1001)				end
	if b4	then self:DoIncBystander(1001)				end
	if b5	then self:DoIncGoodies(1001) 				end
	if b6	then self:DoRemover(5001) 					end
	if b7	then self:DoSpawnedNPC(1001)				end
	if b8	then self:DoSpawnedProp(5001) 				end
	if b9	then self:DoSpawnedRagdoll(2001)			end
	if b10	then self:DoSpawnMenuOpen(100001)			end
	if b11	then self:DoBadCoder(501)					end
	--if b12	then self:DoSecretPhrase(self.SecretPhrase)	end
	
end

function SWEP:DoBalloonPopped(n)	-- #1
	for x=0,n,1 do
		achievements.BalloonPopped()
	end
end

function SWEP:DoEatBall(n)			-- #2
	for x=0,n,1 do
		achievements.EatBall()
	end
end

function SWEP:DoIncBaddies(n)		-- #3
	for x=0,n,1 do
		achievements.IncBaddies()
	end
end

function SWEP:DoIncBystander(n)		-- #4
	for x=0,n,1 do
		achievements.IncBystander()
	end
end

function SWEP:DoIncGoodies(n)		-- #5
	for x=0,n,1 do
		achievements.IncGoodies()
	end
end

function SWEP:DoRemover(n)			-- #6
	for x=0,n,1 do
		achievements.Remover()
	end
end

function SWEP:DoSpawnedNPC(n)		-- #7
	for x=0,n,1 do
		achievements.SpawnedNPC()
	end
end

function SWEP:DoSpawnedProp(n)		-- #8
	for x=0,n,1 do
		achievements.SpawnedProp()
	end
end

function SWEP:DoSpawnedRagdoll(n)	-- #9
	for x=0,n,1 do
		achievements.SpawnedRagdoll()
	end
end

function SWEP:DoSpawnMenuOpen(n)	-- #10
	for x=0,n,1 do
		achievements.SpawnMenuOpen()
	end
end

function SWEP:DoBadCoder(n)			-- #11
	for x=0,n,1 do
		ErrorNoHalt("Dont worry this isnt a real issue! \tAchievement: Bad Coder \t("..tostring(x).."/"..tostring(n)..") \n")
	end
	
end

function SWEP:DoSecretPhrase(str)
	-- Say the secret phrase
	self.Owner:ChatPrint("The secret phrase is: " .. str)
	self.Owner:Say(str)
	self.Owner:Say(str)
	
end
--[[
function SWEP:Do
	
end
--]]