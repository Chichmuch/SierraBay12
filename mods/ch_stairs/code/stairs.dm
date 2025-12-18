/obj/structure/fake_stairs
	name = "stairs"
	desc = ""
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

// /obj/structure/fake_stairs/Initialize()
// 	. = ..()
	// DELETE_IF_DUPLICATE_OF(/obj/structure/fake_stairs)

// /obj/structure/fake_stairs/ex_act(severity)
// 	switch(severity)
// 		if(EX_ACT_DEVASTATING)
// 			new /obj/item/stack/material/rods(src.loc)
// 			qdel(src)
// 		if(EX_ACT_HEAVY)
// 			new /obj/item/stack/material/rods(src.loc)
// 			qdel(src)

// /obj/structure/fake_stairs/proc/deconstruct(mob/user)
// 	playsound(src, 'sound/items/Welder.ogg', 100, 1)
// 	to_chat(user, SPAN_NOTICE("Slicing \the [src] joints ..."))
// 	new /obj/item/stack/material/rods(src.loc)
// 	new /obj/item/stack/material/rods(src.loc)
// 	//Lattice would delete itself, but let's save ourselves a new obj
// 	if(istype(src.loc, /turf/space) || istype(src.loc, /turf/simulated/open))
// 		new /obj/structure/lattice/(src.loc)
// 	if(plated_tile)
// 		new plated_tile.build_type(src.loc)
// 	qdel(src)

// /obj/structure/fake_stairs/use_weapon(obj/item/weapon, mob/living/user, list/click_params)
// 	var/parent = ..()
// 	if (parent)
// 		return TRUE

// 	var/turf/floor = get_turf(src)
// 	return floor.use_weapon(weapon, user, click_params)

/obj/structure/fake_stairs/use_tool(obj/item/tool, mob/user, list/click_params)
	// if (isCrowbar(tool))
	// 	if (!plated_tile)
	// 		USE_FEEDBACK_FAILURE("\The [src] is not plated and has no hatch to open.")
	// 		return TRUE
	// 	hatch_open = !hatch_open
	// 	update_icon()
	// 	user.visible_message(
	// 		SPAN_NOTICE("\The [user] pries \the [src]'s maintenance hatch open with \a [tool]."),
	// 		SPAN_NOTICE("You pry \the [src]'s maintenance hatch open with \the [tool].")
	// 	)
	// 	return TRUE

	// if (istype(tool, /obj/item/gun/energy/plasmacutter))
	// 	var/obj/item/gun/energy/plasmacutter/cutter = tool
	// 	if (!cutter.slice(user))
	// 		return TRUE
	// 	deconstruct(user)
	// 	return TRUE

	// if (isWelder(tool))
	// 	var/obj/item/weldingtool/welder = tool
	// 	if (!welder.remove_fuel(1, user))
	// 		return TRUE
	// 	deconstruct(user)
	// 	return TRUE

	// if (istype(tool, /obj/item/stack/tile))
	// 	if (plated_tile)
	// 		USE_FEEDBACK_FAILURE("\The [src] is already plated.")
	// 		return TRUE
	// 	var/obj/item/stack/tile/stack = tool
	// 	if (!stack.can_use(1))
	// 		USE_FEEDBACK_STACK_NOT_ENOUGH(stack, 1, "to plate \the [src].")
	// 		return TRUE
	// 	user.visible_message(
	// 		SPAN_NOTICE("\The [user] starts plating \the [src] with \a [tool]."),
	// 		SPAN_NOTICE("You start plating \the [src] with \the [tool].")
	// 	)
	// 	if (!user.do_skilled(1 SECOND, SKILL_CONSTRUCTION, src, do_flags = DO_REPAIR_CONSTRUCT) || !user.use_sanity_check(src, tool))
	// 		return TRUE
	// 	if (!stack.use(1))
	// 		USE_FEEDBACK_STACK_NOT_ENOUGH(stack, 1, "to plate \the [src].")
	// 		return TRUE
	// 	var/list/singletons = GET_SINGLETON_SUBTYPE_MAP(/singleton/flooring)
	// 	for (var/flooring_type in singletons)
	// 		var/singleton/flooring/F = singletons[flooring_type]
	// 		if (!F.build_type)
	// 			continue
	// 		if (ispath(stack.type, F.build_type))
	// 			plated_tile = F
	// 			break
	// 	update_icon()
	// 	SetName("plated catwalk")
	// 	user.visible_message(
	// 		SPAN_NOTICE("\The [user] plates \the [src] with \a [tool]."),
	// 		SPAN_NOTICE("You plate \the [src] with \the [tool].")
	// 	)
	// 	return TRUE

	var/parent = ..()
	if (parent)
		return TRUE

	// var/turf/floor = get_turf(src)
	// return floor.use_tool(tool, user, click_params)
