--[[--
	Fiery Weapons Base
	Made by: Nova Prospekt
	
	File: cl_init
	Side: CL
	
	A Modifided weapon_cs_base
 --]]--

--include( "animations.lua" )
include( "shared.lua" )
--include( "animations.lua" )

MsgC( Color( 222, 111, 11 ), "<> cl_init \n")

SWEP.crosshair_color = {}
-- Check for duplicate ConVars
CreateClientConVar("cl_crosshair_scale", -1,true, true)
CreateClientConVar("cl_crosshair_color", tostring(Color( 255, 80, 0, 255 )), true, true) -- "255 120 45 120"

cl_crosshair_r 		= CreateClientConVar("cl_crosshair_r", 255, true, false)		-- Red
cl_crosshair_g 		= CreateClientConVar("cl_crosshair_g", 120, true, false)		-- Green
cl_crosshair_b 		= CreateClientConVar("cl_crosshair_b", 45, true, false)			-- Blue
cl_crosshair_a 		= CreateClientConVar("cl_crosshair_a", 200, true, false)		-- Alpha
cl_crosshair_l 		= CreateClientConVar("cl_crosshair_l", 30, true, false)			-- Length
cl_crosshair_t 		= CreateClientConVar("cl_crosshair_t", 1, true, false)	 		-- Toggle Crosshair		-- Enable/Disable
cl_crosshair_type  	= CreateClientConVar("cl_crosshair_type", 1, true, false)		-- Type

 local FOV_TIME 	= 0.12 -- MAKE VAR?

/*---------------------------------------------------------
	Print Info
---------------------------------------------------------*/
function SWEP:PrintWeaponInfo( x, y, alpha )
	-- Add a reading setting  
	if ( self.DrawWeaponInfoBox == false ) then return end
	
	if (self.InfoMarkup == nil ) then
		local str
		local title_color = "<color=255,120,45,255>"
		local text_color = "<color=150,151,150,255>"
		local ammos = self.AmmoDisc or "Mem issue"
		
		-- Start building the text
		str = "<font=HudSelectionText>"
		str = str .. tostring(self.ClassName) .. "\n(" .. tostring(self.Base) .. ")\n"
		local addAuthor = ""
		if (self.Author != "Nova Prospekt") then addAuthor = "\n\t&\tNova Prospekt" end -- self.isTemplate and 
		if ( self.Author != "" ) 			then str = str .. title_color .. "Author:</color>\t"		..text_color..self.Author..addAuthor.."</color>\n" 		end
		if ( self.Contact != nil
			and self.Contact != "") 		then str = str .. title_color .. "Contact:</color>\n"		..text_color..self.Contact.."</color>\n\n" 				end
		if ( self.Purpose != nil
			and self.Purpose != "" ) 		then str = str .. title_color .. "Purpose:</color>\n\t"		..text_color..self.Purpose.."</color>\n\n" 				end
		if ( self.Instructions != nil
			and self.Instructions != "" ) 	then str = str .. title_color .. "Instructions:</color>\n\t"	..text_color..self.Instructions.."</color>\n" 			end
		if ( self.Note != nil 
			and self.Note != "" ) 			then str = str .. title_color .. "Note:</color>\n\t"			..text_color..self.Note.."</color>\n" 					end
		
		str = str .. title_color .. "Ammo \n</color>" .. text_color .. ammos .. "</color>\n"
		-- Fun feature for RP \/ Allow for serial numbers to be scratched off ;D 
		str = str .. "" .. title_color .. "Serial # \t</color>" .. text_color .. (self.SerialNumber or "Bad Mem") .. "</color>\n\n"
		
		if ( self.Lore != nil 
		and self.Lore != "" ) 				then str = str ..text_color .. "..."						..self.Lore.."</color>\n" 					end
		
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
	return true -- Yep
end

