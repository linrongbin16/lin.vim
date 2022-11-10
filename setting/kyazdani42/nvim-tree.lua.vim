lua<<EOF
local compatible_keymap = {
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

  -- create/rename/delete
  { key = {"a", "A", "N", "K"},       action = "create" },
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
  open_on_setup = true,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  view = {
    width = 40,
    side = "left",
    signcolumn = "yes",
    mappings = {
      custom_only = true,
      list = compatible_keymap,
    },
  },
  renderer = {
    highlight_git = true,
    icons = {
      webdev_colors = true,
      git_placement = "signcolumn",
      glyphs = {
        default = "",
        symlink = "",
      },
    },
    indent_markers = {
      enable = true,
    },
  },
  update_focused_file = {
    enable      = true,
    update_root = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
}
EOF

function! s:nvim_tree_settings() abort
  " key mapping

  " resize explorer width
  nnoremap <silent> <buffer> <D-,> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <A-,> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <D-.> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <A-.> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <D-Left> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <A-Left> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <D-Right> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <A-Right> :<C-u>NvimTreeResize +10<CR>
endfunction

augroup MyNvimTreeGroup
  autocmd!
  autocmd FileType NvimTree call s:nvim_tree_settings()
augroup END
