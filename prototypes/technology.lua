data:extend({
  {
    type = "technology",
    name = "cloning-vat-technology",
    icon = "__Cloning-vat-building__/graphics/technology/cloning-vat-technology.png",
    icon_size = 256,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "cloning-vat",
      },
      {
        type = "unlock-recipe",
        recipe = "cloning-biter-egg",
      },
    },
    prerequisites = { "agricultural-science-pack" },
    unit = {
      count = 350,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "space-science-pack", 1 },
        { "agricultural-science-pack", 1 },
      },
      time = 60,
    },
  },
})