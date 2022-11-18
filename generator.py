#!/usr/bin/env python3

import sys
import click
import enum
import abc
import platform
import datetime
import pathlib
import shutil

HOME_DIR = pathlib.Path.home()
VIM_DIR = pathlib.Path(f"{HOME_DIR}/.vim")
TEMPLATE_DIR = pathlib.Path(f"{HOME_DIR}/.vim/template")
VIMRC_FILE = pathlib.Path(f"{VIM_DIR}/vimrc.vim")

IS_WINDOWS = platform.system().lower().startswith("win")


def message(*args):
    print(f"[lin.vim] - {' '.join(args)}")


def error_message(*args):
    print(f"[lin.vim] - error! {' '.join(args)}")


def try_backup(src):
    assert isinstance(src, pathlib.Path)
    if src.is_symlink() or src.exists():
        dest = f"{src}.{datetime.datetime.now().strftime('%Y-%m-%d.%H-%M-%S.%f')}"
        message(f"backup '{src}' to '{dest}'")
        src.rename(dest)


def try_delete(src):
    assert isinstance(src, pathlib.Path)
    if src.is_symlink() or src.exists():
        message(f"delete '{src}'")
        src.unlink(missing_ok=True)


class Indentable:
    def __init__(self):
        self.indent = 0

    def increment_indent(self):
        self.indent += 4

    def decrement_indent(self):
        self.indent = max(self.indent - 4, 0)

    def to_left_indent(self):
        return max(self.indent - 4, 0)


class Expr(abc.ABC):
    @abc.abstractmethod
    def render(self):
        pass


class IfExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f"if ({self.expr.render()})"


class ElseExpr(Expr):
    def render(self):
        return "else"


class ElseifExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f"elseif ({self.expr.render()})"


class EndifExpr(Expr):
    def render(self):
        return "endif"


class HasExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f"has({self.expr.render()})"


class NotExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f"!({self.expr.render()})"


class LogicAndExpr(Expr):
    def __init__(self, left_expr, right_expr):
        assert isinstance(left_expr, Expr)
        assert isinstance(right_expr, Expr)
        self.left_expr = left_expr
        self.right_expr = right_expr

    def render(self):
        return f"({self.left_expr.render()}) && ({self.right_expr.render()})"


class LogicOrExpr(Expr):
    def __init__(self, left_expr, right_expr):
        assert isinstance(left_expr, Expr)
        assert isinstance(right_expr, Expr)
        self.left_expr = left_expr
        self.right_expr = right_expr

    def render(self):
        return f"({self.left_expr.render()}) || ({self.right_expr.render()})"


class SingleQuoteStringExpr(Expr):
    def __init__(self, value):
        self.value = value

    def render(self):
        return f"'{str(self.value)}'"


class DoubleQuoteStringExpr(Expr):
    def __init__(self, value):
        self.value = value

    def render(self):
        return f'"{str(self.value)}"'


class LiteralExpr(Expr):
    def __init__(self, value):
        self.value = value

    def render(self):
        return str(self.value)


class SourceExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, LiteralExpr)
        self.expr = expr

    def render(self):
        return f"source {self.expr.render()}"


class SingleQuoteCommentExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f'" {self.expr.render()}'


class TrippleQuoteCommentExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f'""" {self.expr.render()}'


class FunctionCallExpr(Expr):
    def __init__(self, func_expr, *arg_exprs) -> None:
        assert isinstance(func_expr, LiteralExpr)
        if arg_exprs:
            for a in arg_exprs:
                assert isinstance(a, LiteralExpr)
        self.func_expr = func_expr
        self.arg_exprs = arg_exprs if arg_exprs else []

    def render(self):
        return f"{self.func_expr.render()}({','.join([e.render() for e in self.arg_exprs])})"


class CallExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f"call {self.expr.render()}"


class ColorschemeExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, LiteralExpr)
        self.expr = expr

    def render(self):
        return f"colorscehem {self.expr.render()}"


class IndentExpr(Expr):
    def __init__(self, value=0):
        assert isinstance(value, int) and value >= 0
        self.value = value

    def render(self):
        return " " * self.value


class StmtExpr(Expr):
    def __init__(self, expr, indent=None):
        assert isinstance(expr, Expr)
        assert isinstance(indent, IndentExpr) or indent is None
        self.expr = expr
        self.indent = indent

    def render(self):
        return f"{self.indent.render() if self.indent else ''}{self.expr.render()}\n"


class EmptyStmtExpr(Expr):
    def render(self):
        return "\n"


class PluginHeaderStmt(LiteralExpr):
    def __init__(self):
        with open(f"{TEMPLATE_DIR}/plugins-header-template.vim", "r") as fp:
            self.content = fp.read()

    def render(self):
        return self.content


class PluginFooterStmt(LiteralExpr):
    def __init__(self):
        with open(f"{TEMPLATE_DIR}/plugins-footer-template.vim", "r") as fp:
            self.content = fp.read()

    def render(self):
        return self.content


class PlugExpr(Expr):
    def __init__(self, org_expr, repo_expr, post_expr=None):
        assert isinstance(org_expr, LiteralExpr)
        assert isinstance(repo_expr, LiteralExpr)
        assert isinstance(post_expr, LiteralExpr) or post_expr is None
        self.org_expr = org_expr
        self.repo_expr = repo_expr
        self.post_expr = post_expr

    def render(self):
        body = f"Plug '{self.org_expr.render()}/{self.repo_expr.render()}'"
        post = f", {self.post_expr.render()}" if self.post_expr else ""
        return f"{body}{post}"


class VimrcSourceStmt(Expr):
    def __init__(self, value, indent=None):
        self.stmt = StmtExpr(SourceExpr(LiteralExpr(f"$HOME/.vim/{value}")), indent)

    def render(self):
        return self.stmt.render()


class SettingCocExtensionStmt(Expr):
    def __init__(
        self, disable_language=False, disable_sh=False, disable_powershell=False
    ) -> None:
        self.comment = TrippleQuoteCommentExpr(LiteralExpr("Coc global extensions"))
        extensions = [
            "coc-yank",
            "coc-lists",
        ]
        if not disable_language:
            extensions.extend(
                [
                    "coc-snippets",
                    "coc-html",
                    "coc-xml",
                    "coc-clangd",
                    "coc-cmake",
                    "coc-pyright",
                    "coc-rust-analyzer",
                    "coc-go",
                    "coc-json",
                    "coc-tsserver",
                    "coc-css",
                    "@yaegassy/coc-volar",
                    "coc-eslint",
                    "coc-prettier",
                ]
            )
        if not disable_sh:
            extensions.append("coc-sh")
        if not disable_powershell:
            extensions.append("coc-powershell")
        self.extensions_expr = [SingleQuoteStringExpr(e) for e in extensions]

    def render(self):
        return f"""
{self.comment.render()}
let g:coc_global_extensions = [{', '.join([e.render() for e in self.extensions_expr])}]
"""


class SettingStaticColorStmt(Expr):
    def __init__(self, expr):
        assert isinstance(expr, LiteralExpr)
        self.comment_expr = TrippleQuoteCommentExpr(LiteralExpr("Static color scheme"))
        self.color_expr = ColorschemeExpr(expr)

    def render(self):
        return f"""
{self.comment_expr.render()}
{self.color_expr.render()}
"""


class SettingRandomColorStmt(Expr):
    def __init__(self):
        self.comment_expr = TrippleQuoteCommentExpr(
            LiteralExpr("Random color scheme on startup")
        )
        self.call_expr = CallExpr(
            FunctionCallExpr(LiteralExpr("NextRandomColorSchemeSync"))
        )

    def render(self):
        return f"""
{self.comment_expr.render()}
{self.call_expr.render()}
"""


