# directory
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
alias gcb="git checkout -b"
alias gaa="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gm="git merge"
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
