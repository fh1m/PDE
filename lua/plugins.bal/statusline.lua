-- Req Variable
local windline = require('windline')
local helper = require('windline.helpers')
local sep = helper.separators
local vim_components = require('windline.components.vim')
local b_components = require('windline.components.basic')
local state = _G.WindLine.state
local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')

-- Main Colors
local hl_list = {
    Black = {'white', 'black'},
    White = {'black', 'white'},
    Inactive = {'InactiveFg', 'InactiveBg'},
    Active = {'ActiveFg', 'ActiveBg'}
}

-- Basic Array that gets filled with stuff
local basic = {}

-- Components
basic.divider = {b_components.divider, ''}
basic.space = {' ', ''}
basic.bg = {' ', 'StatusLine'}
basic.file_name_inactive = {b_components.full_file_name, hl_list.Inactive}
basic.line_col_inactive = {b_components.line_col, hl_list.Inactive}
basic.progress_inactive = {b_components.progress, hl_list.Inactive}

-- Show Error,Hint,Warning Only
basic.lsp_diagnos = {
    width = 90,
    hl_colors = {
        yellow = {'other', 'black'},
        red = {'red', 'black'},
        blue = {'blue', 'black'},
        light_blue = {'light_blue', 'black'}
    },
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                {lsp_comps.lsp_error({format = ' %s  '}), 'red' },
                {lsp_comps.lsp_warning({format = ' %s  '}), 'yellow'},
                {lsp_comps.lsp_hint({format = ' %s  '}), 'blue'},
                {lsp_comps.lsp_info({format = ' %s  '}), 'light_blue'}
            }
        end
        return ''
    end
}

-- Info of Current File
basic.file = {
    hl_colors = {default = {'blue', 'test'}},
    text = function(bufnr)
        return {
            {' ', 'default'},
            {b_components.cache_file_icon({ default = ' ' }), 'default'},
            {' ', 'default'},
        }
    end
}

basic.file_name = {
    hl_colors = {default = {'black', 'other'}},
    text = function(bufnr)
        return {
            {' ', 'default'},
            { b_components.cache_file_name('No Name', ''), '' },
            { b_components.file_modified(' '), '' },
        }
    end
}

-- Right side of statusline [ lsp & line number ]
basic.right = {
    hl_colors = {
        text = {'black', 'other'}
    },
    text = function() return {{' %l of %L ', 'text'}} end
}

basic.line_icon = {
    hl_colors = {
        text = {'blue', 'test'}
    },
    text = function() return {{'   ', 'text'}} end
}

-- Show Code Context
basic.location = {
    hl_colors = {text = {'black_light', 'black'}},
    text = function() return {{'%{Location()}', 'text'}} end
}

-- Default Statusbar for every file
local default = {
    filetypes = {'default'},
    -- Active bar
    active = {
        { sep.left_rounded, { 'test', 'black' } }, basic.file , basic.file_name,  { sep.right_rounded, { 'black_light', 'black' } }, {git_comps.git_branch({icon = '  '}) , {'blue', 'black'}} ,
        basic.divider, {' ', hl_list.Black}, basic.lsp_diagnos ,
        { sep.left_rounded, { 'test', 'black' } }, basic.line_icon , basic.right , { sep.right_rounded, { 'black_light', 'black' } }
    },
    -- Inactive bar
    inactive = {
        {sep.left_rounded, {'black_light', 'black'}}, basic.file,
        {sep.right_rounded, {'black_light', 'black'}}
    }
}

-- Statusbar for quick fix window
local quickfix = {
    filetypes = {'qf', 'Trouble'},
    active = {{'🚦 Quickfix ', {'black_light', 'black'}}},
    always_active = true,
    show_last_status = true
}

-- Help
local help = {
    filetypes = {'help'},
    active = {{'   Vim Help ', {'black_light', 'black'}}},
    always_active = true,
    show_last_status = true
}


-- Off
local off = {
    filetypes = {
        'Outline', 'NvimTree', 'undotree', 'diff', 'TelescopePrompt' , 'netrw' , 'floaterm'
    },
    active = {{'', {'black_light', 'black'}}, {b_components.divider, ''}},
    always_active = true,
    show_last_status = true
}

-- Custom Colors
windline.setup({
    colors_name = function(colors)
        colors.black = "#000000"
        colors.black_light = "#9378b3"
        colors.red = "#ff1767"
        colors.yellow = "#ffac00"
        colors.blue = "#9378b3"
        colors.light_blue = "#368dff"
        colors.other = "#9378b3"
        colors.test = "#141414"
        return colors
    end,

    global_skip_filetypes = {'lir'},

    -- Final setup of all bars
    statuslines = {default, quickfix, explorer, off, help}
})
