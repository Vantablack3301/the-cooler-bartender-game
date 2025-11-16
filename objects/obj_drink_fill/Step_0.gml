if (keyboard_check(vk_alt)) {

	if current_amount < max_amount {
		current_amount += 0.01
	}
}
depth = obj_Drink.depth + 1

image_blend = color

image_yscale = current_amount / max_amount
