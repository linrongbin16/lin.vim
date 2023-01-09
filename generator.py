#!/usr/bin/env python3

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
        src.rename(dest)
        message(f"backup '{src}' to '{dest}'")


# def try_delete(src):
#     assert isinstance(src, pathlib.Path)
#     if src.is_symlink() or src.exists():
#         src.unlink(missing_ok=True)
#         message(f"delete '{src}'")

INDENT_SIZE = 4


class Indentable:
    def __init__(self):
        self._value = 0

    @property
    def indentlevel(self):
        return self._value

    def inc_indentlevel(self):
        self._value += 1

    def dec_indentlevel(self):
        self._value = max(self._value - 1, 0)

    def get_dec_indentlevel(self):
        return max(self._value - 1, 0)


class Expr(abc.ABC):
    @abc.abstractmethod
    def render(self):
        pass


class IfExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f"if {self.expr.render()}"


class ElseExpr(Expr):
    def render(self):
        return "else"


class ElseifExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f"elseif {self.expr.render()}"


class EndifExpr(Expr):
    def render(self):
        return "endif"


class HasExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f"has({self.expr.render()})"


class LogicNotExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f"!({self.expr.render()})"


class LogicAndExpr(Expr):
    def __init__(self, *args):
        assert args is not None
        for a in args:
            assert isinstance(a, Expr)
        self.args = args

    def render(self):
        return " && ".join([f"({a.render()})" for a in self.args])


class LogicOrExpr(Expr):
    def __init__(self, *args):
        assert args is not None
        for a in args:
            assert isinstance(a, Expr)
        self.args = args

    def render(self):
        return " || ".join([f"({a.render()})" for a in self.args])


class StringExpr(Expr):
    @abc.abstractmethod
    def render(self):
        pass


class SingleQuoteStringExpr(StringExpr):
    def __init__(self, value):
        self.value = value

    def render(self):
        return f"'{str(self.value)}'"


class DoubleQuotesStringExpr(StringExpr):
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


class CommentExpr(Expr):
    @abc.abstractmethod
    def render(self):
        pass


