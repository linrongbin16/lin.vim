#!/usr/bin/env python3


import click
import os

VIM_DIR = f"{os.path.expanduser('~')}/.vim"
INSTALL_DIR = f"{VIM_DIR}/install"
TEMPLATE_DIR = f"{VIM_DIR}/template"
CONFIG_DIR = f"{os.path.expanduser('~')}/.config"
NVIM_DIR = f"{CONFIG_DIR}/nvim"

VIMRC_FILE = f"{VIM_DIR}/vimrc.vim"
PLUGINS_FILE = f"{VIM_DIR}/plugins.vim"
SETTINGS_FILE = f"{VIM_DIR}/settings.vim"


class Category:
    COLORSCHEME = "COLORSCHEME"
    HIGHLIGHT = "HIGHLIGHT"
    MARKDOWN = "MARKDOWN"
    ICON = "ICON"
    TABLINE = "TABLINE"
    STATUSLINE = "STATUSLINE"
    EXPLORER = "EXPLORER"
    INDENTLINE = "INDENTLINE"
    GIT = "GIT"
    OUTLINE = "OUTLINE"
    TAGS = "TAGS"
    SEARCH = "SEARCH"
    LANGUAGE = "LANGUAGE"
    EDIT = "EDIT"


class PluginData:
    def __init__(
        self,
        org,
        repo,
        category,
        post_install=None,
        require_nvim=False,
        required_nvim_version=None,
        negative_condition=None,
    ) -> None:
        self.org = org
        self.repo = repo
        self.post_install = post_install
        self.positive_condition = positive_condition
        self.negative_condition = negative_condition
        self.category = category


PLUGINS = [PluginData("lifepillar", "vim-solarized8", Category.COLORSCHEME)]


class PluginInstaller:
    def __init__(self) -> None:
        self.indent = 0


@click.command()
@click.option("-b", "--basic", "basic_opt", is_flag=True, help="Basic mode")
@click.option("-l", "--limit", "limit_opt", is_flag=True, help="Limit mode")
@click.option(
    "-s",
    "--static-color",
    "static_color_opt",
    default=None,
    show_default=True,
    help="Use static colorscheme instead of random selections",
)
@click.option(
    "--without-color",
    "without_color_opt",
    is_flag=True,
    help="Disable extra colors such as colorschemes and random selections",
)
@click.option(
    "--without-highlight",
    "without_highlight_opt",
    is_flag=True,
    help="Disable extra highlights such as RGB and cursor word",
)
@click.option(
    "--without-language",
    "without_language_opt",
    is_flag=True,
    help="Disable coc language server extensions",
)
@click.option(
    "--without-plugin",
    "without_plugin_opt",
    multiple=True,
    help="Disable specific vim plugins",
)
@click.option(
    "--without-vim",
    "without_vim_opt",
    is_flag=True,
    help="Only support neovim, without vim",
)
@click.option(
    "--without-neovim",
    "without_neovim_opt",
    is_flag=True,
    help="Only support vim, without neovim",
)
def generator(
    basic_opt,
    limit_opt,
    static_color_opt,
    without_color_opt,
    without_highlight_opt,
    without_language_opt,
    without_plugin_opt,
    without_vim_opt,
    without_neovim_opt,
):
    """

    Install with 3 modes: full (default), limit and basic.

    \b
    notice:
    \b
    In full mode, you could use '--without-xxx' options to disable specific feature.
    The '--without-language --without-highlight --without-color' option is equivalent to '--limit'.
    The '--without-xxx' option is conflict with '--basic'.
    The '--without-color' option is conflict with '--static-color'.

    """
    pass
