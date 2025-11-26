if (!variable_global_exists("shop_cosmetics")) {
    global.shop_cosmetics = [
        { name: "Table Decor", cost: 5, bought: false, desc: "Adds decor to the tables." },
        { name: "Paintings", cost: 10, bought: false, desc: "Brightens the bar with wall art." },
        { name: "Fairy Lights", cost: 20, bought: false, desc: "Warm glowing lights around the bar." },
        { name: "Open Sign", cost: 10, bought: false, desc: "Displays a bright OPEN sign." },
        { name: "Bar Cat", cost: 25, bought: false, desc: "A friendly cat thats chill." },
        { name: "Premium Ice", cost: 10, bought: false, desc: "Increases drink price." },
        { name: "Tip Jar", cost: 5, bought: false, desc: "Earn more tips from customers." },
        { name: "Novice Upgrade", cost: 15, bought: false, desc: "Unlocks more difficult drinks!" },
        { name: "Expert Upgrade", cost: 30, bought: false, desc: "Unlocks the hardest drinks!" },
		//{ name: "Expert Trophy", cost: 30, bought: false, desc: "Buy this to beat the game!" },
		{ name: "Endless Upgrade", cost: 40, bought: false, desc: "Unlocks an endless difficulty." },
    ];
    
    global.start_y = 100;
}
