/obj/item/stack/tile/light
	name = "light tile"
	singular_name = "light floor tile"
	desc = "A floor tile, made out off glass. It produces light."
	icon_state = "tile_e"
	w_class = 3.0
	force = 3.0
	throwforce = 5.0
	throw_speed = 5
	throw_range = 20
	flags = CONDUCT
	max_amount = 60
	attack_verb = list("bashed", "battered", "bludgeoned", "thrashed", "smashed")
	var/on = 1
	var/state //0 = fine, 1 = flickering, 2 = breaking, 3 = broken

/obj/item/stack/tile/light/New()
	..()
	if(prob(5))
		state = 3 //broken
	else if(prob(5))
		state = 2 //breaking
	else if(prob(10))
		state = 1 //flickering occasionally
	else
		state = 0 //fine

/obj/item/stack/tile/light/attackby(obj/item/O, mob/user)
	..()
	if(istype(O,/obj/item/weapon/crowbar))
		if(!use(1))
			return
		new/obj/item/stack/sheet/metal(user.loc)
		new/obj/item/stack/light_w(user.loc)

