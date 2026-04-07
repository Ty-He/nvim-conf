-- nvim-notify default config
-- :h notify.setup()
  -- {
  --   background_colour = "NotifyBackground",
  --   fps = 30,
  --   icons = {
  --     DEBUG = "",
  --     ERROR = "",
  --     INFO = "",
  --     TRACE = "✎",
  --     WARN = ""
  --   },
  --   level = 2,
  --   minimum_width = 50,
  --   render = "default",
  --   stages = "fade_in_slide_out",
  --   time_formats = {
  --     notification = "%T",
  --     notification_history = "%FT%T"
  --   },
  --   timeout = 5000,
  --   top_down = true
  -- }
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    presets = {
      bottom_search = true,
    }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function(_, opts)
    require("notify").setup({
      background_colour = "#000000",
      fps = 60,
      render = "wrapped-compact",
    })
    require("noice").setup(opts)
  end
}
