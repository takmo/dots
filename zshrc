CONFIG="${HOME}/.config"
DOTS="${HOME}/.dots"
VENDOR="${DOTS}/vendor"

if [ ! -L "${CONFIG}/alacritty" ]; then
	ln -s  "${DOTS}/alacritty" "${CONFIG}/alacritty"
fi

if [ ! -L "${CONFIG}/fish" ]; then
	ln -s "${DOTS}/fish" "${CONFIG}/fish"
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

if [ ! -d "${VENDOR}/alacritty-theme" ]; then
	git clone git@github.com:alacritty/alacritty-theme.git "${VENDOR}/alacritty-theme"
fi
