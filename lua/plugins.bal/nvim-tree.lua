-- File Nav
require'nvim-tree'.setup {
  disable_netrw        = false,
  auto_reload_on_write = true,
  hijack_netrw         = true,
  open_on_setup        = true,
  ignore_ft_on_setup   = {},
  hijack_cursor        = true,
  create_in_closed_folder = false,
  open_on_tab = true,
  reload_on_bufenter = true,
  hijack_unnamed_buffer_when_opening = true,
  open_on_tab = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = true,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    adaptive_size = true,
    centralize_selection = true,
    preserve_window_proportions = true,
    width = 25,
    hide_root_folder = true,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    preserve_window_proportions = true,
    relativenumber = false
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
    renderer = {
    indent_markers = {
      enable = true,
      inline_arrows = false,
      icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
    icons = {
      webdev_colors = true,
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
}

-- Refresh File list
vim.cmd([[autocmd BufReadPost * NvimTreeRefresh ]])