class SingleQuoteCommentExpr(CommentExpr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f'" {self.expr.render()}'


class TrippleQuotesCommentExpr(CommentExpr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f'""" {self.expr.render()}'


class EmptyCommentExpr(SingleQuoteCommentExpr):
    def __init__(self):
        SingleQuoteCommentExpr.__init__(self, LiteralExpr("Empty"))


class FunctionInvokeExpr(Expr):
    def __init__(self, func, *args) -> None:
        assert isinstance(func, LiteralExpr)
        if args:
            for a in args:
                assert isinstance(a, LiteralExpr)
        self.func = func
        self.args = args if args else []

    def render(self):
        return f"{self.func.render()}({','.join([e.render() for e in self.args])})"


class CallExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f"call {self.expr.render()}"


class AddExpr(Expr):
    def __init__(self, *args) -> None:
        assert args
        for a in args:
            assert isinstance(a, Expr)
        self.args = args

    def render(self):
        return f"add({', '.join([a.render() for a in self.args])})"


class ColorschemeExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, LiteralExpr)
        self.expr = expr

    def render(self):
        return f"colorscheme {self.expr.render()}"


class IndentExpr(Expr):
    def __init__(self, expr, count=0):
        assert isinstance(expr, Expr)
        assert isinstance(count, int) and count >= 0
        self.expr = expr
        self.count = count

    def render(self):
        return f"{' ' * self.count * INDENT_SIZE}{self.expr.render()}"


class LineContinuationExpr(Expr):
    def __init__(self, expr):
        assert isinstance(expr, Expr)
        self.expr = expr

    def render(self):
        return f"    \\ {self.expr.render()}"


class Stmt(Expr):
    def __init__(self, expr=None):
        assert isinstance(expr, Expr) or expr is None
        self.expr = expr

    def render(self):
        return f"{self.expr.render() if self.expr else ''}\n"


class EmptyStmt(Stmt):
    def __init__(self):
        Stmt.__init__(self, None)


class PlugExpr(Expr):
    def __init__(self, org, repo, post=None):
        assert isinstance(org, LiteralExpr)
        assert isinstance(repo, LiteralExpr)
        assert isinstance(post, LiteralExpr) or post is None
        self.org = org
        self.repo = repo
        self.post = post

    def render(self):
        return f"Plug '{self.org.render()}/{self.repo.render()}'{(', ' + self.post.render()) if self.post else ''}"


class TemplateContent(Expr):
    def __init__(self, path):
        assert isinstance(path, pathlib.Path)
        assert path.exists()
        with open(path, "r") as fp:
            self.content = fp.read()

    def render(self):
        return self.content


class SourceVimDirStmt(Expr):
    def __init__(self, value, indent_count=0):
        self.stmt = Stmt(
            IndentExpr(SourceExpr(LiteralExpr(f"$HOME/.vim/{value}")), indent_count)
        )

    def render(self):
        return self.stmt.render()


class CocExtensionContent(Expr):
    def __init__(
        self,
        disable_language=False,
        disable_sh=IS_WINDOWS,
        disable_powershell=not IS_WINDOWS,
    ) -> None:
        self.comment = TrippleQuotesCommentExpr(
            LiteralExpr("---- Coc global extensions ----")
        )
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
        self.exprs = [SingleQuoteStringExpr(e) for e in extensions]

    def render(self):
        return f"""
{self.comment.render()}
let g:coc_global_extensions = [{', '.join([e.render() for e in self.exprs])}]
"""


class PluginTag(enum.Enum):
    COLORSCHEME = 1
    HIGHLIGHT = 2
    LANGUAGE = 3
    EDITING = 4
    OPTIMIZATION = 5


class PluginClauseKind(enum.Enum):
    PARAGRAPH = 1
    SINGLE_COMMENT = 2
    TRIPPLE_COMMENT = 3
    IF_HAS = 4
    IF_NOT_HAS = 5
    ELSEIF_HAS = 6
    ELSEIF_NOT_HAS = 7
    ELSE = 8
    ENDIF = 9


class PluginClause:
    def __init__(self, kind, value=None):
        assert isinstance(kind, PluginClauseKind)
        assert isinstance(value, str) or value is None
        self.kind = kind
        self.value = value

    def __str__(self):
        return f"PluginClause(kind:{self.kind}, value:{self.value})"

    @staticmethod
    def make_paragraph():
        return PluginClause(PluginClauseKind.PARAGRAPH)

    @staticmethod
    def make_single_comment(value):
        return PluginClause(PluginClauseKind.SINGLE_COMMENT, value)

    @staticmethod
    def make_tripple_comment(value):
        return PluginClause(PluginClauseKind.TRIPPLE_COMMENT, value)

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
        color=None,
        top_clause=None,
        bottom_clause=None,
        tag=None,
    ) -> None:
        self.org = org
        self.repo = repo
        self.post = post
        self.color = color
        self.top_clause = top_clause  # more clauses above this line
        self.bottom_clause = bottom_clause  # more clauses below this line
        self.tag = tag

    def __str__(self):
        return f"{self.org}/{self.repo}"


