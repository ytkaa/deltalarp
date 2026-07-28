return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.12.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 15,
  height = 20,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 11,
  nextobjectid = 48,
  properties = {
    ["music"] = "the entrance"
  },
  tilesets = {
    {
      name = "farm_world",
      firstgid = 1,
      filename = "../../../tilesets/farm_world.tsx",
      exportfilename = "../../../tilesets/farm_world.lua"
    },
    {
      name = "garden",
      firstgid = 101,
      filename = "../../../tilesets/garden.tsx",
      exportfilename = "../../../tilesets/garden.lua"
    },
    {
      name = "farm_world_extras",
      firstgid = 201,
      filename = "../../../tilesets/farm_world_extras.tsx",
      exportfilename = "../../../tilesets/farm_world_extras.lua"
    },
    {
      name = "garden_extras",
      firstgid = 226,
      filename = "../../../tilesets/garden_extras.tsx",
      exportfilename = "../../../tilesets/garden_extras.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 15,
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
        111, 103, 114, 103, 111, 113, 112, 101, 111, 101, 114, 112, 112, 102, 112,
        114, 103, 114, 101, 112, 104, 113, 111, 114, 102, 102, 111, 114, 104, 104,
        101, 114, 114, 103, 113, 102, 101, 101, 101, 101, 113, 111, 104, 114, 102,
        113, 112, 111, 101, 101, 111, 103, 103, 104, 112, 102, 114, 102, 114, 101,
        103, 103, 113, 112, 111, 101, 101, 112, 101, 112, 112, 111, 112, 103, 111,
        101, 111, 104, 101, 104, 111, 103, 112, 112, 102, 112, 103, 114, 104, 114,
        112, 103, 103, 102, 104, 111, 114, 114, 101, 102, 102, 101, 111, 103, 112,
        105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105,
        105, 105, 105, 105, 105, 105, 105, 106, 105, 105, 105, 105, 105, 105, 105,
        105, 105, 106, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105,
        105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105,
        105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105,
        105, 105, 105, 105, 106, 105, 105, 105, 105, 106, 105, 105, 105, 105, 105,
        105, 105, 105, 105, 105, 106, 105, 105, 105, 105, 105, 105, 106, 105, 105,
        117, 117, 117, 117, 117, 117, 117, 117, 117, 117, 117, 117, 117, 117, 117,
        127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
        125, 125, 125, 125, 125, 125, 125, 125, 125, 125, 125, 125, 125, 125, 125,
        126, 126, 126, 126, 126, 126, 126, 126, 126, 126, 126, 126, 126, 126, 126,
        135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135,
        135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135, 135
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 15,
      height = 20,
      id = 5,
      name = "Camada de Blocos 2",
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        255, 256, 258, 255, 257, 258, 255, 255, 257, 255, 257, 255, 256, 258, 257,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 105, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 30, 30, 30, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 30, 30, 30, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 30, 30, 30, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 30, 30, 30, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 30, 30, 30, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
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
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 440,
          width = 320,
          height = 80,
          rotation = 0,
          opacity = 1,
          gid = 214,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 800,
          width = 120,
          height = 24,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["map"] = "chapter1/farm_world/farm_climb",
            ["marker"] = "to_garden"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "objects_ladder",
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
          id = 32,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 640.333,
          width = 120,
          height = 159.667,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "climbexit",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 600,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["target"] = { id = 46 }
          }
        },
        {
          id = 41,
          name = "climbexit",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 600,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["target"] = { id = 46 }
          }
        },
        {
          id = 42,
          name = "climbexit",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 600,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["target"] = { id = 46 }
          }
        },
        {
          id = 43,
          name = "climbentry",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 560,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["target"] = { id = 40 }
          }
        },
        {
          id = 44,
          name = "climbentry",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 560,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["target"] = { id = 41 }
          }
        },
        {
          id = 45,
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
            ["target"] = { id = 42 }
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "collision",
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
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 280,
          width = 599,
          height = 40,
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
          x = -40,
          y = 320,
          width = 41,
          height = 240,
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
          y = 560,
          width = 361.091,
          height = 42.6667,
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
          x = 361,
          y = 560,
          width = 238,
          height = 42.6667,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 400,
          width = 40,
          height = 20,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "",
          type = "",
          shape = "rectangle",
          x = 340,
          y = 400,
          width = 80,
          height = 20,
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
      id = 4,
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
          id = 18,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 360,
          width = 40,
          height = 80,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* (Green couch in the room.)"
          }
        },
        {
          id = 19,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 400,
          width = 20,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* (Green couch in the room.)"
          }
        },
        {
          id = 20,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 400,
          width = 100,
          height = 20,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* (Green couch in the room.)"
          }
        },
        {
          id = 21,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 420,
          y = 360,
          width = 20,
          height = 60,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* (Green couch in the room.)"
          }
        },
        {
          id = 22,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 180,
          y = 400,
          width = 20,
          height = 20,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* (Green couch in the room.)"
          }
        },
        {
          id = 23,
          name = "npc",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["actor"] = "colonel",
            ["talk"] = true,
            ["talksprite"] = "talk",
            ["text1_1"] = "* Welcome to the SECOND BARRACKS room,[wait:5] soldier!",
            ["text1_2"] = "* Me and the company are waiting for orders,[wait:5] soldier!",
            ["text1_3"] = "* No SAVE POINT here though,[wait:5] soldier.[wait:5] We don't have the funds for that",
            ["text1_4"] = "* That stuff is like crazy expensive dude.",
            ["text1_5"] = "* ... soldier.",
            ["text2_1"] = "* ... soldier."
          }
        },
        {
          id = 24,
          name = "npc",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["actor"] = "colonel",
            ["cutscene"] = "chapter1/garden.barracks2"
          }
        },
        {
          id = 25,
          name = "npc",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 320,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["actor"] = "colonel",
            ["talk"] = true,
            ["talksprite"] = "talk",
            ["text1_1"] = "* The GARDEN is beautiful..."
          }
        },
        {
          id = 26,
          name = "npc",
          type = "",
          shape = "rectangle",
          x = 95.1667,
          y = 400,
          width = 24.8333,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["actor"] = "colonel",
            ["talk"] = true,
            ["talksprite"] = "talk",
            ["text1_1"] = "* Good evening,[wait:5] Master Warrant Officer."
          }
        },
        {
          id = 27,
          name = "npc",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 360,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["actor"] = "colonel",
            ["talk"] = true,
            ["talksprite"] = "talk",
            ["text1_1"] = "* Hm?[wait:5] How did we get here first?",
            ["text1_2"] = "* Simple,[wait:5] major.[wait:10] Helicopter",
            ["text2_1"] = "* We could've provided air support while you were being chased but we got scared"
          }
        },
        {
          id = 38,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 320,
          width = 40,
          height = 239.667,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "chapter1/garden.barracks2_partydisband",
            ["once"] = false
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 9,
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
          id = 33,
          name = "to_farm",
          type = "",
          shape = "point",
          x = 295.333,
          y = 777.333,
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
          id = 46,
          name = "climb_exit",
          type = "",
          shape = "point",
          x = 297,
          y = 532.333,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["player_state"] = "CLIMB"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 10,
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
          id = 47,
          name = "toggle",
          type = "",
          shape = "point",
          x = 295,
          y = 87,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag"] = "leading_colonels_squad",
            ["inverted"] = true,
            ["target1"] = { id = 25 },
            ["target2"] = { id = 26 },
            ["target3"] = { id = 23 },
            ["target4"] = { id = 24 },
            ["target5"] = { id = 27 }
          }
        }
      }
    }
  }
}