class SettingStmt(Expr):
    def __init__(self):
        with open(f"{TEMPLATE_DIR}/settings-template.vim", "r") as fp:
            self.content = fp.read()

    def render(self):
        return self.content


class PluginTag(enum.Enum):
    COLORSCHEME = 1
    HIGHLIGHT = 2
    LANGUAGE = 3
    EDITING = 4


class PluginClauseKind(enum.Enum):
    PARAGRAPH = 1
    COMMENT = 2
    IF_HAS = 3
    IF_NOT_HAS = 4
    ELSEIF_HAS = 5
    ELSEIF_NOT_HAS = 6
    ELSE = 7
    ENDIF = 8


class PluginClause:
    def __init__(self, kind, value=None):
        assert isinstance(kind, PluginClauseKind)
        assert isinstance(value, str) or value is None
        self.kind = kind
        self.value = value

    @staticmethod
    def make_paragraph():
        return PluginClause(PluginClauseKind.PARAGRAPH)

    @staticmethod
    def make_single_comment(value):
        return PluginClause(PluginClauseKind.COMMENT, value)

    @staticmethod
    def make_tripple_comment(value):
        return PluginClause(PluginClauseKind.COMMENT, value)

    @staticmethod
    def make_if_has(value):
        return PluginClause(PluginClauseKind.IF_HAS, value)

    @staticmethod
    def make_else():
        return PluginClause(PluginClauseKind.ELSE)

    @staticmethod
    def make_endif():
        return PluginClause(PluginClauseKind.ENDIF)


class PluginContext:
    def __init__(
        self,
        org,
        repo,
        post=None,
        top_line=None,
        bottom_line=None,
        left_component=None,
        right_component=None,
        tag=None,
    ) -> None:
        self.org = org
        self.repo = repo
        self.post = post
        self.tag = tag
        # extra clauses
        self.top_line = top_line  # more things above this line
        self.bottom_line = bottom_line  # more things below this line
        self.left_component = left_component  # more things on the left
        self.right_component = right_component  # more things on the right

    def to_str(self):
        return f"{self.org}/{self.repo}"


