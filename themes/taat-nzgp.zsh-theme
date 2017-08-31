alias nzgp='source $ZSH_CUSTOM/themes/taat-nzgp.zsh-theme'
alias zgp='source $ZSH_CUSTOM/themes/taat.zsh-theme'


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
    #echo -n '%{%F{45}%}%n%{%F{109}%}@%{%F{33}%}%m%{%F{109}%}:%{%F{215}%}%1~%{%f%}'
    echo -n '%{%F{39}%}%n%{%f%}@%{%F{33}%}%m%{%f%}:%{%F{215}%}%1~%{%f%}'
    #echo -n '%{%F{45}%}%{%k%}%(!.#.%%)%{%f%} '
    echo -n '%{%F{39}%}%{%k%}%(!.#.%%)%{%f%} '
}


PROMPT='%{%f%b%k%}$(build_prompt)'
#RPROMPT='%{%F{3}%}[%*]%{%f%}'
