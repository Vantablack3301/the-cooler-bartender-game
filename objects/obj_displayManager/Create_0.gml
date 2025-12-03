for (var i = 0; i < array_length(global.shop_cosmetics); i++) {
    var item = global.shop_cosmetics[i];
    if (item.bought) {
        switch (item.name) {
            case "Table Decor":
                if (instance_exists(obj_TableDecorSpot)) {
                    var spot = instance_find(obj_TableDecorSpot, 0);
                    instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Flowers_Pink;
					 spot = instance_find(obj_TableDecorSpot1, 0);
                    instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Flowers_Blue;
					 spot = instance_find(obj_TableDecorSpot2, 0);
                    instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Flowers_Orange;
                }
                break;

            case "Paintings":
                if (instance_exists(obj_PaintingsSpot)) {
                    var spot = instance_find(obj_PaintingsSpot, 0);
                    instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Painting_Old_Fashioned;
					spot = instance_find(obj_PaintingsSpot1, 0);
					instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Painting_Martini;
                }
                break;

            case "Fairy Lights":
                if (instance_exists(obj_FairyLightsSpot)) {
                    var spot = instance_find(obj_FairyLightsSpot, 0);
                    instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Fairy_Lights;
                }
                break;
				
			case "Open Sign":
                if (instance_exists(obj_OpenSignSpot)) {
                    var spot = instance_find(obj_OpenSignSpot, 0);
                    instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Open_Sign;
                }
                break;
				
			case "Decortive Glasses":
                if (instance_exists(obj_DecorDrinkSpot1)) {
                    var spot = instance_find(obj_DecorDrinkSpot1, 0);
                    instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Glass_Martini;
					spot = instance_find(obj_DecorDrinkSpot2, 0);
					instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Glass_Flute;
					spot = instance_find(obj_DecorDrinkSpot3, 0);
					instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Glass_Highball;
					spot = instance_find(obj_DecorDrinkSpot4, 0);
					instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Glass_Martini;
					spot = instance_find(obj_DecorDrinkSpot5, 0);
					instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Glass_Red_Wine;
                }
                break;
			
			case "Bar Cat":
                if (instance_exists(obj_BarCatSpot)) {
                    var spot = instance_find(obj_BarCatSpot, 0);
                    instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Cat_Chonks;
                }
                break;
				
			case "Premium Ice":
				part_sys = part_system_create();
                part_particles_burst(part_sys, obj_PremiumIcespot.x, obj_PremiumIcespot.y, Sparkles)
                break;
				
			case "Tip Jar":
               if (instance_exists(obj_TipJarSpot)) {
                    var spot = instance_find(obj_TipJarSpot, 0);
					global.TipSpawnPoint = [spot.x, spot.y]
                    instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Tip_Jar;
                }
                break;
				
			case "Novice Upgrade":
				global.newBeaten = true
               
                break;
				
			case "Expert Upgrade":
				global.noviceBeaten = true
               
                break;
				
			case "Expert Trophy":
              //trophy
			  
                break;
				
			case "Endless Mode":
			//endless
               
            break;
        }
    }
}