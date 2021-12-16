/* Fiery Weapons Base
	Made by: Nova Prospekt
	
	
	A Modifided weapon_cs_base
 */

include('shared.lua')

/*---------------------------------------------------------
	Print Info
---------------------------------------------------------*/
function SWEP:PrintWeaponInfo( x, y, alpha )
	if ( self.DrawWeaponInfoBox == false ) then return end
	
	if (self.InfoMarkup == nil ) then
		local str
		local title_color = "<color=255,120,45,255>"
		local text_color = "<color=150,151,150,255>"
		
		str = "<font=HudSelectionText>"
		if ( self.Author != "" ) 		then str = str .. title_color .. "Author:</color>\t"..text_color..self.Author.."</color>\n" end
		if ( self.Contact != "" ) 		then str = str .. title_color .. "Contact:</color>\t"..text_color..self.Contact.."</color>\n\n" end
		if ( self.Purpose != "" ) 		then str = str .. title_color .. "Purpose:</color>\n"..text_color..self.Purpose.."</color>\n\n" end
		if ( self.Instructions != "" ) 	then str = str .. title_color .. "Instructions:</color>\n"..text_color..self.Instructions.."</color>\n" end
		if ( self.Note != "" ) 			then str = str .. title_color .. "Note:</color>\n"..text_color..self.Note.."</color>\n" end
		if ( self.AmmoType != "" ) 		then str = str .. title_color .. "Ammo:</color>\n"..text_color..self.AmmoType.."</color>\n" end
		str = str .. "</font>"
		
		self.InfoMarkup = markup.Parse( str, 250 )
	end
	
	surface.SetDrawColor( 60, 60, 60, alpha )
	surface.SetTexture( self.SpeechBubbleLid )
	
	surface.DrawTexturedRect( x, y - 64 - 5, 128, 64 ) 
	draw.RoundedBox( 8, x - 5, y - 6, 260, self.InfoMarkup:GetHeight() + 18, Color( 60, 60, 60, alpha ) )
	
	self.InfoMarkup:Draw( x+5, y+5, nil, nil, alpha )
	
end

function SWEP:CL_Init_Check(arg)
	print(tostring(arg))
	return true
end

/*---------------------------------------------------------
	Checks the objects before any action is taken
	This is to make sure that the entities havent been removed
---------------------------------------------------------*/
function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
	
	if not (self.HL2WeaponDraw) then
		draw.SimpleText( self.IconLetter, "CSSelectIcons", x + wide/2, y + tall*0.2, Color( 255, 120, 45, 255 ), TEXT_ALIGN_CENTER )
	
		-- Nobody thinks this is Tony Hawks game...
		draw.SimpleText( self.IconLetter,
							"CSSelectIcons",
							x + wide/2 + math.Rand(-10, 10),
							y + tall*0.2+ math.Rand(-8, 8),
							Color( 255, 125, 55, math.Rand(10, 120) )
							, TEXT_ALIGN_CENTER )
		draw.SimpleText( self.IconLetter, "CSSelectIcons", x + wide/2 + math.Rand(-6, 6), y + tall*0.2+ math.Rand(-12, 12), Color( 255, 135, 70, math.Rand(10, 120) ), TEXT_ALIGN_CENTER )
	elseif (self.HL2WeaponDraw) then
		-- Draw Half Life 2
		draw.SimpleText( self.IconLetter, "HLSelectIcons", x + wide/2, y + tall*0.2, Color( 255, 120, 45, 255 ), TEXT_ALIGN_CENTER )
		
		
		draw.SimpleText( self.IconLetter, "HLSelectIcons", x + wide/2 + math.Rand(-10, 10), y + tall*0.2+ math.Rand(-8, 8), Color( 255, 125, 55, math.Rand(10, 120) ), TEXT_ALIGN_CENTER )
		draw.SimpleText( self.IconLetter, "HLSelectIcons", x + wide/2 + math.Rand(-6, 6), y + tall*0.2+ math.Rand(-12, 12), Color( 255, 135, 70, math.Rand(10, 120) ), TEXT_ALIGN_CENTER )
	elseif CLIENT then
		// Set us up the texture
		surface.SetDrawColor( color_transparent )
		surface.SetTextColor( 255, 120, 45, alpha )
		surface.SetFont( self.WepSelectFont )
		local w, h = surface.GetTextSize( self.WepSelectLetter )
		
		// Draw that mother
		surface.SetTextPos( x + ( wide / 2 ) - ( w / 2 ),
						y + ( tall / 2 ) - ( h / 2 ) )
		surface.DrawText( self.WepSelectLetter )
	end
end

-- Split String
function string_split(str, delimiter)
	if not str or not type(str) == "string" then Error("\n[!] BAD STRING @ string_split") return end
	if not delimiter then delimiter = " " end
	
  local result = {}
  local from = 1
  local delim_from, delim_to = str:find(delimiter, from )
  while delim_from do
    table.insert( result, str:sub(from , delim_from-1 ) )
    from = delim_to + 1
    delim_from, delim_to = str:find( delimiter, from )
  end
  table.insert( result, str:sub( from ) )
  return result
end

