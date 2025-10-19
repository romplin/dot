#!/bin/bash

# Create a new, detached tmux session named "server".
# The initial window is split into top and bottom panes.
tmux new-session -d -s server \; \
split-window -v \; \

# Select the top pane (pane 0) and split it horizontally.
# This creates the top-left and top-right panes.
select-pane -t 0 \; \
split-window -h \; \

# Select the bottom pane (now pane 2) and split it horizontally.
# This creates the bottom-left and bottom-right panes.
select-pane -t 2 \; \
split-window -h \; \

# Select the top-left pane to start.
select-pane -t 0 \; \

# Attach to the "server" session.
tmux attach-session -t server
