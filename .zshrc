# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/iobt/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

function pcs {
	column -t -s, -n "$@" | less -F -S -X -K
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/iobt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/iobt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/iobt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/iobt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
alias vim="nvim"

export TERM=xterm-256color

# opam configuration
test -r /home/iobt/.opam/opam-init/init.zsh && . /home/iobt/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
PATH="$PATH:/home/iobt/random/SMLFORMAT_DIR"; export PATH

alias rsml="rlwrap sml"

PATH="$PATH:/home/iobt/.emacs.d/bin"; export PATH

export PATH=$PATH:/usr/include:/usr/include/c++/9/bits:/usr/include/x86_64-linux-gnu/c++/9
export INCLUDE=$INCLUDE:/usr/include:/usr/include/c++/9/bits:/usr/include/x86_64-linux-gnu/c++/9
export LIBRARY=$INCLUDE:/usr/lib:/usr/include/c++/9:/usr/include/x86_64-linux-gnu/c++/9

export g3d=/home/iobt/g3d
export G3D10DATA=$g3d/G3D10/data-files:$g3d/data10/common:$g3d/data10/game:$g3d/data10/research
export INCLUDE=$g3d/G3D10/external/glew.lib/include:$g3d/G3D10/external/glfw.lib/include:$g3d/G3D10/external/civetweb.lib/include:$g3d/G3D10/external/qrencode.lib/include:$g3d/G3D10/external/zlib.lib/include:$g3d/G3D10/external/physx/include:$g3d/G3D10/G3D-base.lib/include:$g3d/G3D10/G3D-gfx.lib/include:$g3d/G3D10/G3D-app.lib/include:$g3d/G3D10/external/tbb/include:$g3d/G3D10/external/glslang/glslang:$INCLUDE
export LIBRARY=$g3d/G3D10/build/lib:$g3d/G3D10/build/bin:$LIBRARY
export PATH=$PATH:$g3d/G3D10/bin:$g3d/G3D10/build/bin
export LD_LIBRARY_PATH=$g3d/G3D10/build/bin:$LD_LIBRARY_PATH
