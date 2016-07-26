alias nzgp='source $ZSH_CUSTOM/themes/atta-nzgp.zsh-theme'
alias zgp='source $ZSH_CUSTOM/themes/atta.zsh-theme'


prompt_git() {
    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        git_fg_color='%{%F{224}%}'

        dirty=$(parse_git_dirty)

        if [[ -n $dirty ]]; then
            git_status_fg_color='%{%F{196}%}'
        else
            git_status_fg_color='%{%F{39}%}'
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
    [[ $RETVAL -ne 0 ]] && symbols+="%{%F{196}%}[$RETVAL]"
    [[ $UID -eq 0 ]] && symbols+="%{%F{226}%}#"
    [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{224}%}&"

    [[ -n "$symbols" ]] && echo -n "$symbols "
}


build_prompt() {
    RETVAL=$?
    prompt_status
    echo -n '%{%F{51}%}%n%{%F{227}%}@%{%F{147}%}%m%{%F{227}%}:%{%F{216}%}%1~%{%f%}'
    prompt_git
    echo -n '%{%F{227}%}%{%k%}%(!.#.%%)%{%f%} '
}


PROMPT='%{%f%b%k%}$(build_prompt)'
#RPROMPT='%{%F{3}%}[%*]%{%f%}'


ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{196}%}"

ZSH_THEME_GIT_PROMPT_AHEAD="%{%F{227}%}>"
ZSH_THEME_GIT_PROMPT_BEHIND="%{%F{196}%}<"
ZSH_THEME_GIT_PROMPT_ADDED="%{%F{46}%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{%F{75}%}*"
ZSH_THEME_GIT_PROMPT_DELETED="%{%F{196}%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{%F{207}%}="
ZSH_THEME_GIT_PROMPT_UNMERGED="%{%F{227}%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{%F{216}%}?"


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
