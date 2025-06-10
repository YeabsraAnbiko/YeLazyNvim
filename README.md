# YeLazyNvim

YeLazyNvim is a modular, clean, and performant Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim). It’s designed for developers who want a powerful yet minimal setup.

---

## ✨ Highlights

- **Modular Design**: Plugins and settings are organized thematically (e.g., `dap.lua`, `lsp.lua`, `git_and_undo.lua`).
- **Well-Chosen Plugins**: Includes top-tier plugins like Telescope, Treesitter, LSP, CMP, DAP, and more.
- **Thoughtful Configuration**: Keybindings, styling, format-on-save, breadcrumbs (via `nvim-navic`), and rich UI polish.
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
- **rose-pine**: Beautiful and modern theme  
- **lualine.nvim**: Fast statusline  
- **bufferline.nvim**: Tabline with buffer indicators  
- **noice.nvim**: Enhanced command line and LSP UIs  
- **nvim-navic**: Breadcrumbs from LSP symbols  
- **nvim-colorizer.lua**: Highlights color codes  

### Navigation & Search
- **telescope.nvim**: Finder over files, LSP, buffers  
- **neo-tree.nvim**: Tree-based file explorer  
- **vim-tmux-navigator**: Seamless window nav with tmux  

### Git & Undo History
- **vim-fugitive**: Full Git CLI in Neovim  
- **gitsigns.nvim**: Git diff signs in gutter  
- **undotree**: Undo history visualization  

### LSP & Tools
- **nvim-lspconfig**: Easy LSP server config  
- **mason.nvim**: Install LSP servers and tools  
- **mason-lspconfig.nvim**: Mason + LSP bridge  
- **nvim-navic**: Breadcrumbs from LSP symbols  
- Format-on-save, diagnostics, hover, rename, and more  

### Autocompletion
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
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)  
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)  



Feel free to fork, clone, and contribute to make YeLazyNvim even better!

