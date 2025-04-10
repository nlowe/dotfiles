FPATH="${FPATH}:/usr/share/zsh/vendor-completions"

autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

source <(kubectl completion zsh)
compdef k='kubectl'

complete -o nospace -C /usr/local/bin/tk tk
