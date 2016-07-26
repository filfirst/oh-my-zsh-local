alias nzgp='source $ZSH_CUSTOM/themes/taat-nzgp.zsh-theme'
alias zgp='source $ZSH_CUSTOM/themes/taat.zsh-theme'


prompt_git() {
    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        git_fg_color='%{%F{6}%}'

        dirty=$(parse_git_dirty)

        if [[ -n $dirty ]]; then
            git_status_fg_color='%{%F{1}%}'
        else
            git_status_fg_color='%{%F{4}%}'
        fi

        git_status=$(git_prompt_status)
        git_separator=""
        if [ -n "$git_status" ]; then
            git_separator="$git_fg_color|"
        fi

        echo -n " $git_fg_color($git_status_fg_color$(git_prompt_info)$git_separator$git_status$git_fg_color)"
    fi
}


prompt_status() {
    local symbols
    symbols=()
    [[ $RETVAL -ne 0 ]] && symbols+="%{%F{1}%}[$RETVAL]"
    [[ $UID -eq 0 ]] && symbols+="%{%F{5}%}#"
    [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{12}%}&"

    [[ -n "$symbols" ]] && echo -n "$symbols "
}


build_prompt() {
    RETVAL=$?
    prompt_status
    echo -n '%{%F{6}%}%n%{%F{3}%}@%{%F{12}%}%m%{%F{3}%}:%{%F{209}%}%1~%{%f%}'
    prompt_git
    echo -n '%{%F{3}%}%{%k%}%(!.#.%%)%{%f%} '
}


PROMPT='%{%f%b%k%}$(build_prompt)'
#RPROMPT='%{%F{3}%}[%*]%{%f%}'


ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{1}%}"

ZSH_THEME_GIT_PROMPT_AHEAD="%{%F{4}%}>"
ZSH_THEME_GIT_PROMPT_BEHIND="%{%F{1}%}<"
ZSH_THEME_GIT_PROMPT_ADDED="%{%F{4}%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{%F{3}%}*"
ZSH_THEME_GIT_PROMPT_DELETED="%{%F{1}%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{%F{5}%}="
ZSH_THEME_GIT_PROMPT_UNMERGED="%{%F{1}%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{%F{3}%}?"


zgphelp() {
    echo ">: ahead"
    echo "<: behind"
    echo "+: added"
    echo "*: modified"
    echo "-: deleted"
    echo "=: renamed"
    echo "!: unmerged"
    echo "?: untracked"
}
