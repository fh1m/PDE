-- Buffer List
require('bufferline').setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none" ,
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
                style =  'none'
            },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    truncate_names = true,
    max_name_length = 40,
    max_prefix_length = 15,
    show_buffer_default_icon = true,
    show_duplicate_prefix = true,
    tab_size = 15,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    custom_filter = function(buf_number)
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left" },{filetype = "Outline", text = "Code Outline" },{filetype = "undotree", text = "File History" }},
    show_buffer_icons = true,
    color_icons = true ,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    persist_buffer_sort = true,
    separator_style = 'thin',
    enforce_regular_tabs = false,
    always_show_bufferline = false,
    sort_by = 'id',
    hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
    custom_areas = {
  right = function()
    local result = {}
      table.insert(result, {text = "%{get(b:,'gitsigns_status','')}", guifg = "#A3BA5E"})
    return result
  end,
    }
  }
}
