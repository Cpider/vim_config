# Linux Development Environment Configuration

This repository contains my personal configuration files for Neovim, Ranger, and Oh-My-Zsh, providing a complete terminal-based development environment.

## 📋 Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Neovim Configuration](#neovim-configuration)
- [Ranger Configuration](#ranger-configuration)
- [Oh-My-Zsh Configuration](#oh-my-zsh-configuration)
- [Key Bindings](#key-bindings)
- [Features](#features)
- [Requirements](#requirements)

## Overview

This configuration provides:

- **Neovim**: A powerful text editor with LSP support, fuzzy finding, and extensive plugin ecosystem
- **Ranger**: A terminal-based file manager with vim-like keybindings
- **Oh-My-Zsh**: An enhanced Zsh shell with plugins and themes

## Installation

### Prerequisites

Ensure you have the following installed:

- Neovim (>= 0.5.0)
- Ranger
- Oh-My-Zsh
- Git
- Python 3
- Node.js (for Coc.nvim)
- Vim-plug (Neovim plugin manager)

### Setup Steps

1. **Clone this repository**:
   ```bash
   git clone <your-repo-url> ~/vim_config
   ```

2. **Install Neovim configuration**:
   ```bash
   # Create Neovim config directory if it doesn't exist
   mkdir -p ~/.config/nvim
   
   # Copy configuration files
   cp -r ~/vim_config/nvim/* ~/.config/nvim/
   
   # Install plugins
   nvim +PlugInstall +qall
   ```

3. **Install Ranger configuration**:
   ```bash
   # Create Ranger config directory if it doesn't exist
   mkdir -p ~/.config/ranger
   
   # Copy configuration files
   cp -r ~/vim_config/ranger/* ~/.config/ranger/
   ```

4. **Install Oh-My-Zsh configuration**:
   ```bash
   # Install Oh-My-Zsh first (if not already installed)
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   
   # Copy zshrc
   cp ~/vim_config/omz/.zshrc ~/.zshrc
   ```

## Neovim Configuration

### Main Features

- **Language Server Protocol (LSP)**: Full LSP support via Coc.nvim
- **Fuzzy Finding**: FZF integration for files, buffers, and tags
- **File Navigation**: NERDTree and Coc Explorer
- **Git Integration**: GitGutter, vim-fugitive, and vim-signify
- **Code Completion**: Coc.nvim with multiple language servers
- **Syntax Highlighting**: Enhanced syntax for various languages
- **Markdown Preview**: Live markdown preview in browser

### Supported Languages

- C/C++ (clangd)
- Python (Pyright)
- JavaScript/TypeScript
- Go
- Dart/Flutter
- Java (OmniSharp)
- Shell Script
- Docker
- YAML
- JSON
- CMake
- And more...

### Color Schemes

- **Gruvbox**: Default colorscheme (auto-loaded on startup)
- **Snazzy**: Alternative colorscheme (transparent background)

### Key Customizations

The configuration uses a custom key mapping where:
- `h` → Insert mode
- `j` → Move left
- `k` → Move down
- `l` → Move right
- `i` → Move up

This is a personal preference and can be modified in `init.vim`.

### Important Key Bindings

| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<Space><Space>` | Jump to next `<++>` placeholder |
| `tt` | Toggle file explorer (Coc Explorer) |
| `<C-f>` | FZF file search |
| `<C-a>` | FZF content search (Ag) |
| `<C-b>` | FZF buffer list |
| `<C-t>` | FZF tags search |
| `gd` | Go to definition |
| `gr` | Go to references |
| `M` | Show documentation |
| `T` | Toggle undo tree |
| `<Space>m` | Markdown preview |
| `r` | Compile and run code |

### Plugins

Major plugins include:

- **coc.nvim**: LSP client with extensive language support
- **fzf.vim**: Fuzzy file finder
- **vim-airline**: Status line
- **vim-gitgutter**: Git diff indicators
- **markdown-preview.nvim**: Markdown preview
- **undotree**: Undo history visualization
- **vim-surround**: Surround text objects
- **nerdtree-git-plugin**: Git status in NERDTree
- And many more...

## Ranger Configuration

### Features

- **Vim-like Keybindings**: Familiar navigation for vim users
- **File Icons**: Devicons plugin for better visual file identification
- **Image Preview**: Ueberzug support for image previews
- **Custom Colorschemes**: Multiple color scheme options
- **Quick Navigation**: Custom shortcuts to frequently used directories
- **Git Integration**: LazyGit integration (`<C-g>`)

### Key Bindings

| Key | Action |
|-----|--------|
| `i`, `k`, `j`, `l` | Move up, down, left, right |
| `h` | Toggle expand/collapse directory |
| `o` | Open file in vertical split |
| `O` | Open file in new tab |
| `<Space>` | Toggle file selection |
| `yy` | Copy file |
| `dd` | Cut file |
| `pp` | Paste file |
| `dD` | Delete file |
| `cw` | Rename file |
| `zh` | Toggle hidden files |
| `zf` | Filter files |
| `<C-g>` | Open LazyGit |
| `q` | Quit |

### Custom Directory Shortcuts

The configuration includes many quick navigation shortcuts (e.g., `ghh` for home, `gfn` for neovim config, etc.). See `rc.conf` for the complete list.

### File Opening

Ranger uses `rifle.conf` to determine how to open files. Text files open in Neovim by default.

## Oh-My-Zsh Configuration

### Theme

- **dogenpunk**: Custom theme for the shell prompt

### Plugins

- **git**: Git aliases and functions
- **zsh-history-substring-search**: Enhanced history search
- **zsh-autosuggestions**: Command autosuggestions based on history

### Features

- **FZF Integration**: Enhanced file and command search
- **Custom Aliases**: 
  - `ra`: Quick alias for ranger
- **Environment Variables**: Pre-configured paths for various tools
- **Ranger Integration**: Special prompt when inside ranger

### FZF Configuration

Custom FZF options for better preview and navigation:
- Preview window with syntax highlighting
- Custom key bindings for navigation
- Integration with `ag` (The Silver Searcher)

## Key Bindings Summary

### Neovim

#### Navigation
- `h` → Insert mode
- `j` → Left
- `k` → Down  
- `l` → Right
- `i` → Up
- `<C-h>` → Beginning of line
- `<C-e>` → End of line

#### File Operations
- `S` → Save
- `Q` → Quit
- `R` → Reload config

#### Window Management
- `<Space>i/j/k/l` → Navigate between windows
- `sl/sj/si/sk` → Split windows

#### Code Navigation
- `gd` → Go to definition
- `gr` → Go to references
- `M` → Show documentation
- `[g` / `]g` → Navigate diagnostics

### Ranger

- Vim-like navigation with `i`, `k`, `j`, `l`
- File operations: `yy` (copy), `dd` (cut), `pp` (paste)
- Quick directory navigation with `g` prefix shortcuts

## Features

### Neovim

- ✅ LSP support for multiple languages
- ✅ Fuzzy file finding
- ✅ Git integration
- ✅ Code snippets
- ✅ Markdown preview
- ✅ Undo tree visualization
- ✅ Multiple color schemes
- ✅ Auto-completion
- ✅ Syntax highlighting
- ✅ Code formatting
- ✅ Error checking

### Ranger

- ✅ Vim-like keybindings
- ✅ File preview
- ✅ Image preview
- ✅ Git integration
- ✅ Custom colorschemes
- ✅ File icons
- ✅ Quick directory navigation

### Oh-My-Zsh

- ✅ Enhanced prompt
- ✅ Command autosuggestions
- ✅ History search
- ✅ Git integration
- ✅ FZF integration

## Requirements

### System Requirements

- Linux (tested on various distributions)
- Terminal emulator with true color support
- Font with Nerd Font icons (for file icons)

### Software Dependencies

#### Neovim
- Neovim >= 0.5.0
- Vim-plug
- Python 3
- Node.js (for Coc.nvim)
- Git
- ripgrep (for FZF)
- The Silver Searcher (ag) (optional, for better search)

#### Ranger
- Ranger
- Python 3
- Ueberzug (for image preview)
- Various file viewers (see rifle.conf)

#### Oh-My-Zsh
- Zsh
- Oh-My-Zsh
- FZF
- The Silver Searcher (ag) (optional)

### Language Servers (Coc Extensions)

The configuration includes Coc extensions for:
- JSON
- VimL
- Docker
- CMake
- Shell
- Clangd (C/C++)
- Pyright (Python)
- Flutter Tools
- YAML
- Snippets
- And more...

Install them via `:CocInstall <extension-name>` or they will be installed automatically on first use.

## Customization

### Changing Color Scheme

In Neovim, modify `init.vim`:
```vim
autocmd vimenter * ++nested colorscheme gruvbox
```

### Adding New Plugins

Add plugins in the `call plug#begin()` section of `init.vim`, then run `:PlugInstall`.

### Modifying Key Bindings

Key bindings are defined throughout the configuration files. Search for `map` or `noremap` to find and modify bindings.

## Troubleshooting

### Coc.nvim Not Working

1. Ensure Node.js is installed: `node --version`
2. Run `:CocInfo` to check Coc status
3. Install language servers: `:CocInstall coc-<language>`

### FZF Not Found

1. Install FZF: `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install`
2. Ensure ripgrep is installed

### Ranger Image Preview Not Working

1. Install Ueberzug: `pip install ueberzug`
2. Check `rc.conf` for `preview_images_method` setting

## License

This configuration is for personal use. Individual plugins and tools have their own licenses.

## Contributing

This is a personal configuration repository. Feel free to fork and adapt for your own use.

## Notes

- The configuration uses a non-standard key mapping (hjkl → ijkl). This is a personal preference.
- Some paths in the configuration may need to be adjusted for your system.
- The configuration assumes certain tools are installed and available in PATH.

---

**Last Updated**: 2026-01-25
