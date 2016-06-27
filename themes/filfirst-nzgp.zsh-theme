alias nzgp='source ~/.oh-my-zsh/custom/themes/filfirst-nzgp.zsh-theme'
alias zgp='source ~/.oh-my-zsh/custom/themes/filfirst.zsh-theme'


prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{9}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{11}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{14}%}⚙"

  [[ -n "$symbols" ]] && echo -n "$symbols "
}


build_prompt() {
  RETVAL=$?
  prompt_status
  echo -n '%{%F{51}%}%n%{%F{227}%}@%{%F{147}%}%m%{%F{227}%}:%{%F{216}%}%1~%{%f%}'
  echo -n '%{%F{227}%}%{%k%}%(!.#.$)%{%f%} '
}


PROMPT='%{%f%b%k%}$(build_prompt)'
#RPROMPT='%{%F{3}%}[%*]%{%f%}'