--[[
	// Everyone likes console values for crosshair color
	// If there IS NOT a crosshair_colorster (wont be first time)
	if not self.crosshair_colorstr then
		
		if (avoid == true) then
			self.crosshair_colorstr = "255 120 45 120"
		else
			self.crosshair_colorstr = GetConVarString("cl_crosshair_color") or "255 120 45 120"
		end
		
		// Crosshair_colorstr DEFINED ABOVE
		// If there IS (depending on if the convar is created/defined) crosshair_colorstr
		
		// if Color String ISNT null (con var is empty)
		if self.crosshair_colorstr then
			// Generate color from str
			self.crosshair_color = string_split(tostring(self.crosshair_colorstr), " ")
			// Put that shit into a table, know as crosshair_color.
			self.crosshair_colorCL = Color(tonumber(self.crosshair_color[1]), tonumber(self.crosshair_color[2]), tonumber(self.crosshair_color[3]), tonumber(self.crosshair_color[4]))
		else
		// No con variable value, Default
			self.crosshair_colorCL 		= Color(255, 120, 45, 120)
			self.crosshair_color		= {255, 120, 45, 120}
			self.crosshair_colorstr 	= "255 120 45 120"
			
			
		end
		// Oh but if there is, then just set it...
	elseif self.Owner:GetInfo("cl_crosshair_color") ~= self.crosshair_colorstr then
		/* Get the info, no problems
		// How it SHOULD break down
		// 1. Define the colorstr
		// 2. Explode the string at spaces to derive an array
		// 3. Make Crosshair_color into a color var, with the values of its own array (data change happens after arguments are entered)
		*/
		/* Preliminary definition, Just Cause lol
		self.crosshair_color[1] = 255
		self.crosshair_color[2] = 120
		self.crosshair_color[3] = 45
		self.crosshair_color[4] = 120
		*/
		if (avoid == true) then
			self.crosshair_colorstr 	= "255 120 45 120"
		else
			self.crosshair_colorstr 		= GetConVarString("cl_crosshair_color") or "255 120 45 120"
		end
		self.crosshair_color 			= string_split(" ", self.crosshair_colorstr)
		
		if (self.crosshair_color == nil or type(self.crosshair_color) != "table") then
			if (#self.crosshair_color <4) then
			ErrorNoHalt("ITS JUST NOT A TABLE OF THE RIGHT SPECS! " .. type(self.crosshair_color))
			else
			ErrorNoHalt("ITS JUST NOT A TABLE OF THE RIGHT DIM " .. #self.crosshair_color)
			end
		end
		self.crosshair_colorCL 			= Color(self.crosshair_color[1], self.crosshair_color[2], self.crosshair_color[3], self.crosshair_color[4] or 120)
		//											Red						Green					Blue						Alpha
	end
-- END color
-- fff
-- moving down	
--]]





SWEP.crosshair_color = {}

CreateClientConVar("cl_crosshair_scale", -1,true, true)
CreateClientConVar("cl_crosshair_color", "255 120 45 120", true, true)

cl_crosshair_r 		= CreateClientConVar("cl_crosshair_r", 255, true, false)		// Red
cl_crosshair_g 		= CreateClientConVar("cl_crosshair_g", 120, true, false)		// Green
cl_crosshair_b 		= CreateClientConVar("cl_crosshair_b", 45, true, false)		// Blue
cl_crosshair_a 		= CreateClientConVar("cl_crosshair_a", 200, true, false)		// Alpha
cl_crosshair_l 		= CreateClientConVar("cl_crosshair_l", 30, true, false)		// Lenght
cl_crosshair_t 		= CreateClientConVar("cl_crosshair_t", 1, true, false)		// Enable/Disable
cl_crosshair_type  	= CreateClientConVar("cl_crosshair_type", 1, true, false)

/*---------------------------------------------------------
	DrawHUD
	
	Just a rough mock up showing how to draw your own crosshair.
---------------------------------------------------------*/
function SWEP:DrawHUD()

	// No crosshair when ironsights is on
	if ( self.Weapon:GetNetworkedBool( "Ironsights" ) ) then return end

	local x = ScrW() / 2.0
	local y = ScrH() / 2.0
	local scale = 10 * self.Primary.Cone
	// Scale the size of the crosshair according to how long ago we fired our weapon
	local LastShootTime = self.Weapon:GetNetworkedFloat( "LastShootTime", 0 )

	scale = scale * (2 - math.Clamp( (CurTime() - LastShootTime) * 5, 0.0, 1.0 ))
	
	surface.SetDrawColor( 0, 255, 0, 200 )
	
	// Draw an awesome crosshair
	local gap = 40 * scale
	local length = gap + 20 * scale
	surface.DrawLine( x - length, y, x - gap, y )
	surface.DrawLine( x + length, y, x + gap, y )
	surface.DrawLine( x, y - length, x, y - gap )
	surface.DrawLine( x, y + length, x, y + gap )

end

/*---------------------------------------------------------
	Precache
---------------------------------------------------------*/
function SWEP:Precache()
	-- Cache before use
    util.PrecacheSound( self.Primary.Sound )
    util.PrecacheSound( self.Secondary.Sound )
	
end
