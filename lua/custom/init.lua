local colors = {
  -- Catppuccin Macchiato palette
  rosewater = '#f4dbd6',
  flamingo = '#f0c6c6',
  pink = '#f5bde6',
  mauve = '#c6a0f6',
  red = '#ed8796',
  maroon = '#ee99a0',
  peach = '#f5a97f',
  yellow = '#eed49f',
  green = '#a6da95',
  teal = '#8bd5ca',
  sky = '#91d7e3',
  sapphire = '#7dc4e4',
  blue = '#8aadf4',
  lavender = '#b7bdf8',
  text = '#cad3f5',
  subtext1 = '#b8c0e0',
  subtext0 = '#a5adcb',
  overlay2 = '#939ab7',
  overlay1 = '#8087a2',
  overlay0 = '#6e738d',
  surface2 = '#5b6078',
  surface1 = '#494d64',
  surface0 = '#363a4f',
  base = '#000000', -- Changed to pure black
  mantle = '#000000', -- Changed to pure black
  crust = '#000000', -- Changed to pure black
}
-- Default line number style
local default_fg = colors.text
local default_bg = colors.base

local hl = {
  n = { fg = colors.text },
  i = { fg = colors.yellow },
  v = { fg = colors.green },
  R = { fg = colors.base },
}

-- vim.cmd.colorscheme 'tokyonight-night'
-- vim.cmd.colorscheme 'catppuccin-macchiato'
vim.cmd.colorscheme 'catppuccin_macchiato_black'
vim.opt.numberwidth = 4
vim.o.path = vim.o.path .. ',**'
-- for auto-session to work properly
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

require 'lsp'
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'zig' },
  highlight = { enable = true },
}

vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*',
  callback = function()
    local mode = vim.fn.mode()

    local style = hl[mode:sub(1, 1)] or { fg = default_fg, bg = default_bg }

    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = style.fg, bg = style.bg, bold = true })
  end,
})

vim.api.nvim_create_user_command('OpenGLDoc', function()
  local word = vim.fn.expand '<cword>'
  local base = word:gsub('%d.*$', '') -- strip from first digit onwards
  local url = 'https://docs.gl/gl4/gl' .. base
  vim.fn.jobstart({ 'xdg-open', url }, { detach = true })
end, {})

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sc', function()
  builtin.find_files {
    search_dirs = { '~/.config/' },
  }
end, { desc = '[S]earch [C]onfig files' })

local function goto_definition_below()
  if vim.fn.winnr '$' == 1 then
    vim.cmd 'split'
  else
    vim.cmd 'wincmd j'
  end
  vim.lsp.buf.definition()
end

vim.keymap.set('n', '<leader>m', ':make<CR>', { desc = 'Run zig build (make)' })
vim.keymap.set('n', '<leader>a', ':!!<CR>', { desc = 'Rerun last !' })
vim.keymap.set('c', '<C-a>', '<C-b>', { desc = 'Beginning of command line' })
vim.keymap.set('n', '<leader>go', ':OpenGLDoc<CR>', { desc = 'Open OpenGL doc for symbol under cursor' })
vim.keymap.set('n', '<leader>gd', goto_definition_below, { desc = 'Go to definition below' })
vim.keymap.set('n', '<leader>;', '<ESC>A;<ESC>', { desc = 'Insert semicolon at end of line' })

print '🔥 Custom config loaded!'

return {}
