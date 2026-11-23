# dotfiles

## Kitty
```
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

### Homwbrew

### Install

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
### Enable

```
echo >> /Users/cg/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/cg/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
```

## Git

```
brew install git
```

## oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Nerdfont

### Normal
- MesloLGSDZ Nerd Font Mono : search at  https://www.nerdfonts.com/font-downloads

### Italic

- Cascadia Mono NF : https://github.com/microsoft/cascadia-code/releases

### p10k

#### Install via zsh
1. Clone the repository: ``` git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ```
2. Open ~/.zshrc, find the line that sets ZSH_THEME, and change its value to "powerlevel10k/powerlevel10k".

### Package manager - mise

#### Install

```
brew install mise
```

```
#### Enable

```
echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
```

### NodeJs

```
mise use --global node@lts
```

### C compiler (already installed in Mac OS)

For Neovim (nvim-treesitter), choose GCC (gcc) on Linux or Windows, and Apple Clang (clang) on macOS, as these are the native defaults nvim-treesitter looks for first when compiling language parsers

```
xcode-select --install

``` 

### tree-sitter cli
Editors like Neovim and Helix use to compile language parsers

```
brew install tree-sitter-cli
```

### ripgrep

In Neovim, ripgrep is a core dependency for fuzzy-finder plugins like Telescope (live_grep) and fzf-lua to search across an entire project instantaneously.

```
brew install ripgrep
```

### fd

While ripgrep (rg) searches text inside files, fd finds filenames and directories. Plugins like Telescope, fzf-lua, and Snacks.nvim automatically detect fd and use it instead of slower system find commands—making file pickers noticeably faster while automatically respecting your .gitignore files.

```
brew install fd
```

### lazygit

lazygit is a fast, terminal-based UI for Git that lets you stage individual lines, resolve merge conflicts, manage branches, and rebase interactively with single keystrokes—and it integrates seamlessly inside Neovim (especially in LazyVim and Snacks.nvim via <leader>gg).

```
brew install lazygit
```

### Neovim

```
brew install neovim
```

### Tmux

tmux (Terminal Multiplexer) lets you split a single terminal window into multiple panes, organize work into tabs (windows), and keep persistent sessions running in the background—so your Neovim editor, dev servers, and builds stay alive even if you close your terminal or disconnect from SSH.

```
brew install tmux
```

### TPM

TPM (Tmux Plugin Manager) is the standard package manager for tmux, allowing you to declare plugins directly inside your ~/.tmux.conf file and install, update, or remove them with a single keystroke.

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Yazi

```
brew install yazi ffmpeg-full sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick-full font-symbols-only-nerd-font
brew link ffmpeg-full imagemagick-full -f --overwrite
```

### Clone repo

At any non-dotfiles folder
```
git  clone https://github.com/YNM-3000/dotfiles.git
```

### Stow

GNU Stow (stow) is a symlink farm manager that is the gold standard for managing dotfiles (like your Neovim, Zsh, Tmux, and mise configurations) in a clean Git repository.
Instead of manually copying config files around or maintaining fragile shell scripts, Stow mirrors the directory structure of your dotfiles folder and automatically creates symlinks into your home directory (~).

```
brew install stow
```

### Use dot files

```
cd  parent-path-to-dotfiles
stow —adopt -t ~ */
```

```
tmux new -s <session-name>
Prefix( Ctrl + a ) + I — Install new plugins added to tmux.conf
```

