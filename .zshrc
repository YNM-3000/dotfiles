# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="ys"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
  zsh-syntax-highlighting
  zsh-autosuggestions
  web-search
  # evalcache
)

source $ZSH/oh-my-zsh.sh

# PROMPT='%B%m%~%b$(git_super_status) %# '

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


#alias cx="compass"
#alias cw="compass workspace"

#autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /usr/local/bin/compass compass
#export IGNORE_PYTHON_VERSION_REQUIREMENT="1"  ##compass5ea843
#export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python2.7"  ##compass5ea843
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"
#export PATH="$HOME/Library/Python/3.9/bin:$PATH"  ##compass5ea843
#export PATH="/opt/homebrew/bin:$PATH"


#. /opt/homebrew/opt/asdf/libexec/asdf.sh
#export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

#export LDFLAGS="-L/opt/homebrew/opt/node@16/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/node@16/include"
#export COMPOSE_V1=true
#export PATH="$HOME/development/glide-devapp/devtool:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# go env
# eval "$(~/development/urbancompass/scripts/go activate)"
# _evalcache ~/development/urbancompass/scripts/go activate
# export PATH="$HOME/development/urbancompass/build-support/go/sdk/bin/go"
# alias gg="$HOME/development/urbancompass/build-support/go/sdk/bin/go"
# alias grpc="$HOME/development/urbancompass/scripts/grpcreq"
export VISUAL=nvim

export EDITOR="$VISUAL"

export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

function yazi_func() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias yy='yazi_func'

export HOSTIP=$(cat /etc/resolv.conf|grep "nameserver"|cut -f 2 -d " ")
export WSLHOST="$HOSTIP:7890"
alias setWslProxy='export http_proxy="http://$WSLHOST";export https_proxy="https://$WSLHOST";export all_proxy="sock5://$WSLHOST";export ALL_PROXY="socks5://$WSLHOST"'
alias unsetWslProxy='unset http_proxy;unset https_proxy;unset all_proxy;unset ALL_PROXY;'

alias setGitProxy='git config --global http.proxy $WSLHOST'
alias unsetGitProxy='git config --global --unset http.proxy'
export NODE_OPTIONS='--openssl-legacy-provider'
alias nn='neofetch'
# nn

alias python=python3

export NVM_DIR=“$HOME/.nvm”
[ -s “$NVM_DIR/nvm.sh” ] && \. “$NVM_DIR/nvm.sh”  # This loads nvm
[ -s “$NVM_DIR/bash_completion” ] && \. “$NVM_DIR/bash_completion”  # This loads nvm bash_completion
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Added by Windsurf
export PATH="/Users/tcg/.codeium/windsurf/bin:$PATH"
