if !strlen($TMUX) || !executable('tmux')
  finish
endif

" Smart pane switching with awareness of vim splits
call system("tmux bind -n C-h run \"(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?)(diff)?$' && tmux send-keys C-h) || tmux select-pane -L\"")
call system("tmux bind -n C-j run \"(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?)(diff)?$' && tmux send-keys C-j) || tmux select-pane -D\"")
call system("tmux bind -n C-k run \"(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?)(diff)?$' && tmux send-keys C-k) || tmux select-pane -U\"")
call system("tmux bind -n C-l run \"(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?)(diff)?$' && tmux send-keys C-l) || tmux select-pane -R\"")
call system("tmux bind -n C-\ run \"(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)g?(view|n?vim?)(diff)?$' && tmux send-keys 'C-\\') || tmux select-pane\ -l\"")

