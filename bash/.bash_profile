export PS1="Cyanide \w: "
export TERM=ansi
export CLICOLOR=1
#export LSCOLORS=Exfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=auto'

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias sysup='sudo softwareupdate -i -a;'
alias bup='brew update; brew upgrade --all; brew cleanup;'
