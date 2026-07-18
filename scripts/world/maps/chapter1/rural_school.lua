return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.12.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 16,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 4,
  nextobjectid = 3,
  properties = {},
  tilesets = {
    {
      name = "rural",
      firstgid = 1,
      filename = "../../tilesets/rural.tsx",
      exportfilename = "../../tilesets/rural.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
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
        1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3,
        1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3,
        1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3,
        1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3,
        1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3,
        32, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 32,
        32, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 32,
        32, 32, 32, 32, 32, 1, 2, 2, 2, 2, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 1, 2, 2, 2, 2, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 1, 2, 2, 2, 2, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 1, 2, 2, 2, 2, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 1, 2, 2, 2, 2, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 1, 2, 2, 2, 2, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 11, 12, 12, 12, 12, 13, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 11, 2, 21, 22, 22, 23, 12, 13, 32, 32, 32, 32,
        32, 32, 32, 11, 2, 24, 21, 22, 22, 23, 24, 2, 13, 32, 32, 32
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
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 640,
          width = 240,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["map"] = "chapter1/rural_mainstreet",
            ["marker"] = "to_school"
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
          id = 1,
          name = "to_street",
          type = "",
          shape = "point",
          x = 320,
          y = 600,
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
