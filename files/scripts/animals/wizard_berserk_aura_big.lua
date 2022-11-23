dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local x,y = EntityGetTransform( entity_id )
local r = 300
local particlePath = "mods/mo_creeps/files/entities/misc/effect_berserk_short_evil_perk.xml"
if ModSettingGet( "mo_creeps.particle_reduction" ) then
	particlePath = "mods/mo_creeps/files/entities/misc/effect_berserk_short_evil_perk_lowparticles.xml"
end

local targets = EntityGetInRadiusWithTag( x, y, r, "enemy" )

for i,v in ipairs( targets ) do
	if ( v ~= entity_id ) then
		local c = EntityGetAllChildren( v )
		local valid = true
		
		if ( c ~= nil ) then
			for a,b in ipairs( c ) do
				local comps = EntityGetComponent( b, "GameEffectComponent", "effect_berserk_short_evil" )
				
				if ( comps ~= nil ) then
					valid = false
					break
				end
			end
		end
		
		if valid then
			local eid = EntityLoad( particlePath, x, y )
			EntityAddChild( v, eid )
		end
	end
end
