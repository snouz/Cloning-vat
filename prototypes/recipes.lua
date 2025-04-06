data:extend({
  {
    type = "recipe-category",
    name = "cloning",
  },
  {
    type = "recipe",
    name = "cloning-vat",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "biochamber", amount = 1},
      {type = "item", name = "bioflux", amount = 2},
      {type = "item", name = "processing-unit", amount = 1},
      {type = "item", name = "carbon-fiber", amount = 5},
    },
    results = {{type="item", name="cloning-vat", amount=1}}
  },

  {
    type = "recipe",
    name = "cloning-biter-egg",
    icon = "__Cloning-vat__/graphics/icons/cloning-biter-egg.png",
    category = "cloning",
    subgroup = "nauvis-agriculture",
    order = "b[nauvis-agriculture]-e[cloning-biter-egg]",
    auto_recycle = false,
    enabled = false,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "biter-egg", amount = 2},
      {type = "item", name = "bioflux", amount = 5},
    },
    results = {{type="item", name="biter-egg", amount=3}},
    allow_productivity = false,
    allow_quality = false,
    show_amount_in_title = false,
    crafting_machine_tint =
    {
      primary = {r = 130, g = 130, b = 120, a = 1},
      secondary = {r = 194, g = 162, b = 117, a = 1},
    },
  },
})