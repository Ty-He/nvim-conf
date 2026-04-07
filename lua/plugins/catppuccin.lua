return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    background = {
      light = "latte",
      dark = "frappe",
    },
    -- transparent_background = true,
    float = {
      solid = true
    },
    integrations = {
      notify = true
    },
    dim_inactive = {
      enable = true
    }
  },
  config = function (_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin'
  end
}
