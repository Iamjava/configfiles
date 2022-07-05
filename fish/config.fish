if status is-interactive
    # Commands to run in interactive sessions can go here
end
if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end
set fish_greeting "Its fishy here ...."

abbr fishcfg "vim ~/.config/fish/config.fish"
abbr fishcfg "vim ~/.config/fish/config.fish"
abbr alacrittycfg "vim ~/.config/alacritty/alacritty.yml"
abbr vimcfg "vim ~/.config/nvim/init.lua"
abbr lvim "~/.local/bin/lvim"
abbr r "ranger"
abbr o "gio open"


fish_vi_key_bindings
export PATH="$HOME/scripts:$PATH"
# fix for ranger 
export TERM=xterm-256color 

