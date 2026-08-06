return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.12.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 13,
  properties = {
    ["name"] = "Garden - Shop"
  },
  tilesets = {
    {
      name = "garden",
      firstgid = 1,
      filename = "../../../tilesets/garden.tsx"
    },
    {
      name = "garden_slide",
      firstgid = 101,
      filename = "../../../tilesets/garden_slide.tsx"
    },
    {
      name = "garden_extras",
      firstgid = 201,
      filename = "../../../tilesets/garden_extras.tsx",
      exportfilename = "../../../tilesets/garden_extras.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 104, 103, 104, 104, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 104, 102, 102, 102, 102, 104, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 104, 102, 102, 102, 102, 102, 102, 103, 0, 0, 0, 0,
        0, 0, 0, 103, 102, 102, 102, 102, 102, 102, 102, 102, 103, 0, 0, 0,
        0, 0, 103, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 104, 0, 0,
        7, 6, 114, 114, 114, 114, 114, 114, 114, 114, 114, 114, 114, 5, 5, 6,
        5, 5, 5, 5, 5, 6, 7, 5, 7, 5, 5, 5, 6, 5, 5, 5,
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
        19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19,
        29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 400,
          width = 640,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 240,
          width = 280,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 240,
          width = 280,
          height = 40,
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
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 284,
          y = 280,
          width = 72,
          height = 98,
          rotation = 0,
          opacity = 1,
          gid = 241,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 284,
          y = 170,
          width = 72,
          height = 32,
          rotation = 0,
          opacity = 1,
          gid = 242,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 280,
          width = 40,
          height = 120,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["map"] = "chapter1/farm_world/garden_manorladders",
            ["marker"] = "to_shop"
          }
        },
        {
          id = 8,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 240,
          width = 80,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["marker"] = "shop",
            ["shop"] = "zobate"
          }
        },
        {
          id = 11,
          name = "savepoint",
          type = "",
          shape = "rectangle",
          x = 140,
          y = 280,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["heals"] = true,
            ["marker"] = "spawn",
            ["text1"] = "* (The power of this shop shines bright,[wait:5] like the light of a thousand suns.)",
            ["text2"] = "* (Your [color:yellow]DARK WALLET[color:reset] quivers...)",
            ["text_once"] = true
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
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
          id = 7,
          name = "to_ladders",
          type = "",
          shape = "point",
          x = 40,
          y = 340,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "shop",
          type = "",
          shape = "point",
          x = 320,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "spawn",
          type = "",
          shape = "point",
          x = 210,
          y = 310,
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
