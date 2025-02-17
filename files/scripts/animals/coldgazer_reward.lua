dofile_once("data/scripts/lib/utilities.lua")

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	local entity_id = GetUpdatedEntityID()
	local pos_x,pos_y = EntityGetTransform(entity_id)

	SetRandomSeed( GameGetFrameNum(), pos_x + pos_y + entity_id )


    if ModIsEnabled("copis_things") then
        opts = {"ICEBALL", "CIRCLE_WATER", "ACIDSHOT", "LANCE", "BUBBLESHOT", "ROCKET_TIER_3", "GRENADE_TIER_3", "SPITTER_TIER_3", "SPITTER_TIER_3", "LIGHT_BULLET_TRIGGER", "LIGHT_BULLET_TRIGGER_2", "ROCKET_TIER_2", "GRENADE_TIER_2", "SWAPPER_PROJECTILE", "BUCKSHOT", "SHIELD_FIELD", "FREEZE", "BALL_LIGHTNING", "CHAOS_POLYMORPH_FIELD", "BLOOD_MAGIC", "MANA_REDUCE", "CHAINSAW", "RECHARGE", "HOMING_SHOOTER", "HOMING", "BLOODLUST", "MOCREEPS_BOMB_GIGA", "MOCREEPS_AQUA_MINE", "BURST_8", "COPIS_THINGS_SUMMON_HAMIS", "COPIS_THINGS_UPGRADE_MANA_CHARGE_SPEED", "COPIS_THINGS_UPGRADE_MANA_MAX", "COPIS_THINGS_UPGRADE_FIRE_RATE_WAIT", "COPIS_THINGS_UPGRADE_RELOAD_TIME", "COPIS_THINGS_ARCANE_TURRET", "COPIS_THINGS_ANCHORED_SHOT", "COPIS_THINGS_LUNGE", "COPIS_THINGS_SLOW", "COPIS_THINGS_CONCRETEBALL", "COPIS_THINGS_SLOW_BULLET_TIMER_N", "COPIS_THINGS_SCATTER_6", "COPIS_THINGS_CAUSTIC_CLAW", "COPIS_THINGS_LUMINOUS_BLADE", "COPIS_THINGS_ASTRAL_VORTEX", "COPIS_THINGS_LARPA_FORWARDS"}
    elseif ModIsEnabled("variaAddons") then
        opts = {"ICEBALL", "CIRCLE_WATER", "ACIDSHOT", "LANCE", "BUBBLESHOT", "ROCKET_TIER_3", "GRENADE_TIER_3", "SPITTER_TIER_3", "SPITTER_TIER_3", "LIGHT_BULLET_TRIGGER", "LIGHT_BULLET_TRIGGER_2", "ROCKET_TIER_2", "GRENADE_TIER_2", "SWAPPER_PROJECTILE", "BUCKSHOT", "SHIELD_FIELD", "FREEZE", "BALL_LIGHTNING", "CHAOS_POLYMORPH_FIELD", "BLOOD_MAGIC", "MANA_REDUCE", "CHAINSAW", "RECHARGE", "HOMING_SHOOTER", "HOMING", "BLOODLUST", "MOCREEPS_BOMB_GIGA", "MOCREEPS_AQUA_MINE", "BURST_8", "VARIA_SLASH", "VARIA_BULLET", "VARIA_BULLET_TRIGGER", "VARIA_SHOTGUN_SHELL", "VARIA_RE_ADDED_CHARM_FIELD", "VARIA_JUMPER_BLAST", "VARIA_LUKKI_BOMB", "VARIA_CRESCENT_WAVE_POISON", "VARIA_BLINK", "VARIA_BEES"}
    else
        opts = {"ICEBALL", "CIRCLE_WATER", "ACIDSHOT", "LANCE", "BUBBLESHOT", "ROCKET_TIER_3", "GRENADE_TIER_3", "SPITTER_TIER_3", "SPITTER_TIER_3", "LIGHT_BULLET_TRIGGER", "LIGHT_BULLET_TRIGGER_2", "ROCKET_TIER_2", "GRENADE_TIER_2", "SWAPPER_PROJECTILE", "BUCKSHOT", "SHIELD_FIELD", "FREEZE", "BALL_LIGHTNING", "CHAOS_POLYMORPH_FIELD", "BLOOD_MAGIC", "MANA_REDUCE", "CHAINSAW", "RECHARGE", "HOMING_SHOOTER", "HOMING", "BLOODLUST", "MOCREEPS_BOMB_GIGA", "MOCREEPS_AQUA_MINE", "BURST_8"}
    end

    count = 3

    for i = 1, count do
        local rnd = Random(1, #opts)
        CreateItemActionEntity(opts[rnd], pos_x - 8 * count + (i - 0.5) * 16, pos_y)
        table.remove(opts, rnd)
    end
end