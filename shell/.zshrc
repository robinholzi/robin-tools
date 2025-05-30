# ------------------------------------ SHELL INIT ------------------------------------ #

eval "$(starship init zsh)"

# ------------------------------------- RC FILES ------------------------------------- #

if [ -f ~/.shell/.initrc.sh ]; then
    . ~/.shell/.initrc.sh
fi

if [ -f ~/.shell/.configrc.sh ]; then
    . ~/.shell/.configrc.sh
fi

if [ -f ~/.shell/.aliasrc.sh ]; then
    . ~/.shell/.aliasrc.sh
fi

if [ -f ~/.shell/.marcrorc.sh ]; then
    . ~/.shell/.marcrorc.sh
fi

if [ -f ~/.shell/.secretsrc.sh ]; then
    . ~/.shell/.secretsrc.sh
fi

if [ -f ~/.shell/.toolrc.sh ]; then
    . ~/.shell/.toolrc.sh
fi

if [ -f ~/.shell/.ttyrc.sh ]; then
    . ~/.shell/.ttyrc.sh
fi
