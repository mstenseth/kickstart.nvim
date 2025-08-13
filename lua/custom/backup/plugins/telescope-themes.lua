return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    lazy = true,
    dependencies = {
      'andrew-george/telescope-themes',
      -- other dependencies
    },
    config = function()
      local telescope = require 'telescope'
      telescope.load_extension 'themes'
    end,
  },
}
