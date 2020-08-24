#!/usr/bin/env fish

source "$HOME/.asdf/asdf.fish"
# Also copy completion file under ~/.config/fish/completions

# Aliases/Functions

abbr cdu 'cd ..'
abbr ll 'ls -lha'
abbr a. 'atom .'
abbr cdu 'cd ..'
abbr cd. 'cd ..'
abbr cdh 'cd ~/hiden'
abbr cdw 'cd ~/workspace'
abbr cdd 'cd ~/workspace/dodai'
abbr cds 'cd ~/workspace/antikythera'
abbr cda 'cd ~/workspace/antikythera'
abbr gs 'git status'
abbr gg 'git grep'
abbr gd 'git diff'
abbr gdw 'git diff --color-words'
abbr gsu 'git --no-pager diff --stat'
abbr gc 'git commit --interactive --verbose'
abbr gcs 'git commit --gpg-sign --interactive --verbose'
abbr gpu 'git push'
abbr gl 'git log --graph --oneline --decorate --boundary'
abbr ghe 'git checkout'
abbr gma 'git checkout master'
abbr gf 'git fetch --prune --prune-tags'
abbr gip 'git pull --prune'
abbr ger 'git merge'
abbr gua 'git merge --squash'
abbr gom 'git commit'
abbr goms 'git commit --gpg-sign'
abbr gba 'git rebase'
abbr ga 'git add'
abbr gai 'git add --interactive'
abbr grev 'git diff origin/master...HEAD' # review current HEAD against its merge-base (branch/diverge point) from master
abbr gpi 'git cherry-pick'
abbr ssr 'sshrc'

function rl -d "Reload fish config"
  source "$HOME/.config/fish/config.fish"
end

function sshrc -d "sshrc with ssh like completions" --wraps "ssh"
  /usr/local/bin/sshrc $argv
end

function sync_history --on-event fish_preexec
  history --save
  history --merge
end

set fish_complete_path /home/linuxbrew/.linuxbrew/share/fish/vendor_completions.d $fish_complete_path

# Import common settings

source "$HOME/hiden/shrc.sh"

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[ -f ~/.config/yarn/global/node_modules/tabtab/.completions/yarn.fish ]; and . ~/.config/yarn/global/node_modules/tabtab/.completions/yarn.fish

# Enable AWS CLI autocompletion: https://github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
