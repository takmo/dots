ZSH_THEME_GIT_PROMPT_DIRTY="!"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"

ARROW="%(?..%{$fg[red]%})❱❱%{$reset_color%}"
TIME="%{$fg[green]%}%*%{$reset_color%}"
DIR="%{$fg[blue]%}%~%{$reset_color%}"

PROMPT='
[${TIME}] ${DIR} $(git_prompt_info)
${ARROW} '
