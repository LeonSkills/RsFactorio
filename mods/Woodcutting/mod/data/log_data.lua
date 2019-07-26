local resource_autoplace = require("resource-autoplace")

local trees = {
  [1] = {
    name = "",
    mining_time = 0.5,
    amount_min = 1,
    amount_max = 1,
  },
  [2] = {
    name = "oak-",
    mining_time = 10,
    amount_min = 1,
    amount_max = 3,
    width = 447,
    height = 439,
    shift = {-0.13, -1.68},
    coverage = 0.003,
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "rs-oak-autoplace",
      autoplace_control_name = "trees", -- TODO, make one for each tree?
      base_density = 1,
      random_probability = 0.3,
      --has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1.5,
      regular_blob_amplitude_multiplier = 4,
      base_spots_per_km2 = 90,
      seed1 = 34327891
    }
  },
  [3] = {
    name = "willow-",
    mining_time = 20,
    amount_min = 3,
    amount_max = 7,
    width = 340,
    height = 407,
    shift = {-0.461, -1.453},
    coverage = 0.702,
    autoplace = {
      max_probability = 0.015,
      order = "a[rs-trees]-050-willow",
      peaks = {
        {
          influence = 1,
          richness_influence = 0,
          temperature_max_range = 20,
          temperature_optimal = 17,
          temperature_range = 12,
          --water_max_range = 0.075,
          --water_optimal = 0.,
          --water_range = 0.05,
          elevation_optimal = 0.5,
          elevation_max_range = 1.2,
          elevation_range = 0.5,
        }
      },
      sharpness = 0.7,
      control = "trees"
    }
  },
  [4] = {
    name = "maple-",
    mining_time = 40,
    amount_min = 9,
    amount_max = 15,
    width = 373,
    height = 441,
    shift = {0.134, -1.696},
    coverage = 0.001,
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "rs-maple-autoplace",
      autoplace_control_name = "trees", -- TODO, make one for each tree?
      base_density = 1,
      random_probability = 0.1,
      has_starting_area_placement = nil,
      regular_rq_factor_multiplier = 2,
      regular_blob_amplitude_multiplier = 4,
      base_spots_per_km2 = 5,
      seed1 = 343278912737
    }
  },
  [5] = {
    name = "yew-",
    mining_time = 60,
    amount_min = 15,
    amount_max = 25,
    width = 430,
    height = 455,
    shift = {-0.35, -1.7785},
    coverage = 0.0005,
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "rs-yew-autoplace",
      autoplace_control_name = "trees", -- TODO, make one for each tree?
      base_density = 1,
      random_probability = 0.05,
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 1.2,
      regular_blob_amplitude_multiplier = 4,
      base_spots_per_km2 = 5,
      seed1 = 343278912355
    }
  },
  [6] = {
    name = "magic-",
    mining_time = 100,
    amount_min = 25,
    amount_max = 45,
    width = 539,
    height = 487,
    shift = {0.5, -2},
    coverage = 0.00025,
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "rs-magic-autoplace",
      autoplace_control_name = "trees", -- TODO, make one for each tree?
      base_density = 1,
      random_probability = 0.02,
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 0.7,
      regular_blob_amplitude_multiplier = 4,
      base_spots_per_km2 = 4,
      seed1 = 343278916744
    }
  }
}

return trees