return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      -- when we have more than one windows in a tab, only show one statusline
      globalstatus = true,
    },
    extensions = { "nvim-tree" },
    sections = {
      lualine_b = { "branch", 'diagnostics' },
      lualine_x = {
        "encoding",
        "filetype",
      },
    },
  },
}
