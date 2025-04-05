--[[
local function find_intable(tbl, f, ...)
  if type(f) == "function" then
    for k, v in pairs(tbl) do
      if f(v, k, ...) then
        return v, k
      end
    end
  else
    for k, v in pairs(tbl) do
      if v == f then
        return v, k
      end
    end
  end
  return nil
end

local function make_recipe_category(recipe, cat_name, new_assembling_machine)
  if data.raw.recipe[recipe] and data.raw["assembling-machine"][new_assembling_machine] then
    local assembly = data.raw["assembling-machine"][new_assembling_machine]
    local original_recipe_cat = data.raw.recipe[recipe].category or "crafting"
    local new_cat_name = original_recipe_cat .. "-or-" .. cat_name
    data:extend({{ type = "recipe-category", name = new_cat_name }})
    data.raw.recipe[recipe].category = new_cat_name
    for _, machine in pairs(data.raw["assembling-machine"]) do
      for _, category in pairs(machine.crafting_categories) do
          if category == original_recipe_cat then
            if not find_intable(machine.crafting_categories, new_cat_name) then
              table.insert(machine.crafting_categories, new_cat_name)
            end
            break
          end
      end
    end
    if not data.raw["recipe-category"][new_cat_name] then
      data:extend({{ type = "recipe-category", name = new_cat_name }})
    end
    data.raw.recipe[recipe].category = new_cat_name

    if not find_intable(assembly.crafting_categories, new_cat_name) then
      table.insert(assembly.crafting_categories, new_cat_name)
    end
  end
end

local catname = "thinkingbrain"

make_recipe_category("logistic-robot", catname, "cloning-vat")
]]