class Render(Indentable):
    PLUGIN_CONTEXT = [
        PluginContext(
            "lifepillar",
            "vim-solarized8",
            top_line=[
                PluginClause.make_paragraph(),
                PluginClause.make_tripple_comment("Color scheme"),
            ],
            tag=PluginTag.COLORSCHEME,
        ),
        PluginContext("crusoexia", "vim-monokai", tag=PluginTag.COLORSCHEME),
        PluginContext(
            "dracula", "vim", post="{'as': 'dracula'}", tag=PluginTag.COLORSCHEME
        ),
        PluginContext("KeitaNakamura", "neodark.vim", tag=PluginTag.COLORSCHEME),
        PluginContext("srcery-colors", "srcery-vim", tag=PluginTag.COLORSCHEME),
        PluginContext("drewtempelmeyer", "palenight.vim", tag=PluginTag.COLORSCHEME),
        PluginContext("joshdick", "onedark.vim", tag=PluginTag.COLORSCHEME),
        PluginContext("Rigellute", "rigel", tag=PluginTag.COLORSCHEME),
        PluginContext("chriskempson", "base16-vim", tag=PluginTag.COLORSCHEME),
        PluginContext("sainnhe", "edge", tag=PluginTag.COLORSCHEME),
        PluginContext("sainnhe", "gruvbox-material", tag=PluginTag.COLORSCHEME),
        PluginContext("sainnhe", "everforest", tag=PluginTag.COLORSCHEME),
        PluginContext("sainnhe", "sonokai", tag=PluginTag.COLORSCHEME),
        PluginContext(
            "kaicataldo",
            "material.vim",
            post="{'branch': 'main'}",
            tag=PluginTag.COLORSCHEME,
        ),
        PluginContext(
            "EdenEast",
            "nightfox.nvim",
            top_line=PluginClause.make_if_has("nvim-0.5"),
            tag=PluginTag.COLORSCHEME,
        ),
        PluginContext(
            "folke",
            "tokyonight.nvim",
            post="{'branch': 'main'}",
            tag=PluginTag.COLORSCHEME,
        ),
        PluginContext(
            "projekt0n",
            "github-nvim-theme",
            bottom_line=[PluginClause.make_endif()],
            tag=PluginTag.COLORSCHEME,
        ),
        PluginContext(
            "rebelot",
            "kanagawa.nvim",
            top_line=PluginClause.make_if_has("nvim-0.6"),
            bottom_line=[PluginClause.make_endif()],
            tag=PluginTag.COLORSCHEME,
        ),
        PluginContext(
            "RRethy",
            "vim-illuminate",
            top_line=[
                PluginClause.make_paragraph(),
                PluginClause.make_tripple_comment("Highlight"),
            ],
            tag=PluginTag.HIGHLIGHT,
        ),
        PluginContext(
            "RRethy",
            "vim-hexokinase",
            post="{'do': 'make hexokinase'}",
            tag=PluginTag.HIGHLIGHT,
        ),
        PluginContext(
            "kyazdani42",
            "nvim-web-devicons",
            top_line=[
                PluginClause.make_paragraph(),
                PluginClause.make_tripple_comment("UI"),
                PluginClause.make_single_comment("Icon"),
                PluginClause.make_if_has("nvim"),
            ],
        ),
        PluginContext(
            "ryanoasis",
            "vim-devicons",
            top_line=PluginClause.make_else(),
            bottom_line=PluginClause.make_endif(),
        ),
        PluginContext(
            "romgrk",
            "barbar.nvim",
            top_line=[
                PluginClause.make_tripple_comment("Tabline"),
                PluginClause.make_if_has("nvim-0.7"),
            ],
        ),
        PluginContext(
            "bagrat",
            "vim-buffet",
            top_line=PluginClause.make_else(),
            bottom_line=PluginClause.make_endif(),
        ),
        PluginContext(
            "kyazdani42",
            "nvim-tree.lua",
            top_line=[
                PluginClause.make_tripple_comment("Explorer"),
                PluginClause.make_if_has("nvim-0.7"),
            ],
        ),
        PluginContext("lambdalisue", "fern.vim", top_line=PluginClause.make_else()),
        PluginContext("lambdalisue", "nerdfont.vim"),
        PluginContext("lambdalisue", "fern-renderer-nerdfont.vim"),
        PluginContext("lambdalisue", "glyph-palette.vim"),
        PluginContext("lambdalisue", "fern-git-status.vim", bottom_line=PluginClause.make_endif()),
        PluginContext("jlanzarotta", "bufexplorer"),
        PluginContext(
            "lukas-reineke",
            "indent-blankline.nvim",
            if_has_="nvim-0.5",
            comment="Indentline",
            tag=PluginTag.HIGHLIGHT,
        ),
        PluginContext(
            "Yggdroot", "indentLine", else_=True, endif_=True, tag=PluginTag.HIGHLIGHT
        ),
        PluginContext(
            "nvim-lualine", "lualine.nvim", if_has_="nvim-0.5", comment="Statusline"
        ),
        PluginContext("itchyny", "lightline.vim", else_=True, endif_=True),
        PluginContext("airblade", "vim-gitgutter", comment="Git", paragraph=True),
        PluginContext("itchyny", "vim-gitbranch"),
        PluginContext(
            "f-person",
            "git-blame.nvim",
            if_has_="nvim-0.5",
            endif_=True,
            tag=PluginTag.HIGHLIGHT,
        ),
        PluginContext("liuchengxu", "vista.vim", comment="Tags", paragraph=True),
        PluginContext("ludovicchabant", "vim-gutentags"),
        PluginContext(
            "junegunn",
            "fzf",
            post="{'do': { -> fzf#install() }}",
            comment="Search",
            paragraph=True,
        ),
        PluginContext("junegunn", "fzf.vim"),
        PluginContext(
            "neoclide",
            "coc.nvim",
            "{'branch': 'release'}",
            comment="Language server",
            paragraph=True,
        ),
        PluginContext("antoinemadec", "coc-fzf"),
        PluginContext(
            "iamcco",
            "markdown-preview.nvim",
            post="{ 'do': 'cd app && yarn install' }",
            comment="Language support",
            paragraph=True,
            tag=PluginTag.LANGUAGE,
        ),
        PluginContext(
            "justinmk",
            "vim-syntax-extra",
            post="{'for': ['lex', 'flex', 'yacc', 'bison']}",
            comment="Lex/flex, yacc/bison",
            tag=PluginTag.LANGUAGE,
        ),
        PluginContext("rhysd", "vim-llvm", comment="LLVM", tag=PluginTag.LANGUAGE),
        PluginContext(
            "uarun", "vim-protobuf", comment="Protobuf", tag=PluginTag.LANGUAGE
        ),
        PluginContext("zebradil", "hive.vim", comment="Hive", tag=PluginTag.LANGUAGE),
        PluginContext(
            "neovimhaskell", "haskell-vim", comment="Haskell", tag=PluginTag.LANGUAGE
        ),
        PluginContext(
            "andymass", "vim-matchup", comment="HTML tags", tag=PluginTag.LANGUAGE
        ),
        PluginContext("alvan", "vim-closetag", tag=PluginTag.EDITING),
        PluginContext(
            "numToStr",
            "Comment.nvim",
            if_has_="nvim",
            comment=["Editing enhancement", "Commment"],
            paragraph=True,
            tag=PluginTag.EDITING,
        ),
        PluginContext(
            "tomtom", "tcomment_vim", else_=True, endif_=True, tag=PluginTag.EDITING
        ),
        PluginContext(
            "phaazon",
            "hop.nvim",
            if_has_="nvim-0.5",
            comment="Cursor motion",
            tag=PluginTag.EDITING,
        ),
        PluginContext(
            "easymotion",
            "vim-easymotion",
            else_=True,
            endif_=True,
            tag=PluginTag.EDITING,
        ),
        PluginContext(
            "windwp",
            "nvim-autopairs",
            if_has_="nvim-0.5",
            comment="Auto pair",
            tag=PluginTag.EDITING,
        ),
        PluginContext(
            "jiangmiao", "auto-pairs", else_=True, endif_=True, tag=PluginTag.EDITING
        ),
        PluginContext(
            "chaoren", "vim-wordmotion", comment="Word motion", tag=PluginTag.EDITING
        ),
        PluginContext("mattn", "emmet-vim", comment="HTML", tag=PluginTag.EDITING),
        PluginContext("tpope", "vim-repeat", tag=PluginTag.EDITING),
        PluginContext("tpope", "vim-surround", comment="Quotes", tag=PluginTag.EDITING),
        PluginContext("mbbill", "undotree", comment="Undo", tag=PluginTag.EDITING),
        PluginContext(
            "editorconfig",
            "editorconfig-vim",
            comment="Editor config",
            tag=PluginTag.EDITING,
        ),
        PluginContext(
            "haya14busa",
            "incsearch.vim",
            comment="Incremental search",
            tag=PluginTag.EDITING,
        ),
    ]

    def __init__(
        self,
        static_color=None,
        disable_color=False,
        disable_highlight=False,
        disable_language=False,
        disable_editing=False,
        disable_ctrlkeys=False,
        disable_plugins=None,
    ):
        Indentable.__init__(self)
        self.static_color = static_color
        self.disable_color = disable_color
        self.disable_highlight = disable_highlight
        self.disable_language = disable_language
        self.disable_editing = disable_editing
        self.disable_ctrlkeys = disable_ctrlkeys
        self.disable_plugins = disable_plugins

    def render(self):
        plugin_stmts = [PluginHeaderStmt()]
        vimrc_stmts = [
            StmtExpr(
                TrippleQuoteCommentExpr(LiteralExpr("---- Vimrc ----")),
                IndentExpr(self.indent),
            ),
            VimrcSourceStmt("plugins.vim"),
            VimrcSourceStmt("standalone/basic.vim"),
            VimrcSourceStmt("standalone/gui.vim"),
            VimrcSourceStmt("standalone/filetype.vim"),
            VimrcSourceStmt("standalone/color.vim"),
            VimrcSourceStmt("standalone/copypaste.vim"),
        ]
        if self.disable_ctrlkeys:
            vimrc_stmts.append(
                StmtExpr(
                    SingleQuoteCommentExpr(
                        LiteralExpr("Windows ctrl+{a,s,x,c,v} keys disabled")
                    ),
                    IndentExpr(self.indent),
                )
            )
        else:
            vimrc_stmts.append(VimrcSourceStmt("standalone/ctrlkeys.vim"))
        for ctx in Render.PLUGIN_CONTEXT:
            assert isinstance(ctx, PluginContext)
            # skip disabled
            if self.disable_plugins and ctx.to_str() in self.disable_plugins:
                continue
            if self.disable_color and ctx.tag == PluginTag.COLORSCHEME:
                continue
            if self.disable_highlight and ctx.tag == PluginTag.HIGHLIGHT:
                continue
            if self.disable_language and ctx.tag == PluginTag.LANGUAGE:
                continue
            if self.disable_editing and ctx.tag == PluginTag.EDITING:
                continue
            # above statement
            if ctx.paragraph:
                p = EmptyStmtExpr()
                plugin_stmts.append(p)
                vimrc_stmts.append(p)
            if ctx.comment:
                comments = (
                    ctx.comment if isinstance(ctx.comment, list) else [ctx.comment]
                )
                for i, cmt in enumerate(comments):
                    c = (
                        StmtExpr(
                            TrippleQuoteCommentExpr(LiteralExpr(cmt)),
                            IndentExpr(self.indent),
                        )
                        if ctx.paragraph and i == 0
                        else StmtExpr(
                            SingleQuoteCommentExpr(LiteralExpr(cmt)),
                            IndentExpr(self.indent),
                        )
                    )
                    plugin_stmts.append(c)
                    vimrc_stmts.append(c)
            if ctx.if_has_:
                ih = StmtExpr(
                    IfExpr(HasExpr(SingleQuoteStringExpr(ctx.if_has_))),
                    IndentExpr(self.indent),
                )
                plugin_stmts.append(ih)
                vimrc_stmts.append(ih)
                self.increment_indent()
            if ctx.if_not_has_:
                inh = StmtExpr(
                    IfExpr(NotExpr(HasExpr(SingleQuoteStringExpr(ctx.if_not_has_)))),
                    IndentExpr(self.indent),
                )
                plugin_stmts.append(inh)
                vimrc_stmts.append(inh)
                self.increment_indent()
            if ctx.elseif_has_:
                eh = StmtExpr(
                    ElseifExpr(HasExpr(SingleQuoteStringExpr(ctx.elseif_has_))),
                    IndentExpr(self.to_left_indent()),
                )
                plugin_stmts.append(eh)
                vimrc_stmts.append(eh)
            if ctx.elseif_not_has_:
                enh = StmtExpr(
                    ElseifExpr(
                        NotExpr(HasExpr(SingleQuoteStringExpr(ctx.elseif_not_has_)))
                    ),
                    IndentExpr(self.to_left_indent()),
                )
                plugin_stmts.append(enh)
                vimrc_stmts.append(enh)
            if ctx.else_:
                e = StmtExpr(ElseExpr(), IndentExpr(self.to_left_indent()))
                plugin_stmts.append(e)
                vimrc_stmts.append(e)
            # plug statement
            plugin_stmts.append(
                StmtExpr(
                    PlugExpr(
                        LiteralExpr(ctx.org),
                        LiteralExpr(ctx.repo),
                        LiteralExpr(ctx.post) if ctx.post else None,
                    ),
                    IndentExpr(self.indent),
                )
            )
            setting_file = f"repository/{ctx.to_str()}.vim"
            if pathlib.Path(f"{HOME_DIR}/.vim/{setting_file}").exists():
                vimrc_stmts.append(
                    VimrcSourceStmt(setting_file, IndentExpr(self.indent))
                )
            else:
                vimrc_stmts.append(
                    StmtExpr(
                        SingleQuoteCommentExpr(LiteralExpr("Nothing here")),
                        IndentExpr(self.indent),
                    )
                )
            # below statement
            if ctx.endif_:
                self.decrement_indent()
                plugin_stmts.append(StmtExpr(EndifExpr(), IndentExpr(self.indent)))
                vimrc_stmts.append(StmtExpr(EndifExpr(), IndentExpr(self.indent)))
        plugin_stmts.append(PluginFooterStmt())
        vimrc_stmts.append(VimrcSourceStmt("settings.vim"))
        setting_stmts = [
            SettingCocExtensionStmt(self.disable_language, IS_WINDOWS, not IS_WINDOWS),
        ]
        if self.static_color:
            setting_stmts.append(SettingStaticColorStmt(LiteralExpr(self.static_color)))
        elif not self.disable_color:
            setting_stmts.append(SettingRandomColorStmt())
        setting_stmts.append(SettingStmt())
        rendered_plugin = "".join([s.render() for s in plugin_stmts])
        rendered_vimrc = "".join([s.render() for s in vimrc_stmts])
        rendered_setting = "".join([s.render() for s in setting_stmts])
        return rendered_plugin, rendered_setting, rendered_vimrc