function SWEP:BuildFiremodeStr( side, getMode, arg ) -- Side, TypeLetter
	-- Show what firemode we are using
	-- & What ammotype letter to show
	if not getMode then getMode = -1 end
	-- Create base values
	local ans 		= ""
	local p1 		= "p" -- PISTOL			p
	local p2 		= "q" -- 357			q
	local r1 		= "r" -- SMG1			r
	local r2 		= "u" -- AR2			u -- Rivet
	local s1 		= "s" -- BUCK			s
	local rg1 		= "t" -- SMG1 RG		t
	local rg2 		= "z" -- Combine ball	z
	local rocket 	= "x" -- Rocket			x
	local xbow 		= "|" -- xbow?			| -- Dart
	local xbow2 	= "w" -- xbow2?			w -- Rebar
	local gren 		= "v" -- Grenade		v
	local gren2 	= "_" -- Grenade2		v
	local gauss		= "A" -- Lambda
	local gravity	= "?" -- Pointing down
	local d 		= xbow -- @@@Find better default!
	local isSecond 	= (side == 2)
	
	local useAmmo = self.Weapon:GetPrimaryAmmoType()
	local useFont = self.Primary.FiremodeFont or self.SelectFiremode
	local burstNum = self.Primary.BurstFire or 0 -- Tie into a var plz!!
	local isAuto = self.Primary.Automatic == true

	-- Adjust letters for fonts
	if useFont == self.SelectFiremode3 then
		-- DoD:S
		p1 		= "4" -- PISTOL
		p2 		= "4" -- 357
		r1 		= "4" -- SMG1
		r2 		= "4" -- AR2
		s1 		= "4" -- BUCK
		rg1 	= "S" -- SMG1 RG
		rg2 	= "S" -- Combine ball
		rocket 	= "S"
		xbow 	= "4"
		gren 	= "S"
	elseif useFont == self.SelectFiremode2 then
		-- CS:S
		-- @@Todo: Find translations
	end
	
	local fmi = {	-- Translate ammo types to letters
		[1] = r1,		-- AR2
		[2] = rg2,		-- AR2 Ball
		[3] = p1, 		-- Pistol
		[4] = p1, 		-- SMG1 r1
		[5] = p2, 		-- .357
		[6] = xbow, 	-- xbow
		[7] = s1, 		-- Buckshot
		[8] = rocket, 	-- RPG
		[9] = rg1, 		-- smg1 Grenade
		[10] = gren2, 	-- Grenade
		[11] = gren2, 	-- SLAM
		[12] = r1, 		-- Make into 5.7? -- Alyxgun 
		[13] = p2, 		-- SniperRound
		[14] = r2, 		-- SniperPenetratedRound
		[15] = gren, 	-- THUMPER
		[16] = gravity, -- Gravity
		[17] = gauss, 	-- Battery
		[18] = gauss, 	-- GaussEnergy -- y
		[19] = rg1, 	-- CombineCannon
		[20] = r2, 		-- AirboatGun
		[21] = r2, 		-- Strider Minigun
		[22] = r1, 		-- Helicopter Gun 
		[23] = p1, 		-- 9mmRound 
		[24] = rg1, 	-- MP5_Grenade
		[25] = xbow,	-- Hornet 
		[26] = r2, 		-- StriderMinigunDirect
		[27] = r2 		-- CombineHeavyCannon
	}
	
	if isSecond == true then
		useAmmo = self.Weapon:GetSecondaryAmmoType()
		useFont = self.Secondary.FiremodeFont  or self.SelectFiremode
		burstNum = self.Secondary.BurstFire or 0 -- Tie into a var plz!!
		isAuto = self.Secondary.Automatic
	elseif side ~= 1 then
		ErrorNoHalt("@BuildFiremodeStr called with a bad SIDE arg of: "..tostring(side).." PLEASE FIX!\n")
	end
	
	-- Define Bools
	local tl = tostring(arg or fmi[useAmmo] or "p") -- Target Letter
	local fm = self:CurFireMode() -- @@@ This miiiight become ungodly slow?
	local cm = (self.data.modes[fm]) or 0 -- Current Mode
	if getMode > 0 then -- @@@Limit somewhere?
		cm = getMode
	end
	local hm = fm > 0 and #self.data.modes > 1
	local auto = tostring("" .. tl .. tl .. tl .. tl .. tl) -- 4?
	local burst
	if burstNum < 1 then
		burst = t1 --tostring("" .. tl .. tl .. tl)
	else
		--self:Talk("t1:"..tl)
		burst = string.rep( tl, math.max(math.min(burstNum,5),1) )
	end

	-- @@@A string util can duplicate to N of a sides BurstFire
	ans = tl
	
	--ErrorNoHalt("Data Modes >>> : " .. tostring(#self.data.modes) .. " ~FM:" .. tostring(self.FireMode) .. "\n")
	
	if hm == false then
		if isAuto == true then
			ans = auto
			self.DebugTalk("I pooped my pants and all i got was this dev msg\n")
		end
	else
		if cm == 1 then
			-- Semi
			ans = tl
			--ErrorNoHalt("SEMI \n")
		elseif cm == 2 then -- burstNum > 1 and
			-- BurstFire  
			ans = burst
			--ErrorNoHalt("BURST \n") 
		elseif cm == 3 or isAuto == true then
			-- Auto
			ans = auto
			--ErrorNoHalt("AUTO \n")
		else
			ErrorNoHalt("Fall-through value found: "..tostring(cm).."\n")
		end
	end
	
	return ans
end

/*---------------------------------------------------------
	Checks the objects before any action is taken
	This is to make sure that the entities havent been removed
---------------------------------------------------------*/
function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
	-- self.WepSelectFont = "CSSelectIcons"
	if SERVER then return end
	-- @@@@ Obsol33t? \/
	local hl2 = (self.HL2WeaponDraw == true)
	local dods = (self.DoDWeaponDraw == true)
	local css = (self.HL2WeaponDraw ~= true)and(self.DoDWeaponDraw ~= true)
	
	local flooded = self:IsFlooded()
	-- Define local locations/talls/wides
	local t2 = tall * 0.2
	local t5 = tall / 2
	local t8 = tall * 0.8
	local tsi = 2
	
	local w2 = wide * 0.2
	local w5 = wide / 2
	local w8 = wide * 0.8
	local wsi = w5
	
	local useFont 	= self.SelectIconFont 			or self.CSSelectIcons
	local useFont2 	= self.IconFont 				or self.CSKillIcons2
	local useFont3 	= self.SelectIconFont2 			or self.CSSelectIcons3 -- @@@@This needs more logic
	
	local useFont4 	= self.Primary.FiremodeFont 	or self.SelectFiremode -- SelectFiremode
	local useFont5 	= self.Secondary.FiremodeFont 	or self.SelectFiremode --
	local useCFont	= self.CalFont					or self.CSKillIcons
	local useNFont	= self.SelectIconNumberFont 	or self.SelectNumbers
	local useNFont2	= self.SelectIconNumberFont2 	or self.SelectNumbers4
	
	if nil == useFont then
		ErrorNoHalt("[!!!!!] lol it chose a nil over a font!!\n")
	end
	
	if useFont == self.HL2SelectIcons then
		useFont3 = self.HL2SelectIcons
	end

	local useLetter	= self.SelectIconLetter or self.IconLetter or nil
	local useLetter2 = self.SelectIconLetter2 or string.lower(useLetter) -- @@@ These lines need logic work
	
	local useLetter3 = self:BuildFiremodeStr(1) -- useFont4
	local useLetter4 = self:BuildFiremodeStr(2) -- useFont5
	
	local useLetter5 = self:BuildFiremodeStr(1, 3) -- useFont4
	local useLetter6 = self:BuildFiremodeStr(2, 3) -- useFont5
	--self:Talk("5 n 6: "..tostring(useLetter5)..tostring(string.len(useLetter5))" , "..tostring(useLetter6)..tostring(string.len(useLetter6)))
	
	--local ammoLetter = self.Primary.AmmoLetter or self:GuessCallibur()
	-- guess calibur
	local cal = self.Primary.AmmoLetter or self:GuessCallibur(1)
	local cal2 = self.Secondary.AmmoLetter or self:GuessCallibur(2)
	
	local bg_n = 1
		if self.BounceWeaponIcon then -- @@@@Move
		local bg_spread		= 2
		local bg_spread2	= bg_spread * -1
		bg_n = math.Rand(bg_spread, bg_spread2)
	end
	local bg_n2 = bg_n*-1
	
	local clip1 = self.Weapon:Clip1()
	local clip1s = tostring(tonumber(clip1))
	local clip2 = self.Weapon:Clip2()
	local clip2s = tostring(tonumber(clip2))
	
	local doPrimary = clip1 > -1 and self.Primary.ClipSize > 0
	local doSecondary = clip2 > -1 and self.Secondary.ClipSize > 0
	
	local grn = Color( 0, 255, 10, 255 )
	local blk = Color( 255, 255, 255,  235) -- For info band
	local blu = Color( 0, 20, 255, 255)
	local blu2 = Color( 0, 20, 255, 125)
	
	local c0 = Color( 255, 120, 45, 255 ) -- IconColor
	local c1 = Color( 255, 125, 55, math.Rand(10, 100) ) -- needs more Rand
	local c2 = Color( 255, 135, 70, math.Rand(10, 100) )
	local c3n = 20 -- Light White
	local c3 = Color( c3n, c3n, c3n, 255 ) -- use 2nd
	local c4n = 200 -- Light Black
	local c4 = Color( c4n, c4n, c4n, 255 ) -- use first	
	local ar1 = clip1 / self.Primary.ClipSize 
	local ar2 = clip2 / self.Secondary.ClipSize
	-- LERP Green to Red for ammo
	local lerpR1 = ((1-ar1) * 250)
	local lerpG1 = ((ar1)* 250)
	local c51 = Color( lerpR1, lerpG1, lerpG1/4, 255 )
	-- LERP Green to Red for ammo
	local lerpR2 = ((1-ar2) * 250)
	local lerpG2 = ((ar2)* 250)
	local c52 = Color( lerpR2, lerpG2, lerpG2/4, 255 )
	
	local c6 = Color( 250, 5, 5, 255 )
	local c7 = Color( 5, 250, 5, 255 )
	
	
	
	if flooded then
		c0 = blu
		c1 = blu
		c2 = blu
		c51 = blu2
		c52 = blu2
	end
	
	if not useLetter then -- @@@@CHECK VAR DEFS!
		useLetter 		= self.IconLetter
		
		if css then
			useFont		= self.CSSelectIcons
		elseif hl2 then
			useFont		= self.HL2SelectIcons
		elseif dods then
			useFont		= self.DoDSelectIcons
		else
			ErrorNoHalt("[!] Font leak detected in cl_init\n")
		end
		-- 
	end
	
	if useFont == self.CSSelectIcons3 then
		-- Adjust for DoD
		useLetter = useLetter2
	end
	--ErrorNoHalt("useFont = "..tostring(useFont).."\n")
	-- Add Pre and Post Font stuff
		local pre = self.FontPre
		local post = self.FontPost
		-- Make sure to properly dupe with the right number when adding
		useFont =  pre .. useFont	.. post		
		useFont2 = pre .. useFont2	.. post		
		useFont3 = pre .. useFont3	.. post		
		useFont4 = pre .. useFont4	.. post		
		useFont5 = pre .. useFont5	.. post		
		useCFont = pre .. useCFont	.. post		
		useNFont = pre .. useNFont	.. post		
		useNFont2 =  pre .. useNFont2 .. post	
		
	-- Display ammo in the background
	--draw.SimpleText( cal, "CSKillIcons", x + wide/2, y + tall*0.2, c51, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
	--						"SelectNumbers2"
	
	
	-- (wide*0.05)
	-- Draw a black bar for text to be highlighhted on
	-- Give ourselves some extra room                   \/
	draw.RoundedBox( 5, x + 0, y + t8, wide*1, tall * 0.45, Color( 0, 0, 0,  255) )
	
	--[[
	TEXT_ALIGN_LEFT		0	Align the text on the left
	TEXT_ALIGN_CENTER	1	Align the text in center
	TEXT_ALIGN_RIGHT	2	Align the text on the right
	TEXT_ALIGN_TOP		3	Align the text on the top
	TEXT_ALIGN_BOTTOM	4	Align the text on the bottom
	--]]
	local siha = TEXT_ALIGN_CENTER
	local siva = TEXT_ALIGN_TOP
	
	-- Draw spazzy stuff
	if true then
	--
		local xr1 =  0
		local xr2 =  0
		local yr1 =  0
		local yr2 = 0
		if self.BounceWeaponIcon then
			xr1 =  math.Rand(-4, 4)
			xr2 =  math.Rand(-6, 6)
			yr1 =  math.Rand(-14, 14)
			yr2 = math.Rand(-9, 9)
		end
		-- try to fool them into thinking they're playing a Tony Hawks game 
		-- Can we bury this joke? Its 2019 and Tony needs to retire
		--[[
		draw.SimpleText( useLetter, useFont, x + wsi + xr1, y + tall*0.2+ yr1, grn, siha , siva )
		draw.SimpleText( useLetter, useFont, x + wsi + xr2, y + tall*0.2+ yr2, grn, siha , siva )
		--]]
		--
		draw.SimpleText( useLetter, useFont, x + wsi + xr1, y + tsi + yr1,	c1, siha , siva )
		draw.SimpleText( useLetter, useFont, x + wsi + xr2, y + tsi + yr2,	c2, siha , siva )
		--]]
	end
	
	if false then
		-- Draw weapon icon style 1
		draw.SimpleText( useLetter, 	useFont,	bg_n + x + wsi,		bg_n + y + tsi,		c4, siha , siva )
		draw.SimpleText( useLetter, 	useFont,	bg_n2 + x + wsi,	bg_n2 + y + tsi,	c3, siha , siva )
		draw.SimpleText( useLetter,		useFont,	x + wsi,			y + tsi,			c0, siha , siva )
	else
		--ErrorNoHalt("UseFont = " .. tostring(useFont) .. "\n")
		--[[
		draw.SimpleText( tostring(useFont), useFont, x + wsi, y + tsi, grn, siha )
		draw.SimpleText( useLetter2, useFont3, (bg_n2) + x + wsi, (bg_n2) + y + tsi, c4, siha )
		draw.SimpleText( useLetter2, useFont3, x + wsi, y + tsi, c0, siha )
		--]]
		--
		draw.SimpleText( useLetter,		useFont,	x + wsi,				y + tsi,		c0, siha , siva )
		draw.SimpleText( useLetter2,	useFont3,	(bg_n2) + x + wsi,	(bg_n2) + y + tsi,	c4, siha , siva )
		draw.SimpleText( useLetter2,	useFont3,	x + wsi,				y + tsi,		c0, siha , siva )
		--]]
	end
	
	-- Draw scope Zoom
	if isTbl(self.Scope) then
		-- Draw current zoom since we care 
		local zoomi = self:GetScopeZoom()
		local zoomx = self.Scope[zoomi]
		local xw = x + (wide * 0.5)
		local yw = y + (tall * 0.92)
		draw.SimpleText( tostring(zoomx).."x", useNFont2, xw, yw, c0, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP  )
	end
	
	-- Draw Clip Amounts
	--[[
	if clip1 > -1 and self.Primary.ClipSize > 0 then
		local uc = c51
		draw.SimpleText( clip1s, useNFont, x + wide/2, y + tall/2, uc, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP  )
	end
	if clip2 > -1 and self.Secondary.ClipSize > 0 then
		local uc = c52
		draw.SimpleText( clip2s, useNFont, x + wide/2, y + tall/2, uc, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP  )
	end
	--]]
	
	
	--[[
	if CLIENT then
		-- Set us up the texture
		surface.SetDrawColor( color_transparent )
		surface.SetTextColor( 255, 120, 45, alpha )
		surface.SetFont( self.WepSelectFont or self.IconLetter )
		local w, h = surface.GetTextSize( self.WepSelectLetter or self.IconLetter )
		
		-- Draw that mother
		surface.SetTextPos( x + ( wide / 2 ) - ( w / 2 ),
						y + ( tall / 2 ) - ( h / 2 ) )
		surface.DrawText( self.WepSelectLetter or self.IconLetter )
	end
	--]]
	
	-- Draw weapon info
	if doPrimary then
		local uc = c51
		local cac = uc -- Cal color
		
		local clx = x + ( wide * 0.02	) -- Clip
		local cly = y + ( t8	)
		
		 -- Cal
		local caa = TEXT_ALIGN_LEFT
		local cax = x + ( w2 )
		local cay = y + ( tall*0.6	)
		if not doSecondary then -- We have extra room
			-- Alter where the cal shows
			cax = x + ( wide * 0.9 )
			cay = y + ( tall * 0.95 )
			caa = TEXT_ALIGN_RIGHT
			cac = c0 -- Make it more readable
		end
		if self.WorksUnderWater == true then
				cac = blu
		end
		
		local fmx = x + ( wide * 0.05	) -- Firemod
		local fmy = y + ( tall	)
		
		-- SimpleTextOutlined? Gray?
		draw.SimpleText( clip1s,		useNFont,	-1 + clx,	-1 + cly,				c3, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP  )
		draw.SimpleText( clip1s,		useNFont,	1 + clx,	 1 + cly,				c4, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP  )
		draw.SimpleText( clip1s,		useNFont,	clx,		cly, 					uc, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP  )
		
		draw.SimpleText( cal,			useCFont,	-1 + cax, 	-1 + cay,				c3, caa, TEXT_ALIGN_TOP  )
		draw.SimpleText( cal,			useCFont,	1 + cax, 	1 + cay,				c4, caa, TEXT_ALIGN_TOP  )
		draw.SimpleText( cal,			useCFont,	cax,		cay, 					cac, caa, TEXT_ALIGN_TOP  )
		
		draw.SimpleText( useLetter5 or useLetter3,	useFont4,	-1 + fmx, 	-1 + fmy,	c3, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP  )
		draw.SimpleText( useLetter5 or useLetter3,	useFont4,	1 + fmx, 	1 + fmy,	c4, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP  )	
		draw.SimpleText( useLetter3,				useFont4,	fmx, 		fmy,	 	uc, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP  )
	end
	
	if doSecondary then
		local uc = c52
		local cac = uc -- Cal color
		if self.WorksUnderWater == true then
			cac = blu
		end
		
		-- Clip
		local clx = x + ( wide*0.98	) 	-- w0.95
		local cly = y + ( t8 )		-- t8
		
		local cax = x + ( w8	) -- Cal
		local cay = y + ( tall*0.6	)
		
		local fmx = x + ( wide*0.95	) 	-- FireMode0.95
		local fmy = y + ( tall*0.7 )	-- t0.4
		
		draw.SimpleText( clip2s,		useNFont, 	1 + clx, 	1 + cly,				c3, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP  )
		draw.SimpleText( clip2s,		useNFont,	-1 + clx,	-1 + cly,				c4, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP  )
		draw.SimpleText( clip2s,		useNFont, 	clx, 		cly,					uc, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP  )
		
		draw.SimpleText( cal2,			useCFont, 	1 + cax, 	1 + cay,				c3, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP  )
		draw.SimpleText( cal2,			useCFont, 	-1 + cax, 	-1 + cay,				c4, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP  )
		draw.SimpleText( cal2,			useCFont, 	cax, 		cay,					cac, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP  )
		
		draw.SimpleText( useLetter6 or useLetter4,	useFont5, 	1 + fmx,	1 + fmy,	c3, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP  )
		draw.SimpleText( useLetter6 or useLetter4,	useFont5, 	-1 + fmx,	-1 + fmy,	c4, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP  )
		draw.SimpleText( useLetter4,				useFont5, 	fmx,		fmy,		uc, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP  )
	end
	
	self:PrintWeaponInfo( x + wide + 5, y + tall * 0.4, alpha ) -- Edit this call too
	
