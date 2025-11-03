for (var i = 0; i < array_length(global.shop_cosmetics); i++) {
    var item = global.shop_cosmetics[i];
    if (item.bought) {
        switch (item.name) {
            case "Table Decor":
                if (instance_exists(obj_TableDecorSpot)) {
                    var spot = instance_find(obj_TableDecorSpot, 0);
                    instance_create_layer(spot.x, spot.y, "Instances", obj_CosmeticDisplay).sprite_index = spr_TableDecor;
                }
                break;

            case "Paintings":
                if (instance_exists(obj_PaintingsSpot)) {
                    var spot = instance_find(obj_PaintingsSpot, 0);
                    instance_create_layer(spot.x, spot.y, "Instances", obj_CosmeticDisplay).sprite_index = spr_Paintings;
                }
                break;

            case "Fairy Lights":
                if (instance_exists(obj_FairyLightsSpot)) {
                    var spot = instance_find(obj_FairyLightsSpot, 0);
                    instance_create_layer(spot.x, spot.y, "Instances", obj_CosmeticDisplay).sprite_index = spr_FairyLights;
                }
                break;
        }
    }
}
