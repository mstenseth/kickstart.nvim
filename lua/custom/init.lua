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
  base = '#0D1117', -- Changed to pure black
  mantle = '#0D1117', -- Changed to pure black
  crust = '#0D1117', -- Changed to pure black
}
-- Default line number style
local default_fg = colors.text
local default_bg = colors.base

local hl = {
  n = { fg = colors.text },
  i = { fg = colors.yellow },
  v = { fg = colors.green },
  R = { fg = colors.red },
}

-- vim.cmd.colorscheme 'tokyonight-night'
vim.cmd.colorscheme 'catppuccin-mocha'
-- vim.cmd.colorscheme 'catppuccin_macchiato_black'
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
    print('mode:' .. mode)

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

vim.keymap.set('n', '<leader>m', ':WMake<CR>', { desc = 'Save current file and make' })
vim.keymap.set('n', '<leader>r', ':!!<CR>', { desc = 'Rerun last !' })
vim.keymap.set('c', '<C-a>', '<C-b>', { desc = 'Beginning of command line' })
vim.keymap.set('n', '<leader>go', ':OpenGLDoc<CR>', { desc = 'Open OpenGL doc for symbol under cursor' })
vim.keymap.set('n', '<leader>gd', goto_definition_below, { desc = 'Go to definition below' })
vim.keymap.set('n', '<leader>;', '<ESC>A;<ESC>', { desc = 'Insert semicolon at end of line' })
vim.keymap.set('n', '<leader>a', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '<leader>x', '<C-x>', { desc = 'Decrement number' })
vim.keymap.set('n', '<leader>dp', function()
  -- Try to get a larger expression by expanding selection
  local function get_expression_under_cursor()
    -- Save current position
    local pos = vim.api.nvim_win_get_cursor(0)

    -- Try to expand selection to get full expression
    -- This is a heuristic approach: look for common patterns
    local line = vim.api.nvim_get_current_line()
    local col = pos[2]

    -- Find the start of the expression (walk backwards)
    local start_col = col
    while start_col > 0 do
      local char = line:sub(start_col, start_col)
      if char:match '[%w_.]' then
        start_col = start_col - 1
      else
        start_col = start_col + 1
        break
      end
    end

    -- Find the end of the expression (walk forwards)
    local end_col = col + 1
    while end_col <= #line do
      local char = line:sub(end_col, end_col)
      if char:match '[%w_.]' then
        end_col = end_col + 1
      else
        break
      end
    end

    -- Extract the expression
    if start_col <= end_col then
      return line:sub(start_col, end_col - 1)
    end

    -- Fallback
    return vim.fn.expand '<cword>'
  end

  local expr = get_expression_under_cursor()
  local line = 'std.debug.print("' .. expr .. ' = {}\\n", .{' .. expr .. '});'
  vim.api.nvim_put({ line }, 'l', true, true)
end, { desc = 'Debug print expression under cursor' })
vim.api.nvim_set_keymap(
  'n',
  '<leader>ff',
  ':lua require("telescope.builtin").find_files({ hidden = true, no_ignore = false })<CR>',
  { noremap = true, silent = true }
)

-- Auto reload files when focus is gained (if terminal supports focus events)
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI', 'CursorMoved', 'CursorMovedI' }, {
  desc = 'Auto reload files on various events',
  pattern = '*',
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd 'silent! checktime'
    end
  end,
})

require 'blink.cmp'

-- Load custom snippets
require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/lua/custom/snippets' }

vim.api.nvim_create_user_command('WMake', function()
  vim.cmd.write()
  vim.cmd.make()
end, { desc = 'Save and run make' })

print '📁 Auto-reload on focus enabled!'

return {}
