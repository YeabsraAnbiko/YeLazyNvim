
# YeLazyNvim

**YeLazyNvim** is a modular, clean, and performance-focused Neovim configuration built on top of [lazy.nvim](https://github.com/folke/lazy.nvim). It is designed for developers who want a modern Neovim setup with sensible defaults, strong language tooling, and thoughtful UI/UX polish-without unnecessary bloat.

---

## Highlights

- **Modular Architecture**  
    Plugins and configuration are organized by responsibility (LSP, UI, completion, debugging, etc.) for clarity and maintainability.
- **Curated Plugin Stack**  
    Includes best-in-class plugins for LSP, completion, formatting, Git, debugging, navigation, and UI.
- **Performance-Oriented**  
    Aggressive lazy-loading (`VeryLazy`, `BufReadPre`, `InsertEnter`, keybind triggers) ensures fast startup and responsive editing.
- **Developer-Centric UX**  
    Breadcrumbs, folding, formatting-on-save, Git integration, AI assistance, and polished defaults.

---

## Installation

Clone the repository into your Neovim configuration directory:

`git clone https://github.com/YeabsraAnbiko/YeLazyNvim ~/.config/nvim`

Launch Neovim and allow `lazy.nvim` to install the plugins automatically.

---

## Customization

Configuration is intentionally straightforward:

- `lua/config/` - core settings (options, keymaps, autocmds)
- `lua/plugins/` - individual plugin specifications and setup

You can easily:

- Add or remove plugins
- Adjust keybindings
- Configure LSP servers and formatters
- Change themes and UI behavior

---

## Plugin Breakdown

### Plugin Manager

- **lazy.nvim** - Declarative, fast, and efficient plugin manager

---

### UI & UX

- **tokyonight.nvim** - Modern, clean colorscheme
- **lualine.nvim** - Fast and minimal statusline
- **nvim-web-devicons** - File icons
- **nvim-navic** - LSP-based breadcrumbs
- **nvim-colorizer.lua** - Inline color highlighting
- **indent-blankline.nvim** - Indentation guides
- **nvim-ufo** - Advanced code folding
- **cloak.nvim** - Conceals sensitive values (e.g., `.env` secrets)
- **dressing.nvim** - Improved `vim.ui` select/input UIs

---

### Navigation & Search

- **telescope.nvim** - Fuzzy finder for files, buffers, LSP symbols
- **telescope-fzf-native.nvim** - Native FZF sorter
- **telescope-ui-select.nvim** - Telescope-powered UI selectors
- **neo-tree.nvim** - Tree-based file explorer
- **oil.nvim** - Edit your filesystem like a buffer

---

### Git & Undo

- **gitsigns.nvim** - Git diff indicators in the gutter
- **neogit** - Magit-like Git UI (lazy-loaded)
- **diffview.nvim** - Side-by-side Git diff viewer (lazy-loaded)
- **undotree** - Visual undo history (lazy-loaded)

---

### LSP & Language Tooling

- **nvim-lspconfig** - LSP client configurations
- **mason.nvim** - Install LSP servers, linters, and formatters
- **mason-lspconfig.nvim** - Mason LSP bridge
- **nvim-lsp-file-operations** - File operations with LSP awareness
- **lazydev.nvim** - Improved Lua development for Neovim configs
- **nvim-jdtls** - Java language server integration
- **lsp_lines.nvim** - Inline LSP diagnostics (toggleable)

---

### Formatting & Code Quality

- **conform.nvim** - Fast, async code formatting (format-on-save ready)

---

### Autocompletion & Snippets

- **nvim-cmp** - Completion engine
- **cmp-nvim-lsp** - LSP completion source
- **cmp-buffer** - Buffer completion source
- **cmp-path** - Path completion source
- **cmp-cmdline** - Command-line completion
- **cmp_luasnip** - Snippet completion source
- **LuaSnip** - Snippet engine
- **friendly-snippets** - Predefined snippet collection
- **lspkind.nvim** - Completion item icons
- **mini.pairs** - Automatic bracket and quote pairing

---

### AI Assistance

- **copilot.lua** - GitHub Copilot integration
- **copilot-cmp** - Copilot source for `nvim-cmp`
- **avante.nvim** - AI-powered coding assistant and workflows

---

### Syntax & Structure

- **nvim-treesitter** - Syntax-aware parsing and highlighting
- **nvim-ts-autotag** - Auto-close and rename HTML/JSX tags
- **nvim-treesitter-textobjects** - Treesitter-powered text objects

---

### Debugging

- **nvim-dap** - Debug Adapter Protocol support
- **nvim-dap-ui** - Debugging UI
- **nvim-dap-virtual-text** - Inline variable values
- **mason-nvim-dap.nvim** - Mason integration for DAP
- **nvim-nio** - Async utilities for DAP

---

### Markdown

- **render-markdown.nvim** - Enhanced Markdown rendering (lazy-loaded)

---

## Project Structure

```bash
-~/.config/nvim/
-├── lua/
-│   ├── config/          # General settings (keymaps, options)
-│   └── plugins/         # All plugin specs (modular)
-├── init.lua             # Entry point for lazy.nvim
-└── README.md            # This file
```

---

## License

This project is licensed under the **MIT License**. See the `LICENSE` file for details.

---

## Credits

This configuration stands on the shoulders of excellent open-source work, including but not limited to:

- lazy.nvim
- nvim-treesitter
- telescope.nvim
- nvim-cmp
- mason.nvim
- nvim-dap

.and many other outstanding Neovim plugin authors.
