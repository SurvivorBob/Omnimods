local res = {}

RecGen:create("omnimatter","omnicium-plate-pure"):
    setItemName("omnicium-plate"):
    setIcons("omnicium-plate","omnimatter"):
    setStacksize(200):
    setIngredients({normal = {{"crushed-omnite",20}},expensive={{"crushed-omnite",30}}}):
    setResults("omnicium-plate"):
    setCategory("smelting"):
    setSubgroup("omnicium"):
    setOrder("aa"):
    setEnergy(25):
    setEnabled():
    extend()

RecGen:create("omnimatter","omnicium-plate-mix"):
    setIngredients({"omnite",2}):
    ifModsAddIngredients("angelsrefining",{"angels-ore1-crushed",2},{"angels-ore3-crushed",2}):
    ifAddIngredients(not mods["angelsrefining"],{"copper-ore",1},{"iron-ore",1}):
    setResults({normal = {{"omnicium-plate", 2}},expensive={{"omnicium-plate",1}}}):
    addProductivity():
    setIcons("omnicium-plate","omnimatter"):
    addSmallIngIcon(2,1):
    addSmallIngIcon(3,3):
    setCategory("omnifurnace"):
    setSubgroup("omnicium"):
    setOrder("ab"):
    marathon():
    setEnergy(5):
    setEnabled():
    extend()

RecGen:create("omnimatter","omnicium-gear-wheel"):
    setStacksize(100):
    setIngredients({normal = {{"omnicium-plate", 1}},expensive={{"omnicium-plate",2}}}):
    setResults({normal = {{"omnicium-gear-wheel", 1}},expensive={{"omnicium-gear-wheel",1}}}):
    addProductivity():
    setSubgroup("omni-gears"):
    setOrder("aa"):
    setEnabled():
    setEnergy(1):
    extend()

RecGen:create("omnimatter","omnicium-iron-gear-box"):
    setStacksize(100):
    setSubgroup("omni-gears"):
    setIngredients({"omnicium-gear-wheel", 1},{"iron-gear-wheel", 1}):
    addProductivity():
    setEnabled():
    setEnergy(0.25):
    extend()

if mods["bobplates"] then

local plates = {"steel","brass","titanium","tungsten","nitinol"}
local plateTech = {"steel-processing","zinc-processing","titanium-processing","tungsten-processing","nitinol-processing"}

for i,p in pairs(plates) do
    RecGen:create("omnimatter","omnicium-"..p.."-gear-box"):
        setStacksize(100):
        setEnergy(0.25):
        addProductivity():
        setIngredients("omnicium-gear-wheel",p.."-gear-wheel"):
        setCategory("crafting"):
        setSubgroup("omni-gears"):
        setTechName(plateTech[i]):
        extend()
end


    data.raw.item["brass-gear-wheel"].icon="__omnimatter__/graphics/icons/brass-gear-wheel.png"
    data.raw.item["brass-gear-wheel"].icon_size=32
    data.raw.item["steel-gear-wheel"].icon="__omnimatter__/graphics/icons/steel-gear-wheel.png"
    data.raw.item["steel-gear-wheel"].icon_size=32
end

data.raw.item["iron-gear-wheel"].icons={{icon="__omnimatter__/graphics/icons/iron-gear-wheel.png",icon_size=32,mipmaps=1}}

