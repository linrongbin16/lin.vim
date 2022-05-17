let g:nvim_tree_icons = {
    \ 'default': "",
    \ 'symlink': "",
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

lua<<EOF
local key_mappings = {
  -- navigation
  { key = {"l", "o", "<2-LeftMouse>", "l"}, action = "edit" },
  { key = "h",              action = "close_node" },
  { key = "<CR>",           action = "cd" },
  { key = "<BS>",           action = "dir_up" },

  -- split
  { key = "e",              action = "split" },
  { key = "E",              action = "vsplit" },
  { key = "t",              action = "tabnew" },

  -- refresh
  { key = "R",              action = "refresh" },

  -- create/delete/rename
  { key = {"a", "A"},       action = "create" },
  { key = {"r", "m"},       action = "rename" },
  { key = "d",              action = "trash" },
  { key = "D",              action = "remove" },

  -- copy/paste/cut
  { key = "<C-x>",          action = "cut" },
  { key = "<C-c>",          action = "copy" },
  { key = "<C-v>",          action = "paste" },
  { key = "y",              action = "copy_name" },
  { key = "Y",              action = "copy_absolute_path" },

  -- open in system
  { key = "s",              action = "system_open" },

  -- help
  { key = "?",              action = "toggle_help" },

  -- git chunk
  { key = "[c",             action = "prev_git_item" },
  { key = "]c",             action = "next_git_item" },

  -- preview
  { key = "P",              action = "preview" },
  { key = "I",              action = "toggle_file_info" },

  -- toggle dotfiles
  { key = {"H"},           action = "toggle_dotfiles" },

  -- nvim-tree.lua specific funtions
  { key = "<",              action = "prev_sibling" },
  { key = ">",              action = "next_sibling" },
  { key = "gp",             action = "parent_node" },
  { key = "<C-k>",          action = "first_sibling" },
  { key = "<C-j>",          action = "last_sibling" },
}

require'nvim-tree'.setup {
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = true,
  open_on_setup_file = true,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 40,
    height = 40,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = true,
      list = key_mappings,
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "signcolumn",
    }
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd  = "",
    args = {}
    },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}
EOF

function! s:nvim_tree_settings() abort
  " key mapping

  " resize explorer width
  nnoremap <silent> <buffer> <D-,> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <D-.> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <A-,> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <A-.> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <D-Left> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <D-Right> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <A-Left> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <A-Right> :<C-u>NvimTreeResize +10<CR>
endfunction

augroup MyNvimTreeGroup
  autocmd!
  autocmd FileType NvimTree call s:nvim_tree_settings()
augroup END
