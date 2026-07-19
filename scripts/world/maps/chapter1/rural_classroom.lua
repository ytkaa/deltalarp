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
  nextobjectid = 8,
  backgroundcolor = { 0, 0, 0 },
  properties = {},
  tilesets = {
    {
      name = "rural",
      firstgid = 1,
      filename = "../../tilesets/rural.tsx",
      exportfilename = "../../tilesets/rural.lua"
    },
    {
      name = "rural_buildings",
      firstgid = 101,
      filename = "../../tilesets/rural_buildings.tsx",
      exportfilename = "../../tilesets/rural_buildings.lua"
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
        0, 0, 45, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 46, 0, 0,
        0, 0, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 0, 0,
        0, 0, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 0, 0,
        0, 0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 0,
        0, 0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 0,
        0, 0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 0,
        0, 0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 0,
        0, 0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 0,
        0, 0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 0,
        0, 0, 61, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 62, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
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
          x = 40,
          y = 120,
          width = 40,
          height = 320,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 440,
          width = 560,
          height = 40,
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
          x = 560,
          y = 120,
          width = 40,
          height = 320,
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
          x = 80,
          y = 120,
          width = 480,
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
          x = 100,
          y = 160,
          width = 80,
          height = 120,
          rotation = 0,
          opacity = 1,
          gid = 106,
          visible = true,
          properties = {}
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
          name = "spawn",
          type = "",
          shape = "point",
          x = 320,
          y = 280,
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