class FileDumper:
    def __init__(
        self,
        plugin_content,
        setting_content,
        vimrc_content,
        disable_vim=False,
        disable_neovim=False,
    ) -> None:
        self.plugin_content = plugin_content
        self.setting_content = setting_content
        self.vimrc_content = vimrc_content
        self.disable_vim = disable_vim
        self.disable_neovim = disable_neovim

    def dump(self):
        self.config()
        self.vimrc_entry()
        self.neovim_init_vim_entry()

    def config(self):
        plugins_file = f"{VIM_DIR}/plugins.vim"
        settings_file = f"{VIM_DIR}/settings.vim"
        with open(plugins_file, "w") as fp:
            fp.write(self.plugin_content)
        with open(settings_file, "w") as fp:
            fp.write(self.setting_content)
        with open(VIMRC_FILE, "w") as fp:
            fp.write(self.vimrc_content)
        self.coc_settings()

    def coc_settings(self):
        coc_dirs = [VIM_DIR]
        if IS_WINDOWS:
            coc_dirs.append(pathlib.Path(f"{HOME_DIR}/vimfiles"))
        for d in coc_dirs:
            if not d.exists():
                d.mkdir(parents=True)
            shutil.copy(
                f"{VIM_DIR}/template/coc-settings-template.json",
                f"{d}/coc-settings.json",
            )

    def vimrc_entry(self):
        if self.disable_vim:
            return
        if IS_WINDOWS:
            message(f"install {HOME_DIR}\\_vimrc for vim on windows")
            vimrc_path = pathlib.Path(f"{HOME_DIR}\\_vimrc")
        else:
            message(f"install ~/.vimrc for vim")
            vimrc_path = pathlib.Path(f"{HOME_DIR}/.vimrc")
        try_backup(vimrc_path)
        vimrc_path.symlink_to(VIMRC_FILE)

    def neovim_init_vim_entry(self):
        if self.disable_neovim:
            return
        if IS_WINDOWS:
            message(
                f"install {HOME_DIR}\\AppData\\Local\\nvim\\init.vim for neovim on windows"
            )
            appdata_local_path = pathlib.Path(f"{HOME_DIR}/AppData/Local")
            nvim_path = pathlib.Path(f"{appdata_local_path}/nvim")
            nvim_init_vim_path = pathlib.Path(f"{appdata_local_path}/nvim/init.vim")
        else:
            message("install ~/.config/nvim/init.vim for neovim")
            config_path = pathlib.Path(f"{HOME_DIR}/.config")
            nvim_path = pathlib.Path(f"{config_path}/nvim")
            nvim_init_vim_path = pathlib.Path(f"{config_path}/nvim/init.vim")
        try_backup(nvim_init_vim_path)
        try_backup(nvim_path)
        nvim_path.symlink_to(str(VIM_DIR), target_is_directory=True)
        nvim_init_vim_path.symlink_to(str(VIMRC_FILE))


