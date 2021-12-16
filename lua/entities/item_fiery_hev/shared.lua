/* lol HEV suit */
ENT.Type 				= "anim"
ENT.Base 				= "base_gmodentity"
ENT.PrintName 			= "H.E.V. Suit"
ENT.Author 				= "Nova Prospekt"
ENT.Category 			= "Fiery Items"
ENT.Classname			= "item_fiery_HEV"
ENT.Spawnable 			= true
ENT.AdminSpawnable 		= true
ENT.Information	 		= "Use to put on an HEV suit worth 750 armor" 

ENT.TRANSITION_TIME = 0

if(CLIENT)then
	function ENT:Initialize()
	end


	function ENT:Draw()
		self:DrawModel()
	end

end
