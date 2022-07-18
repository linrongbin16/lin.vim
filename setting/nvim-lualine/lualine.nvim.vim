" only enable statusline, disable tabline

lua << END
local function trim6(s)
    return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)'
end
local function lualine_git_status_by_git_signs()
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
local function lualine_git_status_by_git_gutter()
    local git_branch = vim.fn['gitbranch#name']()
    if git_branch == nil or git_branch == '' then
        return ''
    end
    local summary = vim.fn['GitGutterGetHunkSummary']()
    if summary == nil or #summary < 3 then
        return string.format(' %s', git_branch)
    end
    local git_status = {}
    local added = summary[1]
    if added > 0 then
        table.insert(git_status, string.format('+%d', added))
    end
    local modified = summary[2]
    if modified > 0 then
        table.insert(git_status, string.format('~%d', modified))
    end
    local removed = summary[3]
    if removed > 0 then
        table.insert(git_status, string.format('-%d', removed))
    end
    if #git_status > 0 then
        return string.format(' %s %s', git_branch, table.concat(git_status, " "))
    else
        return string.format(' %s', git_branch)
    end
end
local function lualine_current_function_name()
    local function_name = vim.b.coc_current_function
    if function_name == nil or function_name == '' then
        return ''
    end
    return string.format(' %s', function_name)
end
local function lualine_coc_status()
    local coc_status = vim.fn['coc#status']()
    if coc_status == nil or coc_status == '' then
        return ''
    else
        return coc_status
    end
end
local function lualine_cursor_location()
    return ' %3l:%-2v'
end
local function lualine_char_hex()
    return '0x%B'
end
local function lualine_gutentags_status()
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
        lualine_c = { lualine_git_status_by_git_gutter, lualine_coc_status, lualine_gutentags_status },
        lualine_x = { 'fileformat', 'encoding', 'filetype', lualine_char_hex },
        lualine_y = { 'progress' },
        lualine_z = { lualine_cursor_location },
    },
    inactive_secions = {},
    tabline = {},
    extensions = {}
}
END
