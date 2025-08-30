require ("util")
require ("__base__.prototypes.entity.pipecovers")
require ("circuit-connector-sprites")
require ("__base__.prototypes.entity.assemblerpipes")
local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

data:extend({
  {
    type = "item",
    name = "cloning-vat",
    icon = "__Cloning-vat-building__/graphics/icons/cloning-vat-icon.png",
    subgroup = "production-machine",
    order = "ha[cloning-vat]",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "cloning-vat",
    stack_size = 20,
    weight = 50*kg,
  },
  {
    type = "assembling-machine",
    name = "cloning-vat",
    icon = "__Cloning-vat-building__/graphics/icons/cloning-vat-icon.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "cloning-vat"},
    max_health = 300,
    corpse = "biochamber-remnants",
    dying_explosion = "biochamber-explosion",
    icon_draw_specification = {shift = {0, 0}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector
    (
      universal_connector_template,
      {
        { variation = 18, main_offset = util.by_pixel(0, 20), shadow_offset = util.by_pixel(11, 26), show_shadow = true },
        { variation = 18, main_offset = util.by_pixel(0, 20), shadow_offset = util.by_pixel(11, 26), show_shadow = true },
        { variation = 18, main_offset = util.by_pixel(0, 20), shadow_offset = util.by_pixel(11, 26), show_shadow = true },
        { variation = 18, main_offset = util.by_pixel(0, 20), shadow_offset = util.by_pixel(11, 26), show_shadow = true }
      }
    ),
    alert_icon_shift = util.by_pixel(0, -12),
    --create_ghost_on_death = false,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
        secondary_draw_orders = { north = -1 }
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    impact_category = "metal",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/biochamber/biochamber-loop.ogg", volume = 0.4},
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.2,
    fast_replaceable_group = "cloning-vat",
    graphics_set =
    {
      animation_progress = 0.15,
      animation =
      {
        layers =
        {
          {
            filename = "__Cloning-vat-building__/graphics/entity/cloning-vat-base.png",
            priority = "high",
            width = 256,
            height = 256,
            scale = 0.5,
          },
          {
            filename = "__Cloning-vat-building__/graphics/entity/cloning-vat-shadow.png",
            priority = "high",
            width = 320,
            height = 256,
            scale = 0.5,
            draw_as_shadow = true,
          },
          {
            filename = "__Cloning-vat-building__/graphics/entity/cloning-vat-glow.png",
            priority = "high",
            width = 256,
            height = 256,
            scale = 0.5,
            draw_as_glow = true,
            blend_mode = "additive-soft"
          },
        }
      },
      working_visualisations =
      {
        {
          apply_recipe_tint = "primary",
          fadeout = true,
          effect = "flicker",
          animation =
          {
            layers =
            {
              {
                filename = "__Cloning-vat-building__/graphics/entity/cloning-vat-water-anim.png",
                priority = "high",
                width = 256,
                height = 256,
                frame_count = 32,
                line_length = 8,
                scale = 0.5,
                blend_mode = "additive"
              },
              {
                filename = "__Cloning-vat-building__/graphics/entity/cloning-vat-screens-anim.png",
                priority = "high",
                width = 256,
                height = 256,
                frame_count = 32,
                line_length = 8,
                scale = 0.5,
                draw_as_glow = true,
                --blend_mode = "additive"
              },
              {
                filename = "__Cloning-vat-building__/graphics/entity/cloning-vat-glow.png",
                priority = "high",
                width = 256,
                height = 256,
                repeat_count = 32,
                line_length = 1,
                scale = 0.5,
                draw_as_light = true,
                blend_mode = "additive",
                apply_runtime_tint = true,
              },
            }
          }
        },
      },
      frozen_patch =
      {
        filename = "__Cloning-vat-building__/graphics/entity/cloning-vat-frozen.png",
        width = 256,
        height = 256,
        line_length = 1,
        scale = 0.5,
      },
      reset_animation_when_frozen = true,
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 36,
        shift = util.by_pixel(5, 60),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    },
    crafting_categories = {"cloning"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 },
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
    },
    energy_usage = "375kW",
    module_slots = 2,
    allowed_effects = {"speed", "consumption", "pollution", "quality"},
    allowed_module_categories = {"efficiency", "quality"},
    effect_receiver = {uses_module_effects = true, uses_beacon_effects = true, uses_surface_effects = true},
    heating_energy = "150kW",
  },
})