if mods["angelssmelting"] then
    --Get rid of the ore processor 1 ingredient count limit to allow for omnicium processing
    data.raw["assembling-machine"]["ore-processing-machine"].ingredient_count = 255

    ItemGen:import("ingot-iron"):
        setName("ingot-omnicium","omnimatter"):
        setSubgroup("angels-omnicium"):
        setIcons({{icon ="ingot-omnicium", icon_size = 32}}, "omnimatter"):
        extend()

    RecGen:import("iron-ore-smelting"):
        setName("omnite-smelting","omnimatter"):
        setIngredients(
            {type="item", name="iron-ore", amount=12},
            {type="item", name="copper-ore", amount=12},
            {type="item", name="omnite", amount=24}):
        replaceResults("ingot-iron","ingot-omnicium"):
        setSubgroup("angels-omnicium"):
        setIcons("ingot-omnicium","omnimatter"):
        addSmallIcon({{icon = "__omnilib__/graphics/icons/small/num_1.png", icon_size = 32, tint = {a=1,b=0,g=0.8,r=1}}}, 2):
        setTechName("omnitech-angels-omnicium-smelting-1"):
        setTechLocName("technology-name.omnitech-angels-omnicium-smelting-casting",1):
        setTechIcons("casting-omnicium-tech", 256):
        extend()

    RecGen:import("molten-iron-smelting-1"):
        setName("molten-omnicium-smelting-1","omnimatter"):
        setItemName("liquid-molten-omnicium"):
        replaceIngredients("ingot-iron","ingot-omnicium"):
        replaceResults("liquid-molten-iron","liquid-molten-omnicium"):
        setSubgroup("omnicium-casting"):
        setIcons({{icon = "molten-omnicium", icon_size = 256}}, "omnimatter"):
        setBothColour({r = 125/255, g = 0/255, b = 161/255}):
        setTechName("omnitech-angels-omnicium-smelting-1"):
        extend()

    RecGen:import("angels-plate-iron"):
        setName("angels-plate-omnicium","omnimatter"):
        replaceIngredients("liquid-molten-iron","liquid-molten-omnicium"):
        replaceResults("angels-plate-iron","omnicium-plate"):
        setSubgroup("omnicium-casting"):
        setIcons("omnicium-plate","omnimatter"):
        addSmallIcon("molten-omnicium",1):
        addProductivity():
        setTechName("omnitech-angels-omnicium-smelting-1"):
        extend()

    RecGen:import("iron-ore-processing"):
        setName("omnicium-processing","omnimatter"):
        setItemName("processed-omnicium"):
        setIngredients({"iron-ore",2},{"copper-ore",2},{"omnite",4}):
        replaceResults("processed-iron","processed-omnicium"):
        setSubgroup("angels-omnicium"):
        setIcons("processed-omnicium","omnimatter"):
        setTechName("omnitech-angels-omnicium-smelting-2"):
        setTechPrereq("omnitech-angels-omnicium-smelting-1", "ore-processing-1"):
        setTechIcons("smelting-omnicium-tech", 256):
        extend()

    RecGen:import("processed-iron-smelting"):
        setName("processed-omnicium-smelting","omnimatter"):
        setItemName("processed-omnicium"):
        replaceIngredients("processed-iron","processed-omnicium"):
        replaceIngredients("solid-coke",{type="fluid",name="omnic-acid",amount=40}):
        replaceResults("ingot-iron","ingot-omnicium"):
        setSubgroup("angels-omnicium"):
        setIcons("ingot-omnicium","omnimatter"):
        addSmallIcon({{icon = "__omnilib__/graphics/icons/small/num_2.png", icon_size = 32, tint = {a=1,b=0,g=0.8,r=1}}}, 2):
        setTechName("omnitech-angels-omnicium-smelting-2"):
        extend()

    RecGen:import("iron-processed-processing"):
        setName("omnicium-processed-processing","omnimatter"):
        setItemName("pellet-omnicium"):
        replaceIngredients("processed-iron","processed-omnicium"):
        replaceResults("pellet-iron","pellet-omnicium"):
        setSubgroup("angels-omnicium"):
        setIcons("pellet-omnicium","omnimatter"):
        setTechName("omnitech-angels-omnicium-smelting-3"):
        setTechPrereq("omnitech-angels-omnicium-smelting-2", "ore-processing-2"):
        setTechIcons("smelting-omnicium-tech", 256):
        extend()

    RecGen:import("pellet-iron-smelting"):
        setName("pellet-omnicium-smelting","omnimatter"):
        replaceIngredients("pellet-iron","pellet-omnicium"):
        replaceIngredients("solid-limestone",{type="fluid", name="omnic-acid", amount = 30}):
        ifModsReplaceIngredients("omnimatter_crystal","solid-coke","omnine"):
        replaceResults("ingot-iron","ingot-omnicium"):
        setSubgroup("angels-omnicium"):
        setIcons("ingot-omnicium","omnimatter"):
        addSmallIcon({{icon = "__omnilib__/graphics/icons/small/num_3.png", icon_size = 32, tint = {a=1,b=0,g=0.8,r=1}}}, 2):
        setTechName("omnitech-angels-omnicium-smelting-3"):
        setTechIcons("smelting-omnicium-tech", 256):
        extend()

    RecGen:import("roll-iron-casting"):
        setName("roll-omnicium-casting","omnimatter"):
        setItemName("angels-roll-omnicium"):
        replaceIngredients("liquid-molten-iron","liquid-molten-omnicium"):
        replaceResults("angels-roll-iron","angels-roll-omnicium"):
        setSubgroup("omnicium-casting"):
        setIcons("roll-omnicium","omnimatter"):
        addSmallIcon({{icon = "__omnilib__/graphics/icons/small/num_1.png", icon_size = 32, tint = {a=1,b=0,g=0.8,r=1}}}, 2):
        setTechName("omnitech-angels-omnicium-smelting-2"):
        extend()

    RecGen:import("roll-iron-casting-fast"):
        setName("roll-omnicium-casting-fast","omnimatter"):
        replaceIngredients("liquid-molten-iron","liquid-molten-omnicium"):
        replaceResults("angels-roll-iron","angels-roll-omnicium"):
        setSubgroup("omnicium-casting"):
        setIcons("roll-omnicium","omnimatter"):
        addSmallIcon({{icon = "__omnilib__/graphics/icons/small/num_2.png", icon_size = 32, tint = {a=1,b=0,g=0.8,r=1}}}, 2):
        setTechName("omnitech-angels-omnicium-smelting-3"):
        extend()

    RecGen:import("angels-roll-iron-converting"):
        setName("angels-roll-omnicium-converting","omnimatter"):
        replaceIngredients("angels-roll-iron","angels-roll-omnicium"):
        replaceResults("angels-plate-iron","omnicium-plate"):
        setSubgroup("omnicium-casting"):
        setIcons("omnicium-plate"):
        addSmallIcon("angels-roll-omnicium", 2):
        setTechName("omnitech-angels-omnicium-smelting-2"):
        extend()

    --Fix item icons
    ItemGen:import("angels-roll-omnicium"):setIcons("roll-omnicium","omnimatter"):extend()

    RecGen:create("omnimatter","omnicium-gear-wheel-casting"):
        setStacksize(100):
        setSubgroup("omnicium-casting"):
        setOrder("ub"):
        setIngredients({normal = {{type="fluid",name="liquid-molten-omnicium",amount=40}},expensive={{type="fluid",name="liquid-molten-omnicium",amount=40}}}):
        setCategory("casting"):
        setResults({normal = {{"omnicium-gear-wheel", 6}},expensive={{"omnicium-gear-wheel",6}}}):
        addProductivity():
        setEnergy(2):
        setTechName("omnitech-angels-omnicium-smelting-1"):
        extend()

    data:extend({
        {
            type = "item-subgroup",
            name = "angels-omnicium",
            group = "angels-smelting",
            order = "r",
        },
        {
            type = "item-subgroup",
            name = "omnicium-casting",
            group = "angels-casting",
            order = "u",
        },
        {
            type = "item-subgroup",
            name = "omnicium-alloy-casting",
            group = "angels-casting",
            order = "v",
        },
    })
    data.raw.item["omnicium-plate"].subgroup = "omnicium-casting"
end