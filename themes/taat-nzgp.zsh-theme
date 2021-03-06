alias nzgp='source $ZSH_CUSTOM/themes/taat-nzgp.zsh-theme'
alias zgp='source $ZSH_CUSTOM/themes/taat.zsh-theme'


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
    echo -n '%B%{%F{33}%}%n@%m%{%f%b%k%}:%B%{%F{172}%}%1~%{%f%b%k%}'
    echo -n '%{%f%b%k%}%(!.#.%%)%{%f%b%k%} '
}


PROMPT='%{%f%b%k%}$(build_prompt)'
