set -g fish_greeting
set -gx EDITOR nvim

fish_add_path /home/kerim/.cargo/bin/

fish_config theme choose "Dracula Official"

if status is-interactive
    starship init fish | source
end

fish_vi_key_bindings

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'
