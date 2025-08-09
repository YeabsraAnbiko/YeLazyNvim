# YeLazyNvim

YeLazyNvim is a modular, clean, and performant Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim). It’s designed for developers who want a powerful and easy setup.

---

## ✨ Highlights

- **Modular Design**: Plugins and settings are organized thematically (e.g., `dap.lua`, `lsp.lua`, `git_and_undo.lua`).
- **Well-Chosen Plugins**: Includes top-tier plugins like Telescope, Treesitter, LSP, CMP, DAP, and more.
- **Thoughtful Configuration**: Keybindings, styling, breadcrumbs (via `nvim-navic`), and rich UI polish.
- **Performance-Oriented**: Uses lazy-loading (`event = "VeryLazy"` or `BufReadPost`) for fast startup and responsiveness.

---

## 🚀 Installation

Clone this repo into your Neovim config folder:

```bash
git clone https://github.com/YeabsraAnbiko/YeLazyNvim ~/.config/nvim
```

# YeLazyNvim Configuration Overview

## 🛠️ Customization

Edit files inside `~/.config/nvim/lua/plugins/` and `~/.config/nvim/lua/config/` for:

- Keybindings
- Plugin configurations
- LSP server setup
- UI theming

---

## 🧠 Plugin Breakdown

### Plugin Manager
- **lazy.nvim**: Declarative and efficient plugin loader

telescope-ui-select.nvim: Telescope UI selector
### UI & UX
- **Tokyonight**: Beautiful and modern theme  
- **lualine.nvim**: Fast statusline  
- **nvim-navic**: Breadcrumbs from LSP symbols  
- **nvim-colorizer.lua**: Highlights color codes  
- **nvim-web-devicons**: File icons for Neovim
- **indent-blankline.nvim**: Indentation guides
- **gitsigns.nvim**: Git diff signs in the gutter
- **lspkind.nvim**: LSP icons for diagnostics and code actions

### Navigation & Search
- **telescope.nvim**: Finder over files, LSP, buffers  
- **telescope-fzf-native.nvim**: FZF sorter for Telescope (native extension)
- **neo-tree.nvim**: Tree-based file explorer  
- **nvim-window-picke**r: Window picker UI

### Git & Undo History
- **Neogit**: Git interface inside Neovim (loaded on demand)
- **diffview.nvim**: Git diff viewer (loaded on demand)
- **gitsigns.nvim**: Git diff signs in gutter  
- **undotree**: Undo history visualization  (loaded on demand)

### LSP & Tools
- **nvim-lspconfig**: Easy LSP server config  
- **mason.nvim**: Install LSP servers and tools  
- **mason-lspconfig.nvim**: Mason and LSP bridge  
- **nvim-lsp-file-operations**: File operations with LSP integration
- **nvim-navic**: Breadcrumbs from LSP symbols  

### Autocompletion
- **nvim-cmp**: Completion engine  
- **cmp-nvim-lsp**: LSP source for cmp  
- **cmp-buffer**: Buffer source for nvim-cmp
- **cmp-path**: Path completion source
- **cmp_luasnip**: Snippet completion source
- **copilot-cmp**: GitHub Copilot source for nvim-cmp (loaded)
- **copilot.lua**: GitHub Copilot integration (lazy-loaded on InsertEnter)
- **cmp-path, cmp-buffer, cmp_luasnip**  
- **LuaSnip**: Snippet engine  
- **friendly-snippets**: Collection of snippets
- **mini.pairs**: Auto-pairing of brackets and quotes

### Syntax & Structure
- **nvim-treesitter**: Syntax-aware parsing and highlighting  
- **nvim-ts-autotag**: Auto-close and rename HTML tags  
- **nvim-treesitter-textobjects**: Text objects powered by Treesitter

### Debugging
- **nvim-dap**: Debug Adapter Protocol support  
- **nvim-dap-ui**: UI for nvim-dap
- **mason-nvim-dap.nvim**: Mason integration for DAP
- **nvim-dap-virtual-text**: Virtual text support for debugging
- **nvim-nio**: Additional DAP utilities

---

## 🧩 Structure

```bash
~/.config/nvim/
├── lua/
│   ├── config/          # General settings (keymaps, options)
│   └── plugins/         # All plugin specs (modular)
├── init.lua             # Entry point for lazy.nvim
└── README.md            # This file
```
---

## 📄 License

This project is licensed under the **MIT License**. See the `LICENSE` file for full details.

---

## 🙌 Credits

Special thanks to the amazing authors and maintainers of:

- [lazy.nvim](https://github.com/folke/lazy.nvim)  
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)  
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)  
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  
- [mason.nvim](https://github.com/mason-org/mason.nvim)  
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)  
- and many others whose plugins are included!

Feel free to fork, clone, and contribute to make YeLazyNvim even better!

