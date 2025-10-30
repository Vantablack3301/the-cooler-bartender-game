//You can add new items here!
if (!variable_global_exists("shop_cosmetics")) {
    global.shop_cosmetics = [
        { name: "Table Decor", cost: 50, bought: false },
        { name: "Paintings", cost: 100, bought: false },
        { name: "Fairy Lights", cost: 200, bought: false },
		{ name: "TEST", cost: 50, bought: false}
    ];
    global.start_y = 100; //starting location y
}
