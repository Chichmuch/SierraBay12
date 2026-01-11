/obj/structure/deco_stairs
	name = "stairs"
	desc = "A simple interior stairs designed for elevated spaces."
	icon = 'mods/ch_stairs/icons/stairs.dmi'
	icon_state = "steel"
	density = FALSE
	anchored = TRUE
	layer = ABOVE_CATWALK_LAYER
	footstep_type = /singleton/footsteps/plating
	obj_flags = OBJ_FLAG_NOFALL
	color = "#6c737a"

/obj/structure/deco_stairs/edge
	icon_state = "steel-edge"

/obj/structure/deco_stairs/ex_act(severity)
	switch(severity)
		if(EX_ACT_DEVASTATING)
			new /obj/item/stack/material/steel(loc, 2)
			qdel(src)
		if(EX_ACT_HEAVY)
			new /obj/item/stack/material/steel(loc, 1)
			qdel(src)

/obj/structure/deco_stairs/use_tool(obj/item/tool, mob/user, list/click_params)
	var/dismantle = FALSE

	if (istype(tool, /obj/item/gun/energy/plasmacutter))
		var/obj/item/gun/energy/plasmacutter/cutter = tool
		if (!cutter.slice(user))
			return TRUE
		dismantle = TRUE

	if (isWelder(tool))
		var/obj/item/weldingtool/welder = tool
		report_progress(1)
		if (!welder.remove_fuel(2, user))
			report_progress(2)
			return TRUE
		dismantle = TRUE
		report_progress(3)
		report_progress(dismantle)
		report_progress(3)

	if (dismantle)
		report_progress(4)
		playsound(src, 'sound/items/Welder.ogg', 50, TRUE)
		user.visible_message(
			SPAN_NOTICE("\The [user] starts dismantling \the [src] with \a [tool]."),
			SPAN_NOTICE("You start dismantling \the [src] with \the [tool].")
		)
		report_progress(5)
		if (!user.do_skilled((tool.toolspeed * 2) SECONDS, SKILL_CONSTRUCTION, src, do_flags = DO_REPAIR_CONSTRUCT) || !user.use_sanity_check(src, tool))
			return TRUE
		report_progress(6)
		playsound(src, 'sound/items/Welder.ogg', 50, TRUE)
		report_progress(7)
		var/obj/new_sheet = new /obj/item/stack/material/steel(loc, 5)
		report_progress(8)
		transfer_fingerprints_to(new_sheet)
		user.visible_message(
				SPAN_NOTICE("\The [user] dismantles \the [src] with \a [tool]."),
				SPAN_NOTICE("You dismantle \the [src] with \the [tool].")
			)
		report_progress(9)
		qdel_self()
		report_progress(10)
		return TRUE

	var/parent = ..()
	if (parent)
		return TRUE
