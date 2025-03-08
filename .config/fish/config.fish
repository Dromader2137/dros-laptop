if status is-interactive
	starship init fish | source
	
	set fish_greeting

	alias ls="eza -l --group-directories-first -s modified -r"
	alias la="eza -la --group-directories-first -s modified -r"
	alias ll="eza -l --group-directories-first -s modified -r -T -L 3"
	alias lla="eza -la --group-directories-first -s modified -r -T -L 3"

	alias gs="git status"
	alias ga="git add"
	alias gc="git commit -m"
	alias gf="git pull"
	alias gp="git push"
	alias gpa="git push --all"
	alias gl="git log --graph --oneline --all"
	alias gsw="git switch"
	alias gcl="git clone"

	alias mount-android="mtpfs -o allow_other"
	alias pair-ios="idevicepair pair"
	alias verify-ios="idevicepair validate"
	alias mount-ios="ifuse"
	
	contains $HOME/.cargo/bin/ $fish_user_paths; or set -Ua fish_user_paths $HOME/.cargo/bin/
	contains $HOME/.local/bin/ $fish_user_paths; or set -Ua fish_user_paths $HOME/.local/bin/
end
