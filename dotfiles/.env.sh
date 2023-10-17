# vim:ft=bash

# You may need to manually set your language environment
export LANG=pt_PT.UTF-8

# Set XDG Base Directories
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

export ASDF_DATA_DIR="$XDG_CACHE_HOME"/asdf
export CODE="$HOME"/Code
export DOWNLOADS="$HOME"/Downloads
export MOUNT="$HOME"/Mount
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export VOLUMES="/Volumes"
export YARN_CACHE_FOLDER="$XDG_CACHE_HOME"/yarn

export EDITOR="vsc"
export FZF_DEFAULT_COMMAND="fd --exclude '.git/' --exclude 'node_modules/' --hidden --threads 2 --type f"
export FZF_DEFAULT_OPTS="--ansi --border=rounded --cycle --height=100% --layout=reverse --tabstop=4 --tiebreak=chunk,length,begin"
export FZF_ALT_C_COMMAND="fd --exclude '.git/' --exclude 'node_modules/' --hidden --threads 2 --type d"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#lsd installed for colorful ls output. To make it run do alias ls.
#install hack nerd font. To solve issues with icons. If this font is not installed and set for your terminal you may see question mark icon instead of icons shown on git
#For more see prerequisites -> https://github.com/Peltoche/lsd
#install nerd font font from -> https://github.com/ryanoasis/nerd-fonts/blob/master/readme.md#option-4-homebrew-fonts
alias ls='lsd'

#bat installed for colorful cat ouput. To make it run with cat command do alias cat.
#Here By default, bat pipes its own output to a pager (e.g less) if the output is too large for one screen. If you would rather bat work like cat all the time (never page output), you can set --paging=never.
export BAT_THEME='gruvbox-dark'
export PAGER="bat --color=always --style=auto --wrap=never"
alias cat='bat --paging=never'

[[ ! "$PATH" =~ /opt/homebrew/bin ]] &&
	export PATH="$PATH:/opt/homebrew/bin" || true

[[ ! "$PATH" =~ $HOME/.local/bin ]] &&
	export PATH="$PATH:$HOME/.local/bin" || true

[ -z "$HOMEBREW_PREFIX" ] &&
	command -v brew &>/dev/null &&
	export HOMEBREW_PREFIX="$(brew --prefix)" || true

[ -f "$HOMEBREW_PREFIX"/opt/asdf/libexec/asdf.sh ] &&
  source "$HOMEBREW_PREFIX"/opt/asdf/libexec/asdf.sh || true
