return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.12.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 17,
  height = 16,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 10,
  nextobjectid = 28,
  properties = {
    ["music"] = "garden",
    ["name"] = "Garden - Ladder 1"
  },
  tilesets = {
    {
      name = "garden",
      firstgid = 1,
      filename = "../../../tilesets/garden.tsx"
    },
    {
      name = "farm_world",
      firstgid = 101,
      filename = "../../../tilesets/farm_world.tsx",
      exportfilename = "../../../tilesets/farm_world.lua"
    },
    {
      name = "farm_world_extras",
      firstgid = 201,
      filename = "../../../tilesets/farm_world_extras.tsx",
      exportfilename = "../../../tilesets/farm_world_extras.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 17,
      height = 16,
      id = 1,
      name = "Tile Layer 1",
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 21, 5, 22, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 21, 5, 22, 0, 0, 6, 6, 5, 0, 0, 21, 5, 22, 0, 0,
        0, 0, 5, 7, 5, 0, 0, 5, 5, 5, 0, 0, 6, 6, 5, 0, 0,
        0, 0, 9, 7, 9, 0, 0, 5, 5, 5, 0, 0, 9, 5, 9, 0, 0,
        0, 0, 19, 6, 19, 0, 0, 5, 5, 5, 0, 0, 19, 6, 19, 0, 0,
        0, 0, 59, 7, 59, 0, 0, 5, 5, 5, 0, 0, 59, 5, 59, 0, 0,
        0, 0, 0, 5, 0, 0, 0, 5, 5, 5, 0, 0, 0, 5, 0, 0, 0,
        0, 0, 21, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 5, 22, 0, 0,
        0, 0, 9, 9, 9, 9, 9, 5, 5, 5, 9, 9, 9, 9, 9, 0, 0,
        0, 0, 19, 19, 19, 19, 19, 5, 5, 5, 19, 19, 19, 19, 19, 0, 0,
        0, 0, 29, 29, 29, 29, 29, 9, 9, 9, 29, 29, 29, 29, 29, 0, 0,
        0, 0, 39, 39, 39, 39, 39, 19, 19, 19, 39, 39, 39, 39, 39, 0, 0,
        0, 0, 59, 59, 59, 59, 59, 29, 29, 29, 59, 59, 59, 59, 59, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 17,
      height = 16,
      id = 4,
      name = "ladders",
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 130, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 130, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "objects_ladders",
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
          id = 4,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 560,
          width = 40,
          height = 80,
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
      id = 6,
      name = "objects_climb_entry",
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
          id = 6,
          name = "climbentry",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 560,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["target"] = { id = 9 }
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "objects_climb_exit",
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
          name = "climbexit",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 560,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["target"] = { id = 11 }
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 9,
      name = "objects_tilebutton",
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
          id = 23,
          name = "tilebutton",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 200,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["blocks"] = false,
            ["cutscene"] = "chapter1/garden.ladder1",
            ["group"] = 1,
            ["keepdown"] = true,
            ["once"] = true,
            ["onsound"] = "noise"
          }
        },
        {
          id = 26,
          name = "tilebutton",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 200,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["blocks"] = false,
            ["cutscene"] = "chapter1/garden.ladder1",
            ["group"] = 1,
            ["keepdown"] = true,
            ["once"] = true,
            ["onsound"] = "noise"
          }
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
          x = 280,
          y = 620,
          width = 120,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["map"] = "chapter1/farm_world/garden_manorladders",
            ["marker"] = "to_ladder1"
          }
        },
        {
          id = 14,
          name = "dirtflower",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 80,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["setflag"] = "dirt1",
            ["setvalue"] = true
          }
        },
        {
          id = 15,
          name = "enemy",
          type = "",
          shape = "point",
          x = 130,
          y = 360,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["actor"] = "kipkip",
            ["chase"] = false,
            ["chasedist"] = 200,
            ["encounter"] = "kipkip",
            ["enemy"] = "kipkip",
            ["once"] = true
          }
        },
        {
          id = 16,
          name = "enemy",
          type = "",
          shape = "point",
          x = 530,
          y = 360,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["actor"] = "kipkip",
            ["chase"] = false,
            ["chasedist"] = 200,
            ["encounter"] = "kipkip",
            ["enemy"] = "kipkip",
            ["once"] = true
          }
        },
        {
          id = 17,
          name = "spike1",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 200,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          gid = 213,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "spike2",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 200,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          gid = 213,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "spike3",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 200,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          gid = 213,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 160,
          width = 120,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1_1"] = "* (Spikes.)",
            ["text2_1"] = "* (It's garden warfare...)"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 8,
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
          id = 21,
          name = "toggle",
          type = "",
          shape = "point",
          x = 230,
          y = -50,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "garden_ladder1",
            ["inverted"] = true,
            ["target1"] = { id = 21 },
            ["target2"] = { id = 19 },
            ["target3"] = { id = 18 },
            ["target4"] = { id = 17 },
            ["target5"] = { id = 20 }
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
          name = "entry",
          type = "",
          shape = "point",
          x = 340,
          y = 600,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["player_state"] = "CLIMB"
          }
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "point",
          x = 340,
          y = 520,
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
