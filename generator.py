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


class IndentLevel:
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
            PluginClause.make_paragraph(),
            PluginClause.make_tripple_comment("---- Performance ----"),
            PluginClause.make_if_has("nvim"),
        ],
        bottom_clause=[PluginClause.make_endif()],
        tag=PluginTag.OPTIMIZATION,
    ),
    PluginContext(
        "lewis6991",
        "impatient.nvim",
        top_clause=[
            PluginClause.make_if_has("nvim-0.7"),
        ],
        bottom_clause=[PluginClause.make_endif()],
        tag=PluginTag.OPTIMIZATION,
    ),
    PluginContext(
        "lifepillar",
        "vim-solarized8",
        color="solarized8",
        top_clause=[
            PluginClause.make_paragraph(),
            PluginClause.make_tripple_comment("---- Color scheme ----"),
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
        "EdenEast",
        "nightfox.nvim",
        color="nightfox",
        top_clause=PluginClause.make_if_has("nvim-0.5"),
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext(
        "projekt0n",
        "github-nvim-theme",
        color="github_dark",
        bottom_clause=[PluginClause.make_endif()],
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext(
        "folke",
        "tokyonight.nvim",
        post="{'branch': 'main'}",
        color="tokyonight",
        top_clause=PluginClause.make_if_has("nvim-0.6"),
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext(
        "rebelot",
        "kanagawa.nvim",
        color="kanagawa",
        bottom_clause=PluginClause.make_endif(),
        tag=PluginTag.COLORSCHEME,
    ),
    PluginContext(
        "RRethy",
        "vim-illuminate",
        top_clause=[
            PluginClause.make_paragraph(),
            PluginClause.make_tripple_comment("---- Highlight ----"),
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
        "kyazdani42",
        "nvim-web-devicons",
        top_clause=[
            PluginClause.make_paragraph(),
            PluginClause.make_tripple_comment("---- UI ----"),
            PluginClause.make_single_comment("Icon"),
            PluginClause.make_if_has("nvim"),
        ],
    ),
    PluginContext(
        "ryanoasis",
        "vim-devicons",
        top_clause=PluginClause.make_else(),
        bottom_clause=PluginClause.make_endif(),
    ),
    PluginContext(
        "romgrk",
        "barbar.nvim",
        top_clause=[
            PluginClause.make_tripple_comment("---- Tabline ----"),
            PluginClause.make_if_has("nvim-0.7"),
        ],
    ),
    PluginContext(
        "bagrat",
        "vim-buffet",
        top_clause=PluginClause.make_else(),
        bottom_clause=PluginClause.make_endif(),
    ),
    PluginContext(
        "kyazdani42",
        "nvim-tree.lua",
        top_clause=[
            PluginClause.make_tripple_comment("---- Explorer ----"),
            PluginClause.make_if_has("nvim-0.7"),
        ],
    ),
    PluginContext("lambdalisue", "fern.vim", top_clause=PluginClause.make_else()),
    PluginContext("lambdalisue", "nerdfont.vim"),
    PluginContext("lambdalisue", "fern-renderer-nerdfont.vim"),
    PluginContext("lambdalisue", "glyph-palette.vim"),
    PluginContext(
        "lambdalisue",
        "fern-git-status.vim",
        bottom_clause=PluginClause.make_endif(),
    ),
    PluginContext("jlanzarotta", "bufexplorer"),
    PluginContext(
        "lukas-reineke",
        "indent-blankline.nvim",
        top_clause=[
            PluginClause.make_single_comment("Indentline"),
            PluginClause.make_if_has("nvim-0.5"),
        ],
        tag=PluginTag.HIGHLIGHT,
    ),
    PluginContext(
        "Yggdroot",
        "indentLine",
        top_clause=PluginClause.make_else(),
        bottom_clause=PluginClause.make_endif(),
        tag=PluginTag.HIGHLIGHT,
    ),
    PluginContext(
        "nvim-lualine",
        "lualine.nvim",
        top_clause=[
            PluginClause.make_tripple_comment("---- Statusline ----"),
            PluginClause.make_if_has("nvim-0.5"),
        ],
    ),
    PluginContext(
        "itchyny",
        "lightline.vim",
        top_clause=PluginClause.make_else(),
        bottom_clause=PluginClause.make_endif(),
    ),
    PluginContext(
        "airblade",
        "vim-gitgutter",
        top_clause=[
            PluginClause.make_paragraph(),
            PluginClause.make_tripple_comment("---- Git ----"),
        ],
        tag=PluginTag.EDITING,
    ),
    PluginContext("itchyny", "vim-gitbranch", tag=PluginTag.EDITING),
    PluginContext(
        "f-person",
        "git-blame.nvim",
        top_clause=PluginClause.make_if_has("nvim-0.5"),
        bottom_clause=PluginClause.make_endif(),
        tag=PluginTag.HIGHLIGHT,
    ),
    PluginContext(
        "liuchengxu",
        "vista.vim",
        top_clause=[
            PluginClause.make_paragraph(),
            PluginClause.make_tripple_comment("---- Tags ----"),
        ],
    ),
    PluginContext("ludovicchabant", "vim-gutentags"),
    PluginContext(
        "junegunn",
        "fzf",
        post="{'do': { -> fzf#install() }}",
        top_clause=[
            PluginClause.make_paragraph(),
            PluginClause.make_tripple_comment("---- Search ----"),
        ],
    ),
    PluginContext("junegunn", "fzf.vim"),
    PluginContext(
        "neoclide",
        "coc.nvim",
        post="{'branch': 'release'}",
        top_clause=[
            PluginClause.make_paragraph(),
            PluginClause.make_tripple_comment("---- Language server ----"),
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
            PluginClause.make_paragraph(),
            PluginClause.make_tripple_comment("---- Language support ----"),
        ],
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "justinmk",
        "vim-syntax-extra",
        post="{'for': ['lex', 'flex', 'yacc', 'bison']}",
        top_clause=PluginClause.make_single_comment("Lex/flex, yacc/bison"),
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "rhysd",
        "vim-llvm",
        post="{ 'for': ['llvm', 'mir', 'mlir', 'tablegen'] }",
        top_clause=PluginClause.make_single_comment("LLVM"),
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "uarun",
        "vim-protobuf",
        post="{ 'for': ['proto'] }",
        top_clause=PluginClause.make_single_comment("Protobuf"),
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "zebradil",
        "hive.vim",
        post="{ 'for': ['hive']  }",
        top_clause=PluginClause.make_single_comment("Hive"),
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "neovimhaskell",
        "haskell-vim",
        post="{ 'for': ['haskell'] }",
        top_clause=PluginClause.make_single_comment("Haskell"),
        tag=PluginTag.LANGUAGE,
    ),
    PluginContext(
        "alvan",
        "vim-closetag",
        top_clause=[
            PluginClause.make_paragraph(),
            PluginClause.make_tripple_comment("---- Editing enhancement ----"),
            PluginClause.make_single_comment("HTML tag"),
        ],
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "numToStr",
        "Comment.nvim",
        top_clause=[
            PluginClause.make_single_comment("Comment"),
            PluginClause.make_if_has("nvim"),
        ],
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "tomtom",
        "tcomment_vim",
        top_clause=PluginClause.make_else(),
        bottom_clause=PluginClause.make_endif(),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "phaazon",
        "hop.nvim",
        post="{'branch': 'v2'}",
        top_clause=[
            PluginClause.make_single_comment("Cursor motion"),
            PluginClause.make_if_has("nvim-0.5"),
        ],
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "easymotion",
        "vim-easymotion",
        top_clause=PluginClause.make_else(),
        bottom_clause=PluginClause.make_endif(),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "windwp",
        "nvim-autopairs",
        top_clause=[
            PluginClause.make_single_comment("Auto pair"),
            PluginClause.make_if_has("nvim-0.5"),
        ],
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "jiangmiao",
        "auto-pairs",
        top_clause=PluginClause.make_else(),
        bottom_clause=PluginClause.make_endif(),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "chaoren",
        "vim-wordmotion",
        top_clause=PluginClause.make_single_comment("Word motion"),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "mattn",
        "emmet-vim",
        top_clause=PluginClause.make_single_comment("HTML"),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "mbbill",
        "undotree",
        top_clause=PluginClause.make_single_comment("Undo"),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "editorconfig",
        "editorconfig-vim",
        top_clause=PluginClause.make_single_comment("Editor config"),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "haya14busa",
        "is.vim",
        top_clause=[
            PluginClause.make_single_comment("Incremental search"),
            PluginClause.make_if_has("patch-8.0.1238"),
        ],
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "haya14busa",
        "incsearch.vim",
        top_clause=PluginClause.make_else(),
        bottom_clause=PluginClause.make_endif(),
        tag=PluginTag.EDITING,
    ),
    PluginContext(
        "tpope",
        "vim-repeat",
        tag=PluginTag.EDITING,
        top_clause=PluginClause.make_single_comment("Other"),
    ),
    PluginContext("tpope", "vim-surround", tag=PluginTag.EDITING),
]


class Render(IndentLevel):
    def __init__(
        self,
        static_color=None,
        disable_color=False,
        disable_highlight=False,
        disable_language=False,
        disable_editing=False,
        disable_ctrl_keys=False,
        disable_plugins=None,
    ):
        IndentLevel.__init__(self)
        self.static_color = static_color
        self.disable_color = disable_color
        self.disable_highlight = disable_highlight
        self.disable_language = disable_language
        self.disable_editing = disable_editing
        self.disable_ctrl_keys = disable_ctrl_keys
        self.disable_plugins = disable_plugins

    def render(self):
        core_plugins, core_vimrcs, core_color_settings = self.render_core()
        plugin_stmts = self.render_plugin_stmts(core_plugins)
        setting_stmts, color_setting_stmts = self.render_setting_stmts(
            core_color_settings
        )
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
        if self.disable_ctrl_keys:
            vimrc_stmts.append(
                Stmt(
                    SingleQuoteCommentExpr(
                        LiteralExpr("Windows CTRL+{a,s,x,c,v} keys disabled")
                    )
                )
            )
        else:
            vimrc_stmts.append(SourceVimDirStmt("standalone/ctrlkeys.vim"))

        # insert core vimrc statements
        vimrc_stmts.extend(core_vimrcs)

        vimrc_stmts.append(EmptyStmt())
        vimrc_stmts.append(
            Stmt(TrippleQuotesCommentExpr(LiteralExpr("---- Custom settings ----")))
        )
        vimrc_stmts.append(SourceVimDirStmt("settings.vim"))
        return vimrc_stmts

    # settings.vim and color-settings.vim
    def render_setting_stmts(self, core_color_settings):
        setting_stmts = []
        setting_stmts.append(
            CocExtensionContent(
                self.disable_language,
                disable_sh=IS_WINDOWS or self.disable_language,
                disable_powershell=not IS_WINDOWS or self.disable_language,
            )
        )
        setting_stmts.extend(
            [
                EmptyStmt(),
                Stmt(TrippleQuotesCommentExpr(LiteralExpr("---- Color schemes ----"))),
                SourceVimDirStmt("color-settings.vim"),
            ]
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
                                FunctionInvokeExpr(LiteralExpr("NextRandomColorScheme"))
                            )
                        )
                    ),
                ]
            )
        setting_stmts.append(
            TemplateContent(pathlib.Path(f"{TEMPLATE_DIR}/settings-template.vim"))
        )

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

        return setting_stmts, color_setting_stmts

    def render_core(self):
        plugin_stmts = []
        vimrc_stmts = []
        color_setting_stmts = []
        for ctx in PLUGIN_CONTEXTS:
            assert isinstance(ctx, PluginContext)
            # top
            if ctx.top_clause:
                tclauses = (
                    ctx.top_clause
                    if isinstance(ctx.top_clause, list)
                    else [ctx.top_clause]
                )
                for clause in tclauses:
                    assert isinstance(clause, PluginClause)
                    if clause.kind == PluginClauseKind.PARAGRAPH:
                        plugin_stmts.append(EmptyStmt())
                        vimrc_stmts.append(EmptyStmt())
                    elif clause.kind == PluginClauseKind.SINGLE_COMMENT:
                        sc = Stmt(
                            IndentExpr(
                                SingleQuoteCommentExpr(LiteralExpr(clause.value)),
                                self.indentlevel,
                            )
                        )
                        plugin_stmts.append(sc)
                        vimrc_stmts.append(sc)
                    elif clause.kind == PluginClauseKind.TRIPPLE_COMMENT:
                        tc = Stmt(
                            IndentExpr(
                                TrippleQuotesCommentExpr(LiteralExpr(clause.value)),
                                self.indentlevel,
                            ),
                        )
                        plugin_stmts.append(tc)
                        vimrc_stmts.append(tc)
                    elif clause.kind == PluginClauseKind.IF_HAS:
                        ih = Stmt(
                            IndentExpr(
                                IfExpr(HasExpr(SingleQuoteStringExpr(clause.value))),
                                self.indentlevel,
                            ),
                        )
                        plugin_stmts.append(ih)
                        vimrc_stmts.append(ih)
                        if ctx.tag == PluginTag.COLORSCHEME:
                            color_setting_stmts.append(ih)
                        self.inc_indentlevel()
                    elif clause.kind == PluginClauseKind.IF_NOT_HAS:
                        inh = Stmt(
                            IndentExpr(
                                IfExpr(
                                    NotExpr(
                                        HasExpr(SingleQuoteStringExpr(clause.value))
                                    )
                                ),
                                self.indentlevel,
                            ),
                        )
                        plugin_stmts.append(inh)
                        vimrc_stmts.append(inh)
                        self.inc_indentlevel()
                    elif clause.kind == PluginClauseKind.ELSEIF_HAS:
                        eih = Stmt(
                            IndentExpr(
                                ElseifExpr(
                                    HasExpr(SingleQuoteStringExpr(clause.value))
                                ),
                                self.get_dec_indentlevel(),
                            ),
                        )
                        plugin_stmts.append(eih)
                        vimrc_stmts.append(eih)
                    elif clause.kind == PluginClauseKind.ELSEIF_NOT_HAS:
                        einh = Stmt(
                            IndentExpr(
                                ElseifExpr(
                                    NotExpr(
                                        HasExpr(SingleQuoteStringExpr(clause.value))
                                    )
                                ),
                                self.get_dec_indentlevel(),
                            ),
                        )
                        plugin_stmts.append(einh)
                        vimrc_stmts.append(einh)
                    elif clause.kind == PluginClauseKind.ELSE:
                        e = Stmt(IndentExpr(ElseExpr(), self.get_dec_indentlevel()))
                        plugin_stmts.append(e)
                        vimrc_stmts.append(e)
                    else:
                        assert False
            # body
            if self.skip_disabled(ctx):
                # skip disabled plugins
                ec = Stmt(IndentExpr(EmptyCommentExpr(), self.indentlevel))
                plugin_stmts.append(ec)
                vimrc_stmts.append(ec)
                if ctx.tag == PluginTag.COLORSCHEME:
                    color_setting_stmts.append(ec)
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
                    vimrc_stmts.append(
                        Stmt(IndentExpr(EmptyCommentExpr(), self.indentlevel))
                    )
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
                bclauses = (
                    ctx.bottom_clause
                    if isinstance(ctx.bottom_clause, list)
                    else [ctx.bottom_clause]
                )
                for clause in bclauses:
                    assert isinstance(clause, PluginClause)
                    if clause.kind == PluginClauseKind.ENDIF:
                        self.dec_indentlevel()
                        ei = Stmt(IndentExpr(EndifExpr(), self.indentlevel))
                        plugin_stmts.append(ei)
                        vimrc_stmts.append(ei)
                        if ctx.tag == PluginTag.COLORSCHEME:
                            color_setting_stmts.append(ei)
                    else:
                        assert False

        return plugin_stmts, vimrc_stmts, color_setting_stmts

    def skip_disabled(self, ctx):
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
            message(f"install {HOME_DIR}\\_(g)vimrc for vim on windows")
            vimrc_path = pathlib.Path(f"{HOME_DIR}\\_vimrc")
        else:
            message(f"install ~/.(g)vimrc for vim")
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
    "--disable-ctrl-keys",
    "disable_ctrl_keys_opt",
    is_flag=True,
    help="Disable windows ctrl keys",
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
    disable_ctrl_keys_opt,
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
        disable_ctrl_keys_opt,
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
