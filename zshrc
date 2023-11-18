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

if [ ! -d "${VENDOR}/alacritty-catppuccin" ]; then
	git clone git@github.com:catppuccin/alacritty.git "${VENDOR}/alacritty-catppuccin"
fi

if [ ! -d "${VENDOR}/alacritty-nord" ]; then
	git clone git@github.com:nordtheme/alacritty.git "${VENDOR}/alacritty-nord"
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

	plugins=(brew git ripgrep tmux vi-mode)

	export ZSH="${VENDOR}/ohmyzsh"
	source "${ZSH}/oh-my-zsh.sh"
fi

#####
##### CONFIG - ALIASES
#####

if $(which eza >> /dev/null) ; then
	alias ls="eza -l"
fi

alias please='sudo $(fc -n -l -1)'

#####
##### CONFIG - EXPORTS
#####

export EDITOR=hx

# all done <3
