# ------------------------------------------------------------------------------------ #
#                                     PRE SETTINGS                                     #
# ------------------------------------------------------------------------------------ #

export GPG_TTY=$TTY


# ------------------------------------------------------------------------------------ #
#                                      ZSH CONFIG                                      #
# ------------------------------------------------------------------------------------ #


# TODO: hack?
emulate zsh -c "$(direnv export zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

emulate zsh -c "$(direnv hook zsh)"


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

if [ -x "$(command -v colorls)" ]; then
    alias ls="colorls"
    alias la="colorls -al"
fi

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GPG_TTY=$(tty)
export GPG_TTY=`tty`
alias python='python3'
alias py='python3'
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# ------------------------------------------------------------------------------------ #
#                                        CONFIG                                        #
# ------------------------------------------------------------------------------------ #

export HISTSIZE=500000
export SAVEHIST=500000
export HISTFILE=~/.zsh_history

# Amazon Q pre block. Keep at the top of this file.
# [[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# quantco
export PRE_COMMIT_USE_MICROMAMBA=1
export GCR_PAT=
export CR_PAT=
# echo $GCR_PAT | docker login ghcr.io -u USERNAME --password-stdin

# Artifactory
export ARTIFACTORY_TOKEN=""
# pixi auth login quantco.jfrog.io --username robin.holzinger@quantco.com --password $ARTIFACTORY_TOKEN
export ARTIFACTORY_USERNAME_ENC=robin.holzinger%40quantco.com
export ARTIFACTORY_USERNAME="robin.holzinger%40quantco.com"
export ARTIFACTORY_USERNAME="robin.holzinger@quantco.com"

export ARTIFACTORY_PASSWORD=""

# ------------------------------------------------------------------------------------ #
#                                     MAMBA / CONDA                                    #
# ------------------------------------------------------------------------------------ #

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/robinholzinger/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/robinholzinger/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/robinholzinger/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/robinholzinger/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# ------------------------------------------------------------------------------------ #
#                                        ALIASES                                       #
# ------------------------------------------------------------------------------------ #

# python
alias py="python"
alias p="python"

# conda / micromamba

alias m="micromamba"
alias mm="micromamba"
# alias mamba="micromamba"
alias a="micromamba activate"
alias d="micromamba deactivate"
alias conda="micromamba"
alias ml="micromamba list"
alias mel="micromamba env list"
alias mi="micromamba env create -f environment.yml"

# git aliases:
alias gs="git status"
alias gp="git pull"
alias gf="git fetch"
alias gco="git checkout"
alias gcom="git checkout main"
alias gcomp="git checkout main && git pull"
alias gb="git checkout -b"
alias gaa="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gps="git push"

alias cat="bat"
# alias lsa="exa -la"
# alias la="exa -la"
# alias ls="exa"

# pixi
alias pclean="pixi clean && pixi install && pixi run postinstall && pixi run pre-commit-install"
alias pcommit="pixi run pre-commit-run --all-files"
alias pc="pcommit"
# diff-so-fancy
# amazon q commandline
# cloc - count lines of files (brew)
# ncdu - shot folder sizes & child item counts

# # ---------------------------------------- aws --------------------------------------- #

alias awsso="aws configure sso"
alias awslogin="aws sso login --profile"

# # ------------------------------------- terraform ------------------------------------ #

alias tph="terraform plan -help"
alias th="terraform -help"
# setup:  terraform -install-autocomplete

alias tfmt="terraform fmt"
alias tfval="terraform validate"

alias tfini="terraform init"

alias tfplan="terraform plan"

alias tfap="terraform apply"
alias tfapaa="terraform apply --auto-approve"
alias tfdes="terraform destroy --auto-approve"



# # ------------------------------------ credentials ----------------------------------- #

export GPG_TTY=$TTY

# # --------------------------------------- conda -------------------------------------- #


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /opt/homebrew/bin/terraform terraform

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --------------------------------- commandline tools -------------------------------- #

# brew install fzf: fuzzy search

source <(fzf --zsh)

# # -------------------------------- checksum / hashing -------------------------------- #

# Aliases
alias sha256="sha256sum"

# Function to compute and hash a sorted list of file hashes
sha256d() {
  local directory="$1"

  if [ -z "$directory" ]; then
    echo "Usage: compute_and_hash_directory <directory> <hash_file>"
    return 1
  fi

  # Check if the directory exists
  if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' does not exist."
    return 1
  fi

  # Save the current directory
  local current_dir="$(pwd)"

  # Change cwd for sha256sum determinism
  cd "$directory" || return 1

  # Compute and sort file hashes, then save to a temporary file
  find . -type f -exec sha256sum {} \; | sort > "/tmp/sha256d.tmp"

  # Change back to the original directory
  cd "$current_dir" || return 1

  hash_result=$(sha256sum "/tmp/sha256d.tmp")
  hash_only=$(echo "$hash_result" | awk '{print $1}')

  # Clean up temporary file
  rm "/tmp/sha256d.tmp"

  echo "SHA-256 Hash: $hash_only"
}


# Function to compare the hashes of two directories
sha256dcomp() {
  local dir1="$1"
  local dir2="$2"

  if [ -z "$dir1" ] || [ -z "$dir2" ]; then
    echo "Usage: compare_directories <directory1> <directory2>"
    return 1
  fi

  local hash1=$(sha256d "$dir1")
  local hash2=$(sha256d "$dir2")

  if [ "$hash1" = "$hash2" ]; then
    echo "Success: The directories have the same SHA-256 hash."
  else
    echo "Failure: The directories have different SHA-256 hashes."
    echo "Directory hash 1: $hash1"
    echo "Directory hash 2: $hash2"
  fi
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/robinholzinger/robin/dev/jst/parma-analytics/.debug.log/dummyimage/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/robinholzinger/robin/dev/jst/parma-analytics/.debug.log/dummyimage/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/robinholzinger/robin/dev/jst/parma-analytics/.debug.log/dummyimage/google-cloud-sdk/completi~on.zsh.inc' ]; then . '/Users/robinholzinger/robin/dev/jst/parma-analytics/.debug.log/dummyimage/google-cloud-sdk/completion.zsh.inc'; fi


# # Amazon Q post block. Keep at the bottom of this file.
# [[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
# eval "$(pixi completion --shell zsh)"


# # >>> mamba initialize >>>
# # !! Contents within this block are managed by 'micromamba shell init' !!
# export MAMBA_EXE='/opt/homebrew/bin/micromamba';
# export MAMBA_ROOT_PREFIX='/Users/robinholzinger/micromamba';
# __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__mamba_setup"
# else
#     alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
# fi
# unset __mamba_setup
# # <<< mamba initialize <<<


# ------------------------------------------------------------------------------------ #
#                                         HOOKS                                        #
# ------------------------------------------------------------------------------------ #


# --------------------------------------- PIXI --------------------------------------- #

export PATH=$PATH:/Users/robinholzinger/.pixi/bin
export PATH=$HOME/.pixi/bin:$PATH

eval "$(direnv hook zsh)"
eval "$(pixi completion --shell zsh)"

# ----------------------------------------- . ---------------------------------------- #
