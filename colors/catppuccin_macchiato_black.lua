-- Catppuccin Macchiato with pure black background
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
  -- base = '#000000', -- Changed to pure black
  -- mantle = '#000000', -- Changed to pure black
  -- crust = '#000000', -- Changed to pure black
}

-- Clear existing highlights and set colorscheme name
vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.o.background = 'dark'
vim.g.colors_name = 'catppuccin_macchiato_black'

-- Editor highlights
vim.api.nvim_set_hl(0, 'Normal', { fg = colors.text, bg = colors.base })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = colors.text, bg = colors.base })
vim.api.nvim_set_hl(0, 'Cursor', { fg = colors.base, bg = colors.text })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = colors.surface0 })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = colors.surface0 })
vim.api.nvim_set_hl(0, 'Visual', { bg = colors.surface1 })
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = colors.surface1 })
vim.api.nvim_set_hl(0, 'Search', { fg = colors.base, bg = colors.yellow })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = colors.base, bg = colors.red })

-- Line numbers
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.overlay0 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.lavender, bold = true })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = colors.base })
-- vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.overlay0 })
-- vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.base, bg = colors.text, bold = true })
-- vim.api.nvim_set_hl(0, 'SignColumn', { bg = colors.base })

-- Splits and windows
vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.surface0 })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = colors.surface0 })

-- Status line
vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors.text, bg = colors.surface0 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = colors.subtext0, bg = colors.surface0 })

-- Tab line
vim.api.nvim_set_hl(0, 'TabLine', { fg = colors.subtext0, bg = colors.surface0 })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = colors.surface0 })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = colors.text, bg = colors.surface1, bold = true })

-- Popup menu
vim.api.nvim_set_hl(0, 'Pmenu', { fg = colors.text, bg = colors.surface0 })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = colors.base, bg = colors.blue })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = colors.surface1 })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = colors.overlay0 })

-- Syntax highlighting
vim.api.nvim_set_hl(0, 'Comment', { fg = colors.overlay0, italic = true })
vim.api.nvim_set_hl(0, 'Constant', { fg = colors.peach })
vim.api.nvim_set_hl(0, 'String', { fg = colors.green })
vim.api.nvim_set_hl(0, 'Character', { fg = colors.teal })
vim.api.nvim_set_hl(0, 'Number', { fg = colors.peach })
vim.api.nvim_set_hl(0, 'Boolean', { fg = colors.peach })
vim.api.nvim_set_hl(0, 'Float', { fg = colors.peach })

vim.api.nvim_set_hl(0, 'Identifier', { fg = colors.flamingo })
vim.api.nvim_set_hl(0, 'Function', { fg = colors.blue })

vim.api.nvim_set_hl(0, 'Statement', { fg = colors.mauve })
vim.api.nvim_set_hl(0, 'Conditional', { fg = colors.red })
vim.api.nvim_set_hl(0, 'Repeat', { fg = colors.red })
vim.api.nvim_set_hl(0, 'Label', { fg = colors.sapphire })
vim.api.nvim_set_hl(0, 'Operator', { fg = colors.sky })
vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.red })
vim.api.nvim_set_hl(0, 'Exception', { fg = colors.peach })

vim.api.nvim_set_hl(0, 'PreProc', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Include', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Define', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Macro', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = colors.pink })

vim.api.nvim_set_hl(0, 'Type', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'Structure', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'Typedef', { fg = colors.yellow })

vim.api.nvim_set_hl(0, 'Special', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Tag', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = colors.overlay2 })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = colors.overlay0, italic = true })
vim.api.nvim_set_hl(0, 'Debug', { fg = colors.peach })

-- Error and warning
vim.api.nvim_set_hl(0, 'Error', { fg = colors.red })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = colors.red, bg = colors.base })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'Todo', { fg = colors.base, bg = colors.yellow, bold = true })

-- Underline and special
vim.api.nvim_set_hl(0, 'Underlined', { fg = colors.text, underline = true })
vim.api.nvim_set_hl(0, 'Title', { fg = colors.blue, bold = true })

-- Diff
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = colors.green, fg = colors.base })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = colors.yellow, fg = colors.base })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = colors.red, fg = colors.base })
vim.api.nvim_set_hl(0, 'DiffText', { bg = colors.blue, fg = colors.base })

-- Folding
vim.api.nvim_set_hl(0, 'Folded', { fg = colors.blue, bg = colors.surface0 })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = colors.overlay0, bg = colors.base })

-- Spelling
vim.api.nvim_set_hl(0, 'SpellBad', { fg = colors.red, underline = true })
vim.api.nvim_set_hl(0, 'SpellCap', { fg = colors.yellow, underline = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { fg = colors.blue, underline = true })
vim.api.nvim_set_hl(0, 'SpellRare', { fg = colors.pink, underline = true })

-- Additional highlights for better integration
vim.api.nvim_set_hl(0, 'Directory', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = colors.base, bg = colors.base })
vim.api.nvim_set_hl(0, 'NonText', { fg = colors.overlay0 })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = colors.overlay0 })
vim.api.nvim_set_hl(0, 'WildMenu', { fg = colors.base, bg = colors.blue })
vim.api.nvim_set_hl(0, 'Question', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = colors.blue, bold = true })
