" only enable statusline, disable tabline

lua << END
local function trim6(s)
    return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)'
end
local function LuaLineGitStatus()
    local branch = vim.fn['gitbranch#name']()
    if branch == nil or branch == '' then
        return ''
    end
    local hunks = vim.fn['GitGutterGetHunkSummary']()
    if hunks == nil then
        hunks = ''
    end
    local changes = {}
    if hunks[1] > 0 then
        table.insert(changes, '+' .. hunks[1])
    end
    if hunks[2] > 0 then
        table.insert(changes, '~' .. hunks[2])
    end
    if hunks[3] > 0 then
        table.insert(changes, '-' .. hunks[3])
    end
    return string.format(' %s %s', branch, table.concat(changes, ' '))
end
local function LuaLineCurrentFunction()
    local function_name = vim.b.coc_current_function
    if function_name == nil or function_name == '' then
        return ''
    end
    return string.format(' %s', function_name)
end
local function LuaLineCocStatus()
    local coc_status = vim.fn['coc#status']()
    if coc_status == nil or coc_status == '' then
        return ''
    else
        return coc_status
    end
end
local function LuaLineCursorPosition()
    return ' %3l:%-2v'
end
local function LuaLineCursorHexValue()
    return '0x%B'
end
local function LuaLineGutentagsStatus()
    local tags_status = vim.fn['gutentags#statusline']()
    if tags_status == nil or tags_status == '' then
        return ''
    end
    return tags_status
end
require('lualine').setup{
    options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { LuaLineGitStatus, LuaLineCocStatus, LuaLineGutentagsStatus },
        lualine_x = { 'fileformat', 'encoding', 'filetype', LuaLineCursorHexValue },
        lualine_y = { 'progress' },
        lualine_z = { LuaLineCursorPosition },
    },
    inactive_secions = {},
    tabline = {},
    extensions = {}
}
END
