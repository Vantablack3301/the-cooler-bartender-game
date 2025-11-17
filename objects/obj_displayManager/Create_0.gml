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
			
			case "Bar Cat":
                if (instance_exists(obj_BarCatSpot)) {
                    var spot = instance_find(obj_BarCatSpot, 0);
                    instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Bar_Cat;
                }
                break;
				
			case "Premium Ice":
                 if (instance_exists(obj_PremiumIcespot)) {
                    var spot = instance_find(obj_PremiumIcespot, 0);
                    instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Premium_Ice;
				 }
                break;
				
			case "Tip Jar":
               if (instance_exists(obj_TipJarSpot)) {
                    var spot = instance_find(obj_TipJarSpot, 0);
                    instance_create_layer(spot.x, spot.y, "Decor", obj_CosmeticDisplay).sprite_index = spr_Tip_Jar;
                }
                break;
				
			case "Better Shaker":
               
                break;
				
			case "Better Stirir":
               
                break;
				
			case "Unlock Difficulties":
               global.newBeaten = true
			   global.noviceBeaten = true;
                break;
        }
    }
}