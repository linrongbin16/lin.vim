" only enable statusline, disable tabline

lua << END
local function trim6(s)
    return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)'
end
local function LuaLineGitStatus()
    local git_branch = vim.b.gitsigns_head
    if git_branch == nil or git_branch == '' then
        return ''
    end
    local git_status = vim.b.gitsigns_status
    if git_status == nil or git_status == '' then
        return string.format(' %s', trim6(git_branch))
    else
        return string.format(' %s %s', git_branch, git_status)
    end
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
local function LuaLineCursorLocation()
    return ' %3l:%-2v'
end
local function LuaLineCharHexValue()
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
        lualine_c = { LuaLineGitStatus, LuaLineCocStatus },
        lualine_x = { 'fileformat', 'encoding', 'filetype', LuaLineCharHexValue },
        lualine_y = { 'progress' },
        lualine_z = { LuaLineCursorLocation },
    },
    inactive_secions = {},
    tabline = {},
    extensions = {}
}
END
