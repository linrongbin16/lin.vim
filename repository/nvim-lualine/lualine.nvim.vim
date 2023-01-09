" Only enable statusline, no tabline

lua << END
local LinVimLuaLineGitStatus = (vim.fn.has('nvim-0.7') == 1) and (function()
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

    -- gitsigns.nvim
    local branch=vim.b.gitsigns_head
    if branch == nil or branch == '' then
        return ''
    end
    local changes=vim.b.gitsigns_status
    if changes == nil or changes == '' then
        return string.format(' %s', branch)
    else
        return string.format(' %s %s', branch, changes)
    end
end) or (function()
    -- vim-gitbranch + vim-gitgutter
    if not vim.fn.exists('*gitbranch#name') then
        return ''
    end
    local branch = vim.fn['gitbranch#name']()
    if branch == nil or branch == '' then
        return ''
    end
    if not vim.fn.exists('*GitGutterGetHunkSummary') then
        return string.format(' %s', branch)
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
end)
-- local function LinVimLuaLineCurrentFunction()
--     local function_name = vim.b.coc_current_function
--     if function_name == nil or function_name == '' then
--         return ''
--     end
--     return string.format(' %s', function_name)
-- end
local function LinVimLuaLineCocStatus()
    if not vim.fn.exists('*coc#status') then
        return ''
    end
    local coc_status = vim.fn['coc#status']()
    if coc_status == nil or coc_status == '' then
        return ''
    else
        return coc_status
    end
end
local function LinVimLuaLineCursorPosition()
    return ' %3l:%-2v'
end
local function LinVimLuaLineCursorHexValue()
    return '0x%B'
end
local function LinVimLuaLineGutentagsStatus()
    if not vim.fn.exists('*gutentags#statusline') then
        return ''
    end
    local tags_status = vim.fn['gutentags#statusline']()
    if tags_status == nil or tags_status == '' then
        return ''
    end
    return tags_status
end
require('lualine').setup{
    options = {
        icons_enabled = false,
        -- theme = 'auto',
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {'NvimTree', 'fern'},
        -- always_divide_middle = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { LinVimLuaLineGitStatus, LinVimLuaLineCocStatus, LinVimLuaLineGutentagsStatus },
        lualine_x = { 'fileformat', 'encoding', 'filetype', LinVimLuaLineCursorHexValue },
        lualine_y = { 'progress' },
        lualine_z = { LinVimLuaLineCursorPosition },
    },
    inactive_secions = {}
    -- tabline = {},
    -- winbar = {},
    -- inactive_winbar = {},
    -- extensions = {}
}
END
