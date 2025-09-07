######## export thingies ######## 
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)

export BAT_THEME="rose-pine"
export MANPAGER="nvim +Man!"

######## aliases ######## 

# colors
alias grep='grep --color=auto'
alias colb='colors | head -17' # base colors
alias ip='ip -color=auto'

# eza / ls
alias eza='eza --icons --sort=extension --group-directories-first'
alias ls='eza --icons --sort=extension --group-directories-first'
alias la='eza -a'
alias ll='eza -l -b --icons --git --git-repos --octal-permissions --header'
alias l='ll' # overwrite omz
alias tree='eza -T'

# utils
alias nv='nvim'
alias cl='clear'
alias ff='fastfetch'
alias ping='prettyping'
alias wt='curl wttr.in'
alias cp='cp -i'
alias bap='bat -p'
alias fp='fzf --preview "bat {}"'

alias so='source ~/.zshrc; clear && ff'
alias vencord-installer='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias sys-update='rm -rf ~/.cache/paru && paru -Syu; rustup update; nvim --headless -c "PlugUpgrade | PlugUpdate" -c "qa"; omz update'

# git
alias ga="git add"
alias gap="git add --patch"
alias gb="git branch"
alias gc="git commit"
alias gcl="git clone"
alias gd="git diff"
alias gs="git status"
alias gi="git init"
alias gl="git log --graph --all --pretty=format:'%C(yellow)%h %C(white) %an  %ar%C(auto)  %D%n%s%n'" # minimalistic
alias glf="git log --graph --all --pretty" # full
alias gpush="git push"
alias gpull="git pull"


######## plugins ######## 
plugins=(
    git
    colorize
)
# plugins from Arch repository
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
#source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

######## startup ########
ff


######## functions ########
function cd() {
    { z "$@" 2>/dev/null && ls } || echo -e "Directory \e[91m$*\e[0m not found! \e[91mYou are not a [[BIG SHOT]]\e[0m"
}

function command_not_found_handler() {
    echo -e "Command \e[91m$1\e[0m not found! \e[91mYou are not a [[BIG SHOT]]\e[0m" >&2
    return 127
}

# Print all 256 colors
colors() {
	local i
	for i in {0..255}; do
		printf "\x1b[38;5;${i}mcolor %d\n" "$i"
	done
	tput sgr0
}

# Open the current path or file in GitHub
gho() {
	local file=$1
	local remote=${2:-origin}

	# get the git root dir, branch, and remote URL
	local gr=$(git rev-parse --show-toplevel)
	local branch=$(git rev-parse --abbrev-ref HEAD)
	local url=$(git config --get "remote.$remote.url")

	[[ -n $gr && -n $branch && -n $remote ]] || return 1

	# construct the path
	local path=${PWD/#$gr/}
	[[ -n $file ]] && path+=/$file

	# extract the username and repo name
	local a
	IFS=:/ read -a a <<< "$url"
	local len=${#a[@]}
	local user=${a[len-2]}
	local repo=${a[len-1]%.git}

	url="https://github.com/$user/$repo/tree/$branch$path"
	echo "$url"
	xdg-open "$url"
}

######## fzf ########
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa

    --bind 'ctrl-e:become($EDITOR {})'
    --bind 'ctrl-c:become(echo {})'"

######## zstyle ########

# auto-update behavior
zstyle ':omz:update' mode auto # update automatically without asking

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 1

# colorize cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33


######## opts ########

setopt append_history inc_append_history share_history # better history

setopt interactive_comments # allow comments in shell

######## key-binds ########

bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^g" backward-char
bindkey "^h" forward-char
