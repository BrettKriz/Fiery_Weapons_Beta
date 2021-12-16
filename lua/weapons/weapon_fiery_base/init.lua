/* Fiery Weapons Base
	Made by: Nova Prospekt
	
	File: init
	Side: SV
	
	A Modifided weapon_cs_base
 */
 function BeconOut(arg)
	if not arg then arg = "BECON" end
	ErrorNoHalt( "\n\t >> *" .. tostring(arg) .. "* <<\n" ) -- Send out a becon in the process
 end
 
MsgC( Color( 222, 111, 11 ), "<> INIT \n")
-- ADD FILES
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

SWEP.Weight					= 5		// Decides whether we should switch from/to this
SWEP.AutoSwitchTo			= true	// Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true	// Auto switch from if you pick up a better weapon

function SWEP:Init_Check(arg)
	self:DebugTalk(tostring(arg))
	return true
end

/*---------------------------------------------------------
   Name: SWEP:OnRestore()
   Desc: The game has just been reloaded. This is usually the right place
	   to call the GetNetworked* functions to restore the script's values.
---------------------------------------------------------*/
--function SWEP:OnRestore()
	-- Set xhair color and other global vars
--end

/*---------------------------------------------------------
   Name: SWEP:AcceptInput()
   Desc: Accepts input, return true to override/accept input.
---------------------------------------------------------*/
function SWEP:AcceptInput(name, activator, caller, data)
	-- Create a port lol
	return false -- expansions...
end

/*---------------------------------------------------------
   Name: SWEP:KeyValue()
   Desc: Called when a keyvalue is added to us.
---------------------------------------------------------*/
function SWEP:KeyValue(key, value)
	-- THIS...
	-- Might be usefull
end

/*---------------------------------------------------------
   Name: SWEP:OnRemove()
   Desc: Called just before entity is deleted.
---------------------------------------------------------*/
function SWEP:OnRemove()
	-- @@@TROLL-HERE
end

/*---------------------------------------------------------
   Name: SWEP:Equip()
   Desc: A player or NPC has picked the weapon up.
---------------------------------------------------------*/
function SWEP:Equip(NewOwner)
	--BeconOut("EQUIP BECON")
	--NewOwner:PrintMessage(HUD_PRINTTALK, "What'd you do to my owner?")
	self:DebugTalk("What'd you do to my owner?")
	if self:InDebug() then
		self:PrintStats() -- 
	end
end

/*---------------------------------------------------------
   Name: SWEP:EquipAmmo()
   Desc: The player has picked up the weapon and has taken the ammo from it.
	   The weapon will be removed immidiately after this call.
---------------------------------------------------------*/
function SWEP:EquipAmmo(NewOwner)
	--self.
	-- Drop an entity (that has 0 ammo ;D)
	-- @@@TODO
	-- Drop entity of gun (automade?)
	-- or
	-- Drop a new swep with 0 ammo,
	--	add arrestion here to deny equipAmmo
	
	
end

/*---------------------------------------------------------
   Name: SWEP:OnDrop()
   Desc: Weapon was dropped.
---------------------------------------------------------*/
function SWEP:OnDrop()
	-- GRENADE FUNCTIONS HERE!!!!
	-- Fire the last shot too??
--		if (self.Owner:KeyDown( IN_ATTACK ) or self.Owner:KeyDown( IN_ATTACK2 )) and (isTbl(self.Grenade) ) then
			-- MAKE SURE WE EXPLODE!
--			timer.Simple( self.Grenade["explode
--		end
end

/*---------------------------------------------------------
   Name: SWEP:ShouldDropOnDie()
   Desc: Should this weapon be dropped when its owner dies?
---------------------------------------------------------*/
function SWEP:ShouldDropOnDie()
	-- Seems to apply more to npcs? need to check! @@@
	return true 
end

/*---------------------------------------------------------
   Name: SWEP:GetCapabilities()
   Desc: For NPCs, returns what they should try to do with it.
---------------------------------------------------------*/
function SWEP:GetCapabilities()
	-- @@@RESEARCH THIS
	return CAP_WEAPON_RANGE_ATTACK1, CAP_INNATE_RANGE_ATTACK1, CAP_USE_SHOT_REGULATOR
end

/*---------------------------------------------------------
   Name: SWEP:NPCShoot_Primary()
   Desc: NPC tried to fire primary attack.
---------------------------------------------------------*/
function SWEP:NPCShoot_Primary(ShootPos, ShootDir)
	
	if (self.Primary:Clip1() ~= 0) then
		self:PrimaryAttack()
	else
		self:Reload()
	end
end

/*---------------------------------------------------------
   Name: SWEP:NPCShoot_Secondary()
   Desc: NPC tried to fire secondary attack.
---------------------------------------------------------*/
function SWEP:NPCShoot_Secondary(ShootPos, ShootDir)
	-- lol this could be fun
	self:Reload()
end
