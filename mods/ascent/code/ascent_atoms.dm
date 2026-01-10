// Submap specific atom definitions.

// MANTIDIFY(/obj/item/storage/bag/trash/purple, 				"sample collection carrier",	"material storage")
/obj/item/storage/bag/trash/purple/ascent
	name = "sample collection bag"
	desc = "A durable bag used by mantids for collecting various samples."


// MANTIDIFY(/obj/structure/bed/chair/padded/purple,			"mantid nest",					"resting place")
/obj/structure/bed/chair/padded/purple/ascent
	name = "nest chair"
	desc = "Some kind of strange alien resting place technology."
	icon_state = "nest_chair"
	base_icon = "nest_chair"
	icon = 'mods/ascent/icons/obj/ascent_doodads.dmi'
	buckle_pixel_shift = list(0,5,0)
	pixel_z = 0

/obj/structure/bed/chair/padded/purple/ascent/gyne
	name = "mantid throne"
	icon_state = "nest_chair_large"
	base_icon = "nest_chair_large"
	buckle_pixel_shift = list(0,10,0)

/obj/structure/bed/chair/padded/purple/ascent/serpentid
	name = "serpentid resting pole"
	icon_state = "bar_stool_preview" //set for the map
	buckle_pixel_shift = list(0,3,0)
	item_state = "bar_stool"
	base_icon = "bar_stool"
	color = "#a33fbf"


// MANTIDIFY(/obj/item/pickaxe/diamonddrill,        			"lithobliterator",				"drilling")
/obj/item/pickaxe/diamonddrill/ascent
	name = "mantid lithobliterator"
	desc = "A powerful drilling tool used by mantids for geological sampling."


// MANTIDIFY(/obj/item/tank/jetpack/carbondioxide, 			"maneuvering pack",				"propulsion")
/obj/item/tank/jetpack/carbondioxide/ascent
	name = "mantid maneuvering pack"
	desc = "A jetpack-like propulsion device used by mantids for controlled movement in low-gravity environments."


// MANTIDIFY(/obj/item/device/scanner/plant, 		 			"gazefloranotator", 			"plant scanning")
/obj/item/device/scanner/plant/ascent
	name = "mantid gazefloranotator"
	desc = "A specialized scanner used by mantids to analyze plant life."

// MANTIDIFY(/obj/item/device/scanner/xenobio, 	 			"xenonascerator", 				"xenolife scanning")
/obj/item/device/scanner/xenobio/ascent
	name = "mantid xenonascerator"
	desc = "A device used by mantids to scan and analyze alien lifeforms."

// MANTIDIFY(/obj/item/device/scanner/health, 		 			"healthoseefer", 				"medicine")
/obj/item/device/scanner/health/ascent
	name = "mantid healthoseefer"
	desc = "A medical scanner used by mantids to assess the health of organisms."

// MANTIDIFY(/obj/item/device/scanner/gas, 		 			"seegasoscanator", 				"atmospherics")
/obj/item/device/scanner/gas/ascent
	name = "mantid seegasoscanator"
	desc = "An atmospheric scanner used by mantids to analyze gas compositions."


// MANTIDIFY(/obj/item/device/lightreplacer, 					"swabulpternator",				"light replacing")
/obj/item/device/lightreplacer/ascent
	name = "mantid swabulpternator"
	desc = "A device used by mantids to replace and repair light sources."

/obj/item/light/tube/ascent
	name = "mantid light filament"
	color = COLOR_CYAN
	b_colour = COLOR_CYAN
	desc = "Some kind of strange alien lightbulb technology."
	random_tone = FALSE


// MANTIDIFY(/obj/item/reagent_containers/spray/sterilizine,	"cleaning agent sprayer",		"sterilizing")
/obj/item/reagent_containers/spray/sterilizine/ascent
	name = "mantid cleaning agent sprayer"
	desc = "A device used by mantids to sterilize surfaces."


