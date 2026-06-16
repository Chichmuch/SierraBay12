#define PHONE_IDLE = 0
#define PHONE_CALLING = 1
#define PHONE_RINGING = 2
#define PHONE_TALKING = 3

/obj/machinery/phone
	name = "phone"
	icon_state = "wall_phone"
	var/icon_base = "wall_phone"
	icon = 'mods/_phone/phone.dmi'
	layer = ABOVE_WINDOW_LAYER

	var/phone_number = ""
	var/obj/machinery/phone/connected_phone

	var/handset_here = TRUE
	var/obj/item/phone_handset/handset = new()

	var/sound_loop

	var/state = PHONE_IDLE



/obj/machinery/phone/use_tool(obj/item/O, mob/user)
	if (!handset_here && O == handset)
		handset_here = TRUE
		user.unEquip(O, src)
		icon_state = "[icon_base]"
		end_call()
	return ..()


/obj/machinery/phone/interface_interact(mob/living/carbon/human/user)
	if (!CanInteract(user, DefaultTopicState()))
		return FALSE

	if (connected_phone)
		return

	if (handset_here)
		user.put_in_active_hand(handset)
		handset_here = FALSE
		icon_state = "[icon_base]_ear"
		if (state == PHONE_RINGING)
			take_call()
		if (state == PHONE_IDLE)
			dialing(user)
	else
		return


/obj/machinery/phone/proc/dialing(mob/living/carbon/human/user)
	var/number = input(user, "Набор номера")

	if (phone_number == number)
		playsound(handset, "mods/_phone/telephone/phone_busy.ogg")
		to_chat(user, SPAN_NOTICE("Неверно набран номер."))
		return

	var/obj/machinery/phone/target_phone

	for(var/obj/machinery/phone/P as anything in SSmachines.get_machinery_of_type(/obj/machinery/phone))
		if (P.phone_number == number)
			target_phone = P
			break

	if (!target_phone)
		playsound(handset, "mods/_phone/telephone/phone_busy.ogg")
		to_chat(user, SPAN_NOTICE("Неверно набран номер."))
		return

	if (target_phone.state != PHONE_IDLE)
		playsound(handset, "mods/_phone/telephone/phone_busy.ogg")
		to_chat(user, SPAN_NOTICE("Линия занята."))
		return

	connected_phone = target_phone
	connected_phone.recieve_call(src)
	sound_loop = GLOB.sound_player.PlayLoopingSound(handset, "\ref[src]", "mods/_phone/telephone/ring_outgoing.ogg", 50, 7)
	state = PHONE_CALLING


/obj/machinery/phone/proc/take_call()
	state = PHONE_TALKING
	connected_phone.state = PHONE_TALKING


/obj/machinery/phone/proc/end_call()


/obj/machinery/phone/proc/recieve_call(obj/machinery/phone/P)
	state = PHONE_RINGING
	icon_state = "[icon_base]_ring"
	connected_phone = P
	sound_loop = GLOB.sound_player.PlayLoopingSound(src, "\ref[src]", "mods/_phone/telephone/telephone_ring.ogg", 50, 7)




/obj/item/phone_handset
	name = "handset"
	icon_state = "handset"
	icon = 'mods/_phone/phone.dmi'
