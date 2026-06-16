/obj/machinery/phone
	name = "phone"
	icon_state = "wall_phone"
	var/icon_base = "wall_phone"
	icon = 'mods/_phone/phone.dmi'
	layer = ABOVE_WINDOW_LAYER

	var/phone_number = ""

/obj/machinery/phone/interface_interact(mob/living/carbon/human/user)
	if(!CanInteract(user, DefaultTopicState()))
		return FALSE

	var/number = input(user, "Набор номера")

	if (phone_number == number)
		report_progress("self")
		return

	var/obj/machinery/phone/target_phone

	for(var/obj/machinery/phone/P as anything in SSmachines.get_machinery_of_type(/obj/machinery/phone))
		if (P.phone_number == number)
			target_phone = P
			break

	if (!target_phone)
		report_progress("not found")
		return


	report_progress("found")
