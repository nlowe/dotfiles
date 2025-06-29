FPATH="${FPATH}:/usr/share/zsh/vendor-completions"

autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

source <(hctl completion zsh)
source <(kubectl completion zsh)

compdef k='kubectl'
compdef h='hctl'

complete -o nospace -C /usr/local/bin/tk tk
