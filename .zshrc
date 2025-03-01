# Created by Zap installer
#[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
#plug "zap-zsh/supercharge"
#plug "zap-zsh/zap-prompt"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="nanotech"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
# Load and initialise completion system
autoload -Uz compinit
compinit
export PATH="/home/srdamaa7/.cargo/bin:$PATH"
export PATH="$PATH:/opt/telegram"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
alias vim=nvim
alias terminal=gnome-terminal
alias arr="trans :ar"

alias luamake="/home/srdamaa7/lua-language-server/3rd/luamake/luamake"
alias gromit-mpx="flatpak run net.christianbeier.Gromit-MPX"
alias ll="ls -l"
alias hibernate="sudo systemctl hibernate"

export PATH="$PATH:/home/srdamaa7/dev/gitRepo/lua-language-server/bin/"
export PATH="$PATH:/home/srdamaa7/go/bin"
export PATH="$PATH:/usr/bin/clang"
export PATH="$PATH:/usr/bin/clangd14:/home/srdamaa7/dev/Postman"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/usr/bin/flutter/bin"

export ANDROID_SDK_ROOT=$HOME/Android
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
xset r rate 300 40
export DOTNET_ROOT=/snap/dotnet-runtime-80/current
export DOTNET_ROOT=/snap/dotnet-sdk/current

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/srdamaa7/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/srdamaa7/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/srdamaa7/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/srdamaa7/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
