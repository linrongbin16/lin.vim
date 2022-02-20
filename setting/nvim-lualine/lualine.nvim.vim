" only enable statusline

lua << END
local function LuaLineGitStatus()
  local git_branch = vim.g.coc_git_status
  if git_branch == nil or git_branch == '' then
    return ''
  end
  local git_changes = vim.b.coc_git_status
  if git_changes == nil or git_changes == '' then
    return git_branch
  else
    return string.format('%s%s', git_branch, git_changes)
  end
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
