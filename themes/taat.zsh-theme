alias nzgp='source $ZSH_CUSTOM/themes/taat-nzgp.zsh-theme'
alias zgp='source $ZSH_CUSTOM/themes/taat.zsh-theme'


prompt_git() {
    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        git_fg_color='%{%F{215}%}'

        dirty=$(parse_git_dirty)

        if [[ -n $dirty ]]; then
            git_status_fg_color='%{%F{196}%}'
        else
            git_status_fg_color='%{%F{33}%}'
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
    [[ $UID -eq 0 ]] && symbols+="%{%F{165}%}#"
    [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{215}%}&"

    [[ -n "$symbols" ]] && echo -n "$symbols "
}


build_prompt() {
    RETVAL=$?
    prompt_status
    echo -n '%{%F{45}%}%n%{%F{109}%}@%{%F{33}%}%m%{%F{109}%}:%{%F{215}%}%1~%{%f%}'
    prompt_git
    echo -n '%{%F{45}%}%{%k%}%(!.#.%%)%{%f%} '
}


PROMPT='%{%f%b%k%}$(build_prompt)'
#RPROMPT='%{%F{3}%}[%*]%{%f%}'


ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{196}%}"

ZSH_THEME_GIT_PROMPT_AHEAD="%{%F{33}%}>"
ZSH_THEME_GIT_PROMPT_BEHIND="%{%F{196}%}<"
ZSH_THEME_GIT_PROMPT_ADDED="%{%F{33}%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{%F{215}%}*"
ZSH_THEME_GIT_PROMPT_DELETED="%{%F{196}%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{%F{215}%}="
ZSH_THEME_GIT_PROMPT_UNMERGED="%{%F{196}%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{%F{215}%}?"


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
