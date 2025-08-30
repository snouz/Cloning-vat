data:extend({
  {
    type = "recipe-category",
    name = "cloning",
  },
  {
    type = "recipe",
    name = "cloning-vat",
    enabled = false,
    energy_required = 6,
    ingredients =
    {
      {type = "item", name = "biochamber", amount = 1},
      {type = "item", name = "bioflux", amount = 2},
      {type = "item", name = "processing-unit", amount = 1},
      {type = "item", name = "carbon-fiber", amount = 5},
    },
    results = {
      {type = "item", name = "cloning-vat", amount = 1}
    },
    auto_recycle = true,
  },

  {
    type = "recipe",
    name = "cloning-biter-egg",
    icon = "__Cloning-vat-building__/graphics/icons/cloning-biter-egg.png",
    category = "cloning",
    subgroup = "nauvis-agriculture",
    order = "b[nauvis-agriculture]-e[cloning-biter-egg]",
    auto_recycle = false,
    enabled = false,
    energy_required = 35,
    ingredients =
    {
      {type = "item", name = "biter-egg", amount = 2},
      {type = "item", name = "bioflux", amount = 5},
    },
    results = {
      {type = "item", name = "biter-egg", amount = 3}
    },
    allow_productivity = false,
    allow_quality = false,
    show_amount_in_title = false,
    crafting_machine_tint =
    {
      primary = {210, 189, 73},
    },
  },
})