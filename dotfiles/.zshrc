# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

source ~/.env.sh

#plugins=(git aws vscode)

### completions
if type brew &>/dev/null && [[ -d $HOMEBREW_PREFIX ]]; then
  fpath+=$HOME/.zfunc:$HOMEBREW_PREFIX/share/zsh/site-functions
fi
zstyle :compinstall filename $HOME/.zshrc
autoload -Uz compinit
compinit

[ -f $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] &&
  . $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh || echo "zsh-autosuggestions not found"

[ -f $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] &&
  . $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || echo "zsh-syntax-highlighting not found"

[ -f $HOME/.fzf.zsh ] &&
  . $HOME/.fzf.zsh || echo "fzf not found"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme ] &&
  . $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme || echo "powerlevel10k not found"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
