// /obj/mob_offseter
// 	var/offset = 0

// /obj/mob_offseter/Crossed(mob/living/M)
// 	if(istype(M))
// 		M.on_structure_offset(mob_offset)
// 	..()



// /obj/structure/stairs
// 	icon = 'mods/ch_stairs/icons/zstairs.dmi'
// 	icon_state = "above"

// /obj/structure/stairs/Crossed(mob/living/M)
// 	if(istype(M))
// 		if (get_dist(M.loc, loc) > 0)
// 			M.on_structure_offset(12)
// 		else
// 			M.on_structure_offset(24)
