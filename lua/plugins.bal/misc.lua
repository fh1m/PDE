-- disable useless plugin [built in]
local disabled_built_ins = {
    "gzip",
    "man",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- Start Quickly
require'impatient'.enable_profile()

-- Notify
vim.notify = require("notify")

-- Disable comment new line
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove { "c", "r", "o" }
    end,
})

 --- returns a table containing the lsp changes counts from an lsp result
 function count_lsp_res_changes(lsp_res)
   local count = { instances = 0, files = 0 }
   if (lsp_res.documentChanges) then
     for _, changed_file in pairs(lsp_res.documentChanges) do
       count.files = count.files + 1
       count.instances = count.instances + #changed_file.edits
     end
   elseif (lsp_res.changes) then
     for _, changed_file in pairs(lsp_res.changes) do
       count.instances = count.instances + #changed_file
       count.files = count.files + 1
     end
   end
   return count
 end

 -- Lsp Rename
      function LspRename()
        local curr_name = vim.fn.expand("<cword>")
        local input_opts = {
          prompt = 'LSP Rename',
          default = curr_name
        }

        -- ask user input
        vim.ui.input(input_opts, function(new_name)
          -- check new_name is valid
          if not new_name or #new_name == 0 or curr_name == new_name then return end

          -- request lsp rename
          local params = vim.lsp.util.make_position_params()
          params.newName = new_name

          vim.lsp.buf_request(0, "textDocument/rename", params, function(_, res, ctx, _)
            if not res then return end

            -- apply renames
            local client = vim.lsp.get_client_by_id(ctx.client_id)
            vim.lsp.util.apply_workspace_edit(res, client.offset_encoding)

            -- display a message
            local changes = count_lsp_res_changes(res)
            local message = string.format("renamed %s instance%s in %s file%s. %s",
              changes.instances,
              changes.instances== 1 and '' or 's',
              changes.files,
              changes.files == 1 and '' or 's',
              changes.files > 1 and "To save them run ':wa'" or ''
            )
            vim.notify(message)
          end)
        end)
      end
      vim.api.nvim_create_user_command('LspRename', LspRename, {})


local function getlines(location)
  local uri = location.targetUri or location.uri
  if uri == nil then
    return
  end
  local bufnr = vim.uri_to_bufnr(uri)
  if not vim.api.nvim_buf_is_loaded(bufnr) then
    vim.fn.bufload(bufnr)
  end
  local range = location.targetRange or location.range

  local lines = vim.api.nvim_buf_get_lines(bufnr, range.start.line, range['end'].line+1, false)
  return table.concat(lines, '\n')
end

vim.diagnostic.config({float = {format = function(diag)
    local message = diag.message
    local client = vim.lsp.get_active_clients({name = message.source})[1]
    if not client then
        return diag.message
    end

    local relatedInfo = {messages = {}, locations = {}}
    for _, info in ipairs(diag.user_data.lsp.relatedInformation) do
        table.insert(relatedInfo.messages, info.message)
        table.insert(relatedInfo.locations, info.location)
    end

    for i, loc in ipairs(vim.lsp.util.locations_to_items(relatedInfo.locations, client.offset_encoding)) do
        message = string.format("%s\n%s (%s:%d):\n\t%s", message, relatedInfo.messages[i],
                                vim.fn.fnamemodify(loc.filename, ':.'), loc.lnum,
                                getlines(relatedInfo.locations[i]))
    end

    return message
end}})

-- Lua Substitute keybindings
vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
vim.keymap.set("n", "sx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
vim.keymap.set("n", "sxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
vim.keymap.set("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
vim.keymap.set("n", "sxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })

-- Lsp Word Highlight
vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<a-N>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
