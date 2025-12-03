if (!variable_global_exists("shop_cosmetics")) {
    global.shop_cosmetics = [
        { name: "Table Decor", cost: 15, bought: false, doOnce: false, desc: "Adds decor to the tables." },
		{ name: "Decortive Glasses", cost: 20, bought: false, doOnce: false, desc: "Cool Glasses." },
        { name: "Paintings", cost: 25, bought: false, doOnce: false, desc: "Brightens the bar with wall art." },
        { name: "Open Sign", cost: 30, bought: false, doOnce: false, desc: "Displays a bright OPEN sign." },
        { name: "Fairy Lights", cost: 40, bought: false, doOnce: false, desc: "Warm glowing lights around the bar." },
		{ name: "Bar Cat", cost: 75, bought: false, doOnce: false, desc: "A friendly cat thats chill." },
        { name: "Premium Ice", cost: 15, bought: false, doOnce: false, desc: "Increases drink price." },
		{ name: "Tip Jar", cost: 25, bought: false, doOnce: false, desc: "Earn more tips from customers." },
        { name: "Novice Upgrade", cost: 30, bought: false, doOnce: false, desc: "Unlocks more difficult drinks!" },
        { name: "Expert Upgrade", cost: 50, bought: false, doOnce: false, desc: "Unlocks the hardest drinks!" },
        { name: "Endless Mode", cost: 80, bought: false, doOnce: false, desc: "Unlocks an endless difficulty." },
        { name: "Expert Trophy", cost: 100, bought: false, doOnce: false, desc: "Buy this to beat the game!" },
    ];

    global.start_y = 100;
}