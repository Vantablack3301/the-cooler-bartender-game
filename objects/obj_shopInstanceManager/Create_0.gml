if (!variable_global_exists("shop_cosmetics")) {
    global.shop_cosmetics = [
        { name: "Table Decor", cost: 0, bought: false, desc: "Adds cute decor to the tables." },
        { name: "Paintings", cost: 0, bought: false, desc: "Brightens the bar with wall art." },
        { name: "Fairy Lights", cost: 0, bought: false, desc: "Warm glowing lights around the bar." },
        { name: "Open Sign", cost: 0, bought: false, desc: "Displays a bright OPEN sign." },
        { name: "Bar Cat", cost: 0, bought: false, desc: "A friendly cat that sits on the bar." },
        { name: "Premium Ice", cost: 0, bought: false, desc: "Crystal-clear ice for fancy drinks." },
        { name: "Tip Jar", cost: 0, bought: false, desc: "Earn more tips from customers." },
        { name: "Cool Plant", cost: 0, bought: false, desc: "Aesthetic greenery for the bar." },
        { name: "Better Shaker", cost: 0, bought: false, desc: "Improves drink shaking efficiency." },
        { name: "Better Stirir", cost: 0, bought: false, desc: "Smooth stirring for cleaner mixes." },
    ];
    
    global.start_y = 100;
}
