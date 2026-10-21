# Neovim Config

A personal Neovim config built on Neovim's built-in `vim.pack` plugin manager. Focused on web, mobile, and systems development.

## Requirements

- Neovim >= 0.12 (uses `vim.pack`, the experimental `ui2`, and the bundled `nvim.undotree` and `nvim.difftool` packages)
- Git
- A Nerd Font for icons, e.g. [JetBrainsMono Nerd Font](https://www.nerdfonts.com/)
- `fzf`, required by fzf-lua (`brew install fzf`)
- Node.js, required by many LSP servers and `prettierd`
- Formatters on your `$PATH`, either through `:Mason` or installed separately:
  - `stylua` for Lua
  - `prettierd` for the web and data filetypes listed under Formatters
  - `rustfmt` for Rust (comes with the Rust toolchain)
- [FVM](https://fvm.app/) for Flutter, since flutter-tools runs with `fvm = true`

## Installation

```bash
git clone git@github.com:callumw-k/based-nvim.git ~/.config/nvim
nvim
```

On first launch, `vim.pack` installs every plugin listed in the lock file. LSP servers are installed through `:Mason`.

## Plugin Manager

Plugins are declared per file using `vim.pack.add()`:

```lua
vim.pack.add({ "https://github.com/author/plugin.nvim" })
```

The lock file `nvim-pack-lock.json` pins every plugin to a specific git commit for reproducible installs.

### Updating Plugins

```vim
:lua vim.pack.update()   " update all plugins
```

To pin a specific version, set the `version` key:

```lua
vim.pack.add({ { src = "https://github.com/author/plugin", version = "v1.0.0" } })
```

## Plugins

| Plugin | Purpose |
|--------|---------|
| `nvim-lspconfig` + `mason.nvim` + `mason-lspconfig.nvim` | Core LSP setup and server installer |
| `blink.cmp` | Completion engine (v1.10.2) |
| `LuaSnip` | Snippet engine (v2.4.0) |
| `conform.nvim` | Code formatting |
| `nvim-treesitter` | Syntax highlighting (`main` branch) |
| `fzf-lua` | Fuzzy finder, also used for `vim.ui.select` |
| `oil.nvim` | File explorer (default) |
| `neo-tree.nvim` | Tree-style file explorer (`:Neotree`), closes when a file is opened |
| `flash.nvim` | Enhanced motion/jumping |
| `which-key.nvim` | Popup listing the keymaps that follow a prefix |
| `render-markdown.nvim` | Renders Markdown in the buffer, showing raw text on the cursor line |
| `catppuccin` | Colour scheme (Macchiato) |
| `lualine.nvim` | Status bar, showing the file path relative to the cwd |
| `mini.tabline` | Buffer line, marking modified buffers with `●` |
| `nvim-autopairs` | Auto-close brackets/quotes |
| `nvim-ts-autotag` | Auto-close HTML tags |
| `marks.nvim` | Mark navigation with visual indicators |
| `mini.surround` | Add / delete / replace surroundings |
| `mini.ai` | Extended `a` / `i` text objects |
| `mini.bufremove` | Delete buffers without closing their window |
| `gitsigns.nvim` | Git change signs, hunk staging, blame |
| `nvim-dap` + `nvim-dap-view` | Debugger and its UI |
| `flutter-tools.nvim` | Flutter/Dart development ([callumw-k fork](https://github.com/callumw-k/flutter-tools.nvim)) |
| `roslyn.nvim` | C# via Roslyn LSP |
| `lazydev.nvim` | Lua type hints and completion |
| `claude-code.nvim` | Claude Code integration |
| `plenary.nvim` + `nui.nvim` | Lua utilities and UI components |
| `nvim-web-devicons` | File type icons |

## LSP Servers

`mason-lspconfig` enables every server installed through `:Mason`, and per-server settings go in `vim.lsp.config()`. Mason also pulls from the [Crashdummyy registry](https://github.com/Crashdummyy/mason-registry), which is where the `roslyn` server comes from.

Servers with custom settings:

| Server | Settings | Configured in |
|--------|----------|---------------|
| `ts_ls` | Completes function calls with their parentheses | `lua/plugins/lsp/nvim-lsp.lua` |
| `roslyn` | Inlay hints for implicit object creation and variable types, references code lens | `lua/plugins/lsp/roslyn.lua` |
| `dartls` | 120 character line length, started by flutter-tools rather than Mason | `lua/plugins/lsp/flutter-tools.lua` |

## Formatters

Configured in `lua/plugins/lsp/conform.lua`. Formatting runs on save with a 500ms timeout, and falls back to the LSP for any filetype not listed.

| Language | Formatter |
|----------|-----------|
| Lua | `stylua` |
| Rust | `rustfmt` (fallback: LSP) |
| JavaScript / TypeScript (incl. JSX/TSX) | `prettierd` |
| CSS / SCSS | `prettierd` |
| HTML | `prettierd` |
| JSON / JSONC | `prettierd` |
| YAML | `prettierd` |
| Markdown | `prettierd` |
| Svelte | `prettierd` |
| Astro | `prettierd` |
| Dart | LSP |
| C# | LSP |

## Completion

blink.cmp shows documentation after 250ms and appends `()` to function and method labels. Lua files also get completion from lazydev.

| Key | Action |
|-----|--------|
| `<CR>` | Accept completion |
| `<Tab>` (cmdline) | Accept completion |
| `<CR>` (cmdline) | Accept completion and run the command |

The cmdline menu only opens on its own for `:` commands.

## Keybindings

Leader key: `<Space>`. Press it and wait to see the which-key popup.

### General

| Key | Action |
|-----|--------|
| `<leader>w` | Save file |
| `<leader>q` | Quit window without saving |
| `<leader>o` | Source current file |
| `<leader>y` | Yank to system clipboard (normal / visual) |
| `p` (visual) | Paste without overwriting the register |
| `<leader>v` | Toggle Markdown rendering |

### Buffers

| Key / Command | Action |
|-----|--------|
| `<S-l>` | Next buffer |
| `<S-h>` | Previous buffer |
| `<leader>b` | Switch to alternate buffer |
| `<leader>d` | Force delete current buffer, keeping the window |
| `<leader>O` | Close all other buffers |
| `<leader>D` | Close all buffers |
| `:Bufonly [buffer]` | Close every buffer except the given one (also `:BufOnly`, `:Bonly`, `:BOnly`) |

### Windows

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate between windows |
| `<leader>x` | Close window |
| `<leader>mp` | Zoom current window into its own tab (toggle) |

Windows are equalised horizontally whenever you move into one.

### File Navigation

| Key | Action |
|-----|--------|
| `<leader>pv` | Open Oil file explorer |
| `<leader>fp` | Find files (fzf) |
| `<leader>fg` | Live grep (fzf), skipping `docs/superpowers/` |
| `<leader>fs` | Grep current buffer (fzf) |
| `<leader>fh` | Find open buffers (fzf) |
| `<leader>fm` | Find marks (fzf) |

#### Oil (file explorer) keymaps

| Key | Action |
|-----|--------|
| `<CR>` | Open file/directory |
| `-` | Go to parent directory |
| `_` | Open the cwd |
| `<C-v>` | Open in vertical split |
| `<leader>p` | Open in new tab |
| `<C-p>` | Preview file |
| `<C-r>` | Refresh |
| `q` / `<C-w>` | Close Oil |
| `` ` `` | `:cd` to the current directory |
| `~` | `:tcd` to the current directory |
| `gs` | Change sort order |
| `gx` | Open with the system app |
| `g.` | Toggle hidden files |
| `g\` | Toggle trash |
| `g?` | Show help |

### Motion

| Key | Action |
|-----|--------|
| `s` | Flash jump (normal / visual / operator) |

### Surround (mini.surround)

| Key | Action |
|-----|--------|
| `gsa{motion}{char}` | Add surrounding |
| `gsd{char}` | Delete surrounding |
| `gsr{old}{new}` | Replace surrounding |
| `gsf` / `gsF` | Find surrounding right / left |
| `gsh` | Highlight surrounding |
| `gsn` | Update the number of lines searched |

### Git (active in git-tracked buffers)

| Key | Action |
|-----|--------|
| `]h` / `[h` | Next / previous hunk |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gb` | Blame line |

### Built-in

| Key / Command | Action |
|-----|--------|
| `<leader>u` | Toggle `:Undotree` |
| `:DiffTool {left} {right}` | Diff two files or directories |

### LSP (active when LSP attaches)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gs` | Go to definition in a vertical split |
| `gt` | Go to type definition |
| `gi` | Go to implementation |
| `grr` | Find references |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>e` | Show diagnostics (float) |
| `<leader>lf` | Format buffer (conform) |

### Debugging

The dap-view panel opens and closes with the debug session. In Flutter projects it docks beside the Flutter dev log.

| Key | Action |
|-----|--------|
| `<F5>` | Start / continue |
| `<F9>` | Toggle breakpoint |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>k` | Dap commands picker (`:DapViewToggle` pinned first) |

### Flutter

| Key | Action |
|-----|--------|
| `<leader>j` | Flutter commands picker (`:FlutterLogToggle` pinned first) |

### Claude Code

Claude Code opens in a floating window covering 90% of the editor.

| Key | Action |
|-----|--------|
| `<leader>cl` | Toggle Claude Code panel (normal / terminal) |
| `<leader>cC` | Toggle with `--continue` flag |
| `<leader>cV` | Toggle with `--verbose` flag |

## Options Highlights

- Indentation: 2 spaces (expandtab)
- Line numbers: absolute + relative
- Undo: persistent across sessions, 1000 levels
- Search: case-insensitive unless the pattern has capitals; `:s` previews in a split
- Messages / cmdline: experimental `ui2`
- Splits: open below and to the right, with a 90 column minimum width for the current window
- Borders: rounded window borders
- Swap files: disabled
- Wrap: disabled, except in Markdown, which wraps at word boundaries and moves `j`/`k` by display line
- Scroll offset: 8 lines
- Project config: `exrc` is on, so Neovim asks before loading a `.nvim.lua`, `.nvimrc` or `.exrc` from the cwd

## Directory Structure

```
~/.config/nvim/
├── init.lua                  # Entry point
├── nvim-pack-lock.json       # Plugin lock file
├── after/ftplugin/
│   └── markdown.lua          # Wrapping for Markdown
└── lua/
    ├── options.lua           # Editor options
    ├── keymaps.lua           # Keymap helpers + global bindings
    └── plugins/
        ├── init.lua          # Plugin loader
        ├── *.lua             # Individual plugin configs
        └── lsp/
            ├── init.lua      # LSP loader
            ├── nvim-lsp.lua  # Core LSP + Mason + LSP keymaps
            ├── blink-cmp.lua # Completion
            ├── conform.lua   # Formatting
            ├── luasnip.lua   # Snippets
            ├── lazydev.lua   # Lua dev support
            ├── flutter-tools.lua
            └── roslyn.lua    # C#
```
