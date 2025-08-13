-- Kitty default theme colors
local colors = {
  -- Core colors from the file
  background = '#000000', -- black background
  foreground = '#dddddd', -- light gray foreground
  cursor = '#cccccc', -- light gray cursor
  cursor_text_color = '#111111', -- dark gray for text under cursor

  -- Selection colors
  selection_background = '#fffacd', -- light cream
  selection_foreground = '#000000', -- black

  -- URL color
  url_color = '#0087bd', -- blue

  -- Border colors
  active_border_color = '#00ff00', -- bright green
  inactive_border_color = '#cccccc', -- light gray
  bell_border_color = '#ff5a00', -- orange

  -- Tab colors
  active_tab_background = '#eeeeee', -- very light gray
  active_tab_foreground = '#000000', -- black
  inactive_tab_background = '#999999', -- medium gray
  inactive_tab_foreground = '#444444', -- dark gray

  -- The 16 ANSI colors from color_table array
  color0 = '#000000', -- black
  color1 = '#cc0403', -- red
  color2 = '#19cb00', -- green
  color3 = '#cecb00', -- yellow
  color4 = '#0d73cc', -- blue
  color5 = '#cb1ed1', -- magenta
  color6 = '#0dcdcd', -- cyan
  color7 = '#dddddd', -- white

  -- Bright colors
  color8 = '#767676', -- bright black (gray)
  color9 = '#f2201f', -- bright red
  color10 = '#23fd00', -- bright green
  color11 = '#fffd00', -- bright yellow
  color12 = '#1a8fff', -- bright blue
  color13 = '#fd28ff', -- bright magenta
  color14 = '#14ffff', -- bright cyan
  color15 = '#ffffff', -- bright white
}

-- Clear existing highlights and set colorscheme name
vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.o.background = 'dark'
vim.g.colors_name = 'kitty_default'

-- Editor highlights
vim.api.nvim_set_hl(0, 'Normal', { fg = colors.foreground, bg = colors.background })
vim.api.nvim_set_hl(0, 'Cursor', { fg = colors.cursor_text_color, bg = colors.cursor })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#111111' })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = '#111111' })
vim.api.nvim_set_hl(0, 'Visual', { fg = colors.selection_foreground, bg = colors.selection_background })
vim.api.nvim_set_hl(0, 'VisualNOS', { fg = colors.selection_foreground, bg = colors.selection_background })
vim.api.nvim_set_hl(0, 'Search', { fg = colors.color0, bg = colors.color11 })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = colors.color0, bg = colors.color9 })

-- Line numbers
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.color8 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.color7, bold = true })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = colors.background })

-- Splits and windows
vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.inactive_border_color })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = colors.inactive_border_color })

-- Status line
vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors.active_tab_foreground, bg = colors.active_tab_background })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = colors.inactive_tab_foreground, bg = colors.inactive_tab_background })

-- Tab line
vim.api.nvim_set_hl(0, 'TabLine', { fg = colors.inactive_tab_foreground, bg = colors.inactive_tab_background })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = colors.inactive_tab_background })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = colors.active_tab_foreground, bg = colors.active_tab_background, bold = true })

-- Popup menu
vim.api.nvim_set_hl(0, 'Pmenu', { fg = colors.foreground, bg = colors.color8 })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = colors.color0, bg = colors.color4 })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = colors.color8 })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = colors.foreground })

-- Syntax highlighting
vim.api.nvim_set_hl(0, 'Comment', { fg = colors.color8, italic = true })
vim.api.nvim_set_hl(0, 'Constant', { fg = colors.color1 })
vim.api.nvim_set_hl(0, 'String', { fg = colors.color2 })
vim.api.nvim_set_hl(0, 'Character', { fg = colors.color2 })
vim.api.nvim_set_hl(0, 'Number', { fg = colors.color1 })
vim.api.nvim_set_hl(0, 'Boolean', { fg = colors.color1 })
vim.api.nvim_set_hl(0, 'Float', { fg = colors.color1 })

vim.api.nvim_set_hl(0, 'Identifier', { fg = colors.color4 })
vim.api.nvim_set_hl(0, 'Function', { fg = colors.color4 })

vim.api.nvim_set_hl(0, 'Statement', { fg = colors.color5, bold = true })
vim.api.nvim_set_hl(0, 'Conditional', { fg = colors.color5, bold = true })
vim.api.nvim_set_hl(0, 'Repeat', { fg = colors.color5, bold = true })
vim.api.nvim_set_hl(0, 'Label', { fg = colors.color5, bold = true })
vim.api.nvim_set_hl(0, 'Operator', { fg = colors.color5, bold = true })
vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.color5, bold = true })
vim.api.nvim_set_hl(0, 'Exception', { fg = colors.color5, bold = true })

vim.api.nvim_set_hl(0, 'PreProc', { fg = colors.color6 })
vim.api.nvim_set_hl(0, 'Include', { fg = colors.color6 })
vim.api.nvim_set_hl(0, 'Define', { fg = colors.color6 })
vim.api.nvim_set_hl(0, 'Macro', { fg = colors.color6 })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = colors.color6 })

vim.api.nvim_set_hl(0, 'Type', { fg = colors.color3 })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = colors.color3 })
vim.api.nvim_set_hl(0, 'Structure', { fg = colors.color3 })
vim.api.nvim_set_hl(0, 'Typedef', { fg = colors.color3 })

vim.api.nvim_set_hl(0, 'Special', { fg = colors.color6 })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = colors.color6 })
vim.api.nvim_set_hl(0, 'Tag', { fg = colors.color6 })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = colors.foreground })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = colors.color6 })
vim.api.nvim_set_hl(0, 'Debug', { fg = colors.color6 })

-- Error and warning
vim.api.nvim_set_hl(0, 'Error', { fg = colors.color9, bg = colors.background })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = colors.color9 })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = colors.color11 })
vim.api.nvim_set_hl(0, 'Todo', { fg = colors.color11, bg = colors.background, bold = true })

-- Underline and special
vim.api.nvim_set_hl(0, 'Underlined', { fg = colors.url_color, underline = true })
vim.api.nvim_set_hl(0, 'Title', { fg = colors.color5, bold = true })

-- Diff
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = colors.color2, bg = '#001100' })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = colors.color3, bg = '#111100' })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = colors.color1, bg = '#110000' })
vim.api.nvim_set_hl(0, 'DiffText', { fg = colors.color11, bg = '#222200' })

-- Folding
vim.api.nvim_set_hl(0, 'Folded', { fg = colors.color8, bg = '#111111' })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = colors.color8, bg = colors.background })

-- Spelling
vim.api.nvim_set_hl(0, 'SpellBad', { fg = colors.color9, underline = true })
vim.api.nvim_set_hl(0, 'SpellCap', { fg = colors.color4, underline = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { fg = colors.color6, underline = true })
vim.api.nvim_set_hl(0, 'SpellRare', { fg = colors.color5, underline = true })