end

function SWEP:SetupCrosshairColor()
	-- Everyone likes console values for crosshair color
	-- If there IS NOT a crosshair_colorster (wont be first time)
	if not self.crosshair_colorstr then
		
		if GetConVarString("cl_crosshair_color") then
			self.crosshair_colorstr = "255 120 45 120"
		else
			self.crosshair_colorstr = GetConVarString("cl_crosshair_color") or "255 120 45 120"
		end
		
		-- Crosshair_colorstr DEFINED ABOVE
		-- If there IS (depending on if the convar is created/defined) crosshair_colorstr
		
		-- if Color String ISNT null (con var is empty)
		if self.crosshair_colorstr then
			-- Generate color from str
			self.crosshair_color = string_split(tostring(self.crosshair_colorstr), " ")
			-- Put that shit into a table, know as crosshair_color.
			self.crosshair_colorCL = Color(	tonumber(self.crosshair_color[1]),
											tonumber(self.crosshair_color[2]),
											tonumber(self.crosshair_color[3]),
											tonumber(self.crosshair_color[4])
										)
		else
		-- No con variable value, Default
			self.crosshair_colorCL 		= Color(255, 120, 45, 120)
			self.crosshair_color		= {255, 120, 45, 120}
			self.crosshair_colorstr 	= "255 120 45 120"
			
			
		end
		-- Oh but if there is, then just set it...
	elseif self.Owner:GetInfo("cl_crosshair_color") ~= self.crosshair_colorstr then
		/* Get the info, no problems
		-- How it SHOULD break down
		-- 1. Define the colorstr
		-- 2. Explode the string at spaces to derive an array
		-- 3. Make Crosshair_color into a color var, with the values of its own array (data change happens after arguments are entered)
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
			ErrorNoHalt("COLORS: ITS JUST NOT A TABLE OF THE RIGHT SPECS! " .. type(self.crosshair_color))
			else
			ErrorNoHalt("COLORS: ITS JUST NOT A TABLE OF THE RIGHT DIM " .. #self.crosshair_color)
			end
		end
		self.crosshair_colorCL 			= Color(self.crosshair_color[1], self.crosshair_color[2], self.crosshair_color[3], self.crosshair_color[4] or 120)
		--											Red						Green					Blue						Alpha
	end
end
--]]

/*---------------------------------------------------------
	DrawHUD
	
	Just a rough mock up showing how to draw your own crosshair.
---------------------------------------------------------*/
function SWEP:DrawHUD()
	
	
	
	--if (isTbl( self.Scope ) and self.Scope[1] == 0) then return end
	
	--[SEE THE FOLLOWING FUNCTION
	if isTbl( self.Scope ) and (self.BadToHipFire or self.Weapon:GetNetworkedBool("Ironsights")) then -- self:CanScopeIn(true)
		
		self:DrawSight_Scope()
	else
		self:DrawSight_CrossHairs()
		--ErrorNoHalt(" . ")
	end
	--]]
