if status is-interactive
	starship init fish | source
	
	set fish_greeting

	export QT_QPA_PLATFORMTHEME=qt5ct
	export RANGER_LOAD_DEFAULT_RC=false
	export EDITOR="nvim"
	export VISUAL="nvim"
	
	gsettings set org.gnome.desktop.interface gtk-theme 'gruvbox-dark-gtk'
	gsettings set org.gnome.desktop.interface icon-theme 'gruvbox-dark-icons-gtk'
	gsettings set org.gnome.desktop.interface cursor-theme 'Simp1e-Gruvbox-Dark'
	gsettings set org.gnome.desktop.interface font-name 'Mononoki Nerd Font 11'  
	
	alias ls="exa -l --group-directories-first -s Extension"
	alias la="exa -la --group-directories-first -s Extension"
	alias ll="exa -la --group-directories-first -s Extension -T -L 3"
	alias gs="git status"
	alias ga="git add"
	alias gc="git commit -m"
	alias gf="git pull"
	alias gp="git push"
	alias gpa="git push --all"
	alias gl="git log --graph --oneline --all"
	alias gsw="git switch"
	alias gcl="git clone"
	
	contains $HOME/.cargo/bin/ $fish_user_paths; or set -Ua fish_user_paths $HOME/.cargo/bin/
	contains $HOME/.local/bin/ $fish_user_paths; or set -Ua fish_user_paths $HOME/.local/bin/
end

if status is-login
	Hyprland
end
