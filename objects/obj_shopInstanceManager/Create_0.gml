if (!variable_global_exists("shop_cosmetics")) {
    global.shop_cosmetics = [
        { name: "Table Decor", cost: 1, bought: false },
        { name: "Paintings", cost: 5, bought: false },
        { name: "Fairy Lights", cost: 10, bought: false },
    ];
    global.start_y = 100; //starting location y
}
