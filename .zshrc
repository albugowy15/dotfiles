export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'header' yes
zstyle ':omz:plugins:eza' 'icons' yes
zstyle ':omz:plugins:eza' 'hyperlink' yes

plugins=(
  eza
  fzf
  starship
  zoxide
)

export EDITOR="nvim"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target,.next
  --preview 'bat -n --color=always {}'"
export FZF_ALT_C_OPTS="--walker-skip .git,node_modules,target,.next"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# alias
alias vi="vim"
alias vim="nvim"
alias cat="bat"
alias pn="pnpm"
alias cd="z"

source $ZSH/oh-my-zsh.sh

# go install
export PATH="$HOME/go/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opencode
export PATH="$HOME/.opencode/bin:$PATH"
