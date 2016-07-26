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
    echo -n '%{%F{6}%}%n%{%F{3}%}@%{%F{6}%}%m%{%F{3}%}:%{%F{12}%}%1~%{%f%}'
    echo -n '%{%F{3}%}%{%k%}%(!.#.%%)%{%f%} '
}


PROMPT='%{%f%b%k%}$(build_prompt)'
#RPROMPT='%{%F{3}%}[%*]%{%f%}'
