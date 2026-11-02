typeset -U path PATH fpath FPATH
export LSCOLORS=
alias n='echo -n ""'


# macOS
if [[ $OSTYPE == darwin* ]]; then
    # zsh-autosuggestions
    if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi

    # zsh-syntax-highlighting
    if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_STYLES[comment]='fg=8,bold'
    fi
fi


# Linux
if [[ $OSTYPE == linux* ]]; then
    # zsh-autosuggestions
    if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi

    # zsh-syntax-highlighting
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_STYLES[comment]='fg=8,bold'
    fi
fi
