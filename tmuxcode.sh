tmux new-session -d -s coding \; \
split-window -h -p 50 \; \
split-window -v -p 15 \; \
select-pane -t 0
tmux attach-session -t coding