end

function SWEP:DrawSight_CrossHairs()
	-- Major check
	if (GetConVarNumber("cl_drawhud") == 0) and (self.DrawCrosshair == false) then return end
	self.Owner:DrawViewModel(true) -- Just to be sure
	if not ( self.Weapon:Clip1() > 0 ) then return end

	-- if isTbl( self.Scope ) then return end -- If its a sniper, then abort, we shouldnt draw it?
	-- IN CROSSHAIRS,
	-- This is probably going to change to a setting

	local x, y 			= ScrW() / 2.0, ScrH() / 2.0 -- Never Touch
	local LastShootTime = self.Weapon:GetNetworkedFloat( "LastShootTime", 0 )-- Scale the size of the crosshair according to how long ago we fired our weapon
	local cone 			= self.Primary.Cone --self:CurrentCone()
	local pwr 			= self.Primary.Recoil
	local addz			= self.Owner:GetViewPunchAngles() -- @@@ Adjust height of XHAIR
	local alpha = 255
	local black = Color(0,0,0,alpha)
	local white = Color(255,255,255,alpha)
	local fiery = Color(255,140,45,alpha)
	
	if ( self.Owner == LocalPlayer() and self.Owner:ShouldDrawLocalPlayer() ) then
		-- Trace
		local tr = util.GetPlayerTrace( self.Owner )
		tr.mask = bit.bor( CONTENTS_SOLID,CONTENTS_MOVEABLE,CONTENTS_MONSTER, CONTENTS_WINDOW,CONTENTS_DEBRIS,CONTENTS_GRATE,CONTENTS_AUX )
		--( CONTENTS_SOLID+CONTENTS_MOVEABLE+CONTENTS_MONSTER+CONTENTS_WINDOW+CONTENTS_DEBRIS+CONTENTS_GRATE+CONTENTS_AUX ) -- List the enums that should mask the crosshair on camrea/thridperson
		local trace = util.TraceLine( tr )
		
		local coords = trace.HitPos:ToScreen()
		x, y = coords.x, coords.y
	else
		--
		local trace = util.TraceLine ({
			start = LocalPlayer():GetShootPos(),
			endpos = LocalPlayer():GetShootPos() + LocalPlayer():GetAimVector() * 4096,
			filter = LocalPlayer(),
			mask = MASK_SHOT 
		}).HitPos

		local screen = trace:ToScreen()
		x = screen.x
		y = screen.y
		
		--]]
	end 
	
	if ( self.Weapon:GetNetworkedBool( "Ironsights" ) or self.Owner:InVehicle() ) then
		surface.DrawCircle( x, y, 1, white ) -- DOT WHITE
		surface.DrawCircle( x, y, 2, black ) -- DOT BLACK
		return -- Simple as that
	end

	local scale =  math.max( GetConVarNumber("cl_crosshair_scale"), (cone * 10) )
	local delta =  math.Clamp( CurTime() - LastShootTime, 0, 1 ) -- Adjust for recoil	
	local ratio = math.Clamp( 2 - delta, 1.00, 2.00 ) 
	local scaler = scale * ratio
	
	-- UN SCALED VALUES
	local anchor	= 40*scaler
	local gap 		= math.Clamp( anchor, 1.00, (ScrH() / 2)-100 )--  For close	
	local length 	= math.Clamp( cl_crosshair_l:GetInt(), 1.00 , (ScrH() / 2)-100 ) -- gap + 20 * scale

	local heat = 0
	local color = {}
			color[1] = cl_crosshair_r:GetInt()
			color[2] = cl_crosshair_g:GetInt()
			color[3] = cl_crosshair_b:GetInt()
			color[4] = cl_crosshair_a:GetInt()
	--color = Color(color) 

	local center_y = y
	local center_x = x
	local addy = 2
	local addx = 2
	local near 	= 40*scale-- just scale
	local far	= length+gap

	local x_l_c		= (x - near)		*1 	-- x left close
	local x_l_f		= (x - far)			*1 	-- x left far
	local x_r_c		= (x + near)		*1 	-- x right close
	local x_r_f		= (x + far)			*1 	-- x right far
	
	local y_u_c		= (y - near)		*1 -- y UP close
	local y_u_f		= (y - (far*0.7))  	*1 -- y UP far
	local y_d_c		= (y + near)		*1 -- y DOWN close
	local y_d_f		= (y + (far*0.7))	*1 -- y DOWN far

	local user_clr = Color(color[1], color[2], color[3], color[4])
	--self:DebugTalk("Crosshair Color: "..tostring(user_clr))
	surface.SetDrawColor(user_clr)
	-- XHAIR TYPE SETTINGS --
	local maxty = 12
	local ty = math.Clamp(GetConVarNumber("cl_crosshair_type"),0, maxty ) -- MAX
	
	if ty == 0 then
		-- Just the circle
	elseif ty == -1 then
		-- for reloading
		-- get reloading time
		return
	elseif ty == 1 then
		--   |
		-- - o -
		--   |
		surface.DrawLine( x_l_f, center_y, x_l_c, center_y )	-- Left
		surface.DrawLine( x_r_f, center_y, x_r_c, center_y )	-- Right
		surface.DrawLine( center_x, y_u_f, center_x, y_u_c )	-- Top/Up
		surface.DrawLine( center_x, y_d_f, center_x, y_d_c )	-- Bottom/Down

	elseif ty == 2 then
		--   ||
		-- = o =
		--   ||
		surface.DrawLine( x_l_f, center_y-addy, x_l_c, center_y-addy )	-- Left T
		surface.DrawLine( x_r_f, center_y-addy, x_r_c, center_y-addy )	-- Right T
		surface.DrawLine( center_x-addx, y_u_f, center_x-addx, y_u_c )	-- Top/Up  L 
		surface.DrawLine( center_x-addx, y_d_f, center_x-addx, y_d_c )	-- Bottom/Down  L
		
		surface.DrawLine( x_l_f, center_y+addy, x_l_c, center_y+addy )	-- Left B
		surface.DrawLine( x_r_f, center_y+addy, x_r_c, center_y+addy )	-- Right B
		surface.DrawLine( center_x+addx, y_u_f, center_x+addx, y_u_c )	-- Top/Up  R 
		surface.DrawLine( center_x+addx, y_d_f, center_x+addx, y_d_c )	-- Bottom/Down  R

	elseif ty == 3 then
		-- 
		-- - o -
		--   |
		
		surface.DrawLine( x_l_f, center_y, x_l_c, center_y )	-- Left
		surface.DrawLine( x_r_f, center_y, x_r_c, center_y )	-- Right
		surface.DrawLine( center_x, y_d_f, center_x, y_d_c )	-- Bottom/Down

	elseif ty == 4 then
		--   |
		-- > o <
		--   ^
		surface.DrawLine( x_l_f, y_u_c, x_l_c, center_y )	-- Left T
		surface.DrawLine( x_r_f, y_u_c, x_r_c, center_y )	-- Right T
		
		surface.DrawLine( x_l_f, y_d_c, x_l_c, center_y )	-- Left B
		surface.DrawLine( x_r_f, y_d_c, x_r_c, center_y )	-- Right B
	
		surface.DrawLine( x_l_c, y_d_f, center_x, y_d_c )	-- Bottom/Down  L
		surface.DrawLine( x_r_c, y_d_f, center_x, y_d_c )	-- Bottom/Down  R
		
		surface.DrawLine( center_x, y_u_f, center_x, y_u_c )	-- Top/Up
		surface.DrawCircle( center_x, y_u_f, 2, user_clr ) -- Top
	elseif ty == 5 then
		--   .
		-- ' o '
		--   '
		--surface.DrawTexturedRect(
		surface.DrawCircle( x_l_c, center_y, 2, user_clr ) -- Left
		surface.DrawCircle( x_r_c, center_y, 2, user_clr ) -- Right
		surface.DrawCircle( center_x, y_u_c, 2, user_clr ) -- Top
		surface.DrawCircle( center_x, y_d_c, 2, user_clr ) -- Bottom
		
		
	elseif ty == 6 then
		-- 
		--    .
		-- '' o ''
		--    '
		--surface.DrawTexturedRect(
		surface.DrawCircle( x_l_c, center_y, 2, user_clr ) -- Left
		surface.DrawCircle( x_r_c, center_y, 2, user_clr ) -- Right
		surface.DrawCircle( center_x, y_u_c, 2, user_clr ) -- Top
		surface.DrawCircle( center_x, y_d_c, 2, user_clr ) -- Bottom
		
		surface.DrawCircle( x_l_f, center_y, 2, user_clr ) -- Left
		surface.DrawCircle( x_r_f, center_y, 2, user_clr ) -- Right
	elseif ty == 7 then
		-- 
		--   
		-- '-o-'
		--   '
		--surface.DrawTexturedRect(
		surface.DrawLine( x_l_f, center_y, x_l_c, center_y )	-- Left
		surface.DrawLine( x_r_f, center_y, x_r_c, center_y )	-- Right
		surface.DrawLine( center_x, y_d_f, center_x, y_d_c )	-- Bottom/Down
		
		surface.DrawCircle( x_l_c, center_y, 2, user_clr ) -- Left
		surface.DrawCircle( x_r_c, center_y, 2, user_clr ) -- Right
		surface.DrawCircle( center_x, y_d_c, 2, user_clr ) -- Bottom
	elseif ty == 8 then
		--   
		-- '=o='
		--   '
		surface.DrawCircle( x_l_c, center_y, 2, user_clr ) -- Left
		surface.DrawCircle( x_r_c, center_y, 2, user_clr ) -- Right
		surface.DrawCircle( center_x, y_d_c, 2, user_clr ) -- Bottom
		
		surface.DrawLine( x_l_f, center_y-addy, x_l_c, center_y-addy )	-- Left T
		surface.DrawLine( x_r_f, center_y-addy, x_r_c, center_y-addy )	-- Right T
		surface.DrawLine( center_x-addx, y_d_f, center_x-addx, y_d_c )	-- Bottom/Down  L
		
		surface.DrawLine( x_l_f, center_y+addy, x_l_c, center_y+addy )	-- Left B
		surface.DrawLine( x_r_f, center_y+addy, x_r_c, center_y+addy )	-- Right B
		surface.DrawLine( center_x+addx, y_d_f, center_x+addx, y_d_c )	-- Bottom/Down  R
		
	elseif ty == 9 then
		--   
		-- '-o-'
		--   '
		surface.DrawCircle( x_l_c, center_y, 2, user_clr ) -- Left
		surface.DrawCircle( x_r_c, center_y, 2, user_clr ) -- Right
		surface.DrawCircle( center_x, y_d_c, 2, user_clr ) -- Bottom
		
		surface.DrawLine( x_l_f, center_y, x_l_c, center_y )	-- Left
		surface.DrawLine( x_r_f, center_y, x_r_c, center_y )	-- Right
	elseif ty == 10 then -- 			
		--	  o
		--	  |
		--	  .
		surface.DrawLine( center_x, y_d_f, center_x, center_y )	-- Bottom/Down
		surface.DrawCircle( center_x, math.max(y_d_c, y_d_c*((anchor/near)*0.9)), 2, user_clr ) -- Bottom
	elseif ty == 11 then
		--	  . 
		--    .
		-- '' o ''
		--    '
		--	  .
		--surface.DrawTexturedRect(
		surface.DrawCircle( x_l_c, center_y, 2, user_clr ) -- Left
		surface.DrawCircle( x_r_c, center_y, 2, user_clr ) -- Right
		surface.DrawCircle( center_x, y_u_c, 2, user_clr ) -- Top
		surface.DrawCircle( center_x, y_d_c, 2, user_clr ) -- Bottom
		
		surface.DrawCircle( x_l_f, center_y, 2, user_clr ) -- Left
		surface.DrawCircle( x_r_f, center_y, 2, user_clr ) -- Right
		surface.DrawCircle( center_x, y_u_f, 2, user_clr ) -- Top
		surface.DrawCircle( center_x, y_d_f, 2, user_clr ) -- Bottom
	elseif ty == 12 then
		--   '
		--
		-- ' o '
		--
		--   '
	elseif ty == 13 then
	elseif ty == 14 then
	elseif ty == 15 then
	
	else
		SetConVar("cl_crosshair_type", 6)
	end
-- Reloading
	local reloading_time = self.Weapon:GetNetworkedInt( "reloadtimer")
	if reloading_time >= CurTime() then
		-- Draw a half circle to show time
		-- x_l_c x_r_c
		local bulk = 20
		local b_x_l = x_l_f
		local b_x_r = x_r_f
		local y_off = y_d_f + bulk
		local s_off = 2
		local s_off2 = s_off * 2
		local width = b_x_r - b_x_l
		local prog = width * math.Clamp( CurTime() / reloading_time, 0, 1 )
		
		surface.SetDrawColor(black)
		surface.DrawRect( b_x_l + s_off, y_off + s_off, width - s_off, bulk - s_off )
		
		surface.SetDrawColor(white)
		surface.DrawRect( b_x_l - s_off, y_off - s_off, width + s_off, bulk + s_off )
		
		
		surface.SetDrawColor(fiery)
		surface.DrawRect( b_x_l + s_off2, y_off + s_off2, prog - s_off2, bulk - s_off2 )
		
	end

-- HEAT 
	if (self.Heat == nil) then
		surface.DrawCircle( center_x, center_y, (gap/2), fiery ) -- Cone Circle
		return 
	else
		heat = self.Heat -- SMH x2


		local heat = LerpVector( heat/(255*3), white, black)

		--surface.SetDrawColor(255-math.max( (255*2) - heat, 0), math.max(255-heat,0), 25, 250)
		surface.DrawCircle( center_x, center_y, (near/2), Color(heat[1],heat[2],heat[3], 250)) -- Cone Circle
		
		
		surface.DrawLine( (x - far -5), center_y, (x - near), center_y )	-- Left HEAT
		surface.DrawLine( (x + far +5), center_y, (x + near), center_y )	-- Right HEAT
	end -- END IF DRAW
end

function SWEP:CanScopeIn( ignore_iron_value ) -- @@@ Check for inherent scoping issues?
	if true then return false end
	local ans = false
	
	local b2,b3,b4
	if not ignore_iron_value then 
		ignore_iron_value = false
	end
	-- @@@ Rewrite needed here
	b2 = ignore_iron_value and not ( self.Weapon:GetNetworkedBool( "Ironsights" ) ) 
	b3 = not isTbl( self.Scope ) 
	--b4 = isTbl( self.Scope ) and not(self.Scope[1] > 0 and self.Scope[1] <= self.ScopeMAX )
	
	-- CHECK ALL NEGATIONS
	ans = ( b2 and b3 ) -- and b4
	
	return ans
end

function SWEP:DrawSight_Scope()
		--(isTbl( self.Scope ) and self.Scope[1] == 0)
	-- @@@Convar for scope use at 0 ammo?
	local isEmpty = not ( self.Weapon:Clip1() > 0 )
	
	if isEmpty and self:GetIronsights() == false  then 
		self.Owner:DrawViewModel(true) -- Just to be sure
		return 
	end

	local x, y = ScrW() / 2.0, ScrH() / 2.0 -- Never Touch
	local LastShootTime = self.Weapon:GetNetworkedFloat( "LastShootTime", 0 )-- Scale the size of the crosshair according to how long ago we fired our weapon
	local cone = self.Primary.Cone
	local pwr = self.Primary.Recoil
	local alpha = 255 -- OPEQUE
	local black = Color(2,3,2,alpha) -- Color match the scope mat
	local white = Color(255,255,255,alpha)
	local fiery = Color(255,140,45,alpha)
	local scopemat = self.ScopeMat or "scope/scope_normal"

	if ( self.Owner == LocalPlayer() and self.Owner:ShouldDrawLocalPlayer() ) then
		local tr = util.GetPlayerTrace( self.Owner )
		tr.mask = bit.bor( CONTENTS_SOLID,CONTENTS_MOVEABLE,CONTENTS_MONSTER, CONTENTS_WINDOW,CONTENTS_DEBRIS,CONTENTS_GRATE,CONTENTS_AUX )
		--( CONTENTS_SOLID+CONTENTS_MOVEABLE+CONTENTS_MONSTER+CONTENTS_WINDOW+CONTENTS_DEBRIS+CONTENTS_GRATE+CONTENTS_AUX ) -- List the enums that should mask the crosshair on camrea/thridperson
		local trace = util.TraceLine( tr )
		
		local coords = trace.HitPos:ToScreen()
		x, y = coords.x, coords.y
	else
		--[
		local trace = util.TraceLine ({
			start = LocalPlayer():GetShootPos(),
			endpos = LocalPlayer():GetShootPos() + LocalPlayer():GetAimVector() * 4096,
			filter = LocalPlayer(),
			mask = MASK_SHOT 
		}).HitPos

		local screen = trace:ToScreen()
		x = screen.x
		y = screen.y
		
		--]]
	end 
	

	if (GetConVarNumber("cl_drawhud") ~= 0) or (self.DrawCrosshair) then
	--[[ Draw an awesome crosshair
	
				cl_crosshairscale			@@@CROSSHAIR
	--]]--
		-- (2 - math.Clamp( (CurTime() - LastShootTime) * 5, 0.0, 1.0 ))
		local scale =  math.max( GetConVarNumber("cl_crosshair_scale"), (self.Primary.Cone * 50) )
		
		local delta =  math.Clamp(CurTime() - LastShootTime, 0, 1 ) -- Adjust for recoil	
		local ratio = math.Clamp( 2-delta, 1.00, 2.00 ) 
		
		local scaler = scale * ratio
		
		
		
		-- UN SCALED VALUES
		local gap 		= math.Clamp( 40*scaler, 1.00, (ScrH() / 2)-100 )--  For close 
		-- @@ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Change to use curcone	
		local length 	= math.Clamp( cl_crosshair_l:GetInt(), 1.00 , (ScrH() / 2)-100 ) -- gap + 20 * scale

		local heat = 60 -- @@ IMPLEMENT ME
		local color = {}
		color[1] = cl_crosshair_r:GetInt()
		color[2] = cl_crosshair_g:GetInt()
		color[3] = cl_crosshair_b:GetInt()
		color[4] = cl_crosshair_a:GetInt()
		--color = Color(color) 

		local center_y = y
		local center_x = x
		local addy = 2
		local addx = 2
		local near 	= gap
		local far	= 0

		local x_l_c		= (x - near)	*1 	-- x left close
		local x_l_f		= (0)		*1 	-- x left far
		local x_r_c		= (x + near)	*1 	-- x right close
		local x_r_f		= (x+x)		*1 	-- x right far
		
		local y_u_c		= (y - near)	*1 -- y UP close
		local y_u_f		= (0)  	*1 -- y UP far
		local y_d_c		= (y + near)	*1 -- y DOWN close
		local y_d_f		= (y+y)		*1 -- y DOWN far

		-- With snipers, we dont just wanna give them an almost DOT sized circle, soooo
		-- @@@ Design accu.-based stats filtering for this?
		
		-- No crosshair when ironsights is on
		if not self.Weapon:GetNetworkedBool( "Ironsights" ) then
			self.Owner:DrawViewModel(true) -- Itd be cool to not do this every frame
			local scaler = 1
			if self.BadToHipFire or (self.Owner:InVehicle()) then
				scaler = 2
			end
			-- Buuut error prevention fur shur
			surface.DrawCircle( center_x, center_y, near*scaler, fiery ) -- Double Cone Circle
			return -- Stop here 
		else
			self.Owner:DrawViewModel(false)
			surface.DrawCircle( center_x, center_y, near, fiery )
		end
		
		if not isEmpty then -- <-- Edit may be worth while on ironsights?

			local user_clr = Color(color[1], color[2], color[3], color[4])
			surface.SetDrawColor(user_clr)
			local maxty = 10
			local ty = math.Clamp(GetConVarNumber("cl_crosshair_type"),0, maxty ) -- MAX
			
			-- @@@EDIT ME!
			-- Need scope sights similar 
			-- to their crosshair counterparts
			
			if ty == 0 then
				-- nothin
			elseif ty == -1 then
				-- for reloading
				
			elseif ty == 1 then
				--   |
				-- - o -
				--   |
				surface.DrawLine( x_l_f, center_y, x_l_c, center_y )	-- Left
				surface.DrawLine( x_r_f, center_y, x_r_c, center_y )	-- Right
				surface.DrawLine( center_x, y_u_f, center_x, y_u_c )	-- Top/Up
				surface.DrawLine( center_x, y_d_f, center_x, y_d_c )	-- Bottom/Down

			elseif ty == 2 then
				--   ||
				-- = o =
				--   ||
				surface.DrawLine( x_l_f, center_y-addy, x_l_c, center_y-addy )	-- Left T
				surface.DrawLine( x_r_f, center_y-addy, x_r_c, center_y-addy )	-- Right T
				surface.DrawLine( center_x-addx, y_u_f, center_x-addx, y_u_c )	-- Top/Up  L 
				surface.DrawLine( center_x-addx, y_d_f, center_x-addx, y_d_c )	-- Bottom/Down  L
				
				surface.DrawLine( x_l_f, center_y+addy, x_l_c, center_y+addy )	-- Left B
				surface.DrawLine( x_r_f, center_y+addy, x_r_c, center_y+addy )	-- Right B
				surface.DrawLine( center_x+addx, y_u_f, center_x+addx, y_u_c )	-- Top/Up  R 
				surface.DrawLine( center_x+addx, y_d_f, center_x+addx, y_d_c )	-- Bottom/Down  R

			elseif ty == 3 then
				-- 
				-- - o -
				--   |
				
				surface.DrawLine( x_l_f, center_y, x_l_c, center_y )	-- Left
				surface.DrawLine( x_r_f, center_y, x_r_c, center_y )	-- Right
				surface.DrawLine( center_x, y_d_f, center_x, y_d_c )	-- Bottom/Down

			elseif ty == 4 then
				--   |
				-- > o <
				--   ^
				surface.DrawLine( x_l_f, y_u_c, x_l_c, center_y )	-- Left T
				surface.DrawLine( x_r_f, y_u_c, x_r_c, center_y )	-- Right T
				
				surface.DrawLine( x_l_f, y_d_c, x_l_c, center_y )	-- Left B
				surface.DrawLine( x_r_f, y_d_c, x_r_c, center_y )	-- Right B
			
				surface.DrawLine( x_l_c, y_d_f, center_x, y_d_c )	-- Bottom/Down  L
				surface.DrawLine( x_r_c, y_d_f, center_x, y_d_c )	-- Bottom/Down  R
				
				surface.DrawLine( center_x, y_u_f, center_x, y_u_c )	-- Top/Up
				surface.DrawCircle( center_x, y_u_f, 2, user_clr ) -- Top
			elseif ty == 5 then
				--   .
				-- ' o '
				--   '
				--surface.DrawTexturedRect(
				surface.DrawCircle( x_l_c, center_y, 2, user_clr ) -- Left
				surface.DrawCircle( x_r_c, center_y, 2, user_clr ) -- Right
				surface.DrawCircle( center_x, y_u_c, 2, user_clr ) -- Top
				surface.DrawCircle( center_x, y_d_c, 2, user_clr ) -- Bottom
				
				
			elseif ty == 6 then
				-- 
				--    .
				-- '' o ''
				--    '
				--surface.DrawTexturedRect(
				surface.DrawCircle( x_l_c, center_y, 2, user_clr ) -- Left
				surface.DrawCircle( x_r_c, center_y, 2, user_clr ) -- Right
				surface.DrawCircle( center_x, y_u_c, 2, user_clr ) -- Top
				surface.DrawCircle( center_x, y_d_c, 2, user_clr ) -- Bottom
				
				surface.DrawCircle( x_l_f, center_y, 2, user_clr ) -- Left
				surface.DrawCircle( x_r_f, center_y, 2, user_clr ) -- Right
			elseif ty == 7 then
				-- 
				--   
				-- '-o-'
				--   '
				--surface.DrawTexturedRect(
				surface.DrawLine( x_l_f, center_y, x_l_c, center_y )	-- Left
				surface.DrawLine( x_r_f, center_y, x_r_c, center_y )	-- Right
				surface.DrawLine( center_x, y_d_f, center_x, y_d_c )	-- Bottom/Down
				
				surface.DrawCircle( x_l_c, center_y, 2, user_clr ) -- Left
				surface.DrawCircle( x_r_c, center_y, 2, user_clr ) -- Right
			elseif ty == 8 then
				--   
				-- '=o='
				--   ' 
				surface.DrawCircle( x_l_c, center_y, 2, user_clr ) -- Left
				surface.DrawCircle( x_r_c, center_y, 2, user_clr ) -- Right
				surface.DrawCircle( center_x, y_d_c, 2, user_clr ) -- Bottom
				
				surface.DrawLine( x_l_f, center_y-addy, x_l_c, center_y-addy )	-- Left T
				surface.DrawLine( x_r_f, center_y-addy, x_r_c, center_y-addy )	-- Right T
				surface.DrawLine( center_x-addx, y_d_f, center_x-addx, y_d_c )	-- Bottom/Down  L
				
				surface.DrawLine( x_l_f, center_y+addy, x_l_c, center_y+addy )	-- Left B
				surface.DrawLine( x_r_f, center_y+addy, x_r_c, center_y+addy )	-- Right B
				surface.DrawLine( center_x+addx, y_d_f, center_x+addx, y_d_c )	-- Bottom/Down  R
				
			elseif ty == 9 then
				--   
				-- '-o-'
				--   '
				surface.DrawCircle( x_l_c, center_y, 2, user_clr ) -- Left
				surface.DrawCircle( x_r_c, center_y, 2, user_clr ) -- Right
				surface.DrawCircle( center_x, y_d_c, 2, user_clr ) -- Bottom
				
				surface.DrawLine( x_l_f, center_y, x_l_c, center_y )	-- Left
				surface.DrawLine( x_r_f, center_y, x_r_c, center_y )	-- Right
			elseif ty == 10 then -- 
				--   
				-- '-o-'
				--   '
			elseif ty == 11 then
			elseif ty == 12 then
			elseif ty == 13 then
			elseif ty == 14 then
			elseif ty == 15 then
			
			else
				cl_crosshair_type = 5
			end
		
		end
	-- The scope
			local res = surface.ScreenHeight() * 0.4
			
			-- Put the texture 
			surface.SetDrawColor(2,30, 2, 255) -- @@@VaR ME
			surface.SetTexture(surface.GetTextureID( scopemat )) -- "scope/scope_reddot"
			surface.DrawTexturedRect((surface.ScreenWidth()/2) - res, (surface.ScreenHeight()/2) - res, 2*res, 2*res)
			--[[
					self.LensTable.x = (surface.ScreenWidth()/2) - res
					self.LensTable.y = (surface.ScreenHeight()/2) - res
					self.LensTable.w = 2*res
					self.LensTable.h = 2*res
			--]]
			-- Fill in everything else 
			surface.SetDrawColor(2, 3, 2, 255) -- @@@VaR ME
			surface.DrawRect( -2.5, -2.5, surface.ScreenWidth() + 5, (surface.ScreenHeight()/2) - res + 5)
			surface.DrawRect( -2.5, (surface.ScreenHeight()/2) + res - 2.5, surface.ScreenWidth() + 5, (surface.ScreenHeight()/2) - res + 5)
			surface.DrawRect( -2.5, -2.5, (surface.ScreenWidth()/2) - res + 5, surface.ScreenHeight() + 5)
			surface.DrawRect((surface.ScreenWidth()/2) + res - 2.5, -2.5, (surface.ScreenWidth()/2) - res + 5, surface.ScreenHeight() + 5)
			
			
		end -- END IF DRAW
	end

function SWEP:TranslateFOV(current_fov)
	-- Adjust cl FOV
		local zoomi = self:GetScopeZoom() or 1
		local zoom = self.IronSightZoom or 1
	if isTbl(self.Scope) then
		-- Use index to grab zoom float
		zoom = math.min( math.abs(self.Scope[zoomi] or 2) , self.ScopeMAX )
	end
	
	local bIron = self.Weapon:GetNetworkedBool("Ironsights")
	if bIron ~= self.bLastIron then -- Do the same thing as in CalcViewModel.  I don't know why this works, but it does.
		self.bLastIron = bIron 
		self.fIronTime = CurTime()
	end
	
	local fIronTime = self.fIronTime or 0

	if not bIron and (fIronTime < CurTime() - FOV_TIME) then 
		return current_fov
	end
	
	local Mul = 1.0 -- More interpolating shit
	
	if fIronTime > CurTime() - FOV_TIME then
	
		Mul = math.Clamp((CurTime() - fIronTime) / FOV_TIME, 0, 1)
		if not bIron then Mul = 1 - Mul end
	
	end

	current_fov = current_fov*(1 + Mul/ zoom - Mul)

	return current_fov
end
  
/*---------------------------------------------------------
	Precache
---------------------------------------------------------*/
function SWEP:Precache()
	-- Cache before use
    util.PrecacheSound( self.Primary.Sound )
    util.PrecacheSound( self.Secondary.Sound )
--[[
    util.PrecacheSound( self.Primary.SuppressedSound )
    util.PrecacheSound( self.Primary.ReloadSound )
	--]]
end
