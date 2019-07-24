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
    coverage = 0.003
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
    coverage = 0.001
  },
  [5] = {
    name = "yew-",
    mining_time = 60,
    amount_min = 15,
    amount_max = 25,
    width = 430,
    height = 455,
    shift = {-0.35, -1.7785},
    coverage = 0.0005
  },
  [6] = {
    name = "magic-",
    mining_time = 100,
    amount_min = 25,
    amount_max = 45,
    width = 539,
    height = 487,
    shift = {0.5, -2},
    coverage = 0.00025
  }
}

return trees