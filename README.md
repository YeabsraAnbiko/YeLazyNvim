# YeNvim

This is my custom Neovim configuration powered by `lazy.nvim`. The setup includes various plugins and settings that enhance productivity and development experience in Neovim.

## Features

- **lazy.nvim** for plugin management
- Pre-configured settings for a seamless Neovim experience
- Support for essential plugins for code editing, file navigation, and LSP integration

## Installation

1. Clone the repository into your `~/.config/nvim` directory:

   ```bash
   git clone https://github.com/YeabsraAnbiko/YeLazyNvim ~/.config/nvim
2. Open Neovim and run the following command to install the plugins:

   ```vim
    :Lazy sync

## Customization
You can customize the Neovim configuration by modifying the files inside the lua/ directory. These files contain various settings and plugin configurations that you can tweak to your liking.

## Lua Configuration
The main configuration files are located in lua/config/ and lua/plugins/. Feel free to modify the settings according to your preferences.

## Plugins
This setup uses lazy.nvim to manage plugins. You can easily add, remove, or update plugins in the lua/ directory.

## Plugins Included

This Neovim setup includes a curated set of plugins managed by [lazy.nvim](https://github.com/folke/lazy.nvim), aimed at improving your development workflow:

### Plugin Manager
- **lazy.nvim**: The plugin manager used to handle all other plugins.

### UI Enhancements
- **rose-pine**: A warm, modern colorscheme with support for various plugins and terminals.
- **lualine.nvim**: A fast and beautiful statusline written in Lua, with icon support via `nvim-web-devicons`.

### Fuzzy Finding
- **telescope.nvim**: A powerful fuzzy finder over lists (files, buffers, LSP symbols, etc.), requires `plenary.nvim`.

### Git Integration and History
- **vim-fugitive**: A Git wrapper providing powerful Git commands from within Neovim.
- **vim-gitgutter**: Shows Git diff indicators in the sign column.
- **undotree**: Visualizes the undo history in a tree format.

### LSP, Syntax Highlighting, and Language Support
- **nvim-lspconfig**: Configures built-in LSP client for various programming languages.
- **nvim-treesitter**: Provides better syntax highlighting and parsing through tree-sitter.
- **mason.nvim** & **mason-lspconfig.nvim**: Easy installation and configuration of LSP servers and related tooling.

### Autocompletion and Editing
- **nvim-cmp**: Completion engine for Neovim.
- **cmp-nvim-lsp**: LSP source for `nvim-cmp`.
- **nvim-ts-autotag**: Automatically close and rename HTML tags using Tree-sitter.
- **mini.pairs**: Lightweight plugin to auto-pair brackets, quotes, etc.

### Debuggers
-nvim-dap
-nvim-dap-ui

## License
MIT License. See LICENSE for details.

## Credits
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Neovim](https://github.com/neovim/neovim)

## Feel free to fork, clone, and contribute to this configuration!
