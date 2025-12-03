if (!variable_global_exists("shop_cosmetics")) {
    global.shop_cosmetics = [
        { name: "Table Decor", cost: 0, bought: false, desc: "Adds decor to the tables." },
		{ name: "Decortive Glasses", cost: 0, bought: false, desc: "Cool glasses." },
        { name: "Paintings", cost: 0, bought: false, desc: "Brightens the bar with wall art." },
        { name: "Open Sign", cost: 0, bought: false, desc: "Displays a bright OPEN sign." },
		{ name: "Fairy Lights", cost: 0, bought: false, desc: "Warm glowing lights around the bar." },
        { name: "Bar Cat", cost: 0, bought: false, desc: "A friendly cat thats chill." },
        { name: "Premium Ice", cost: 10, bought: false, desc: "Increases drink price." },
        { name: "Tip Jar", cost: 5, bought: false, desc: "Allows customers to tip if you make a good drink" },
        { name: "Novice Upgrade", cost: 15, bought: false, desc: "Unlocks more difficult drinks!" },
        { name: "Expert Upgrade", cost: 30, bought: false, desc: "Unlocks the hardest drinks!" },
		{ name: "Endless Upgrade", cost: 40, bought: false, desc: "Unlocks an endless difficulty." },
		{ name: "Expert Trophy", cost: 100, bought: false, desc: "Buy this to beat the game!" },
    ];
    
    global.start_y = 100;
}
