return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.12.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 40,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 24,
  properties = {
    ["music"] = "garden",
    ["name"] = "Garden - Weight Puzzle 2"
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
      filename = "../../../tilesets/garden_extras.tsx",
      exportfilename = "../../../tilesets/garden_extras.lua"
    },
    {
      name = "treasures",
      firstgid = 150,
      filename = "../../../tilesets/treasures.tsx",
      exportfilename = "../../../tilesets/treasures.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 40,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 48, 47, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        9, 9, 9, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 48, 48, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        19, 19, 19, 19, 5, 5, 5, 6, 6, 7, 5, 5, 5, 5, 5, 48, 47, 15, 15, 15, 15, 0, 0, 0, 48, 48, 48, 48, 0, 0,
        29, 29, 29, 5, 5, 5, 5, 5, 6, 7, 5, 5, 5, 5, 5, 48, 48, 15, 15, 15, 15, 15, 15, 48, 48, 48, 48, 48, 48, 0,
        39, 39, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 48, 48, 15, 15, 16, 16, 15, 15, 15, 48, 48, 48, 47, 48, 0,
        49, 49, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 48, 48, 15, 15, 16, 15, 15, 15, 15, 15, 15, 48, 48, 48, 0,
        59, 59, 19, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 47, 48, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0,
        0, 0, 29, 19, 9, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 48, 48, 37, 37, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0,
        0, 0, 39, 29, 19, 19, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 19, 19, 48, 48, 48, 15, 15, 15, 15, 15, 15, 15, 0,
        0, 0, 49, 39, 29, 29, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 29, 29, 48, 48, 48, 48, 15, 15, 15, 16, 15, 15, 0,
        0, 0, 59, 49, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7, 5, 5, 39, 39, 48, 48, 48, 48, 15, 15, 15, 16, 16, 15, 0,
        0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 7, 5, 49, 49, 0, 48, 48, 15, 15, 15, 15, 15, 15, 15, 0,
        0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 59, 59, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0,
        0, 5, 5, 5, 5, 5, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 37, 37, 0,
        0, 5, 5, 5, 5, 7, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 15, 15, 15, 16, 15, 15, 15, 15, 15, 37, 19, 19, 0,
        0, 5, 5, 5, 5, 6, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 15, 16, 15, 15, 15, 15, 15, 15, 38, 19, 29, 29, 0,
        0, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 15, 15, 15, 15, 15, 15, 15, 15, 19, 29, 39, 39, 0,
        0, 19, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 15, 15, 15, 15, 15, 15, 15, 37, 29, 39, 49, 49, 0,
        0, 29, 19, 9, 9, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 9, 9, 37, 37, 37, 38, 37, 37, 37, 19, 39, 49, 59, 59, 0,
        0, 39, 29, 19, 19, 19, 5, 5, 5, 5, 5, 5, 5, 5, 5, 19, 19, 19, 19, 19, 19, 19, 19, 19, 29, 49, 59, 0, 0, 0,
        0, 49, 39, 29, 29, 29, 5, 5, 5, 5, 5, 5, 5, 5, 5, 29, 29, 29, 29, 29, 29, 29, 29, 29, 39, 59, 0, 0, 0, 0,
        0, 59, 49, 39, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 39, 39, 39, 39, 39, 39, 39, 49, 0, 0, 0, 0, 0,
        0, 0, 59, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 49, 49, 49, 49, 49, 49, 49, 59, 0, 0, 0, 0, 0,
        0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7, 6, 5, 59, 59, 59, 59, 59, 59, 59, 0, 0, 0, 0, 0, 0,
        0, 0, 5, 5, 5, 5, 7, 6, 6, 5, 5, 5, 5, 6, 7, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 9, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 19, 19, 9, 9, 9, 9, 5, 5, 5, 5, 5, 5, 9, 9, 9, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 29, 29, 19, 19, 19, 19, 9, 9, 9, 5, 5, 9, 19, 19, 19, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 39, 39, 29, 29, 29, 29, 19, 19, 19, 9, 9, 19, 29, 29, 29, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 49, 49, 39, 39, 39, 39, 29, 29, 29, 19, 19, 29, 39, 39, 39, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 59, 59, 49, 49, 49, 49, 39, 39, 39, 29, 29, 39, 49, 49, 49, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 59, 59, 59, 59, 49, 49, 49, 39, 39, 49, 59, 59, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 59, 59, 59, 49, 49, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
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
          id = 1,
          name = "to_treasure",
          type = "",
          shape = "point",
          x = 49.3333,
          y = 162.667,
          width = 0,
          height = 0,
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
      id = 5,
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
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 1240,
          width = 141.59,
          height = 230.163,
          rotation = 0,
          opacity = 1,
          gid = 161,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
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
          id = 3,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 120,
          width = 40,
          height = 80.6667,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["map"] = "chapter1/farm_world/garden_treasurehunt",
            ["marker"] = "to_weight2"
          }
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 560,
          width = 354,
          height = 205,
          rotation = 0,
          opacity = 1,
          gid = 148,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 1000,
          width = 354,
          height = 205,
          rotation = 0,
          opacity = 1,
          gid = 148,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "npc",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 280,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["actor"] = "kipkip",
            ["text1_1"] = "* (Come back later not doen yet)",
            ["text2_1"] = "* (Stupid starwalker temporary NPCs and their cryptic Deltarune Related Theories.)",
            ["text2_2"] = "* (I'm going to say cryptic Pikmin theories instead.)",
            ["text3_1"] = "* (Umibozu Theory [sound:wheredidtheyhidetheza] [sound:wheredidtheyhidetheza]PNF-404 is Earth [sound:wheredidtheyhidetheza]Louie's Dark Secret [sound:wheredidtheyhidetheza]Pikmin 2 SPAM Email Every Pikmin 2 Cave is Personalized [sound:wheredidtheyhidetheza] Drake is Character D Hocotate is a corporate state [sound:wheredidtheyhidetheza]Bulbmin are parasite Pikmin [sound:wheredidtheyhidetheza] Louie is evil)"
          }
        },
        {
          id = 7,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 350,
          width = 358.666,
          height = 206.167,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/treasures.secondPaperBag",
            ["solid"] = true
          }
        },
        {
          id = 8,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 788,
          width = 358.666,
          height = 211.167,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/treasures.thirdPaperBag",
            ["solid"] = true
          }
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 840,
          y = 360,
          width = 40,
          height = 60,
          rotation = 0,
          opacity = 1,
          gid = 149,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 840,
          y = 320,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/treasures.pickupWeight",
            ["setflag"] = "weight99",
            ["solid"] = true
          }
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 440,
          width = 40,
          height = 60,
          rotation = 0,
          opacity = 1,
          gid = 149,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/treasures.pickupWeight",
            ["setflag"] = "weight98",
            ["solid"] = true
          }
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1080,
          y = 440,
          width = 40,
          height = 60,
          rotation = 0,
          opacity = 1,
          gid = 149,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 1080,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/treasures.pickupWeight",
            ["setflag"] = "weight97",
            ["solid"] = true
          }
        },
        {
          id = 23,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 319.667,
          y = 1011.42,
          width = 132.666,
          height = 222.167,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/treasures.pickupPrinterInk",
            ["solid"] = true
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
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
          id = 17,
          name = "toggle",
          type = "",
          shape = "point",
          x = 887,
          y = 99,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "weight99",
            ["inverted"] = true,
            ["target1"] = { id = 10 },
            ["target2"] = { id = 39 }
          }
        },
        {
          id = 18,
          name = "toggle",
          type = "",
          shape = "point",
          x = 997,
          y = 91,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "weight98",
            ["inverted"] = true,
            ["target1"] = { id = 11 },
            ["target2"] = { id = 12 }
          }
        },
        {
          id = 19,
          name = "toggle",
          type = "",
          shape = "point",
          x = 1097,
          y = 85,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "weight97",
            ["inverted"] = true,
            ["target1"] = { id = 13 },
            ["target2"] = { id = 14 }
          }
        },
        {
          id = 20,
          name = "toggle",
          type = "",
          shape = "point",
          x = 648,
          y = 481.333,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "secondPaperBag",
            ["inverted"] = true,
            ["target1"] = { id = 4 },
            ["target2"] = { id = 7 }
          }
        },
        {
          id = 21,
          name = "toggle",
          type = "",
          shape = "point",
          x = 710,
          y = 674,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "thirdPaperBag",
            ["inverted"] = true,
            ["target1"] = { id = 5 },
            ["target2"] = { id = 8 }
          }
        }
      }
    }
  }
}
