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
  nextobjectid = 11,
  properties = {
    ["light"] = true
  },
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
        32, 32, 32, 32, 32, 1, 21, 22, 22, 23, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 1, 21, 22, 22, 23, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 1, 21, 22, 22, 23, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 1, 21, 22, 22, 23, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 1, 21, 22, 22, 23, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 1, 21, 22, 22, 23, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 1, 21, 22, 22, 23, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 1, 2, 2, 22, 22, 23, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 1, 2, 2, 2, 22, 23, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 1, 2, 2, 2, 3, 23, 3, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 1, 2, 2, 2, 3, 32, 32, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
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
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 0,
          width = 40,
          height = 280,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 0,
          width = 40,
          height = 400,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = -40,
          width = 200,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 0,
          width = 40,
          height = 480,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 480,
          width = 640,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 0,
          width = 40,
          height = 480,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 440,
          y = -40,
          width = 200,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["light"] = true
          }
        }
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
          id = 1,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 240,
          y = -40,
          width = 160,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["map"] = "chapter1/rural1",
            ["marker"] = "to_shed"
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
          id = 2,
          name = "entry",
          type = "",
          shape = "point",
          x = 320,
          y = 40,
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