/obj/item/stock_parts/computer/hard_drive/portable/design/mantid
	name = "mantid designs"
	color = COLOR_ASCENT_PURPLE
	icon = 'icons/obj/modular_components.dmi'
	icon_state = "aislot"
	designs = list(
		/datum/design/autolathe/device_component,
		/datum/design/autolathe/device_component/keyboard,
		/datum/design/autolathe/device_component/tesla_component,
		/datum/design/autolathe/device_component/radio_transmitter,
		/datum/design/autolathe/device_component/radio_transmitter_event,
		/datum/design/autolathe/device_component/radio_receiver,
		/datum/design/autolathe/device_component/battery_backup_crap,
		/datum/design/autolathe/device_component/battery_backup_stock,
		/datum/design/autolathe/device_component/battery_backup_turbo,
		/datum/design/autolathe/device_component/battery_backup_responsive,
		/datum/design/autolathe/device_component/terminal,
		/datum/design/autolathe/device_component/cable_coil,
		/datum/design/autolathe/device_component/cell_device,
		/datum/design/autolathe/engineering,
		/datum/design/autolathe/engineering/airalarm,
		/datum/design/autolathe/engineering/firealarm,
		/datum/design/autolathe/engineering/powermodule,
		/datum/design/autolathe/medical,
		/datum/design/autolathe/medical/circularsaw,
		/datum/design/autolathe/medical/surgicaldrill,
		/datum/design/autolathe/medical/retractor,
		/datum/design/autolathe/medical/dropper,
		/datum/design/autolathe/medical/cautery,
		/datum/design/autolathe/medical/hemostat,
		/datum/design/autolathe/medical/beaker,
		/datum/design/autolathe/medical/beaker_large,
		/datum/design/autolathe/medical/beaker_insul,
		/datum/design/autolathe/medical/beaker_insul_large,
		/datum/design/autolathe/medical/vial,
		/datum/design/autolathe/medical/syringe,
		/datum/design/autolathe/medical/hypospray/autoinjector,
		/datum/design/autolathe/tool/t_scanner,
		/datum/design/autolathe/general/datacrystal,
		/datum/design/autolathe/general/tube/large/cool,
		/datum/design/autolathe/general/tube/cool,
		/datum/design/autolathe/general/handcuffs,
		)


// Self-charging power cell.
/obj/item/cell/mantid
	name = "mantid microfusion plant"
	desc = "An impossibly tiny fusion reactor of mantid design."
	icon = 'mods/ascent/icons/obj/items/ascent.dmi'
	icon_state = "plant"
	maxcharge = 1500
	w_class = ITEM_SIZE_NORMAL
	var/recharge_amount = 12

/obj/item/cell/mantid/Initialize()
	START_PROCESSING(SSobj, src)
	. = ..()

/obj/item/cell/mantid/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/cell/mantid/Process()
	if(charge < maxcharge)
		give(recharge_amount)


/mob/living/silicon/robot/flying/ascent
	desc = "A small, sleek, dangerous-looking hover-drone."
	speak_statement = "clicks"
	speak_exclamation = "rasps"
	speak_query = "chirps"
	lawupdate =      FALSE
	scrambledcodes = TRUE
	icon_state = "drone-ascent"
	spawn_sound = 'mods/ascent/sound/ascent1.ogg'
	cell =   /obj/item/cell/mantid
	laws =   /datum/ai_laws/ascent
	idcard = /obj/item/card/id/ascent
	module = /obj/item/robot_module/flying/ascent
	req_access = list(access_ascent)
	silicon_radio = null
	var/global/ascent_drone_count = 0

/mob/living/silicon/robot/flying/ascent/add_ion_law(law)
	return FALSE

/mob/living/silicon/robot/flying/ascent/Initialize()
	. = ..()
	remove_language(LANGUAGE_EAL)
	remove_language(LANGUAGE_ROBOT_GLOBAL)
	default_language = all_languages[LANGUAGE_MANTID_NONVOCAL]

/mob/living/silicon/robot/flying/ascent/examine(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.species.name == SPECIES_SKRELL) // TODO make codex searches able to check the reader's species.
			to_chat(H, SPAN_NOTICE("You recognize it as a product of the warlike, insectoid Ascent, long-time rivals to your people."))
			return
	to_chat(user, SPAN_NOTICE("The design is clearly not of human manufacture."))

/mob/living/silicon/robot/flying/ascent/initialize_components()
	components["actuator"] =       new/datum/robot_component/actuator/ascent(src)
	components["power cell"] =     new/datum/robot_component/cell/ascent(src)
	components["diagnosis unit"] = new/datum/robot_component/diagnosis_unit(src)
	components["armour"] =         new/datum/robot_component/armour/light(src)

/mob/living/silicon/robot/flying/ascent/Initialize()
	. = ..()
	name = "[uppertext(pick(GLOB.gyne_geoforms))]-[++ascent_drone_count]"

// Sorry, you're going to have to actually deal with these guys.
/mob/living/silicon/robot/flying/ascent/flash_eyes(intensity = FLASH_PROTECTION_MODERATE, override_blindness_check = FALSE, affect_silicon = FALSE, visual = FALSE, type = /obj/screen/fullscreen/flash)
	emp_act(2)

/mob/living/silicon/robot/flying/ascent/emp_act(severity)
	SHOULD_CALL_PARENT(FALSE)
	confused = min(confused + rand(3, 5), (severity == 1 ? 40 : 30))


// Since they don't have binary, camera or radio to soak
// damage, they get some hefty buffs to cell and actuator.
/datum/robot_component/actuator/ascent
	max_damage = 100
/datum/robot_component/cell/ascent
	max_damage = 100
