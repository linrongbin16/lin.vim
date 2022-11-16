#!/bin/bash

# debug
# set -x

VIM_HOME=$HOME/.vim
CONFIG_HOME=$HOME/.config
NVIM_HOME=$CONFIG_HOME/nvim
INSTALL_HOME=$VIM_HOME/install
TEMPLATE_HOME=$VIM_HOME/template
OS="$(uname -s)"

MODE_NAME='full' # default mode
OPT_FULL=1
OPT_BASIC=0
OPT_WITHOUT_LANGUAGE_SERVER=0
OPT_WITHOUT_HIGHLIGHT=0
OPT_WITHOUT_COLOR=0
OPT_STATIC_COLOR=''
OPT_ONLY_VIM=0
OPT_ONLY_NEOVIM=0

PLUGINS_FILE=$VIM_HOME/plugins.vim
SETTINGS_FILE=$VIM_HOME/settings.vim

source $INSTALL_HOME/util.sh

# test if array contains element
# printf '%s\0' "${myarray[@]}" | grep -Fxqz -- 'myelement'

# test if string is empty or whitespace
# [[ -z "${mystring// }" ]]

# dependency

function platform_dependency() {
    case "$OS" in
        Linux)
            if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
                $INSTALL_HOME/pacman.sh
            elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
                $INSTALL_HOME/dnf.sh
            elif [ -f "/etc/gentoo-release" ]; then
                $INSTALL_HOME/emerge.sh
            else
                # assume apt
                $INSTALL_HOME/apt.sh
            fi
            ;;
        FreeBSD)
            $INSTALL_HOME/pkg.sh
            ;;
        NetBSD)
            $INSTALL_HOME/pkgin.sh
            ;;
        OpenBSD)
            $INSTALL_HOME/pkg_add.sh
            ;;
        Darwin)
            $INSTALL_HOME/brew.sh
            ;;
        *)
            message "$OS is not supported, exit..."
            exit 1
            ;;
    esac
}

function rust_dependency() {
    install_or_skip "curl https://sh.rustup.rs -sSf | sh -s -- -y" "rustc"
    source $HOME/.cargo/env
    install_or_skip "cargo install ripgrep" "rg"
    install_or_skip "cargo install fd-find" "fd"
    if [ $OPT_WITHOUT_COLOR -eq 0 ]; then
        install_or_skip "cargo install --locked bat" "bat"
    fi
}

function golang_dependency() {
    # see https://github.com/canha/golang-tools-install-script
    install_or_skip "wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash" "go"
    if [ -d $HOME/.go/bin ]; then
        export PATH=$HOME/.go/bin:$PATH
    fi
}

function pip3_dependency() {
    message "install python packages with pip3"
    sudo pip3 install pyOpenSSL neovim pynvim pep8 flake8 pylint black yapf chardet cmakelang cmake-language-server click
}

function npm_dependency() {
    message "install node packages with npm"
    sudo npm install -g yarn prettier neovim
}

function guifont_dependency() {
    if [ "$OS" == "Darwin" ]; then
        message "install hack nerd font with brew"
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
    else
        message "install hack nerd font from github"
        mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
        local font_file=Hack.zip
        local font_version=v2.2.2
        local font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/$font_version/$font_file"
        if [ -f $font_file ]; then
            rm $font_file
        fi
        curl -L $font_url -o $font_file
        if [ $? -ne 0 ]; then
            message "failed to download $font_file, skip..."
        else
            unzip -o $font_file
            message "install hack nerd font from github - done"
        fi
    fi
}

function install_dependencies() {
    platform_dependency
    rust_dependency
    golang_dependency
    pip3_dependency
    npm_dependency
    guifont_dependency
}

# template

function begin_install_plugin() {
    cat $TEMPLATE_HOME/plugin/header.vim >> $PLUGINS_FILE
}

function end_install_plugin() {
    cat $TEMPLATE_HOME/plugin/footer.vim >> $PLUGINS_FILE
}

