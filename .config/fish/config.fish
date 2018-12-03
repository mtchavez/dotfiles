### PATH ###
set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin
set home_bin $HOME/bin

### Ruby
# . (rbenv init -|psub)
# set rbenv_paths $HOME/.rbenv/shims

### Go
set -gx GOPATH $HOME/go
set -gx GOROOT /usr/local/opt/go/libexec
set -gx GOBIN $GOROOT/bin
set go_paths $GOPATH/bin $GOBIN

### Rust
set rust_paths $HOME/.cargo/bin

### Node
set -gx NODE_PATH /usr/local/share/npm/lib/node_modules /usr/local/lib/node /usr/local/lib/node_modules

### Python
set python_paths ~/Library/Python/3.7/bin /usr/local/opt/python/libexec/bin

### Set PATH
set -gx PATH $go_paths $rust_paths $python_paths $homebrew $home_bin $default_path

### Python ###
set -e PYTHON_VERSION
set -g VIRTENV $HOME/.virtualenvs
set -g WORKON_HOME $HOME/.virtualenvs
set -g PYTHONSTARTUP $HOME/.pythonrc.py

### Editor ###
set -x EDITOR vim -f

### Git ###
set -x GIT_TERMINAL_PROMPT 1

### Theme ###
set -g theme_display_nvm yes
set -g theme_display_node yes
set -g theme_display_rust no

set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_master_branch yes
set -g theme_git_worktree_support yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_ruby yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_date_format "+%a %H:%M"
set -g theme_color_scheme dark
set -g fish_prompt_pwd_dir_length 2
set -g theme_project_dir_length 2
set -g theme_newline_cursor yes
### END Theme ###

### The Fuck ###
# thefuck --alias | source

### FZF ###
set -x FZF_TMUX 1
# set -U FZF_FIND_FILE_COMMAND "ag -l --hidden --ignore .git"
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --smart-case --glob "!.git/*,!*.log,!node_modules/*,!_build/*,!deps/*,!priv/*"'

### Aliases ###

# Rehash fish configs quickly - doesn't truly reload, launches a new shell, but results the same
alias reload 'exec fish -l'

# Ruby
alias b "bundle"
alias be "bundle exec"
alias rk "rake"
alias rb "ruby"

# IP addresses
alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
alias localip "ipconfig getifaddr en0"
alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Enhanced WHOIS lookups
alias whois "whois -h whois-servers.net"

# Flush Directory Service cache
alias flush "dscacheutil -flushcache and killall -HUP mDNSResponder"

# Postgres
alias pgstart "pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop "pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# Mysql
alias mystart "mysql.server start"
alias mystop "killapp mysql"

# Vagrant
alias v "vagrant"
alias vag "vagrant"

#
# Compose Helpers
#
# NOTE: this overrides 'dc' which is a reverse polish notation calculator
alias dc "docker-compose"
alias dcr "docker-compose run --rm"
alias dcs "docker-compose stop"
alias dcrm "docker-compose rm -f"

#
# Machine helpers
#
alias dm "docker-machine"
alias dml "docker-machine ls"
alias dmip "docker-machine ip"
alias dmenv "docker-machine env"

#
# Sys helpers
#
alias lsports "lsof -iTCP -sTCP:LISTEN -P"

# IP
alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
alias localip "ipconfig getifaddr en0"
alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# HTTP
alias sniff "sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump "sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias urlencode 'python -c "import urllib.parse; import sys; print(urllib.parse.quote(sys.argv[1], safe=\"\"));"'

#
# Utility functions
#
function psapp
  ps -ax | grep -i "$argv" | grep -i -v  "grep.*$argv" | awk '{print $1}'
end

function digga
  dig +nocmd "$argv" any +multiline +noall +answer
end

function killapp
  kill (psapp $argv)
end

function mkp
  mkdir -p $argv
  cd $argv
end

# Docker

function dcleanup
  docker rm -v (docker ps --filter "status=exited" -q 2>/dev/null) 2>/dev/null
  docker rmi (docker images --filter "dangling=true" -q 2>/dev/null) 2>/dev/null
  docker rm (docker ps -a --filter "status=dead" -f -q 2> /dev/null) 2>/dev/null
end

function dremstop
  set state (docker inspect --format "{{.State.Running}}" $argv 2>/dev/null)

  if $state == "false"
    docker rm $argv
  end
end

#
# Autojump
#
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

#
# Load ASDF Version Manager if exists and is asked for
#
if test -f ~/.asdf/asdf.fish; # and contains "true" $ASDF
  source ~/.asdf/asdf.fish
end
