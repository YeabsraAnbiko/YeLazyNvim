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

### UI & UX
- **Tokyonight**: Beautiful and modern theme  
- **lualine.nvim**: Fast statusline  
- **nvim-navic**: Breadcrumbs from LSP symbols  
- **nvim-colorizer.lua**: Highlights color codes  
- **nvim-web-devicons**: File icons for Neovim
- **indent-blankline.nvim**: Indentation guides
- **gitsigns.nvim**: Git diff signs in the gutter
- **lspkind.nvim**: LSP icons for diagnostics and code actions
- **telescope-ui-select.nvim**: Telescope UI selector
- **diffview.nvim**: Git diff viewer

### Navigation & Search
- **telescope.nvim**: Finder over files, LSP, buffers  
- **neo-tree.nvim**: Tree-based file explorer  

### Git & Undo History
- **Neogit**: Git interface inside Neovim 
- **diffview.nvim**: Git diff viewer
- **gitsigns.nvim**: Git diff signs in gutter  
- **undotree**: Undo history visualization  

### LSP & Tools
- **nvim-lspconfig**: Easy LSP server config  
- **mason.nvim**: Install LSP servers and tools  
- **mason-lspconfig.nvim**: Mason + LSP bridge  
- **nvim-navic**: Breadcrumbs from LSP symbols  
- Diagnostics, hover, rename, and more  

### Autocompletion
- **copilot.lua**: GitHub Copilot integration
- **copilot-cmp**: Copilot source for nvim-cmp
- **nvim-cmp**: Completion engine  
- **cmp-nvim-lsp**: LSP source for cmp  
- **cmp-path, cmp-buffer, cmp_luasnip**  
- **LuaSnip**: Snippet engine  
- **mini.pairs**: Auto-pairing  

### Syntax & Structure
- **nvim-treesitter**: Syntax-aware parsing and highlighting  
- **nvim-ts-autotag**: Auto-close/rename HTML tags  

### Debugging
- **nvim-dap**: Debug Adapter Protocol support  
- **nvim-dap-ui**: Visual DAP controls  

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



Feel free to fork, clone, and contribute to make YeLazyNvim even better!

