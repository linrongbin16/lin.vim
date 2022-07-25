" only enable statusline, disable tabline

lua << END
local function trim6(s)
    return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)'
end
local function LuaLineGitStatus()
    local git_branch = vim.g.coc_git_status
    if git_branch == nil or git_branch == '' then
        return ''
    end
    local git_changes = vim.b.coc_git_status
    if git_changes == nil or git_changes == '' then
        git_changes = ''
    end
    return string.format('%s%s', git_branch, git_changes)
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