PLUGIN_CONTEXTS = [
    PluginContext(
        "nathom",
        "filetype.nvim",
        top_clause=[
            EmptyStmt(),
            TrippleQuotesCommentExpr(LiteralExpr("---- Performance ----")),
            IfExpr(HasExpr(SingleQuoteStringExpr("nvim"))),
        ],
        bottom_clause=EndifExpr(),
        tag=PluginTag.OPTIMIZATION,
    ),
    PluginContext(
        "lewis6991",
        "impatient.nvim",
        top_clause=IfExpr(HasExpr(SingleQuoteStringExpr("nvim-0.7"))),
        bottom_clause=EndifExpr(),
        tag=PluginTag.OPTIMIZATION,
    ),
    PluginContext(
        "lifepillar",
        "vim-solarized8",
        color="solarized8",
        top_clause=[
            EmptyStmt(),
            TrippleQuotesCommentExpr(LiteralExpr("---- Colorscheme ----")),
        ],
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext(
        "crusoexia", "vim-monokai", color="monokai", tag=PluginTag.COLORSCHEME
    ),
    PluginContext(
        "dracula",
        "vim",
        post="{'as': 'dracula'}",
        color="dracula",
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext(
        "KeitaNakamura", "neodark.vim", color="neodark", tag=PluginTag.COLORSCHEME
    ),
    PluginContext(
        "srcery-colors", "srcery-vim", color="srcery", tag=PluginTag.COLORSCHEME
    ),
    PluginContext(
        "drewtempelmeyer", "palenight.vim", color="palenight", tag=PluginTag.COLORSCHEME
    ),
    PluginContext(
        "joshdick", "onedark.vim", color="onedark", tag=PluginTag.COLORSCHEME
    ),
    PluginContext("Rigellute", "rigel", color="rigel", tag=PluginTag.COLORSCHEME),
    PluginContext(
        "chriskempson",
        "base16-vim",
        color="base16-default-dark",
        top_clause=[
            SingleQuoteCommentExpr(
                LiteralExpr(
                    "Colorscheme base16-default-dark is not working with lualine"
                )
            ),
            IfExpr(LogicNotExpr(HasExpr(SingleQuoteStringExpr("nvim-0.5")))),
        ],
        bottom_clause=EndifExpr(),
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext("sainnhe", "edge", color="edge", tag=PluginTag.COLORSCHEME),
    PluginContext(
        "sainnhe",
        "gruvbox-material",
        color="gruvbox-material",
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext(
        "sainnhe", "everforest", color="everforest", tag=PluginTag.COLORSCHEME
    ),
    PluginContext("sainnhe", "sonokai", color="sonokai", tag=PluginTag.COLORSCHEME),
    PluginContext(
        "kaicataldo",
        "material.vim",
        post="{'branch': 'main'}",
        color="material",
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext(
        "projekt0n",
        "github-nvim-theme",
        color="github_dark",
        top_clause=IfExpr(HasExpr(SingleQuoteStringExpr("nvim-0.5"))),
        bottom_clause=EndifExpr(),
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext(
        "folke",
        "tokyonight.nvim",
        post="{'branch': 'main'}",
        color="tokyonight",
        top_clause=IfExpr(HasExpr(SingleQuoteStringExpr("nvim-0.6"))),
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext(
        "rebelot",
        "kanagawa.nvim",
        color="kanagawa",
        bottom_clause=EndifExpr(),
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext(
        "EdenEast",
        "nightfox.nvim",
        color="nightfox",
        top_clause=IfExpr(HasExpr(SingleQuoteStringExpr("nvim-0.8"))),
        bottom_clause=EndifExpr(),
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext(
        "RRethy",
        "vim-illuminate",
        top_clause=[
            EmptyStmt(),
            TrippleQuotesCommentExpr(LiteralExpr("---- Highlight ----")),
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
        "andymass",
        "vim-matchup",
        tag=PluginTag.HIGHLIGHT,
    ),
    PluginContext(
        "inkarkat",
        "vim-ingo-library",
        tag=PluginTag.HIGHLIGHT,
    ),
    PluginContext(
        "inkarkat",
        "vim-mark",
        tag=PluginTag.HIGHLIGHT,
    ),
    PluginContext(
        "kyazdani42",
        "nvim-web-devicons",
        top_clause=[
            EmptyStmt(),
            TrippleQuotesCommentExpr(LiteralExpr("---- UI ----")),
            SingleQuoteCommentExpr(LiteralExpr("Icon")),
            IfExpr(HasExpr(SingleQuoteStringExpr("nvim"))),
        ],
    ),
    PluginContext(
        "ryanoasis",
        "vim-devicons",
        top_clause=ElseExpr(),
        bottom_clause=EndifExpr(),
    ),
    PluginContext(
        "romgrk",
        "barbar.nvim",
        top_clause=[
            SingleQuoteCommentExpr(LiteralExpr("Tabline")),
            IfExpr(HasExpr(SingleQuoteStringExpr("nvim-0.7"))),
        ],
    ),
    PluginContext(
        "bagrat",
        "vim-buffet",
        top_clause=ElseExpr(),
        bottom_clause=EndifExpr(),
    ),
    PluginContext(
        "kyazdani42",
        "nvim-tree.lua",
        top_clause=[
            SingleQuoteCommentExpr(LiteralExpr("Explorer")),
            IfExpr(HasExpr(SingleQuoteStringExpr("nvim-0.8"))),
        ],
    ),
    PluginContext("lambdalisue", "fern.vim", top_clause=ElseExpr()),
    PluginContext("lambdalisue", "nerdfont.vim"),
    PluginContext("lambdalisue", "fern-renderer-nerdfont.vim"),
    PluginContext("lambdalisue", "glyph-palette.vim"),
    PluginContext(
        "lambdalisue",
        "fern-git-status.vim",
        bottom_clause=EndifExpr(),
    ),
    PluginContext("jlanzarotta", "bufexplorer"),
    PluginContext(
        "lukas-reineke",
        "indent-blankline.nvim",
        top_clause=[
            SingleQuoteCommentExpr(LiteralExpr("Indentline")),
            IfExpr(HasExpr(SingleQuoteStringExpr("nvim-0.5"))),
        ],
        tag=PluginTag.HIGHLIGHT,
    ),
    PluginContext(
        "Yggdroot",
        "indentLine",
        top_clause=ElseExpr(),
        bottom_clause=EndifExpr(),
        tag=PluginTag.HIGHLIGHT,
    ),
    PluginContext(
        "nvim-lualine",
        "lualine.nvim",
        top_clause=[
            SingleQuoteCommentExpr(LiteralExpr("Statusline")),
            IfExpr(HasExpr(SingleQuoteStringExpr("nvim-0.5"))),
        ],
    ),
    PluginContext(
        "itchyny",
        "lightline.vim",
        top_clause=ElseExpr(),
        bottom_clause=EndifExpr(),
    ),
    PluginContext(
        "lewis6991",
        "gitsigns.nvim",
        top_clause=[
            SingleQuoteCommentExpr(LiteralExpr("Git")),
            IfExpr(HasExpr(SingleQuoteStringExpr("nvim-0.7"))),
        ],
        tag=PluginTag.HIGHLIGHT,
    ),
    PluginContext(
        "airblade",
        "vim-gitgutter",
        top_clause=ElseExpr(),
        tag=PluginTag.EDITING,
    ),
    PluginContext("itchyny", "vim-gitbranch", tag=PluginTag.EDITING),
    PluginContext(
        "f-person",
        "git-blame.nvim",
        top_clause=IfExpr(HasExpr(SingleQuoteStringExpr("nvim-0.5"))),
        bottom_clause=[EndifExpr(), EndifExpr()],
        tag=PluginTag.HIGHLIGHT,
    ),
    PluginContext(
        "voldikss",
        "vim-floaterm",
        top_clause=SingleQuoteCommentExpr(LiteralExpr("Terminal")),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "liuchengxu",
        "vista.vim",
        top_clause=[
            EmptyStmt(),
            TrippleQuotesCommentExpr(LiteralExpr("---- Tags ----")),
        ],
    ),
    PluginContext("ludovicchabant", "vim-gutentags"),
    PluginContext(
        "junegunn",
        "fzf",
        post="{'do': { -> fzf#install() }}",
        top_clause=[
            EmptyStmt(),
            TrippleQuotesCommentExpr(LiteralExpr("---- Search ----")),
        ],
    ),
    PluginContext("junegunn", "fzf.vim"),
    PluginContext(
        "neoclide",
        "coc.nvim",
        post="{'branch': 'release'}",
        top_clause=[
            EmptyStmt(),
            TrippleQuotesCommentExpr(LiteralExpr("---- Language server ----")),
        ],
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "antoinemadec",
        "coc-fzf",
        post="{'branch': 'release'}",
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "iamcco",
        "markdown-preview.nvim",
        post="{ 'do': 'cd app && yarn install', 'for': ['markdown'] }",
        top_clause=[
            EmptyStmt(),
            TrippleQuotesCommentExpr(LiteralExpr("---- Language support ----")),
        ],
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "justinmk",
        "vim-syntax-extra",
        post="{'for': ['lex', 'flex', 'yacc', 'bison']}",
        top_clause=SingleQuoteCommentExpr(LiteralExpr("Lex/yacc, flex/bison")),
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "rhysd",
        "vim-llvm",
        post="{ 'for': ['llvm', 'mir', 'mlir', 'tablegen'] }",
        top_clause=SingleQuoteCommentExpr(LiteralExpr("LLVM")),
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "uarun",
        "vim-protobuf",
        post="{ 'for': ['proto'] }",
        top_clause=SingleQuoteCommentExpr(LiteralExpr("Protobuf")),
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "zebradil",
        "hive.vim",
        post="{ 'for': ['hive']  }",
        top_clause=SingleQuoteCommentExpr(LiteralExpr("Hive")),
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "neovimhaskell",
        "haskell-vim",
        post="{ 'for': ['haskell'] }",
        top_clause=SingleQuoteCommentExpr(LiteralExpr("Haskell")),
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "slim-template",
        "vim-slim",
        post="{ 'for': ['slim'] }",
        top_clause=SingleQuoteCommentExpr(LiteralExpr("Slim")),
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "jparise",
        "vim-graphql",
        post="{ 'for': ['graphql', 'graphqls', 'gql'] }",
        top_clause=SingleQuoteCommentExpr(LiteralExpr("GraphQL")),
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "alvan",
        "vim-closetag",
        top_clause=[
            EmptyStmt(),
            TrippleQuotesCommentExpr(LiteralExpr("---- Editing enhancement ----")),
            SingleQuoteCommentExpr(LiteralExpr("HTML tag")),
        ],
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "numToStr",
        "Comment.nvim",
        top_clause=[
            SingleQuoteCommentExpr(LiteralExpr("Comment")),
            IfExpr(HasExpr(SingleQuoteStringExpr("nvim"))),
        ],
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "tomtom",
        "tcomment_vim",
        top_clause=ElseExpr(),
        bottom_clause=EndifExpr(),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "phaazon",
        "hop.nvim",
        post="{'branch': 'v2'}",
        top_clause=[
            SingleQuoteCommentExpr(LiteralExpr("Cursor motion")),
            IfExpr(HasExpr(SingleQuoteStringExpr("nvim-0.5"))),
        ],
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "easymotion",
        "vim-easymotion",
        top_clause=ElseExpr(),
        bottom_clause=EndifExpr(),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "windwp",
        "nvim-autopairs",
        top_clause=[
            SingleQuoteCommentExpr(LiteralExpr("Autopair")),
            IfExpr(HasExpr(SingleQuoteStringExpr("nvim-0.7"))),
        ],
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "jiangmiao",
        "auto-pairs",
        top_clause=ElseExpr(),
        bottom_clause=EndifExpr(),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "haya14busa",
        "is.vim",
        top_clause=[
            SingleQuoteCommentExpr(LiteralExpr("Incremental search")),
            IfExpr(HasExpr(SingleQuoteStringExpr("patch-8.0.1238"))),
        ],
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "haya14busa",
        "incsearch.vim",
        top_clause=ElseExpr(),
        bottom_clause=EndifExpr(),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "tpope",
        "vim-repeat",
        tag=PluginTag.EDITING,
        top_clause=SingleQuoteCommentExpr(LiteralExpr("Other")),
    ),
    PluginContext("tpope", "vim-surround", tag=PluginTag.EDITING),
    PluginContext("chaoren", "vim-wordmotion", tag=PluginTag.EDITING),
    PluginContext("mattn", "emmet-vim", tag=PluginTag.EDITING),
    PluginContext("mbbill", "undotree", tag=PluginTag.EDITING),
    PluginContext("editorconfig", "editorconfig-vim", tag=PluginTag.EDITING),
]


class Render(Indentable):
    def __init__(
        self,
        static_color=None,
        disable_color=False,
        disable_highlight=False,
        disable_language=False,
        disable_editing=False,
        disable_plugins=None,
    ):
        Indentable.__init__(self)
        self.static_color = static_color
        self.disable_color = disable_color
        self.disable_highlight = disable_highlight
        self.disable_language = disable_language
        self.disable_editing = disable_editing
        self.disable_plugins = disable_plugins

    def render(self):
        core_plugins, core_vimrcs, core_color_settings = self.render_core()

        plugin_stmts = self.render_plugin_stmts(core_plugins)
        color_setting_stmts = self.render_color_setting_stmts(core_color_settings)
        setting_stmts = self.render_setting_stmts()
        vimrc_stmts = self.render_vimrc_stmts(core_vimrcs)

        # merge empty comment statements
        plugin_stmts = self.merge_empty_comments(plugin_stmts)
        setting_stmts = self.merge_empty_comments(setting_stmts)
        color_setting_stmts = self.merge_empty_comments(color_setting_stmts)
        vimrc_stmts = self.merge_empty_comments(vimrc_stmts)

        plugins_content = "".join([s.render() for s in plugin_stmts])
        settings_content = "".join([s.render() for s in setting_stmts])
        color_settings_content = "".join([s.render() for s in color_setting_stmts])
        vimrc_content = "".join([s.render() for s in vimrc_stmts])
        return plugins_content, settings_content, color_settings_content, vimrc_content

    def merge_empty_comments(self, statements):
        assert isinstance(statements, list)
        new_statements = []
        i = 0
        while i < len(statements):
            s = statements[i]
            new_statements.append(s)
            i += 1
            if self.is_empty_comment(s):
                j = i
                while j < len(statements):
                    s2 = statements[j]
                    if not self.is_empty_comment(s2):
                        break
                    j += 1
                i = j
        return new_statements

    def is_empty_comment(self, s):
        return (
            isinstance(s, Stmt)
            and s.render().strip() == EmptyCommentExpr().render().strip()
        )

    # plugins.vim
    def render_plugin_stmts(self, core_plugins):
        plugin_stmts = []
        plugin_stmts.append(
            TemplateContent(pathlib.Path(f"{TEMPLATE_DIR}/plugins-header-template.vim"))
        )
        plugin_stmts.extend(core_plugins)
        plugin_stmts.append(
            TemplateContent(pathlib.Path(f"{TEMPLATE_DIR}/plugins-footer-template.vim"))
        )
        return plugin_stmts

    # vimrc.vim
    def render_vimrc_stmts(self, core_vimrcs):
        vimrc_stmts = []
        vimrc_stmts.append(
            Stmt(TrippleQuotesCommentExpr(LiteralExpr("---- Vimrc ----")))
        )
        vimrc_stmts.append(SourceVimDirStmt("plugins.vim"))
        vimrc_stmts.append(SourceVimDirStmt("standalone/basic.vim"))
        vimrc_stmts.append(SourceVimDirStmt("standalone/filetype.vim"))

        # insert core vimrc statements
        vimrc_stmts.extend(core_vimrcs)

        vimrc_stmts.append(EmptyStmt())
        vimrc_stmts.append(
            Stmt(TrippleQuotesCommentExpr(LiteralExpr("---- Custom settings ----")))
        )
        vimrc_stmts.append(SourceVimDirStmt("color-settings.vim"))
        vimrc_stmts.append(SourceVimDirStmt("settings.vim"))
        return vimrc_stmts

    # color-settings.vim
    def render_color_setting_stmts(self, core_color_settings):
        color_setting_stmts = []
        color_setting_stmts.append(
            TemplateContent(
                pathlib.Path(f"{TEMPLATE_DIR}/settings-color-array-template.vim")
            )
        )
        color_setting_stmts.extend(core_color_settings)
        color_setting_stmts.append(
            TemplateContent(
                pathlib.Path(f"{TEMPLATE_DIR}/settings-color-function-template.vim")
            )
        )
        return color_setting_stmts

    # settings.vim
    def render_setting_stmts(self):
        setting_stmts = []
        setting_stmts.append(
            CocExtensionContent(
                self.disable_language,
                disable_sh=IS_WINDOWS or self.disable_language,
                disable_powershell=not IS_WINDOWS or self.disable_language,
            )
        )
        if self.static_color:
            setting_stmts.extend(
                [
                    EmptyStmt(),
                    Stmt(
                        TrippleQuotesCommentExpr(
                            LiteralExpr("---- Static colorscheme ----")
                        )
                    ),
                    Stmt(IndentExpr(ColorschemeExpr(LiteralExpr(self.static_color)))),
                ]
            )
        elif not self.disable_color:
            setting_stmts.extend(
                [
                    EmptyStmt(),
                    Stmt(
                        TrippleQuotesCommentExpr(
                            LiteralExpr("---- Random colorscheme on startup ----")
                        )
                    ),
                    Stmt(
                        IndentExpr(
                            CallExpr(
                                FunctionInvokeExpr(
                                    LiteralExpr("LinVimNextRandomColorScheme")
                                )
                            )
                        )
                    ),
                ]
            )
        setting_stmts.append(
            TemplateContent(pathlib.Path(f"{TEMPLATE_DIR}/settings-template.vim"))
        )
        return setting_stmts

    def render_core(self):
        plugin_stmts = []
        vimrc_stmts = []
        color_setting_stmts = []
        for ctx in PLUGIN_CONTEXTS:
            assert isinstance(ctx, PluginContext)
            # top
            if ctx.top_clause:
                tops = (
                    ctx.top_clause
                    if isinstance(ctx.top_clause, list)
                    else [ctx.top_clause]
                )
                for top in tops:
                    assert isinstance(top, Expr)
                    if isinstance(top, EmptyStmt):
                        plugin_stmts.append(top)
                        vimrc_stmts.append(top)
                        if ctx.tag == PluginTag.COLORSCHEME:
                            color_setting_stmts.append(top)
                    elif isinstance(top, CommentExpr):
                        cs = Stmt(IndentExpr(top, self.indentlevel))
                        plugin_stmts.append(cs)
                        vimrc_stmts.append(cs)
                        if ctx.tag == PluginTag.COLORSCHEME:
                            color_setting_stmts.append(cs)
                    elif isinstance(top, IfExpr):
                        ifs = Stmt(IndentExpr(top, self.indentlevel))
                        plugin_stmts.append(ifs)
                        vimrc_stmts.append(ifs)
                        if ctx.tag == PluginTag.COLORSCHEME:
                            color_setting_stmts.append(ifs)
                        self.inc_indentlevel()
                    elif isinstance(top, ElseifExpr) or isinstance(top, ElseExpr):
                        elifs = Stmt(IndentExpr(top, self.get_dec_indentlevel()))
                        plugin_stmts.append(elifs)
                        vimrc_stmts.append(elifs)
                        if ctx.tag == PluginTag.COLORSCHEME:
                            color_setting_stmts.append(elifs)
                    else:
                        assert False
            ecs = Stmt(IndentExpr(EmptyCommentExpr(), self.indentlevel))
            # body
            if self.is_disabled_plugin(ctx):
                # skip disabled plugins
                plugin_stmts.append(ecs)
                vimrc_stmts.append(ecs)
                if ctx.tag == PluginTag.COLORSCHEME:
                    color_setting_stmts.append(ecs)
            else:
                # plugins
                plugin_stmts.append(
                    Stmt(
                        IndentExpr(
                            PlugExpr(
                                LiteralExpr(ctx.org),
                                LiteralExpr(ctx.repo),
                                LiteralExpr(ctx.post) if ctx.post else None,
                            ),
                            self.indentlevel,
                        )
                    )
                )
                # vimrc
                setting_file = f"repository/{ctx}.vim"
                if pathlib.Path(f"{HOME_DIR}/.vim/{setting_file}").exists():
                    vimrc_stmts.append(SourceVimDirStmt(setting_file, self.indentlevel))
                else:
                    vimrc_stmts.append(ecs)
                # color settings
                if ctx.tag == PluginTag.COLORSCHEME:
                    color_setting_stmts.append(
                        Stmt(
                            IndentExpr(
                                CallExpr(
                                    AddExpr(
                                        LiteralExpr("s:lin_vim_colorschemes"),
                                        SingleQuoteStringExpr(ctx.color),
                                    )
                                ),
                                self.indentlevel,
                            )
                        )
                    )
            # bottom
            if ctx.bottom_clause:
                bottoms = (
                    ctx.bottom_clause
                    if isinstance(ctx.bottom_clause, list)
                    else [ctx.bottom_clause]
                )
                for bottom in bottoms:
                    assert isinstance(bottom, Expr)
                    if isinstance(bottom, EndifExpr):
                        self.dec_indentlevel()
                        eis = Stmt(IndentExpr(bottom, self.indentlevel))
                        plugin_stmts.append(eis)
                        vimrc_stmts.append(eis)
                        if ctx.tag == PluginTag.COLORSCHEME:
                            color_setting_stmts.append(eis)
                    else:
                        assert False

        return plugin_stmts, vimrc_stmts, color_setting_stmts

    def is_disabled_plugin(self, ctx):
        if self.disable_plugins and str(ctx) in self.disable_plugins:
            return True
        if self.disable_color and ctx.tag == PluginTag.COLORSCHEME:
            return True
        if self.disable_highlight and ctx.tag == PluginTag.HIGHLIGHT:
            return True
        if self.disable_language and ctx.tag == PluginTag.LANGUAGE:
            return True
        if self.disable_editing and ctx.tag == PluginTag.EDITING:
            return True
        return False


class FileDumper:
    def __init__(
        self,
        plugin_content,
        setting_content,
        color_setting_content,
        vimrc_content,
        disable_vim=False,
        disable_neovim=False,
    ) -> None:
        self.plugin_content = plugin_content
        self.setting_content = setting_content
        self.color_setting_content = color_setting_content
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
        color_settings_file = f"{VIM_DIR}/color-settings.vim"
        try_backup(pathlib.Path(plugins_file))
        with open(plugins_file, "w") as fp:
            fp.write(self.plugin_content)
        try_backup(pathlib.Path(settings_file))
        with open(settings_file, "w") as fp:
            fp.write(self.setting_content)
        try_backup(pathlib.Path(color_settings_file))
        with open(color_settings_file, "w") as fp:
            fp.write(self.color_setting_content)
        try_backup(pathlib.Path(VIMRC_FILE))
        with open(VIMRC_FILE, "w") as fp:
            fp.write(self.vimrc_content)
        self.coc_settings()

    def coc_settings(self):
        coc_dirs = VIM_DIR
        coc_settings_file = f"{coc_dirs}/coc-settings.json"
        try_backup(pathlib.Path(coc_settings_file))
        shutil.copy(f"{VIM_DIR}/template/coc-settings-template.json", coc_settings_file)

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
    "--static-color",
    "static_color_opt",
    default=None,
    show_default=True,
    help="Use static colorscheme",
)
@click.option(
    "--disable-color",
    "disable_color_opt",
    is_flag=True,
    help="Disable extra colors",
)
@click.option(
    "--disable-highlight",
    "disable_highlight_opt",
    is_flag=True,
    help="Disable extra highlights",
)
@click.option(
    "--disable-language",
    "disable_language_opt",
    is_flag=True,
    help="Disable language support",
)
@click.option(
    "--disable-editing",
    "disable_editing_opt",
    is_flag=True,
    help="Disable editing enhancement",
)
@click.option(
    "--disable-plugin",
    "disable_plugin_opt",
    multiple=True,
    help="Disable specific vim plugin",
)
@click.option(
    "--disable-vim",
    "disable_vim_opt",
    is_flag=True,
    help="No .vimrc file for vim",
)
@click.option(
    "--disable-neovim",
    "disable_neovim_opt",
    is_flag=True,
    help="No init.vim file neovim",
)
def generator(
    basic_opt,
    limit_opt,
    static_color_opt,
    disable_color_opt,
    disable_highlight_opt,
    disable_language_opt,
    disable_editing_opt,
    disable_plugin_opt,
    disable_vim_opt,
    disable_neovim_opt,
):
    if limit_opt:
        disable_color_opt = True
        disable_highlight_opt = True
        disable_language_opt = True
        disable_editing_opt = True
    render = Render(
        static_color_opt,
        disable_color_opt,
        disable_highlight_opt,
        disable_language_opt,
        disable_editing_opt,
        disable_plugin_opt,
    )
    (
        plugins_content,
        settings_content,
        color_settings_content,
        vimrc_content,
    ) = render.render()
    dumper = FileDumper(
        plugins_content,
        settings_content,
        color_settings_content,
        vimrc_content,
        disable_vim_opt,
        disable_neovim_opt,
    )
    dumper.dump()


if __name__ == "__main__":
    generator()
