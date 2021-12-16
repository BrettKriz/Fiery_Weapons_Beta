/* Getin into entities now... */
ENT.Type 				= "anim"
ENT.Base 				= "base_gmodentity"
ENT.PrintName 			= "Ballistic Plate Vest"
ENT.Author 				= "Nova Prospekt"

ENT.Category 			= "Fiery Items"
ENT.Classname			= "item_ballistic_vest" --
ENT.Spawnable 			= true
ENT.AdminSpawnable 		= true
ENT.Information	 		= "Use to equipt a Ballistic Plate Vest worth 200 armor" 

ENT.TRANSITION_TIME = 0

if(CLIENT)then
	function ENT:Initialize()
	end

--[[
	function ENT:Draw()
		self:DrawModel()
		local shade = 182
		self:SetColor(shade, shade, shade, 255)
	end
--]]

end
