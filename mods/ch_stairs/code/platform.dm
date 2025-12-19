/obj/structure/railing/platform
	name = "platform"
	desc = ""
	icon = 'mods/ch_stairs/icons/platform.dmi'
	icon_state = "preview"
	density = TRUE
	climb_speed_mult = 0.35
	anchored = TRUE
	health_max = 100

/obj/structure/railing/platform/mapped
	material = MATERIAL_ALUMINIUM
	init_color = COLOR_GUNMETAL

/obj/structure/railing/platform/mapped/below_stairs
	layer = CATWALK_LAYER


// /obj/structure/railing/platform/Initialize(mapload, material_key)
// 	. = ..()
// 	desc = "A simple [material.display_name] railing designed to protect against careless trespass."


/obj/structure/railing/platform/on_update_icon(update_neighbors = TRUE)
	NeighborsCheck(update_neighbors)
	ClearOverlays()
	if (!neighbor_status)
		icon_state = "base"
		AddOverlays(image(icon, "_base", layer = ABOVE_HUMAN_LAYER))
	else
		if (neighbor_status & 32)
			AddOverlays(image(icon, "corner"))
		if ((neighbor_status & 16) || !(neighbor_status & 32) || (neighbor_status & 64))
			AddOverlays(image(icon, "front_l"))
			AddOverlays(image(icon, "_front_l", layer = ABOVE_HUMAN_LAYER))
		if (!(neighbor_status & 2) || (neighbor_status & 1) || (neighbor_status & 4))
			AddOverlays(image(icon, "front_r"))
			AddOverlays(image(icon, "_front_r", layer = ABOVE_HUMAN_LAYER))
			if (neighbor_status & 4)
				var/pix_offset_x = 0
				var/pix_offset_y = 0
				switch (dir)
					if (NORTH)
						pix_offset_x = 32
					if (SOUTH)
						pix_offset_x = -32
					if (EAST)
						pix_offset_y = -32
					if (WEST)
						pix_offset_y = 32
				AddOverlays(image(icon, "mcorner", pixel_x = pix_offset_x, pixel_y = pix_offset_y))
				AddOverlays(image(icon, "_mcorner", pixel_x = pix_offset_x, pixel_y = pix_offset_y, layer = ABOVE_HUMAN_LAYER))


/obj/structure/railing/platform/use_tool(obj/item/tool, mob/user, list/click_params)
	// Welding Tool - Repair
	if (isWelder(tool))
		if (!health_damaged())
			USE_FEEDBACK_FAILURE("\The [src] doesn't require repairs.")
			return TRUE
		playsound(src, 'sound/items/Welder.ogg', 50, TRUE)
		user.visible_message(
			SPAN_NOTICE("\The [user] starts repairing \the [src] with \a [tool]."),
			SPAN_NOTICE("You start repairing \the [src] with \the [tool].")
		)
		if (!user.do_skilled((tool.toolspeed * 2) SECONDS, SKILL_CONSTRUCTION, src, do_flags = DO_REPAIR_CONSTRUCT) || !user.use_sanity_check(src, tool))
			return TRUE
		if (!health_damaged())
			USE_FEEDBACK_FAILURE("\The [src] doesn't require repairs.")
			return TRUE
		playsound(src, 'sound/items/Welder.ogg', 50, TRUE)
		restore_health(get_max_health() / 5)
		user.visible_message(
			SPAN_NOTICE("\The [user] repairs \the [src] with \a [tool]."),
			SPAN_NOTICE("You repair \the [src] with \the [tool].")
		)
		return TRUE
	// Wrench - Dismantle
	if (isWrench(tool))
		playsound(src, 'sound/items/Ratchet.ogg', 50, TRUE)
		user.visible_message(
			SPAN_NOTICE("\The [user] starts dismantling \the [src] with \a [tool]."),
			SPAN_NOTICE("You start dismantling \the [src] with \the [tool].")
		)
		if (!user.do_skilled((tool.toolspeed * 2) SECONDS, SKILL_CONSTRUCTION, src, do_flags = DO_REPAIR_CONSTRUCT) || !user.use_sanity_check(src, tool))
			return TRUE
		playsound(src, 'sound/items/Ratchet.ogg', 50, TRUE)
		var/obj/new_sheet = material.place_sheet(loc, 2)
		transfer_fingerprints_to(new_sheet)
		user.visible_message(
			SPAN_NOTICE("\The [user] dismantles \the [src] with \a [tool]."),
			SPAN_NOTICE("You dismantle \the [src] with \the [tool].")
		)
		qdel_self()
		return TRUE

	if (isScrewdriver(tool))
		return TRUE

	return ..()
