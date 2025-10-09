# If not running interactively, don't do anything
[[ $- != *i* ]] && return 

#bind TAB:menu-complete

export PATH=/home/frame/.local/bin:$PATH
export PATH=/home/frame/.cargo/bin:$PATH

export BAT_THEME="TwoDark"
export MANPAGER="lvim +Man!"

shopt -s cdspell
shopt -s autocd

alias nv='lvim'
alias nvim='lvim'
alias lv='lvim'
alias ff='clear && fastfetch -c ~/.config/fastfetch/niko.jsonc'
alias cl='clear'
alias ..='cd ..'
alias ...='cd ../..'

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
alias gclone="git clone"
alias gpush="git push"
alias gpull="git pull"

#utils
alias sys-update='paru -Syu; rustup update;lvim +LvimUpdate +LvimSyncCorePlugins +q +q'
alias vencord-install='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'

# Functions

# zoxide wrapper to cd
cd() {
         z "$@" 2>/dev/null  || echo -e "Directory \e[91m$*\e[0m not found! \e[91m◕⩊◕\e[0m"
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
    open "$url"
}

# Prompt
# Store `tput` colors for future use to reduce fork+exec
# the array will be 0-255 for colors, 256 will be sgr0
# and 257 will be bold
COLOR256=()
COLOR256[0]=$(tput setaf 1)
COLOR256[256]=$(tput sgr0)
COLOR256[257]=$(tput bold)

# Colors for use in PS1 that may or may not change when
# set_prompt_colors is run
PROMPT_COLORS=()

# Change the prompt colors to a theme, themes are 0-29
set_prompt_colors() {
	local h=${1:-0}
	local color=
	local i=0
	local j=0
	for i in {22..231}; do
		((i % 30 == h)) || continue

		color=${COLOR256[$i]}
		# cache the tput colors
		if [[ -z $color ]]; then
			COLOR256[$i]=$(tput setaf "$i")
			color=${COLOR256[$i]}
		fi
		PROMPT_COLORS[$j]=$color
		((j++))
	done
}

# Construct the prompt
# [(exit code)] <user> - <hostname> <uname> <cwd> [git branch] <$|#>

# exit code of last process
PS1='$(ret=$?;(($ret!=0)) && echo "\[${COLOR256[0]}\]($ret) \[${COLOR256[256]}\]")'

# username (red for root)
PS1+='\[${PROMPT_COLORS[0]}\]\[${COLOR256[257]}\]$(((UID==0)) && echo "\[${COLOR256[0]}\]")\u\[${COLOR256[256]}\] - '

# zonename (global zone warning)
PS1+='\[${COLOR256[0]}\]\[${COLOR256[257]}\]'"$(zonename 2>/dev/null | grep -q '^global$' && echo 'GZ:')"'\[${COLOR256[256]}\]'

# hostname
PS1+='\[${PROMPT_COLORS[3]}\]\h '

# uname
PS1+='\[${PROMPT_COLORS[2]}\]'"$(uname | tr '[:upper:]' '[:lower:]')"' '

# cwd
PS1+='\[${PROMPT_COLORS[5]}\]\w '

# optional git branch
PS1+='$(branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); [[ -n $branch ]] && echo "\[${PROMPT_COLORS[2]}\](\[${PROMPT_COLORS[3]}\]git:$branch\[${PROMPT_COLORS[2]}\]) ")'

# prompt character
PS1+='\[${PROMPT_COLORS[0]}\]\$\[${COLOR256[256]}\] '

# set the theme
set_prompt_colors 24

# Prompt command
_prompt_command() {
        local user=$USER
        local host=${HOSTNAME%%.*}
        local pwd=${PWD/#$HOME/\~}
        local ssh=
        [[ -n $SSH_CLIENT ]] && ssh='[ssh] '
        printf "\033]0;%s%s@%s:%s\007" "$ssh" "$user" "$host" "$pwd"
}
PROMPT_COMMAND=_prompt_command

PROMPT_DIRTRIM=6

eval "$(zoxide init bash)"
