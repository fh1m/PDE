require("tokyonight").setup({
  style = "night",
  light_style = "day",
  transparent = true,
  terminal_colors = false,
  styles = {
    comments = { bold = true },
    keywords = { bold = true },
    functions = { bold = true },
    variables = { bold = true },
    sidebars = "transparent",
    floats = "transparent",
  },
  sidebars = { "qf", "help" },
  day_brightness = 0.3,
  hide_inactive_statusline = true,
  dim_inactive = false,
  lualine_bold = false,
  -- on_colors = function(colors)
  --   colors.blue = "#004eff"
  -- end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors)
    highlights.CursorLine = {bg = ""}
    highlights.IndentBlankLineChar = {fg = "#050e1a"}
    highlights.IndentBlankLineContextChar = {fg = "#072f61"}
    highlights.IndentBlankLineContextStart = {bg = "", fg = ""}
    highlights.Visual = {bg = "#050e1a", fg = ""}
  end,
})

vim.cmd([[ colorscheme tokyonight-night ]])

-- Change Default Colors
vim.cmd([[ hi Normal guibg=#000000 guifg=#8bb9f6 ]])
vim.cmd([[ hi IncSearch guibg=#10171a guifg=none ]])
vim.cmd([[ hi Visual guibg=#050e1a guifg=NONE ]])

vim.cmd([[ hi TelescopeSelection guibg=#050e1a guifg=none ]])
-- vim.cmd([[ hi TelescopeNormal guibg=#0d0d0d ]])
vim.cmd([[ hi TelescopeTitle guibg=NONE guifg=#004eff ]])
vim.cmd([[ hi TelescopeBorder guibg=NONE guifg=#001d4d ]])

vim.cmd([[ hi LspReferenceText guibg=#050e1a ]])
vim.cmd([[ hi LspReferenceWrite guibg=#050e1a guifg=NONE ]])
vim.cmd([[ hi LspReferenceRead guibg=#050e1a guifg=NONE ]])

vim.cmd([[ hi IndentBlankLineChar guifg=#050e1a ]])
vim.cmd([[ hi IndentBlankLineContextChar guifg=#072f61 ]])
vim.cmd([[ hi IndentBlankLineContextStart gui=NONE cterm=NONE ]])

-- vim.cmd([[ hi BufferLineBufferSelected guibg=#cba6f7 guifg=#000000 ]])
vim.cmd([[ hi BufferLineBackground guibg=#000000 ]])
vim.cmd([[ hi BufferLineFill guibg=#000000 ]])
-- vim.cmd([[ hi BufferLineDevIconDefaultSelected guibg=#cba6f7 guifg=#000000 ]])
vim.cmd([[ hi BufferLineDevIconDefault guibg=#08080d ]])


vim.cmd([[ hi @string guifg=#ff1767 ]])
vim.cmd([[ hi CursorLineNr guifg=#004eff ]])
vim.cmd([[ hi IncSearch guibg=#10171a guifg=none ]])
vim.cmd([[ hi Search guibg=#142633 guifg=none ]])
vim.cmd([[ hi StatusLine gui=none guibg=none ]])
vim.cmd([[ hi StatusLineNC gui=none guibg=none ]])
vim.cmd([[ hi BufferLineSeparator guifg=#002766 ]])
vim.cmd([[ hi BufferLineSeparatorVisible guifg=#002766 ]])
vim.cmd([[ hi BufferLineSeparatorSelected guifg=#063c93 ]])
vim.cmd([[ hi FocusedSymbol guibg=NONE guifg=#004eff ]])
vim.cmd([[ hi SymbolsOutlineConnector guibg=NONE guifg=#002866 ]])
vim.cmd([[ hi MatchParen guifg=NONE guibg=#050e1a ]])
vim.cmd([[ hi LspReferenceText guibg=#050e1a ]])
vim.cmd([[ hi LspReferenceWrite guibg=#050e1a guifg=NONE ]])
vim.cmd([[ hi LspReferenceRead guibg=#050e1a guifg=NONE ]])
vim.cmd([[ hi illuminatedWord guibg=#050e1a guifg=NONE ]])
vim.cmd([[ hi illuminatedCurWord guibg=#050e1a guifg=NONE ]])
vim.cmd([[ hi @keyword guifg=#004eff ]])
vim.cmd([[ hi @include guifg=#004eff ]])
vim.cmd([[ hi @variable.bulitin guifg=#ff1767 ]])
vim.cmd([[ hi @variable guifg=#ff1767 ]])
vim.cmd([[ hi @parameter guifg=#004eff ]])
vim.cmd([[ hi @number guifg=#ff1767 ]])
vim.cmd([[ hi @constant guifg=#3b77fc ]])
vim.cmd([[ hi @constant.bulitin guifg=#3b77fc ]])
vim.cmd([[ hi @boolean guifg=#368dff ]])
vim.cmd([[ hi @repeat guifg=#3b77fc ]])
vim.cmd([[ hi @keyword.function guifg=#004eff ]])
vim.cmd([[ hi @type guifg=#368dff  ]])
vim.cmd([[ hi @function guifg=#004eff ]])
vim.cmd([[ hi @function.bulitin guifg=#004eff ]])
vim.cmd([[ hi @field guifg=#3b77fc ]])
vim.cmd([[ hi @constant.bulitin guifg=#3b77fc ]])
vim.cmd([[ hi @keyword.operator guifg=#368dff ]])
vim.cmd([[ hi @proterty guifg=#368dff ]])
vim.cmd([[ hi MatchParen guifg=NONE guibg=#050e1a ]])
vim.cmd([[ hi rainbowcol1 guifg=#004eff  ]])
vim.cmd([[ hi rainbowcol2 guifg=#3b77fc  ]])
vim.cmd([[ hi rainbowcol3 guifg=#ff1767  ]])
vim.cmd([[ hi rainbowcol4 guifg=#368dff  ]])
vim.cmd([[ hi rainbowcol5 guifg=#123456  ]])
