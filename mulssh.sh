#!/bin/bash
SESSION=$USER

current_pane=$TMUX_PANE
echo $current_pane

for cmd in "$@" ; do
    tmux split-window "ssh $cmd"
done

tmux kill-pane -t "$current_pane"
