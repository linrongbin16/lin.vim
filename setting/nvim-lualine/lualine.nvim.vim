" only enable statusline, disable tabline

lua << END
local function trim6(s)
    return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)'
end
local function LuaLineGitStatus()
    -- coc-git
    -- local branch = vim.g.coc_git_status
    -- if branch == nil or branch == '' then
    --     return ''
    -- end
    -- local changes = vim.b.coc_git_status
    -- if changes == nil or changes == '' then
    --     changes = ''
    -- end
    -- return string.format('%s%s', branch, changes)

    -- vim-gitbranch + vim-gitgutter
    local branch = vim.fn['gitbranch#name']()
    if branch == nil or branch == '' then
        return ''
    end
    -- summary = [a, m, r]
    local summary = vim.fn['GitGutterGetHunkSummary']()
    if summary == nil then
        return string.format(' %s', branch)
    end
    local changes = {}
    if summary[1] > 0 then
        changes[#changes+1]=string.format('+%d', summary[1])
    end
    if summary[2] > 0 then
        changes[#changes+1]=string.format('~%d', summary[2])
    end
    if summary[3] > 0 then
        changes[#changes+1]=string.format('-%d', summary[3])
    end
    if next(changes) == nil then
        return string.format(' %s', branch)
    else
        return string.format(' %s %s', branch, table.concat(changes, ' '))
    end
end
-- local function LuaLineCurrentFunction()
--     local function_name = vim.b.coc_current_function
--     if function_name == nil or function_name == '' then
--         return ''
--     end
--     return string.format(' %s', function_name)
-- end
local function LuaLineCocStatus()
    -- coc-git
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