function install_highlight_plugin() {
    cat $TEMPLATE_HOME/plugin/highlight.vim >> $PLUGINS_FILE
}

function install_color_plugin() {
    cat $TEMPLATE_HOME/plugin/color.vim >> $PLUGINS_FILE
}

function install_markdown_plugin() {
    cat $TEMPLATE_HOME/plugin/markdown.vim >> $PLUGINS_FILE
}

function install_common_plugin() {
    cat $TEMPLATE_HOME/plugin/common.vim >> $PLUGINS_FILE
}

function begin_install_coc_global_extension_setting() {
    echo "" >> $SETTINGS_FILE
    echo '" Coc global extensions' >> $SETTINGS_FILE
    printf "let g:coc_global_extensions = [" >> $SETTINGS_FILE
}

function end_install_coc_global_extension_setting() {
    echo "]" >> $SETTINGS_FILE
}

function install_random_colorscheme_setting() {
    cat $TEMPLATE_HOME/setting/random-colorscheme.vim >> $SETTINGS_FILE
}

function add_coc_global_extension_setting() {
    local extension=$1
    printf "'$extension', " >> $SETTINGS_FILE
}

function install_static_colorscheme_setting() {
    local color=$1
    echo "" >> $SETTINGS_FILE
    echo '""" Static colorscheme' >> $SETTINGS_FILE
    echo "colorscheme $color" >> $SETTINGS_FILE
}

function install_common_setting() {
    cat $TEMPLATE_HOME/setting/common.vim >> $SETTINGS_FILE
}

function install_plugin_template() {
    reset_file $PLUGINS_FILE
    begin_install_plugin
    if [ $OPT_WITHOUT_COLOR -eq 0 ]; then
        # enable color feature
        install_color_plugin
    fi
    if [ $OPT_WITHOUT_HIGHLIGHT -eq 0 ]; then
        # enable highlight feature
        install_highlight_plugin
    fi
    if [ $OPT_WITHOUT_LANGUAGE_SERVER -eq 0 ]; then
        # enable markdown feature
        install_markdown_plugin
    fi
    install_common_plugin
    end_install_plugin
}

function install_setting_template() {
    reset_file $SETTINGS_FILE
    cp $TEMPLATE_HOME/coc-settings-template.json $VIM_HOME/coc-settings.json

    begin_install_coc_global_extension_setting
    add_coc_global_extension_setting "coc-yank"
    add_coc_global_extension_setting "coc-lists"
    if [ $OPT_WITHOUT_LANGUAGE_SERVER -eq 0 ]; then
        add_coc_global_extension_setting "coc-snippets"
        add_coc_global_extension_setting "coc-html"
        add_coc_global_extension_setting "coc-xml"
        add_coc_global_extension_setting "coc-clangd"
        add_coc_global_extension_setting "coc-cmake"
        add_coc_global_extension_setting "coc-pyright"
        add_coc_global_extension_setting "coc-rust-analyzer"
        add_coc_global_extension_setting "coc-go"
        add_coc_global_extension_setting "coc-json"
        add_coc_global_extension_setting "coc-tsserver"
        add_coc_global_extension_setting "coc-css"
        add_coc_global_extension_setting "@yaegassy/coc-volar"
        add_coc_global_extension_setting "coc-eslint"
        add_coc_global_extension_setting "coc-prettier"
        add_coc_global_extension_setting "coc-sh"
    fi
    end_install_coc_global_extension_setting

    if [[ ! -z "${OPT_STATIC_COLOR// }" ]]; then
        install_static_colorscheme_setting $OPT_STATIC_COLOR
    elif [ $OPT_WITHOUT_COLOR -eq 0 ]; then
        install_random_colorscheme_setting
    fi

    install_common_setting
}

function install_template() {
    message "install configurations"
    # cp $TEMPLATE_HOME/plugin-template.vim $VIM_HOME/plugin.vim
    # cp $TEMPLATE_HOME/coc-settings-template.json $VIM_HOME/coc-settings.json
    # cp $TEMPLATE_HOME/setting-template.vim $VIM_HOME/setting.vim

    install_plugin_template
    install_setting_template
}

