#####
##### IMPORTANT LOCATIONS
#####

CONFIG="${HOME}/.config"
DOTS="${HOME}/.dots"
VENDOR="${DOTS}/vendor"

#####
##### SETUP - FILES AND DIRECTORIES
#####

if [ ! -L "${CONFIG}/alacritty" ]; then
	ln -s  "${DOTS}/alacritty" "${CONFIG}/alacritty"
fi

if [ ! -L "${CONFIG}/helix" ]; then
	ln -s "${DOTS}/helix" "${CONFIG}/helix"
fi

if [ ! -L "${CONFIG}/tmux" ]; then
	ln -s "${DOTS}/tmux" "${CONFIG}/tmux"
fi

if [ ! -d "${VENDOR}" ]; then
	mkdir -p vendor
fi

#####
##### SETUP - VENDORED FILES
#####

if [ ! -d "${VENDOR}/alacritty-theme" ]; then
	git clone git@github.com:alacritty/alacritty-theme.git "${VENDOR}/alacritty-theme"
fi

if [ ! -d "${VENDOR}/ohmyzsh" ]; then
	git clone git@github.com:ohmyzsh/ohmyzsh.git "${VENDOR}/ohmyzsh"
fi

#####
##### CONFIG - OH MY ZSH
#####

if [ -d "${VENDOR}/ohmyzsh" ]; then
	ZSH_CUSTOM="${DOTS}/ohmyzsh-custom"
	ZSH_THEME="custom"

	ZSH_TMUX_AUTOSTART=true
	ZSH_TMUX_FIXTERM=true
	ZSH_TMUX_FIXTERM_WITH_256COLOR="alacritty"
	ZSH_TMUX_CONFIG="${DOTS}/tmux/tmux.conf"

	# plugins=(brew git tmux vi-mode)
	plugins=(brew tmux vi-mode nvm)

	export ZSH="${VENDOR}/ohmyzsh"
	source "${ZSH}/oh-my-zsh.sh"
fi

#####
##### CONFIG - ALIASES
#####

if $(which eza >> /dev/null) ; then
	alias ls="eza -l"
fi

if $(which rg >> /dev/null) ; then
	alias rg="rg -S --color=always"
fi

alias please='sudo $(fc -n -l -1)'

#####
##### CONFIG - EXPORTS
#####

export EDITOR=hx

# all done <3
