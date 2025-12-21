/obj/structure/fake_stairs
	name = "stairs"
	desc = "A simple interior stairs designed for complex spaces."
	icon = 'mods/ch_stairs/icons/stairs.dmi'
	icon_state = "base"
	density = FALSE
	anchored = TRUE
	layer = ABOVE_CATWALK_LAYER
	footstep_type = /singleton/footsteps/plating
	obj_flags = OBJ_FLAG_NOFALL
	color = "#6c737a"

/obj/structure/fake_stairs/edge
	icon_state = "base-edge"

/obj/structure/fake_stairs/ex_act(severity)
	switch(severity)
		if(EX_ACT_DEVASTATING)
			material.place_sheet(loc, 2)
			qdel(src)
		if(EX_ACT_HEAVY)
			material.place_sheet(loc, 1)
			qdel(src)

/obj/structure/fake_stairs/use_tool(obj/item/tool, mob/user, list/click_params)
	var/dismantle = FALSE

	if (istype(tool, /obj/item/gun/energy/plasmacutter))
		var/obj/item/gun/energy/plasmacutter/cutter = tool
		if (!cutter.slice(user))
			return TRUE
		dismantle = TRUE

	if (isWelder(tool))
		var/obj/item/weldingtool/welder = tool
		if (!welder.remove_fuel(2, user))
			return TRUE
		dismantle = TRUE

	if (dismantle = TRUE)
		playsound(src, 'sound/items/Welder.ogg', 50, TRUE)
		user.visible_message(
			SPAN_NOTICE("\The [user] starts dismantling \the [src] with \a [tool]."),
			SPAN_NOTICE("You start dismantling \the [src] with \the [tool].")
		)
		if (!user.do_skilled((tool.toolspeed * 2) SECONDS, SKILL_CONSTRUCTION, src, do_flags = DO_REPAIR_CONSTRUCT) || !user.use_sanity_check(src, tool))
			return TRUE
		playsound(src, 'sound/items/Welder.ogg', 50, TRUE)
		var/obj/new_sheet = material.place_sheet(loc, 5)
		transfer_fingerprints_to(new_sheet)
		user.visible_message(
				SPAN_NOTICE("\The [user] dismantles \the [src] with \a [tool]."),
				SPAN_NOTICE("You dismantle \the [src] with \the [tool].")
			)
		qdel_self()
		return TRUE

	var/parent = ..()
	if (parent)
		return TRUE
