" only enable statusline

lua << END
local function LuaLineGitStatus()
  local git_branch = vim.g.coc_git_status
  if git_branch == nil or git_branch == '' then
    return ''
  end
  return git_branch
end
local function LuaLineCurrentFunction()
  local function_name = vim.b.coc_current_function
  if function_name == nil or function_name == '' then
    return ''
  else
    return string.format('%s', function_name)
  end
end
local function LuaLineCocStatus()
  local coc_status = vim.fn['coc#status']()
  local coc_info = vim.b.coc_diagnostic_info
  if coc_status == nil or coc_status == '' then
      return ''
  end
  local i = 1
  local msgs = {}
  msgs[i] = coc_status
  i = i + 1
  if coc_info['error'] ~= nil and coc_info['error'] ~= nil and coc_info['error'] ~= '' then
      msgs[i] = string.format('E%s', coc_info['error'])
      i = i + 1
  end
  if coc_info['warning'] ~= nil and coc_info['warning'] ~= nil and coc_info['warning'] ~= '' then
      msgs[i] = string.format('W%s', coc_info['warning'])
      i = i + 1
  end
  if next(msgs) then
      return ''
  end
  return table.concat(msgs, " ")
end
local function LuaLineCursorLocation()
  return ' %3l:%-2v'
end
local function LuaLineCharHexValue()
  -- char hex value: 0x%B
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
        lualine_b = { 'filename'},
        lualine_c = { LuaLineGitStatus, LuaLineCurrentFunction, LuaLineCocStatus },
        lualine_x = { 'fileformat', 'encoding', 'filetype', LuaLineCharHexValue },
        lualine_y = { 'progress' },
        lualine_z = { LuaLineCursorLocation },
    },
    inactive_secions = {},
    tabline = {},
    extensions = {}
}
END
