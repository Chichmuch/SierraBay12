/datum/stack_recipe/furniture/stairs
	title = "interior stairs"
	result_type = /obj/structure/fake_stairs
	req_amount = 6
	time = 50
	send_material_data = 0

/datum/stack_recipe/furniture/platform
	title = "platform"
	result_type = /obj/structure/railing/platform
	req_amount = 3
	time = 40
	send_material_data = 1


/material/steel/generate_recipes(reinforce_material)
	. = ..()
	if(reinforce_material)
		return
	. += new/datum/stack_recipe/furniture/stairs(src)

/material/generate_recipes()
	.=..()
	if(integrity >= 50 && hardness >= MATERIAL_FLEXIBLE + 10)
		. += new/datum/stack_recipe/furniture/platform(src)
