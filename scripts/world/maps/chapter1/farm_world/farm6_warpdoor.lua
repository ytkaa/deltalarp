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
  nextlayerid = 7,
  nextobjectid = 11,
  properties = {
    ["name"] = "Wheat Field - Door"
  },
  tilesets = {
    {
      name = "farm_world",
      firstgid = 1,
      filename = "../../../tilesets/farm_world.tsx",
      exportfilename = "../../../tilesets/farm_world.lua"
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
        11, 0, 0, 0, 0, 0, 11, 14, 0, 0, 0, 0, 0, 2, 13, 1,
        0, 13, 0, 2, 0, 2, 13, 0, 12, 14, 3, 0, 0, 0, 0, 0,
        0, 3, 0, 0, 13, 11, 1, 12, 4, 2, 12, 4, 0, 0, 0, 14,
        14, 0, 3, 0, 13, 1, 3, 13, 14, 14, 2, 3, 0, 0, 0, 4,
        1, 11, 14, 12, 11, 11, 13, 1, 3, 2, 14, 14, 14, 13, 12, 4,
        14, 4, 13, 3, 0, 0, 0, 0, 0, 0, 0, 0, 1, 12, 14, 12,
        16, 16, 5, 17, 17, 18, 17, 17, 18, 17, 17, 18, 18, 5, 16, 15,
        16, 15, 16, 16, 6, 5, 6, 6, 6, 5, 6, 5, 15, 16, 15, 16,
        15, 16, 16, 16, 16, 5, 5, 5, 6, 6, 5, 16, 16, 16, 16, 15,
        11, 3, 13, 2, 4, 12, 1, 4, 1, 3, 1, 2, 4, 13, 14, 12,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 2,
      name = "Tile Layer 2",
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
        0, 0, 0, 0, 0, 0, 9, 8, 9, 8, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 8, 7, 7, 7, 7, 8, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 8, 7, 7, 7, 7, 7, 7, 8, 0, 0, 0, 0,
        0, 0, 0, 8, 7, 7, 7, 7, 7, 7, 7, 7, 9, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
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
          y = 200,
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
          y = 360,
          width = 640,
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
          id = 3,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 240,
          width = 40,
          height = 120,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["map"] = "chapter1/farm_world/farm6",
            ["marker"] = "to_warpdoor"
          }
        },
        {
          id = 7,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 240,
          width = 40,
          height = 120,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["map"] = "chapter1/farm_world/farm7",
            ["marker"] = "to_warpdoor"
          }
        },
        {
          id = 9,
          name = "warpdoor",
          type = "",
          shape = "point",
          x = 320,
          y = 240,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["flag1"] = "barracks",
            ["map1"] = "chapter1/farm_world/farm6_warpdoor",
            ["marker1"] = "warp",
            ["name1"] = "Wheat Field",
            ["openflag"] = "farm_warpdoors"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
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
          id = 5,
          name = "to_farm7",
          type = "",
          shape = "point",
          x = 600,
          y = 300,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "to_farm6",
          type = "",
          shape = "point",
          x = 40,
          y = 300,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "warp",
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
