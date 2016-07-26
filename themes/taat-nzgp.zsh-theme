alias nzgp='source $ZSH_CUSTOM/themes/taat-nzgp.zsh-theme'
alias zgp='source $ZSH_CUSTOM/themes/taat.zsh-theme'


prompt_status() {
    local symbols
    symbols=()
    [[ $RETVAL -ne 0 ]] && symbols+="%{%F{196}%}[$RETVAL]"
    [[ $UID -eq 0 ]] && symbols+="%{%F{165}%}#"
    [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{172}%}&"

    [[ -n "$symbols" ]] && echo -n "$symbols "
}


build_prompt() {
    RETVAL=$?
    prompt_status
    echo -n '%{%F{105}%}%n%{%F{44}%}@%{%F{39}%}%m%{%F{44}%}:%{%F{216}%}%1~%{%f%}'
    echo -n '%{%F{44}%}%{%k%}%(!.#.%%)%{%f%} '
}


PROMPT='%{%f%b%k%}$(build_prompt)'
#RPROMPT='%{%F{3}%}[%*]%{%f%}'
