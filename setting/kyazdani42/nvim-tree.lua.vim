lua<<EOF
local key_mappings = {
  { key = {"l", "o", "<2-LeftMouse>"},    action = "edit" },
  -- { key = {"O"},                          action = "edit_no_picker" },
  { key = {"<Return>"},                   action = "cd" },
  { key = "<C-v>",                        action = "vsplit" },
  { key = "<C-x>",                        action = "split" },
  { key = "<C-t>",                        action = "tabnew" },
  { key = "<",                            action = "prev_sibling" },
  { key = ">",                            action = "next_sibling" },
  { key = "gp",                           action = "parent_node" },
  { key = "h",                            action = "close_node" },
  -- { key = "<Tab>",                        action = "preview" },
  { key = "<C-k>",                        action = "first_sibling" },
  { key = "<C-j>",                        action = "last_sibling" },
  { key = "I",                            action = "toggle_ignored" },
  { key = "H",                            action = "toggle_dotfiles" },
  { key = "R",                            action = "refresh" },
  { key = {"N", "K"},                     action = "create" },
  { key = "D",                            action = "remove" },
  { key = "d",                            action = "trash" },
  { key = {"r", "m"},                     action = "rename" },
  { key = "X",                            action = "cut" },
  { key = "C",                            action = "copy" },
  { key = {"V", "P"},                     action = "paste" },
  { key = "y",                            action = "copy_name" },
  { key = "Y",                            action = "copy_path" },
  { key = "gy",                           action = "copy_absolute_path" },
  { key = "[c",                           action = "prev_git_item" },
  { key = "]c",                           action = "next_git_item" },
  { key = "<BS>",                         action = "dir_up" },
  { key = "s",                            action = "system_open" },
  -- { key = "q",                            action = "close" },
  { key = "?",                            action = "toggle_help" },
}

require'nvim-tree'.setup {
  disable_netrw        = false,
  hijack_netrw         = true,
  open_on_setup        = true,
  ignore_ft_on_setup   = {},
  auto_close           = false,
  auto_reload_on_write = true,
  open_on_tab          = false,
  hijack_cursor        = true,
  update_cwd           = false,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 40,
    hide_root_folder = false,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = true,
      list = key_mappings,
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash-put",
    require_confirm = true
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = false,
    }
  }
}
EOF