class CommandHelp(click.Command):
    HELP_FILE = pathlib.Path(f"{VIM_DIR}/install/help.txt")

    def format_help(self, ctx, formatter):
        with open(CommandHelp.HELP_FILE, "r") as hf:
            formatter.write(hf.read())


@click.command(cls=CommandHelp)
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
    "--disable-color",
    "disable_color_opt",
    is_flag=True,
    help="Disable extra colors such as colorschemes and random selections",
)
@click.option(
    "--disable-highlight",
    "disable_highlight_opt",
    is_flag=True,
    help="Disable extra highlights such as RGB and cursor word",
)
@click.option(
    "--disable-language",
    "disable_language_opt",
    is_flag=True,
    help="Disable coc language server extensions",
)
@click.option(
    "--disable-editing",
    "disable_editing_opt",
    is_flag=True,
    help="Disable extra editing enhancement",
)
@click.option(
    "--disable-ctrl-keys",
    "disable_ctrl_keys_opt",
    is_flag=True,
    help="Disable windows ctrl+{a,s,x,c,v} keys",
)
@click.option(
    "--disable-plugin",
    "disable_plugin_opt",
    multiple=True,
    help="Disable specific vim plugins in org/repo format from github",
)
@click.option(
    "--disable-vim",
    "disable_vim_opt",
    is_flag=True,
    help="Only support neovim, disable vim",
)
@click.option(
    "--disable-neovim",
    "disable_neovim_opt",
    is_flag=True,
    help="Only support vim, disable neovim",
)
def generator(
    basic_opt,
    limit_opt,
    static_color_opt,
    disable_color_opt,
    disable_highlight_opt,
    disable_language_opt,
    disable_editing_opt,
    disable_ctrl_keys_opt,
    disable_plugin_opt,
    disable_vim_opt,
    disable_neovim_opt,
):
    """

    Install with 3 modes: full (default), limit and basic.

    \b
    In full mode, you could use '--disable-xxx' options to disable specific feature.
    The '--disable-highlight --disable-color --disable-language --disable-editing' option is equivalent to '--limit'.
    The '--disable-color' option is conflict with '--static-color'.

    """
    if limit_opt:
        disable_color_opt = True
        disable_highlight_opt = True
        disable_language_opt = True
        disable_editing_opt = True
    if static_color_opt and disable_color_opt:
        error_message("cannot use --static-color along with --disable-color")
        exit(1)
    render = Render(
        static_color_opt,
        disable_color_opt,
        disable_highlight_opt,
        disable_language_opt,
        disable_editing_opt,
        disable_ctrl_keys_opt,
        disable_plugin_opt,
    )
    plugin_content, setting_content, vimrc_content = render.render()
    dumper = FileDumper(
        plugin_content,
        setting_content,
        vimrc_content,
        disable_vim_opt,
        disable_neovim_opt,
    )
    dumper.dump()


if __name__ == "__main__":
    generator()