function install_vim() {
    message "install .vimrc for vim"
    try_backup $HOME/.vimrc
    ln -s $VIM_HOME/lin.vim $HOME/.vimrc

    message "install vim plugins"
    vim -E -c "PlugInstall" -c "qall"
}

function install_neovim() {
    message "install ~/.config/nvim and ~/.config/nvim/init.vim for neovim"
    mkdir -p $CONFIG_HOME
    try_backup $NVIM_HOME/init.vim
    try_backup $NVIM_HOME
    ln -s $VIM_HOME $NVIM_HOME
    ln -s $VIM_HOME/lin.vim $NVIM_HOME/init.vim

    message "install neovim plugins"
    nvim -E -c "PlugInstall" -c "qall"
}

function basic_installer() {
    echo 1
}

function show_help() {
    cat $INSTALL_HOME/help_message.txt
cat <<EOF
Notice:
In full mode, you could use '--without-xxx' options to disable some specific feature.
The '--without-language-server --without-highlight --without-color' option is equivalent to '--limit'.
The '--without-xxx' option cannot specify with '--basic' at the same time.
The '--without-color' option cannot specify with '--static-color' at the same time.

-h,--help                       Show help message.
-b,--basic                      Basic mode.
-l,--limit                      Limit mode.

--without-language-server       Disable coc language servers.
--without-highlight             Disable extra highlights.
--without-color                 Disable extra colors and colorscheme.

--static-color [name]           Use static colorscheme, not random ones.
--only-vim                      Only support vim.
--only-neovim                   Only support neovim.

EOF
}

function check_no_option() {
    local opt_value=$1
    local opt_name=$2
    local input=$3
    if [ $opt_value -eq 1 ]; then
        error_message "cannot use $input along with $opt_name"
        exit 1
    fi
}

function parse_options() {
    local basic=0
    local limit=0

    while [ $# -gt 0 ]; do
        case "$1" in
        -h|--help)
            show_help
            exit 0
            ;;
        -b|--basic)
            basic=1
            check_no_option $limit "--limit" "$1"

            MODE_NAME='basic'
            OPT_BASIC=1
            OPT_FULL=0
            ;;
        -l|--limit) 
            limit=1
            check_no_option $basic "--basic" "$1"

            MODE_NAME='limit'
            OPT_BASIC=0
            OPT_FULL=1
            OPT_WITHOUT_LANGUAGE_SERVER=1
            OPT_WITHOUT_HIGHLIGHT=1
            OPT_WITHOUT_COLOR=1
            ;;
        --without-language-server)
            OPT_WITHOUT_LANGUAGE_SERVER=1
            ;;
        --without-highlight)
            OPT_WITHOUT_HIGHLIGHT=1
            ;;
        --without-color)
            OPT_WITHOUT_COLOR=1
            # if static color is not empty string
            if [ ! -z "${OPT_STATIC_COLOR// }" ]; then
                error_message "cannot use --without-color along with --static-color"
                exit 1
            fi
            ;;
        --static-color)
            shift
            OPT_STATIC_COLOR="$1"
            if [ ! -z "${OPT_STATIC_COLOR// }" ]; then
                if [ $OPT_WITHOUT_COLOR -gt 0 ]; then
                    error_message "error! cannot use --static-color along with --without-color"
                    exit 1
                fi
            fi
            ;;
        --only-vim)
            OPT_ONLY_VIM=1
            ;;
        --only-neovim)
            OPT_ONLY_NEOVIM=1
            ;;
        *)
            message "unknown options! please try ./install.sh --help for more information"
            exit 1
            ;;
        esac
        shift
    done
}

function main() {
    message "install with $MODE_NAME mode"

    if [ $OPT_BASIC -gt 0 ]; then
        basic_installer
    else
        install_dependencies

        # install files
        install_template
        install_vim
        install_neovim
    fi

    message "install with $MODE_NAME mode - done"
}

parse_options "$@"
main
