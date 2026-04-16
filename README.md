# Neovim Config

A personal Neovim config built on Neovim's built-in `vim.pack` plugin manager. Focused on web, mobile, and systems development.

## Requirements

- **Neovim** >= 0.11 (uses `vim.pack` and `vim.lsp.enable`)
- **Git**
- **A Nerd Font** (for icons — e.g. [JetBrainsMono Nerd Font](https://www.nerdfonts.com/))
- **fzf** — required by fzf-lua (`brew install fzf`)
- **Node.js** — required by many LSP servers
- **Mason-installed tools** (installed via `:Mason` on first launch):
  - `stylua` — Lua formatter
  - `prettierd` — JS/TS/Svelte/Astro formatter
  - `rustfmt` — Rust formatter (comes with Rust toolchain)

## Installation

```bash
git clone https://github.com/<you>/nvim-config ~/.config/nvim
nvim
```

On first launch, `vim.pack` will automatically install all plugins listed in the lock file. LSP servers are managed via Mason — run `:Mason` to install servers manually, or they will be picked up if already on your `$PATH`.

## Plugin Manager

This config uses **`vim.pack`** — Neovim's built-in package manager (no lazy.nvim, packer, etc).

Plugins are declared per-file using `vim.pack.add()`:

```lua
vim.pack.add({ "https://github.com/author/plugin.nvim" })
```

The lock file `nvim-pack-lock.json` pins every plugin to a specific git commit for reproducible installs.

### Updating Plugins

```vim
:packupdate       " update all plugins
```

To pin a specific version, set the `version` key:

```lua
vim.pack.add({ { src = "https://github.com/author/plugin", version = "v1.0.0" } })
```

## Plugins

| Plugin | Purpose |
|--------|---------|
| `nvim-lspconfig` + `mason.nvim` | Core LSP setup & server installer |
| `blink.cmp` | Completion engine (v1.6.0) |
| `LuaSnip` | Snippet engine |
| `conform.nvim` | Code formatting |
| `nvim-treesitter` | Syntax highlighting |
| `fzf-lua` | Fuzzy finder |
| `oil.nvim` | File explorer (default) |
| `neo-tree.nvim` | Tree-style file explorer |
| `flash.nvim` | Enhanced motion/jumping |
| `catppuccin` | Color scheme (Macchiato) |
| `lualine.nvim` | Status bar |
| `windows.nvim` | Window management |
| `nvim-autopairs` | Auto-close brackets/quotes |
| `nvim-ts-autotag` | Auto-close HTML tags |
| `marks.nvim` | Mark navigation with visual indicators |
| `typescript-tools.nvim` | Enhanced TypeScript/JavaScript LSP |
| `flutter-tools.nvim` | Flutter/Dart development |
| `roslyn.nvim` | C# via Roslyn LSP |
| `lazydev.nvim` | Lua type hints & completion |
| `claude-code.nvim` | Claude Code integration |
| `dressing.nvim` | Improved input/select UI |
| `alpha-nvim` | Dashboard (currently disabled) |
| `plenary.nvim` + `nui.nvim` | Lua utilities & UI components |
| `nvim-web-devicons` | File type icons |

## LSP Servers

Servers enabled via `vim.lsp.enable()` — configure in `lua/plugins/lsp/nvim-lsp.lua`:

| Server | Language |
|--------|----------|
| `lua_ls` | Lua |
| `svelte` | Svelte |
| `html` | HTML |
| `astro` | Astro |
| `tailwindcss` | Tailwind CSS |
| `cssls` | CSS / SCSS |
| `typescript-tools` | TypeScript / JavaScript |
| `flutter-tools` (dartls) | Flutter / Dart |
| `roslyn` | C# |

## Formatters

Configured in `lua/plugins/lsp/conform.lua`. Format runs automatically on save (500ms timeout).

| Language | Formatter |
|----------|-----------|
| Lua | `stylua` |
| Rust | `rustfmt` (fallback: LSP) |
| JavaScript / TypeScript | `prettierd` |
| Svelte | `prettierd` |
| Astro | `prettierd` |
| Dart | LSP |
| C# | LSP |

## Keybindings

**Leader key**: `<Space>`

### General

| Key | Action |
|-----|--------|
| `<leader>w` | Save file |
| `<leader>q` | Quit (force) |
| `<leader>o` | Source current config |
| `<leader>y` | Yank to system clipboard |

### Buffers

| Key | Action |
|-----|--------|
| `<S-l>` | Next buffer |
| `<S-h>` | Previous buffer |
| `<leader>b` | Toggle to previous buffer |
| `<leader>d` | Close current buffer |
| `<leader>bo` | Close all other buffers |
| `<leader>D` | Close all buffers |

### Windows

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate between windows |
| `<leader>mp` | Maximize current window |

### File Navigation

| Key | Action |
|-----|--------|
| `<leader>pv` | Open Oil file explorer |
| `<leader>fp` | Find files (fzf) |
| `<leader>fg` | Live grep (fzf) |
| `<leader>fs` | Grep current buffer (fzf) |
| `<leader>fh` | Search help tags (fzf) |
| `<leader>fm` | Find marks (fzf) |
| `<leader>h` | Find open buffers (fzf) |

#### Oil (file explorer) keymaps

| Key | Action |
|-----|--------|
| `<CR>` | Open file/directory |
| `-` | Go to parent directory |
| `<C-v>` | Open in vertical split |
| `<leader>p` | Open in new tab |
| `<C-p>` | Preview file |
| `<C-r>` | Refresh |
| `q` / `<C-w>` | Close Oil |
| `g.` | Toggle hidden files |
| `g?` | Show help |

### Motion

| Key | Action |
|-----|--------|
| `s` | Flash jump (normal / visual / operator) |

### LSP (active when LSP attaches)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gt` | Go to type definition |
| `gi` | Go to implementation |
| `grr` | Find references |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>e` | Show diagnostics (float) |
| `<leader>lf` | Format buffer |

### Flutter

| Key | Action |
|-----|--------|
| `<leader>ft` | Flutter commands (Telescope) |
| `<leader>fl` | Toggle Flutter dev log |

### Claude Code

| Key | Action |
|-----|--------|
| `<leader>cl` | Toggle Claude Code panel |
| `<leader>cC` | Toggle with `--continue` flag |
| `<leader>cV` | Toggle with `--verbose` flag |

## Options Highlights

- **Indentation**: 2 spaces (expandtab)
- **Line numbers**: Absolute + relative
- **Undo**: Persistent across sessions, 1000 levels
- **Splits**: Open below and to the right
- **Borders**: Rounded window borders
- **Swap files**: Disabled
- **Wrap**: Disabled
- **Scroll offset**: 8 lines

## Directory Structure

```
~/.config/nvim/
├── init.lua                  # Entry point
├── nvim-pack-lock.json       # Plugin lock file
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
            ├── typescript-tools.lua
            ├── flutter-tools.lua
            └── roslyn.lua    # C#
```
