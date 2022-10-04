dofile_once("data/scripts/lib/utilities.lua")
local seasonalSetting = ModSettingGet( "mo_creeps.seasonal_events" )

function collision_trigger()
	
	local ambrosiaCats = ModSettingGet( "mo_creeps.congacat_cat_immortal" )
	local cat_list = { "cat_mocreeps", "cat_mocreeps_black", "cat_mocreeps", "cat_mocreeps_black", "cat_mocreeps_white", "cat_mocreeps_spoopy", "cat_mocreeps_spoopy_skittle", "cat_mocreeps_spoopy_frisky", "cat_mocreeps_spoopy_tiger" }

	if seasonalSetting == true then
		local year, month, day = GameGetDateAndTimeLocal()
		
		if ( month == 10 ) and ( day >= 1 ) then -- Halloween Event
			cat_list = { "cat_mocreeps", "cat_mocreeps_black", "cat_mocreeps_black", "cat_mocreeps_black", "cat_mocreeps_black", "cat_mocreeps_black", "cat_mocreeps_black", "cat_mocreeps_white", "cat_mocreeps_spoopy", "cat_mocreeps_spoopy", "cat_mocreeps_spoopy", "cat_mocreeps_spoopy", "cat_mocreeps_spoopy", "cat_mocreeps_spoopy", "cat_mocreeps_spoopy_skittle", "cat_mocreeps_spoopy_frisky", "cat_mocreeps_spoopy_tiger" }
		elseif ( month == 12 ) and ( day >= 22 ) then --Smissmass Event
			cat_list = { "cat_mocreeps", "cat_mocreeps_black", "cat_mocreeps_white", "cat_mocreeps_white", "cat_mocreeps_white", "cat_mocreeps_spoopy", "cat_mocreeps_spoopy_skittle", "cat_mocreeps_spoopy_skittle", "cat_mocreeps_spoopy_frisky", "cat_mocreeps_spoopy_frisky", "cat_mocreeps_spoopy_frisky", "cat_mocreeps_spoopy_tiger" }
		end
	end

	if ambrosiaCats == true then
		local entity_id    = GetUpdatedEntityID()
		local pos_x, pos_y = EntityGetTransform( entity_id )
		SetRandomSeed( GameGetFrameNum(), pos_x + entity_id )
		local goldenCatSeed = Random( 1, 50)
		local rainbowCatSeed = Random( 1, 50)
		local esotericCatSeed = Random( 1, 100)
			
		pos_x, pos_y = EntityGetTransform( entity_id )

		local rnd = Random( 1, #cat_list )
		local target = cat_list[rnd]

		EntityLoad( "data/entities/animals/cat_immortal/" .. target .. ".xml", pos_x, pos_y )
	
		if goldenCatSeed == 1 then
			EntityLoad( "data/entities/animals/cat_immortal/cat_mocreeps_golden.xml", pos_x, pos_y )
		elseif goldenCatSeed == 2 then
			EntityLoad( "data/entities/animals/cat_immortal/cat_mocreeps_spoopy_golden.xml", pos_x, pos_y )
		elseif goldenCatSeed >= 40 then
			EntityLoad( "data/entities/animals/cat_immortal/cat_mocreeps_skateboard.xml", pos_x, pos_y )
		end
	
		if rainbowCatSeed == 50 then
			EntityLoad( "data/entities/animals/cat_immortal/cat_mocreeps_sorako.xml", pos_x, pos_y )
		elseif rainbowCatSeed >= 47 then
			EntityLoad( "data/entities/animals/cat_immortal/cat_mocreeps_wizard.xml", pos_x, pos_y )
		end
		--OMG GUYS I'M A RAINBOW KITTY! - Sorako
	
		if esotericCatSeed == 100 then
			EntityLoad( "data/entities/animals/cat_immortal/cat_mocreeps_esoteric.xml", pos_x, pos_y )
		end

		if seasonalSetting == true then
			local year, month, day = GameGetDateAndTimeLocal()
			-- Halloween Event
			if ( month == 10 ) and ( day >= 1 ) then
				if esotericCatSeed >= 95 then
					EntityLoad( "data/entities/animals/cat_immortal/cat_mocreeps_esoteric.xml", pos_x, pos_y )
				end
			end

			-- Smissmass Event
			if ( month == 10 ) and ( day >= 1 ) then
				if goldenCatSeed <= 4 then
					EntityLoad( "data/entities/animals/cat_immortal/cat_mocreeps_golden.xml", pos_x, pos_y )
				elseif goldenCatSeed <= 6 then
					EntityLoad( "data/entities/animals/cat_immortal/cat_mocreeps_spoopy_golden.xml", pos_x, pos_y )
				end

				if rainbowCatSeed <= 2 then
					EntityLoad( "data/entities/animals/cat_immortal/cat_mocreeps_sorako.xml", pos_x, pos_y )
				end
			end
		end
		
		EntityKill( entity_id )
	
	else

		local entity_id    = GetUpdatedEntityID()
		local pos_x, pos_y = EntityGetTransform( entity_id )
		SetRandomSeed( GameGetFrameNum(), pos_x + entity_id )
		local goldenCatSeed = Random( 1, 50)
		local rainbowCatSeed = Random( 1, 50)
		local esotericCatSeed = Random( 1, 100)
			
		pos_x, pos_y = EntityGetTransform( entity_id )

		local rnd = Random( 1, #cat_list )
		local target = cat_list[rnd]

		EntityLoad( "data/entities/animals/" .. target .. ".xml", pos_x, pos_y )

		if goldenCatSeed == 1 then
			EntityLoad( "data/entities/animals/cat_mocreeps_golden.xml", pos_x, pos_y )
		elseif goldenCatSeed == 2 then
			EntityLoad( "data/entities/animals/cat_mocreeps_spoopy_golden.xml", pos_x, pos_y )
		elseif goldenCatSeed >= 40 then
			EntityLoad( "data/entities/animals/cat_mocreeps_skateboard.xml", pos_x, pos_y )
		end

		if rainbowCatSeed == 50 then
			EntityLoad( "data/entities/animals/cat_mocreeps_sorako.xml", pos_x, pos_y )
		elseif rainbowCatSeed >= 47 then
			EntityLoad( "data/entities/animals/cat_mocreeps_wizard.xml", pos_x, pos_y )
		end
		--OMG GUYS I'M A RAINBOW KITTY! - Sorako

		if esotericCatSeed == 100 then
			EntityLoad( "data/entities/animals/cat_mocreeps_esoteric.xml", pos_x, pos_y )
		end

		if seasonalSetting == true then
			local year, month, day = GameGetDateAndTimeLocal()
			-- Halloween Event
			if ( month == 10 ) and ( day >= 1 ) then
				if esotericCatSeed >= 95 then
					EntityLoad( "data/entities/animals/cat_mocreeps_esoteric.xml", pos_x, pos_y )
				end
			end
		end

		if seasonalSetting == true then
			-- Smissmass Event
			if ( month == 10 ) and ( day >= 1 ) then
				if goldenCatSeed <= 4 then
					EntityLoad( "data/entities/animals/cat_mocreeps_golden.xml", pos_x, pos_y )
				elseif goldenCatSeed <= 6 then
					EntityLoad( "data/entities/animalsl/cat_mocreeps_spoopy_golden.xml", pos_x, pos_y )
				end

				if rainbowCatSeed <= 2 then
					EntityLoad( "data/entities/animals/cat_mocreeps_sorako.xml", pos_x, pos_y )
				end
			end
		end
		
		EntityKill( entity_id )
	end
end