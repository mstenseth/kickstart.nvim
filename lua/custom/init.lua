require 'lsp'
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'zig' },
  highlight = { enable = true },
}

-- vim.g.clipboard = 'osc52'
-- vim.opt.makeprg = 'zig build run'
vim.keymap.set('n', '<leader>m', ':make<CR>', { desc = 'Run zig build (make)' })
-- vim.keymap.set('n', '<leader>r', ':make run<CR>', { desc = 'Run zig build (make run)' })
-- vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Write file' })
vim.keymap.set('n', '<leader>a', ':!!<CR>', { desc = 'Rerun last !' })

vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*',
  callback = function()
    local mode = vim.fn.mode()

    -- Default line number style
    local default_fg = '#888888'
    local default_bg = '#1e1e1e'

    local hl = {
      n = { fg = '#15161E', bg = '#7AA2F7' }, -- normal = white
      i = { fg = '#15161E', bg = '#9ECE6A' }, -- insert = green
      v = { fg = '#15161E', bg = '#BB9AF7' }, -- visual = orange
      R = { fg = '#15161E', bg = '#FF0000' }, -- replace = red
    }

    local style = hl[mode:sub(1, 1)] or { fg = default_fg, bg = default_bg }

    vim.api.nvim_set_hl(0, 'LineNr', { fg = style.fg, bg = style.bg })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = style.fg, bg = style.bg, bold = true })
  end,
})

vim.api.nvim_create_user_command('OpenGLDoc', function()
  local word = vim.fn.expand '<cword>'
  local base = word:gsub('%d.*$', '') -- strip from first digit onwards
  local url = 'https://docs.gl/gl4/gl' .. base
  vim.fn.jobstart({ 'xdg-open', url }, { detach = true })
end, {})

vim.keymap.set('n', '<leader>gd', ':OpenGLDoc<CR>', { desc = 'Open OpenGL doc for symbol under cursor' })

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sc', function()
  builtin.find_files { search_dirs = { '~/.config/' } }
end, { desc = '[S]earch [C]eovim files' })

local telescope = require 'telescope'
-- Grab the original setup from the plugin
local existing = require('telescope.config').values

-- Extend or override just the pickers
telescope.setup {
  defaults = existing.defaults,
  extensions = existing.extensions,
  pickers = vim.tbl_deep_extend('force', existing.pickers or {}, {
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true,
      previewer = true,
    },
  }),
}

print '🔥 Custom config loaded!'

return {}
