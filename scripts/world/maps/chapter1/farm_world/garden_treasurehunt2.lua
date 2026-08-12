return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.12.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 40,
  height = 20,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 8,
  nextobjectid = 45,
  properties = {
    ["music"] = "garden",
    ["name"] = "Garden - Weight Puzzle"
  },
  tilesets = {
    {
      name = "garden",
      firstgid = 1,
      filename = "../../../tilesets/garden.tsx"
    },
    {
      name = "garden_extras",
      firstgid = 101,
      class = "",
      tilewidth = 1160,
      tileheight = 738,
      spacing = 0,
      margin = 0,
      columns = 0,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 1,
        height = 1
      },
      properties = {},
      wangsets = {},
      tilecount = 19,
      tiles = {
        {
          id = 29,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/pikmin_flowers.png",
          width = 60,
          height = 80
        },
        {
          id = 30,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/saskatchewan_flowers.png",
          width = 60,
          height = 80
        },
        {
          id = 31,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/saskatchewan_flowers_small.png",
          width = 60,
          height = 80
        },
        {
          id = 32,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/trillium_flowers.png",
          width = 60,
          height = 80
        },
        {
          id = 33,
          image = "../../../../../assets/sprites/tilesets/farm_world/pikmin3_stonebarrier.png",
          width = 864,
          height = 580
        },
        {
          id = 34,
          image = "../../../../../assets/sprites/tilesets/farm_world/pikmin3_flowerbg.png",
          width = 404,
          height = 304
        },
        {
          id = 35,
          image = "../../../../../assets/sprites/tilesets/farm_world/pikmin3_pot.png",
          width = 197,
          height = 219
        },
        {
          id = 36,
          image = "../../../../../assets/sprites/tilesets/farm_world/pikmin3_rock.png",
          width = 252,
          height = 202
        },
        {
          id = 37,
          image = "../../../../../assets/sprites/tilesets/farm_world/pikmin2_cave.png",
          width = 640,
          height = 480
        },
        {
          id = 38,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/dirt_pile.png",
          width = 360,
          height = 360
        },
        {
          id = 39,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/purple_ladder3.png",
          width = 1160,
          height = 720
        },
        {
          id = 40,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/shop_door.png",
          width = 36,
          height = 49
        },
        {
          id = 41,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/shop_sign.png",
          width = 36,
          height = 16
        },
        {
          id = 42,
          image = "../../../../../assets/sprites/tilesets/farm_world/pikmin2_geyser.png",
          width = 123,
          height = 113
        },
        {
          id = 43,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/orchard/fence.png",
          width = 600,
          height = 200
        },
        {
          id = 44,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/orchard/apple.png",
          width = 40,
          height = 60
        },
        {
          id = 45,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/orchard/apple_bucket.png",
          width = 866,
          height = 738
        },
        {
          id = 46,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/orchard/apple_bucket_2.png",
          width = 866,
          height = 738
        },
        {
          id = 47,
          image = "../../../../../assets/sprites/tilesets/farm_world/garden/paperbag.png",
          width = 456,
          height = 205
        }
      }
    },
    {
      name = "treasures",
      firstgid = 149,
      filename = "../../../tilesets/treasures.tsx",
      exportfilename = "../../../tilesets/treasures.lua"
    },
    {
      name = "garden_extras",
      firstgid = 160,
      filename = "../../../tilesets/garden_extras.tsx",
      exportfilename = "../../../tilesets/garden_extras.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 40,
      height = 20,
      id = 1,
      name = "Camada de Blocos 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 6, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
        5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 5, 5, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
        5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 5, 5, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19,
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7, 5, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29,
        19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 9, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39,
        29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 19, 9, 5, 5, 6, 5, 5, 5, 5, 9, 9, 29, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
        39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 29, 19, 9, 9, 9, 9, 9, 9, 9, 29, 29, 39, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59,
        49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 39, 29, 29, 29, 29, 29, 29, 29, 29, 39, 39, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 49, 39, 39, 39, 39, 39, 39, 39, 39, 49, 49, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59, 49, 49, 49, 49, 49, 49, 49, 49, 59, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59, 59, 59, 59, 59, 59, 59, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 186,
          y = 464.333,
          width = 354,
          height = 205,
          rotation = 0,
          opacity = 1,
          gid = 148,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "",
          type = "",
          shape = "rectangle",
          x = 30,
          y = 478.667,
          width = 131.667,
          height = 238.438,
          rotation = 0,
          opacity = 1,
          gid = 159,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = 680,
          y = 240,
          width = 40,
          height = 60,
          rotation = 0,
          opacity = 1,
          gid = 208,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = 880,
          y = 280,
          width = 40,
          height = 60,
          rotation = 0,
          opacity = 1,
          gid = 208,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "",
          type = "",
          shape = "rectangle",
          x = 920,
          y = 440,
          width = 40,
          height = 60,
          rotation = 0,
          opacity = 1,
          gid = 208,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 520,
          width = 40,
          height = 60,
          rotation = 0,
          opacity = 1,
          gid = 208,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "controllers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 13,
          name = "toggle",
          type = "",
          shape = "point",
          x = 468,
          y = 86.6667,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "firstPaperBag",
            ["inverted"] = true,
            ["target1"] = { id = 8 },
            ["target2"] = { id = 9 }
          }
        },
        {
          id = 14,
          name = "toggle",
          type = "",
          shape = "point",
          x = 702.667,
          y = 82.6667,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "weight1",
            ["inverted"] = true,
            ["target1"] = { id = 10 },
            ["target2"] = { id = 39 }
          }
        },
        {
          id = 15,
          name = "toggle",
          type = "",
          shape = "point",
          x = 926.667,
          y = 54.6667,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "weight2",
            ["inverted"] = true,
            ["target1"] = { id = 11 },
            ["target2"] = { id = 40 }
          }
        },
        {
          id = 16,
          name = "toggle",
          type = "",
          shape = "point",
          x = 1082.67,
          y = 665.333,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "weight3",
            ["inverted"] = true,
            ["target1"] = { id = 12 },
            ["target2"] = { id = 42 }
          }
        },
        {
          id = 19,
          name = "toggle",
          type = "",
          shape = "point",
          x = 1149,
          y = 531,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "weight4",
            ["inverted"] = true,
            ["target1"] = { id = 18 },
            ["target2"] = { id = 41 }
          }
        },
        {
          id = 38,
          name = "toggle",
          type = "",
          shape = "point",
          x = 248,
          y = 80,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "pickedUpJoylessDevice",
            ["inverted"] = true,
            ["target1"] = { id = 37 },
            ["target2"] = { id = 35 }
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "collisions",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1040,
          y = 200,
          width = 561.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 120,
          width = 78.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 80,
          width = 203.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 720,
          y = 40,
          width = 38.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 80,
          width = 203.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = -6,
          y = 160,
          width = 565.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 160,
          width = 81.833,
          height = 39.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1040,
          y = 400,
          width = 561.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1040,
          y = 480,
          width = 78.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1000,
          y = 520,
          width = 38.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 520,
          width = 38.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 480,
          width = 565.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "",
          type = "",
          shape = "rectangle",
          x = 920,
          y = 560,
          width = 78.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 600,
          width = 286.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 560,
          width = 38.833,
          height = 79.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "",
          type = "",
          shape = "rectangle",
          x = -80,
          y = 220,
          width = 81.833,
          height = 259.5,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "objects_party",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 1600,
          y = 280,
          width = 40,
          height = 120,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["map"] = "chapter1/farm_world/garden_treasurehunt",
            ["marker"] = "to_weights"
          }
        },
        {
          id = 8,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 181,
          y = 240,
          width = 358.666,
          height = 236.167,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/treasures.firstPaperBag",
            ["solid"] = true
          }
        },
        {
          id = 10,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 680,
          y = 200,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/treasures.pickupWeight",
            ["setflag"] = "weight1",
            ["solid"] = true
          }
        },
        {
          id = 11,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 880,
          y = 240,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/treasures.pickupWeight",
            ["setflag"] = "weight2",
            ["solid"] = true
          }
        },
        {
          id = 12,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 480,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/treasures.pickupWeight",
            ["setflag"] = "weight3",
            ["solid"] = true
          }
        },
        {
          id = 18,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 920,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/treasures.pickupWeight",
            ["setflag"] = "weight4",
            ["solid"] = true
          }
        },
        {
          id = 37,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 34,
          y = 240,
          width = 127.666,
          height = 236.167,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/treasures.pickupJoylessDevice",
            ["solid"] = true
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 3,
          name = "to_treasure",
          type = "",
          shape = "point",
          x = 1560,
          y = 341.333,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
